## Yocto Project

The **updatehub** offers a high quality integration for the Yocto Project and provides a ready to use support for a number of boards. Every six months, a new version of Yocto Project is released.

The current version is the Yocto Project 2.4, codename `rocko`, and its support is provided by the `meta-updatehub` layer. This layer provides all the infrastructure code to enable the use of Yocto Project together with the **updatehub**. The minimal set of layers to use the **updatehub** are:

| Layer name                    | Branch name |
|-------------------------------|-------------|
| poky                          | rocko       |
| meta-openembedded/meta-oe     | rocko       |
| meta-openembedded/meta-python | rocko       |
| meta-updatehub                | rocko       |


Besides the basic support, there are many boards with **updatehub** support, provided by extra BSP layers, as shown at the table below:

|  Board full name                        | BSP layer name                                                                                              | Machine name   | Branch name |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------|----------------|-------------|
| BeagleBone Black                        | <a href="https://github.com/updatehub/meta-updatehub-ti/tree/rocko">meta-updatehub-ti</a>                   | beaglebone     | rocko       |
| Raspberry Pi 3                          | <a href="https://github.com/updatehub/meta-updatehub-raspberrypi/tree/rocko">meta-updatehub-raspberrypi</a> | raspberrypi3   | rocko       |
| NXP i.MX6QP/Q/DL SABRE Smart Device     | <a href="https://github.com/updatehub/meta-updatehub-freescale/tree/rocko">meta-updatehub-freescale</a>     | imx6qdlsabresd | rocko       |
| Boundary Devices Nitrogen6X             | <a href="https://github.com/updatehub/meta-updatehub-freescale/tree/rocko">meta-updatehub-freescale</a>     | nitrogen6x     | rocko       |
| Boundary Devices i.MX6 SABRELite        | <a href="https://github.com/updatehub/meta-updatehub-freescale/tree/rocko">meta-updatehub-freescale</a>     | nitrogen6x     | rocko       |
| TechNexion i.MX7 PICO                   | <a href="https://github.com/updatehub/meta-updatehub-freescale/tree/rocko">meta-updatehub-freescale</a>     | imx7d-pico     | rocko       |
| Toradex Apalis iMX6Q/D                  | <a href="https://github.com/updatehub/meta-updatehub-freescale/tree/rocko">meta-updatehub-freescale</a>     | apalis-imx6    | rocko       |
| WaRP7                                   | <a href="https://github.com/updatehub/meta-updatehub-freescale/tree/rocko">meta-updatehub-freescale</a>     | imx7s-warp     | rocko       |
| Wandboard i.MX6 QuadPlus/Quad/Dual/Solo | <a href="https://github.com/updatehub/meta-updatehub-freescale/tree/rocko">meta-updatehub-freescale</a>     | wandboard      | rocko       |


If you need to use an earlier Yocto Project version, the **updatehub** is also supported. Currently, there is support for following previous Yocto Project versions:

* Yocto Project 2.1, codename `krogoth`
* Yocto Project 2.2, codename `morty`
* Yocto Project 2.3, codename `pyro`

These earlier versions are actively supported by the **updatehub**, but features and compatible machines may vary among them.
