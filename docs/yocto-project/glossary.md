# Glossary of variables


#### UPDATEHUB_ACCESS_SECRET
When using the uhupush task we can override the Access Id and the corresponding Secret for use. This is usually used in auto builders as they may require different credentials depending on the product being build.


#### UPDATEHUB_ACTIVE_INACTIVE_BACKEND
The active and inactive image schema requires a backend to identify and choose the image to be used for next boot.
It supports: *u-boot*, *grub* or *grub-efi*.


#### UPDATEHUB_CUSTOM_CA_CERTS
Specify the CA certificate bundle to be used for uhupush task. It is currently used by **UpdateHub** staging server for tests but may be interesting for other users when doing custom server deployments.


#### UPDATEHUB_DEVICE_ATTRIBUTE
This allows more details to be added on a device. This is a very useful variable to applying filters to certain devices. Some examples of attributes: *kernel*, *cpu-model*, *mem-total* and *ipinfo-io*.


#### UPDATEHUB_DEVICE_IDENTITY
This variable provides the device with an identity, making it easier to recognize each device during operations on **UpdateHub Cloud**. The supported values ​​are: 

*primary-iface*: is the MAC of the primary network interface.

*cpuinfo-serial*: It is the serial number of the processor, can be obtained with the command "grep Serial / proc / cpuinfo".

*custom*: parameter that you can create. To create a customized parameter, simply put *UPDATEHUB_DEVICE_IDENTITY* + *_*(underscore) + *name* such as UPDATEHUB_DEVICE_IDENTITY_updatehub-imx or UPDATEHUB_DEVICE_IDENTITY_updatehub-rpi.


#### UPDATEHUB_FILESYSTEM_SUPPORT
When using the *copy* or *tarball* installation mode, some filesystem support packages are required.
This variable controls which filesystems should be supported. It supports different values, as *btrfs*, *ext2*, *ext3*, *ext4*, *f2fs*, *jffs2*, *ubifs*, *vfat* and *xfs*.


#### UPDATEHUB_IMAGE_TYPE
The updatehub can operate using different setup which can be chosen using the UPDATEHUB_IMAGE_TYPE variable. It supports different values, as below:

  *initramfs* - Enables the **Updatehub** gold firmware support; this adds an initramfs based image which is used for the upgrade process. In this mode,
  the **Updatehub Agent** is ran inside an initramfs image which allows for the image to be changed without the need of a spare storage space.

  *active/inactive* - Allow the use of active and inactive images schema. This reduces the downtime of the system as the image can be change without rebooting. The new image is installed in a spare storage area and in next reboot the new image is used. The UPDATEHUB_ACTIVE_INACTIVE_BACKEND variable need to set depending of the machine requirement.


#### UPDATEHUB_INSTALL_MODE
There are multiple installation modes supported.
This is usually machine dependent as it depends on the storate type in use.
Supported values are: *copy*, *flash*, *raw*, *tarball*, *ubifs* and *imxkobs*.


#### UPDATEHUB_PACKAGE_VERSION
Informs the system version and is based on the **Yocto Project's** DISTRO_VERSION variable (the version of the distribution).

#### UPDATEHUB_PACKAGE_VERSION_SUFFIX
It allows adding more information at the end of the variable name.


#### UPDATEHUB_PRODUCT_UID
The UPDATEHUB_PRODUCT_UID identifies the product id in use. This is used by the **Updatehub** server to identify the product and track the possible versions for Rollouts.


#### UPDATEHUB_RUNTIME_PACKAGES
Is a variable configured to install some package in an image that supports **UpdateHub**, such as an boot configuration package or to install a bootscript.


#### UPDATEHUB_SERVER_URL
Specifies the **Updatehub** server address to use. This is required in case you are running it inside your private cloud.


#### UPDATEHUB_UHUPKG_PRIVATE_KEY
The variable are required to point to the private key which are used to validate and sign the update package.
The private key works together with the public key that is described below in UPDATEHUB_UHUPKG_PUBLIC_KEY, variable that points to the private key.

The keys may or not be stored on the layer. Commonly the keys are not available for developers and passed to the build system using the **local.conf** file of the autobuilder.


#### UPDATEHUB_UHUPKG_PUBLIC_KEY
The variable to point to public key that work in conjunction with the private key to ensure more security in authentication.

The keys may or not be stored on the layer. Commonly the keys are not available for developers and passed to the build system using the *local.conf* file of the autobuilder.
