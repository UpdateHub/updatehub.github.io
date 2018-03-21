# Image classes

The updatehub support layer for [Yocto](https://www.yoctoproject.org/) provides
a set of classes to easily integrate your product with **updatehub**.

## updatehub-image

updatehub image integration class.

### Required Variables

* `UPDATEHUB_PRODUCT_UID` identifies the product id in use. This is
used by the updatehub server to identify the product and track the
 possible versions for rollouts.

* `UPDATEHUB_UHUPKG_PUBLIC_KEY` path to the public key which is used to
validate and sign the update package.

* `UPDATEHUB_UHUPKG_PRIVATE_KEY` path to the private key which is used to
validate and sign the update package.
