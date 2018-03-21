# Integration Guide

## 1. Generate key pair

The **updatehub** verifies the authenticity of every update package prior
applying it, this ensures that the update package has not been modified or
corrupted by any means. Each device will contain the public key which will
validate any received package before uncompressing it and applying an update.

The generation of the RSA keys requires the `openssl` utility. The
private RSA key can be generated using the command below:

```bash
openssl genpkey -algorithm RSA -out private_key.pem -pkeyopt rsa_keygen_bits:4096
```

Next we need to extract the public RSA key from the private key. This
can be done using the following command:

```bash
openssl rsa -pubout -in private_key.pem -out public_key.pem
```

The public key, `public_key.pem`, is be included on the device image,
so it can be used to validate every update package before making any
change on the device. The private key, `private_key.pem`, is used to
sign the update package.

{% hint style="info" %}

**Important**: Once a device is deployed using a RSA key, the same key
is used to validate every update package. It is important to keep the RSA keys safe.

{% endhint %}

## 2. Integrating updatehub into your Yocto Project based

Including the **updatehub** Yocto layers to your build is easy: first clone the
meta-updatehub layer and the machine support layer to your sources directory:

```
user@dev:~$ cd project/sources
user@dev:~/project/sources$ git clone https://github.com/updatehub/meta-updatehub
user@dev:~/project/sources$ git clone https://github.com/updatehub/meta-updatehub-freescale
user@dev:~/project/sources$ git clone https://github.com/updatehub/meta-updatehub-raspberrypi
```

Now add the two layers to your `build/conf/bblayers.conf` file:

```
user@dev:~/project/sources$ bitbake-layers add-layer meta-updatehub
user@dev:~/project/sources$ bitbake-layers add-layer meta-updatehub-freescale
user@dev:~/project/sources$ bitbake-layers add-layer meta-updatehub-raspberrypi
```

With that the layers should be integrated with your build. Keep developing your
solution as you normally would. After the build more steps are necessary to push
your changes to the management server.

## 3. Create a product


## 4. Create and push a new update package

When a new build with changes has successfully finished another commands must be
run to push the changes to the updatehub management server.

```
user@dev:~/project/sources$ bitbake updatehub-image-minimal -c uhupush
```

After that is done the update should appear in the management server web
interface.
