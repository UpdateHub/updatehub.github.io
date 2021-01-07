# Yocto Project guide

Here we have a guide with the necessary steps for adding **UpdateHub**, either in a project that already exists or in a new project. Each step provides a brief description of the process that must be performed and a link to a section with more detailed information about this process.

Before you start, we ask you to check if your [board is supported](../yocto-project-reference/#supported-version) by **UpdateHub**.

!!! info ""
	If your board still does not have support or you encounter difficulties we will be happy to assist you through our [Gitter](https://gitter.im/UpdateHub/community?utm_source=share-link&utm_medium=link&utm_campaign=share-link) or contact us at contact@updatehub.io


## First step: adding layer


### Create project from scratch

For the creation of a project that already has the necessary layers to support **UpdateHub** we recommend [using the platform](../yocto-project-reference/#using-updatehub-platform) that will download and add the necessary layers automatically, allowing you to start your implementation quickly.


### Integrating onto a existing project

In a finished or under development project, the way to integrate UpdateHub is done by [adding layers directly](../yocto-project-reference/#adding-layer-to-your-project).


## Second step: creating a product

[Create a *Product*](../../updatehub-cloud/#how-to-create-a-product) is necessary for some variables such as the product identifier to be generated. These variables must be included in the image that will be generated so that the device has the necessary data to be authorized on the UpdateHub server when accessing it.

!!! warning "To create a product you need to be logged into your [**UpdateHub Cloud** account](https://dashboard.updatehub.io/)."


## Third step: requesting an Access Key

Access key is a variable that **Updatehub** uses to guarantee the authenticity of a device when it requests access to the server.

[Generating an Access Key](../../updatehub-cloud/#requesting-an-access-key) is easy and after just putting it in a project's settings before the image that will be loaded on the devices is generated.

!!! warning "Just like creating a product, creating a access key takes place within the [*Dashboard*](https://dashboard.updatehub.io/)"


## Fourth step: configuring the variables

Here we show [how to setting up the **UpdateHub** variables](../yocto-project-reference/#configurating-updatehub-variables) necessary for the correct functioning of **UpdateHub**. Definitions of variables as well as other variables can be found in the [Glossary of variables](../glossary).


## Fifth step: in your board

After adding the necessary layers and configuring the variables now just generate the image with the bitbake command, save the image on the target devices and that's it!


## Sixth step: sending a package to server

When changes occur in the original image that is present in devices in the field, it is necessary to update these devices by [sending the package](../yocto-project-reference/#pushing-an-update-package) with the changed image to the UpdateHub server for it to be applied.

**Congratulations! Your UpdateHub support is up and running.**

Can't run a tutorial step? Please contact us at [Gitter](https://gitter.im/UpdateHub/community?utm_source=share-link&utm_medium=link&utm_campaign=share-link) so we can help you.
