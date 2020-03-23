# Yocto Project reference

In this section we cover the topics that involve **UpdateHub** with **Yocto Project** such as adding UpdateHub layers, setting variables, access keys and glossary. review

## Supported version

The **UpdateHub** offers a high quality integration for the **Yocto Project** and provides a ready to use support for a number of boards (**RaspberryPi**, **Texas Instruments** e **Freescale**). Every six months, a new version of **Yocto Project** is released.

The current version is the **Yocto Project** 3.0, codename *Zeus*, and its support is provided by the *meta-updatehub* layer. This layer provides all the infrastructure code to enable the use of **Yocto Project** together with the **UpdateHub**. The minimal set of layers to use the **UpdateHub** are:

| Layer name                    | Branch name |
|-------------------------------|-------------|
| poky                          | zeus        |
| meta-openembedded/meta-oe     | zeus        |
| meta-openembedded/meta-python | zeus        |
| meta-updatehub                | zeus        |


Besides the basic support, there are many boards with **UpdateHub** support, provided by extra BSP integration layers, as shown at the table below:

|  Board full name                        | BSP layer name                                                                                              | Machine name   | Branch name |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------|----------------|-------------|
| BeagleBone Black                        | [meta-updatehub-ti](https://github.com/updatehub/meta-updatehub-ti/tree/zeus)                   | beaglebone     | zeus       |
| Raspberry Pi 3                          | [meta-updatehub-raspberrypi](https://github.com/updatehub/meta-updatehub-raspberrypi/tree/zeus) | raspberrypi3   | zeus       |
| NXP i.MX6QP/Q/DL SABRE Smart Device     | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/zeus)     | imx6qdlsabresd | zeus       |
| Boundary Devices Nitrogen6X             | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/zeus)     | nitrogen6x     | zeus       |
| Boundary Devices i.MX6 SABRELite        | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/zeus)     | nitrogen6x     | zeus       |
| TechNexion i.MX7 PICO                   | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/zeus)     | imx7d-pico     | zeus       |
| Toradex Apalis iMX6Q/D                  | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/zeus)     | apalis-imx6    | zeus       |
| WaRP7                                   | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/zeus)     | imx7s-warp     | zeus       |
| Wandboard i.MX6 QuadPlus/Quad/Dual/Solo | [meta-updatehub-freescale](https://github.com/updatehub/meta-updatehub-freescale/tree/zeus)     | wandboard      | zeus       |


If you need to use an earlier **Yocto Project** version, the **UpdateHub** is also supported. Currently, there is support for following previous **Yocto Project** versions:

* Yocto Project 2.1, codename _Krogoth_
* Yocto Project 2.2, codename _Morty_
* Yocto Project 2.3, codename _Pyro_
* Yocto Project 2.4, codename _Rocko_
* Yocto Project 2.5, codename _Sumo_
* Yocto Project 2.6, codename _Thud_
* Yocto Project 2.7, codename _Warrior_
* Yocto Project 3.0, codename _Zeus_

!!! danger ""
    These earlier versions are actively supported by the **UpdateHub**, but features and compatible machines may vary among them.

## Adding layer to your project

The first step is initialize the environment to build a **Linux** image
using **Yocto Project**. To start working with **Yocto Project** we
need to fetch all the needed layers, that includes the **poky**,
*meta-openembedded*, *meta-raspberrypi*, *meta-updatehub* and
*meta-updatehub-raspberrypi* layers. 

The [meta-updatehub](https://github.com/UpdateHub/meta-updatehub) is the
layer that adds support to **UpdateHub** itself, and
[meta-updatehub-raspberrypi](https://github.com/UpdateHub/meta-updatehub-raspberrypi)
includes **UpdateHub** support for **Raspberry Pi** machines. In addition, we need to get the *meta-openembedded* layer, because **UpdateHub** has some dependencies, such as **Python 3** packages to create the [uhu](https://github.com/UpdateHub/uhu) utility used as UpdateHub package manager and will be covered in this guide.

Here we will show you two different approaches to download the necessary layers to support **UpdateHub**: one [using a platform](#using-updatehub-platform) which will download the necessary layers and add them automatically to the project, the other approach is to [manually download](#adding-the-layers-manually) and add these layers.

### Using UpdateHub Platform

To get a platform you need have [*Repo*](https://gerrit.googlesource.com/git-repo/) installed. Repo is a tool that helps manage many Git repositories, uploading to revision control systems and automating parts of the development workflow.

Install the repo utility:
```
mkdir ~/bin
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```
Download the platform source:
```
PATH=${PATH}:~/bin
mkdir updatehub-platform
cd updatehub-platform
repo init -u https://github.com/UpdateHub/updatehub-yocto-project-reference-platform.git -b zeus
repo sync
```

Setup the environment:
```
source ./setup-environment build
```

At the end of the commands you have every metadata you need to start working.

### Adding the layers manually

To include the **updatehub** Yocto layers in your build is easy just clone the
meta-updatehub layer and the machine support layer to your sources directory following the commands below:

```
git clone https://github.com/openembedded/meta-openembedded -b zeus
git clone https://github.com/UpdateHub/meta-updatehub -b zeus
```
In */build* folder of your project include:
```
bitbake-layers add-layer ../meta-openembedded/meta-oe
bitbake-layers add-layer ../meta-openembedded/meta-python
bitbake-layers add-layer ../meta-openembedded/meta-networking
bitbake-layers add-layer ../meta-updatehub
```

For **Raspberry Pi** 3, you can do that using:
```
git clone https://github.com/UpdateHub/meta-updatehub-raspberrypi
```
In */build* folder of your project include:
```
bitbake-layers add-layer ../meta-updatehub-raspberrypi/
```

For **BeagleBone Black**, you can use:
```
git clone https://github.com/UpdateHub/meta-updatehub-ti
```
In */build* folder of your project include:
```
bitbake-layers add-layer ../meta-updatehub-ti/
```

And for **imx6qdlsabresd**, use:
```
git clone https://github.com/UpdateHub/meta-updatehub-freescale
```
In */build* folder of your project include:
```
bitbake-layers add-layer ../meta-updatehub-freescale/
```

Done! Now you have the **UpdateHub** layer in your project.

## Configurating UpdateHub variables
 
You should now to include *UpdateHub* system variables in *conf/local.conf*. The variables below are the basics for the correct configuration. More details and options see [Glossary of variables](../glossary).

*UPDATEHUB_PRODUCT_UID* - identifies the product id in use and this is used by
rollouts. It is [generate](../../updatehub-cloud/product/#how-to-create-a-product) in create process ends or you get this code in **UpdateHub** Dashboard, in *Product* page.

*UPDATEHUB_ACCESS_ID* and *UPDATEHUB_ACCESS_SECRET* - They can be [generate](../../updatehub-cloud/#requesting-a-access-key) in *Settings* available in right top of screen and are necessary for server connection. 

*UPDATEHUB_PACKAGE_VERSION_SUFFIX* - added optionally, is advised for version organization.

Finally the final of your local.conf file should seem like this.
```
UPDATEHUB_PRODUCT_UID = "05344b71c3e9f8..."
UPDATEHUB_ACCESS_ID = "your-email@gmail.com-8bc21121049af..."
UPDATEHUB_ACCESS_SECRET = "9b1fcee96795fa5dea5cd04cb1d2..."
UPDATEHUB_PACKAGE_VERSION_SUFFIX = "-test-image-1.0"
```

### Cases of adding layers manually

!!! danger "If you have used the platform, the process below is not necessary, because the platform already has *updatehub-image* class configured."

In case you are not using the platform, in addition to the variable configuration specified above, you will need to add *update-image* class of **UpdateHub** in your project recipe for to use the setting available. For this you must include "inherit updatehub-image" in *myproject/../my-image.bb* or just to add "updatehub-image" in *inherit* if this exists.   


The your new image with **UpdateHub** support layer is ready. 

## RSA Key

RSA keys are asymmetric encryption keys that serve to provide greater security in communications. 

The **UpdateHub** verifies the authenticity of every *Package* update prior applying it. To do so, it uses a RSA key that to check if the *Package* has not been modified or corrupted by any means. Each device will contain the public key, *public_key.pem*, included on the device image, which will validate any received * Package* before unpacking, which must have been signed with the private key, *private_key.pem*, when generating the update package.


!!! danger "Although these keys are not mandatory on UpdateHub, we advise their use as an additional data protection mechanism." 

In this session we will cover:

- [Generating a RSA Key](#generating-a-rsa-key)
- [Setting up RSA Key](#setting-up-rsa-key)

### Generating a RSA Key

The generation of the RSA keys requires the *openssl* utility. The private RSA key is generated using the command below:

```
mkdir -p ~/updatehub-keys
openssl genpkey -algorithm RSA -out ~/updatehub-keys/private_key.pem -pkeyopt rsa_keygen_bits:4096
```
Next we need to extract the public RSA key from the private key. Use the following command:

```
openssl rsa -pubout -in ~/updatehub-keys/private_key.pem -out ~/updatehub-keys/public_key.pem
```

### Setting up RSA Key

The keys need to be enabled inside your **Yocto Project** build configuration, so **UpdateHub** can deploy the public key inside the generated image and use the private key to sign the update package. You must set the *UPDATEHUB_UHUPKG_PRIVATE_KEY* and *UPDATEHUB_UHUPKG_PRIVATE_KEY* variables inside your *conf/local.conf* file as seen next:

```
UPDATEHUB_UHUPKG_PRIVATE_KEY = "~/updatehub-keys/private_key.pem"
UPDATEHUB_UHUPKG_PUBLIC_KEY = "~/updatehub-keys/public_key.pem"
```

!!! danger "Keep save your RSA keys"
    Once a device is deployed using a RSA key, the same key is used to validate every update package send to this device. It is important to keep the RSA keys safe or you'll not be able to send updates for those devices.

## Pushing an update package

The **UpdateHub** works with upkg format for update package, and this is generated by the *uhu*. 
Update Utilities or *uhu* is an interactive prompt and a command line utility to manage update packages for UpdateHub agent and will provide you few new **BitBake** tasks, like this:

*uhupush*: sends the update package to the **UpdateHub** Cloud. The generation of an update package is very simple. After the integration of the **UpdateHub** with your **Yocto Project** build is complete, the **Bitbake** tool can be used to generate and upload the update package. The following command does all the needed work in order to push the packages to the **UpdateHub** Cloud:

```
bitbake <image> -c uhupush
```

After running this, the **UpdateHub** Cloud will display that there is a new *Package* to update the *Devices* and you may start a *Rollout* through the interface.

For more details or uhu install access [UpdateHub Utilities](https://github.com/UpdateHub/uhu).