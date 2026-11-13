# Zephyr Project guide

UpdateHub agent for Zephyr makes it simple to remotely update all your embedded devices.  It handles
all aspects related to sending Firmware Over-the-Air (FOTA) updates with maximum security and
efficiency, while you focus on adding value to your product. The UpdateHub Zephyr Agent can works
on two modes: polling and manual update.

Polling mode runs automatically on a predefined period, probing the server for updates and
installing them without requiring user intervention.

Manual mode requires the user to call the server probe and then, if there is an available update,
also requires the user to decide if it is appropriate to update now or later.

The UpdateHub Zephyr Demo uses Zephyr network management callbacks to know when the agent should
start, see [sample source code](https://github.com/zephyrproject-rtos/zephyr/tree/master/samples/subsys/mgmt/updatehub/src/main.c).


## Caveats

* The Zephyr port of ``UpdateHub`` was initialy developed to run on a
  [Freedom-K64F <frdm_k64f>](https://docs.zephyrproject.org/latest/boards/arm/frdm_k64f/doc/index.html)
  kit using the ethernet connectivity.  The application should build and run for other platforms with
  same connectivity.

* The sample provides [overlay](https://docs.zephyrproject.org/latest/guides/dts/howtos.html?troubleshoot-devicetree-issues#set-devicetree-overlays)
  files to enable other tecnologies like WIFI, modem, BLE IPSP, 802.15.4 or OpenThread.  These
  technologies depends on hardware resources and the correspondent overlay was designed to be generic
  instead full optimized.

* It is important understand that some wireless technologies may require a gateway or some sort of
  border router.  It is out of scope provide such configuration in details.

* The MCUboot bootloader is required for ``UpdateHub`` work properly.  Before chose a platform to
  test, make sure that SoC and board have support to it.  UpdateHub currently uses two slots to
  perform the upgrade.  More information about Device Firmware Upgrade subsystem and MCUboot can be
  found in [MCUboot](https://docs.zephyrproject.org/latest/guides/device_mgmt/dfu.html#mcuboot).

* ``UpdateHub`` acts like a service on Zephyr. It is heavily dependent on Zephyr sub-systems and it
  uses CoAP over UDP.


## Building and Running

Before start, make sure follow steps from
[Zephyr Getting Started Guide](https://docs.zephyrproject.org/latest/getting_started/index.html).

The below steps describe how to build and run the ``UpdateHub`` sample in
Zephyr.  Open a terminal ``terminal 1`` and navigate to your Zephyr project
directory.  This allows contruct and run everything from a common place.

```
    ls
    bootloader  modules  tools  zephyr
```


### Step 1: Build/Flash MCUboot

The MCUboot can be build following the instructions in the
[MCUboot](https://docs.zephyrproject.org/latest/guides/device_mgmt/dfu.html#mcuboot) documentation
page.  Flash the resulting image file using west on ``terminal 1``.

```
    # From the root of the zephyr repository
    west build -b frdm_k64f -d build/mcuboot-frdm_k64f bootloader/mcuboot/boot/zephyr
    west flash -d build/mcuboot-frdm_k64f
```


### Step 2: Start the UpdateHub Server

#### Step 2.1: UpdateHub-CE (Community Edition)

The Zephyr sample application is configured by default to use the UpdateHub-CE server edition.  This
version implies you need run your own server.  The UpdateHub-CE is distributed as a docker container
and can be on your local network or even instaled on a service provider like Digital Ocean, Vultr etc.
To start using the UpdateHub-CE simple execute the docker command with the following parameters on
another terminal ``terminal 2``.

```
    docker run -it -p 8080:8080 -p 5683:5683/udp --rm updatehub/updatehub-ce:latest
```


#### Step 2.2: UpdateHub Cloud

The UpdateHub Cloud is an enterprise-grade solution.  It provides almost the same resources as
UpdateHub-CE, with DTLS as the main differential.  For more details on how to use the UpdateHub
Cloud please refer to the documentation on [UpdateHub Cloud](../../updatehub-cloud/dashboard).

The UpdateHub Cloud accepts plain CoAP on ``coap.updatehub.io`` port 5683 and CoAPS (DTLS 1.2) on
port 5684.  To use CoAPS, add ``overlay-dtls.conf`` when building the sample.  The server
authenticates with an ECDSA P-256 certificate signed by an UpdateHub root CA, using the
``TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256`` cipher suite.  The device verifies that chain and the
server name.  The device does not authenticate itself with a certificate, so you do not generate
keys or certificates and the device never holds a private key.

The device must trust both UpdateHub root CAs:

| Root | Role | SHA-256 fingerprint |
|------|------|---------------------|
| [UpdateHub Device Root CA R1](certificates/updatehub-root-ca-r1.pem) | Signs the current server certificate | ``D2:D8:AB:2C:24:05:FC:1D:71:85:7C:96:62:3C:B6:60:11:2A:D2:32:77:74:89:52:29:CA:58:88:E7:02:49:3E`` |
| [UpdateHub Device Root CA R2](certificates/updatehub-root-ca-r2.pem) | Standby root | ``73:E8:0C:AE:CF:AD:A9:4E:89:0C:EC:F4:E1:C0:D1:39:F6:90:D5:E8:EB:D7:7E:74:09:3D:7B:29:A0:1D:C2:AB`` |

Ship both roots in your products: the server can then move to R2 without a firmware update.  Both
are also available as a single [PEM bundle](certificates/updatehub-root-ca.pem).  Zephyr keeps one
credential per type and security tag, so register the bundle once as a
``TLS_CREDENTIAL_CA_CERTIFICATE`` instead of adding the roots one by one.

!!! warning
    Zephyr releases up to and including v4.5 cannot complete a verified DTLS handshake with
    UpdateHub Cloud: the client never sets the server name, and the sample registers its
    certificate as its own identity instead of a trusted CA.  The fix is proposed upstream in
    [zephyrproject-rtos/zephyr#125786](https://github.com/zephyrproject-rtos/zephyr/pull/125786),
    which also ships the root bundle above in the sample.  Until it is part of your Zephyr
    version, apply the patches for Zephyr main or v4.5 from
    [UpdateHub/updatehub-coaps-e2e](https://github.com/UpdateHub/updatehub-coaps-e2e), which also
    has an end-to-end test harness.

With those patches, ``overlay-dtls.conf`` selects the cipher suite and sets a 24 KiB mbedTLS heap.
Do not go below 20 KiB: the allocator fragments and handshakes fail at 16 KiB.  On a Cortex-M4
(``frdm_k64f``) CoAPS adds about 80 KB of flash and 37 KB of RAM to the sample.

!!! note
    Certificate validity dates are only checked when ``CONFIG_MBEDTLS_HAVE_TIME_DATE`` is enabled,
    which requires a trusted wall clock (for example SNTP or an RTC) to be set before the first
    connection.  With the option enabled and no valid clock, the handshake rejects every
    certificate as not yet valid.

!!! note
    When using UpdateHub Cloud server it is necessary update your own ``overlay-prj.conf`` with
    option ``CONFIG_UPDATEHUB_CE`` equal ``n``.


### Step 3: Configure UpdateHub Sample

The updatehub have several Kconfig options that are necessary configure to make it work or tune
communication.

Set ``CONFIG_UPDATEHUB_CE`` select between UpdateHub edition.  The ``y`` value will select
UpdateHub-CE otherwise ``n`` selects UpdateHub Cloud.

Set ``CONFIG_UPDATEHUB_SERVER`` with your local IP address that runs the UpdateHub-CE server
edition.  If your are using a service provider a DNS name is a valid option too.  With the patches
from Step 2.2 it also applies to UpdateHub Cloud, where it defaults to ``coap.updatehub.io``.

Set ``CONFIG_UPDATEHUB_POLL_INTERVAL`` with the polling period of your preference, remembering that
the limit is between 0 and 43200 minutes (30 days).  The default value is 1440 minutes (24h).

Set ``CONFIG_UPDATEHUB_PRODUCT_UID`` with your product ID.  When using UpdateHub-CE the valid is
available at ``overlay-prj.conf.example`` file.


### Step 4: Build UpdateHub App

In order to correctly build UpdateHub the overlay files must be use correctly.
More information about overlay files in :ref:`important-build-vars`.

!!! note
    It is out of scope at this moment provide support for experimental features.  However, the
    configuration and use is similar to the start point indicated on the experimental network
    interface.

#### Step 4.1: Build for Ethernet

The ethernet depends only from base configuration.

```
    west build -b [ frdm_k64f | nucleo_f767zi ] \
    -d build/app zephyr/samples/subsys/mgmt/updatehub -- \
    -DOVERLAY_CONFIG=overlay-prj.conf
```

To use CoAPS with UpdateHub Cloud (see Step 2.2), add ``overlay-dtls.conf``:

```
    west build -b frdm_k64f -d build/app zephyr/samples/subsys/mgmt/updatehub -- \
      -DEXTRA_CONF_FILE="overlay-dtls.conf;overlay-prj.conf"
```

#### Step 4.2: Build for WiFi

For WiFi, it needs add ``overlay-wifi.conf``.  Here a shield provides WiFi connectivity using, for
instance, arduino headers.  See [ESP-8266 Module](https://docs.zephyrproject.org/latest/boards/shields/esp_8266/doc/index.html#module-esp-8266)
for details.

```
    west build -b [ frdm_k64f | nrf52840dk_nrf52840 | nucleo_f767zi ] \
    -d build/app zephyr/samples/subsys/mgmt/updatehub -- \
    -DSHIELD=esp_8266_arduino \
    -DOVERLAY_CONFIG="overlay-wifi.conf;overlay-prj.conf"
```

!!! note
    The board ``disco_l475_iot1`` is not supported.  The es-WIFI driver currently doesn't support UDP.

#### Step 4.3: Build for Modem

Modem needs add ``overlay-modem.conf``.  Now, a DTC overlay file is used to configure the glue
between the modem and an arduino headers.  The modem config uses PPP over GSM modem,
see [Generic GSM Modem Sample](https://docs.zephyrproject.org/latest/samples/net/gsm_modem/README.html#gsm-modem-sample).

```
    west build -b [ frdm_k64f | nrf52840dk_nrf52840 | nucleo_f767zi ] \
    -d build/app zephyr/samples/subsys/mgmt/updatehub -- \
    -DOVERLAY_CONFIG="overlay-modem.conf;overlay-prj.conf" \
    -DDTC_OVERLAY_FILE=arduino.overlay
```

#### Step 4.4: Build for IEEE 802.15.4 [experimental]

For IEEE 802.15.4 needs add ``overlay-802154.conf``.  This requires two nodes: one will be the host
and the second one will be the device under test.  The validation needs a Linux kernel >= 4.9 with
all 6loWPAN support.  The start point is try reproduce the Zephyr
[wpanusb sample](https://docs.zephyrproject.org/latest/samples/net/wpanusb/README.html#wpanusb-sample).
It is out of scope at this moment provide support since it is experimental.  The gateway was tested
with both native linux driver and ``atusb`` and with ``wpanusb`` sample.

```
    west build -b nrf52840dk_nrf52840 \
    -d build/app zephyr/samples/subsys/mgmt/updatehub -- \
    -DOVERLAY_CONFIG="overlay-802154.conf;overlay-prj.conf"
```

```
    west build -b [ frdm_k64f | nucleo_f767zi ] \
    -d build/app zephyr/samples/subsys/mgmt/updatehub -- \
    -DSHIELD=atmel_rf2xx_arduino \
    -DOVERLAY_CONFIG="overlay-802154.conf;overlay-prj.conf"
```

#### Step 4.5: Build for BLE IPSP [experimental]

The BLE IPSP needs ``overlay-ipsp.conf``.  This may requires two nodes:
one will be the host and the second one will be the device under test.  The
validation needs a Linux kernel >= 4.9 with all 6loWPAN support.  In this
particular case the Bluetooth 6LoWPAN module is needed. The start point is try
reproduce the Zephyr
[Bluetooth: ipsp sample](https://docs.zephyrproject.org/latest/samples/bluetooth/ipsp/README.html#bluetooth-ipsp-sample).
It is out of scope at this moment provide support since it is experimental.  The gateway was tested
with native linux driver and an USB dongle.

```
    west build -b nrf52840dk_nrf52840 \
    -d build/app zephyr/samples/subsys/mgmt/updatehub -- \
    -DOVERLAY_CONFIG="overlay-ipsp.conf;overlay-prj.conf"
```


#### Step 4.6: Build for OpenThread Network [experimental]

The OpenThread requries the ``overlay-ot.conf``.  It requires two nodes: one will be the host NCP
and the second one will be the device under test.  The validation needs a Linux kernel >= 4.9 with
optional NAT-64 support.  The start point is try reproduce the
[OpenThread Router](https://openthread.io/guides/border-router).
It is out of scope at this moment provide support since it is experimental.  The gateway was tested
using two boards with OpenThread 1.1.1 on NCP mode.

```
    west build -b nrf52840dk_nrf52840 \
    -d build/app zephyr/samples/subsys/mgmt/updatehub -- \
    -DOVERLAY_CONFIG="overlay-ot.conf;overlay-prj.conf"
```

### Step 5: Sign the app image

The app image is the application itself that will be on the board.  This app will connect to
UpdateHub server and check for new images.  The image will be loaded on the board with version 1.0.0.
It is important check what file format you SoC tools uses.  In general, Zephyr can create images with
binary (``.bin``) image format or Intel's (``.hex``) image format.

The Zephyr provide the ``west`` tool that simplify the signing process.  Just call west with proper
parameter values:

```

  west sign -t imgtool -d build/app -- --version 1.0.0 --pad \
    --key bootloader/mcuboot/root-rsa-2048.pem

  === image configuration:
  partition offset: 131072 (0x20000)
  partition size: 393216 (0x60000)
  rom start offset: 512 (0x200)
  === signing binaries
  unsigned bin: <zephyrdir>/build/app/zephyr/zephyr.bin
  signed bin:   <zephyrdir>/build/app/zephyr/zephyr.signed.bin
```

### Step 6: Flash the app image

```
    west flash -d build/app --bin-file build/app/zephyr/zephyr.signed.bin
```

!!! note "Note: Command variation to flash a ``hex`` file"
    ``west flash -d build/app --hex-file build/app/zephyr/zephyr.signed.hex``

At this point you can access a third terminal ``terminal 3`` to check if image is running.  Open the
``terminal 3`` and press reset on your board:

```
    minicom -D /dev/ttyACM0
```


### Step 7: Signing the binary test image

The test image needs different parameters to add the signature.  Pay attention to make sure you are
creating the right signed image.  The test image will be created with version 2.0.0 in this tutorial:

```
  west sign --no-hex --bin -B build/zephyr-2.0.0.bin -t imgtool -d build/app -- \
    --version 2.0.0 --key bootloader/mcuboot/root-rsa-2048.pem

  === image configuration:
  partition offset: 131072 (0x20000)
  partition size: 393216 (0x60000)
  rom start offset: 512 (0x200)
  === signing binaries
  unsigned bin: <zephyrdir>/build/app/zephyr/zephyr.bin
  signed bin:   build/zephyr-2.0.0.bin
```


### Step 8: Create a package with UpdateHub Utilities (uhu)

First, install UpdateHub Utilities (``uhu``) on your system, using:

```
    pip3 install --user uhu
```

After installing uhu you will need to set the ``product-uid``.  The value for UpdateHub-CE can be
found at ``overlay-prj.conf.example`` file.  For UpdateHub Cloud, you need copy the value from the
web interface.

```
    uhu product use "e4d37cfe6ec48a2d069cc0bbb8b078677e9a0d8df3a027c4d8ea131130c4265f"
```

Then, add the package and its mode (``zephyr``):

```
    uhu package add build/zephyr-2.0.0.bin -m zephyr
```

Then inform what ``version`` this image is:

```
   uhu package version 2.0.0
```

And finally you can build the package by running:

```
    uhu package archive --output build/zephyr-2.0.0.pkg
```

The remaining steps are dedicated to UpdateHub-CE.  If you are using UpdateHub Cloud you can find
the proper procedure at `docs.updatehub.io`_.


### Step 9: Add the package to server

#### Step 9.1: UpdateHub-CE

Add the package to the UpdateHub-CE server.  Open your browser to the server URL, ``<your-ip-address>:8080``,
and logging into the server using ``admin`` as the login and password by default.  After logging in,
click on the package menu, then ``UPLOAD PACKAGE``, and select the package built in step 8.


#### Step 9.2: UpdateHub Cloud

UpdateHub Cloud allows manager packages only by API.  To enable API access by terminal, add
following three environment variables:

```
    export UHU_ACCESS_ID="<email address>-<id number>"
    export UHU_ACCESS_SECRET="<your secret>"
    export UHU_SERVER_URL="https://api.updatehub.io"
```

The last step is call ``package push`` to send package built in step 8 to UpdateHub cloud server.

```
    uhu package push
```

!!! note
    This can be easilly integrated with a CI/CD development workflow


### Step 10: Register device on server

If you chose ``Manual``, register your device at updatehub server by using the terminal session
where you are debugging the board ``terminal 3``. Type the following command:

```
    updatehub run
```

If everything is alright, it will print on the screen ``No update available``.

For ``Polling`` mode, the system will automatically register your device after
``CONFIG_UPDATEHUB_POLL_INTERVAL`` minutes.  The ``updatehub run`` can be used to speed-up.

!!! note
    The message ``Could not receive data`` means that the application was not able to reached the
    updatehub server for some reason.  The most common cases are server down, missing network routes
    and forget to change the content of ``overlay-prj.conf`` file.


### Step 11: Create a rollout

In the browser where the UpdateHub-CE is open, click on ``menu Rollout`` and then ``CREATE ROLLOUT``.
Select the version of the package that you added in step 9.  With that, the update is published, and
the server is ready to accept update requests.


### Step 12: Run the update

Back in the terminal session that you used for debugging the board, type the following command:

```
    updatehub run
```

And then wait.  The board will probe the server, check if there are any new updates, and then
download the update package you've just created. If everything goes fine the message
``Image flashed successfully, you can reboot now`` will be printed on the terminal.  If you are
using the ``Polling`` mode the board will reboot automatically and Step 13 can be skipped.


### Step 13: Reboot the system

In the terminal you used for debugging the board, type the following command:

```
    kernel reboot cold
```

Your board will reboot and then start with the new image.  After rebooting, the board will
automatically ping the server again and the message ``No update available`` will be printed on the
terminal.  You can check the newer version using the following command:

```
    uart:~$ updatehub info
    Unique device id: acbdef0123456789
    Firmware Version: 2.0.0
    Product uid: e4d37cfe6ec48a2d069cc0bbb8b078677e9a0d8df3a027c4d8ea131130c4265f
    UpdateHub Server: <server ip/dns>
    uart:~$
```

## Hardware

The below list of hardware have been used by UpdateHub team.

| ID  | Network Interface       | Shield / Device  |
|:--- |    :---:                |      :---:       |
|  1  | Ethernet                | Native           |
|  2  | WIFI                    | [ESP-8266](https://docs.zephyrproject.org/latest/boards/shields/esp_8266/doc/index.html#module-esp-8266) |
|  3  | MODEM (PPP)             | SIMCOM 808       |
|  4  | IEEE 802.15.4 (6loWPAN) | Native, [RF2xx](https://docs.zephyrproject.org/latest/boards/shields/atmel_rf2xx/doc/index.html#atmel-at86rf2xx-transceivers) |
|  5  | BLE IPSP (6loWPAN)      | Native           |
|  6  | OpenThread Network      | Native           |

| Board | Network Interface ID  |
|:---   |    :---:       |
| [NXP FRDM-K64F](https://docs.zephyrproject.org/latest/boards/arm/frdm_k64f/doc/index.html#frdm-k64f) | 1, 2, 3, 4 |
| [nRF52840 DK](https://docs.zephyrproject.org/latest/boards/arm/nrf52840dk_nrf52840/doc/index.html#nrf52840dk-nrf52840) | 2, 3, 4, 5, 6 |
| [ST Nucleo F767ZI](https://docs.zephyrproject.org/latest/boards/arm/nucleo_f767zi/doc/index.html#nucleo-f767zi-board) | 1, 2, 3, 4 |
