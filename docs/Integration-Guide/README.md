## Yocto Project

The **updatehub** offers a high quality integration for the Yocto Project and provides a ready to use support for a number of boards. Every six months, a new version of Yocto Project is released.

The current version is the Yocto Project 2.4, codename `rocko`, and its support is provided by the `meta-updatehub` layer. This layer provides all the infrastructure and supporting code to enable the use of Yocto Project together with the **updatehub**. The minimal set of layers to use the **updatehub** is:

| Layer name                    | Branch name |
|-------------------------------|-------------|
| poky                          | rocko       |
| meta-openembedded/meta-oe     | rocko       |
| meta-openembedded/meta-python | rocko       |
| meta-updatehub                | rocko       |


Besides the basic support, there are many boards with **updatehub** support, provided by extra BSP support layers, as shown at the table below:

|  Board full name                        | BSP layer name                                                                                   | Machine name   | Branch name |
|-----------------------------------------|--------------------------------------------------------------------------------------------------|----------------|-------------|
| BeagleBone Black                        | [meta-updatehub-ti](https://github.com/updatehub/meta-updatehub-ti/tree/rocko)                   | beaglebone     | rocko       |
| Raspberry Pi 3                          | [meta-updatehub-raspberrypi](https://github.com/updatehub/meta-updatehub-raspberrypi/tree/rocko) | raspberrypi3   | rocko       |
| NXP i.MX6QP/Q/DL SABRE Smart Device     | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/rocko)     | imx6qdlsabresd | rocko       |
| Boundary Devices Nitrogen6X             | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/rocko)     | nitrogen6x     | rocko       |
| Boundary Devices i.MX6 SABRELite        | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/rocko)     | nitrogen6x     | rocko       |
| TechNexion i.MX7 PICO                   | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/rocko)     | imx7d-pico     | rocko       |
| Toradex Apalis iMX6Q/D                  | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/rocko)     | apalis-imx6    | rocko       |
| WaRP7                                   | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/rocko)     | imx7s-warp     | rocko       |
| Wandboard i.MX6 QuadPlus/Quad/Dual/Solo | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/rocko)     | wandboard      | rocko       |


If you are using any other Yocto Project version, check the version specific page below:

* Yocto Project 2.3 - `pyro`
* Yocto Project 2.2 - `morty`
* Yocto Project 2.1 - `krogoth`
