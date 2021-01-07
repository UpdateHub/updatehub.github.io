The **UpdateHub** support multiple **Yocto Project** releases and the latest **Yocto Project** release we offer support for is the 3.1 LTS (dunfell).

!!! danger ""
    If you need to use an **Yocto Project** release different than the 3.1 LTS (dunfell) release please refer to the respective layers to check for compatibility.

Manufacturer    |Repository                                                                                                                 |
----------------|---------------------------------------------------------------------------------------------------------------------------|
Freescale       |[https://github.com/UpdateHub/meta-updatehub-freescale.git](https://github.com/UpdateHub/meta-updatehub-freescale.git)     |
RaspberryPi     |[https://github.com/UpdateHub/meta-updatehub-raspberrypi.git](https://github.com/UpdateHub/meta-updatehub-raspberrypi.git) |
Texas Intruments|[https://github.com/UpdateHub/meta-updatehub-ti.git](https://github.com/UpdateHub/meta-updatehub-ti.git)                   |

UpdateHub has support for the machines specified in the table below. Remember that it is possible for other configurations to work correctly with UpdateHub, the machines that have been configured and tested are the ones informed here.

Commercial name                            |Machine           |Layer                                                                                              |
-------------------------------------------|------------------|---------------------------------------------------------------------------------------------------|
Beaglebone Black                           |beaglebone        |[meta-updatehub-ti](https://github.com/UpdateHub/meta-updatehub-ti/tree/dunfell)                   |
Boundary Devices Nitrogen6X                |nitrogen6x        |[meta-updatehub-freescale](https://github.com/UpdateHub/meta-updatehub-freescale/tree/dunfell)     |
Element14 WaRP i.MX7 Solo                  |imx7s-warp        |[meta-updatehub-freescale](https://github.com/UpdateHub/meta-updatehub-freescale/tree/dunfell)     |
NXP i.MX6 SABRE Automotive Board           |imx6qdlsabreauto  |[meta-updatehub-freescale](https://github.com/UpdateHub/meta-updatehub-freescale/tree/dunfell)     |
NXP i.MX6 SABRE Platform for Smart Devices |imx6qdlsabresd    |[meta-updatehub-freescale](https://github.com/UpdateHub/meta-updatehub-freescale/tree/dunfell)     |
Raspberry Pi 3 Model B and B+              |raspberrypi3      |[meta-updatehub-raspberrypi](https://github.com/UpdateHub/meta-updatehub-raspberrypi/tree/dunfell) |
Raspberry Pi 4 Model B                     |raspberrypi4      |[meta-updatehub-raspberrypi](https://github.com/UpdateHub/meta-updatehub-raspberrypi/tree/dunfell) |
TechNexion PICO i.MX7                      |imx7d-pico        |[meta-updatehub-freescale](https://github.com/UpdateHub/meta-updatehub-freescale/tree/dunfell)     |
Toradex Apalis iMX6                        |apalis-imx6       |[meta-updatehub-freescale](https://github.com/UpdateHub/meta-updatehub-freescale/tree/dunfell)     |
Toradex Colibri iMX6                       |colibri-imx6      |[meta-updatehub-freescale](https://github.com/UpdateHub/meta-updatehub-freescale/tree/dunfell)     |
Toradex Colibri iMX7 (with eMMC storage)   |colibri-imx7-emmc |[meta-updatehub-freescale](https://github.com/UpdateHub/meta-updatehub-freescale/tree/dunfell)     |
Wandboard Solo/Dual/Quad                   |wandboard         |[meta-updatehub-freescale](https://github.com/UpdateHub/meta-updatehub-freescale/tree/dunfell)     |

The support for the machines in the table above is from Yocto Project 3.1 (Dunfell), but Updatehub has support for the Yocto Project since version 2.1 (Krogoth).
In case you are using an older version of the Yocto Project, below you can find the supported versions and the respective machines:

* [Yocto Project 3.0 (Zeus)](zeus.md)
* [Yocto Project 2.7 (Warrior)](warrior.md)
* [Yocto Project 2.6 (Thud)](thud.md)
* [Yocto Project 2.5 (Sumo)](sumo.md)
* [Yocto Project 2.4 (Rocko)](rocko.md)
* [Yocto Project 2.3 (Pyro)](pyro.md)
* [Yocto Project 2.2 (Morty)](morty.md)
* [Yocto Project 2.1 (Krogoth)](krogoth.md)

If you have any difficulties or doubts, access the [Gitter](https://gitter.im/UpdateHub/community?source=orgpage) so we can help you.
