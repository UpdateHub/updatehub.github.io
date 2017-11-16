# BSP layers

The Yocto integration of **updatehub** is done, as most things are in Yocto, via
layers, provided as open source. Those layers are hosted on GitHub

### 1. `meta-updatehub`: OpenEmbedded/Yocto Project support layer for updatehub

This layer provides the core functinality needed to integrate a Yocto build
project with **updatehub** services.

You will also need to include at least another layer related to the manufacturer
of the machine you are developing to.

[github.com/updatehub/meta-updatehub](https://github.com/updatehub/meta-updatehub)

### 2. `meta-updatehub-freescale`: Freescale OpenEmbedded/Yocto Project BSP support layer for updatehub

This layer provides the functionality needed to **updatehub** to work with Freescale
devices.

You will also need to include the meta-updatehub layer, as it contains the core
functionality required to work with **updatehub**.

[github.com/updatehub/meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale)

### 3. `meta-updatehub-raspberrypi`: Raspberry Pi OpenEmbedded/Yocto Project BSP support layer for updatehub

This layer provides the functionality needed to **updatehub** to work with Raspberry
Pi devices.

You will also need to include the meta-updatehub layer, as it contains the core
functionality required to work with **updatehub**.

[github.com/updatehub/meta-updatehub-raspberrypi](https://github.com/updatehub/meta-updatehub-raspberrypi)

### 4. `meta-updatehub-ti`: Texas Instruments OpenEmbedded/Yocto Project BSP support layer for updatehub

This layer provides the functionality needed to **updatehub** to work with Texas
Instruments devices.

You will also need to include the meta-updatehub layer, as it contains the core
functionality required to work with **updatehub**.

[github.com/updatehub/meta-updatehub-ti](https://github.com/updatehub/meta-updatehub-ti)

### 5. `meta-updatehub-qa`: OpenEmbedded/Yocto Project updatehub QA metadata

This layer provides the functionality used for regression and as Quality
Assurance tests for **updatehub**.

It is not intended to be used by end users, although it can be used as a
reference when doing new platform integrations.

[github.com/updatehub/meta-updatehub-qa](https://github.com/updatehub/meta-updatehub-qa)
