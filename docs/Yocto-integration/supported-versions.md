# Supported Versions

The **updatehub** offers support for multiple versions of the Yocto Project.

Currently, it supports:

* Yocto Project 2.1 - Krogoth
* Yocto Project 2.2 - Morty
* Yocto Project 2.3 - Pyro
* Yocto Project 2.4 - Rocko

The **updatehub** integration with [Yocto Project](https:/yoctoproject.org) is
done by [`meta-updatehub`](https://github.com/updatehub/meta-updatehub) which
enables you to create a Yocto Project image with [updatehub
Agent](/advanced/updatehub-agent/overview.md) bundled into the image.

In addition to the meta-updatehub layer there's also specific layer for each
machine manufacturer that must also be integrated in the build. Check the [BSP
layers](/yocto-integration/bsp-layers.md) page for more information.
