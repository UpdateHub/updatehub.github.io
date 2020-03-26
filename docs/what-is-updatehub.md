# What is UpdateHub?

**UpdateHub** is an enterprise-grade solution which makes simple to remotely update all your embedded devices in the field. It handles all aspects related to sending Firmware Over-the-Air \(FOTA\) updates with maximum security and efficiency, making your project the center of your attention.


<p align="center">
  <img src="../img/introduction/workflow.png">
</p>

## Supported Platforms

To maximize the diverity of projects which can benefit of **UpdateHub** use, we provide support for [**Yocto Project™**](https://www.yoctoproject.org/) and [**Zephyr Project™**](https://www.zephyrproject.org/) based devices, encompassing Linux and RTOS based devices.

## Basic Concepts

There are few basic concepts that are important to understand the **UpdateHub**. Those basic concepts are detailed below:

- Product: is the base that connects everything together through the **UpdateHub**. Essentially the *Product* includes one or multiple *Devices*, and for each of them there is a *Package* version that may be updated using a *Rollout*
- Device: it represents your physical device. It has multiple characteristics which are tracked on the management platform, as such: hardware type, unique identifier, runtime attributes and more
- Package: encompases a software version, including the filesystem image, bootloader or any other objects
- Rollout: it is essentially a deployment plan. It can be simple as "send version 2.0 for all devices" or a more complex plan, selecting specific filters and enforcing a gradual deployment across the devices in the field
- Rollback: this allows to roll back to the previous working version if a new version has critical errors, ensuring that the device will continue to function after the upgrade

## Features

The **UpdateHub** has a rich features set. On the management platform side it offers support for:

- *Single* and *team* managed products
- 2-click rollout creation for fast deployment across all your devices
- Multi-step rollout support for finner control about the rollout process across your devices \(e.g: lab, alpha testers, production\)
- HTTP API to control the system remotely

The support provided by the **UpdateHub** for the device includes:

- Support for multiple **Yocto Project™** and **Zephyr Project™** versions
- Bootloader upgrade support \(U-Boot and GRUB\)
- Flash support \(NAND, NOR\)
- UBIFS support
- Update package signature validation for security
- Automated rollback in case of update fail
- Conditional installation \(content, version and custom pattern support\)
- Callback support for every update step
- HTTP API to control and inquiry the local agent

## UpdateHub Server Editions

**UpdateHub** Server is available in two editions:

* [UpdateHub Community Edition](https://github.com/UpdateHub/updatehub-ce): is ideal for individual developers and small teams looking to get started with **UpdateHub** and experimenting with Firmware Over-the-Air (FOTA) updates.
* [UpdateHub Cloud](https://updatehub.io): is designed for enterprise development and IT teams who needs a end-to-end solution to build and ship Firmware Over-the-Air (FOTA) updates with maximum security and efficiency at any scale.

### UpdateHub Cloud

[**UpdateHub Cloud**](updatehub-cloud/dashboard.md)  have a rich but simple interface with all the tools required to:

- Create and operate your own *Products*
- Access *Products* from organizations
- Check when new *Packages* are available for updates
- Oversee a fleet of *Devices* on the field
- Deploy updates via an Over-The-Air system running the *Rollouts*

In essence the **UpdateHub Cloud**  allows the oversight over the whole **UpdateHub** plataform and operations, making it easy to manage any need that you might have.

### Comparasion Table

See the comparison table below to help you to choose which version fits you need:

| Feature                                      | UpdateHub CE | UpdateHub Cloud  |
|:---                                          |    :---:     |      :---:       |
| Secure communication (HTTPS, CoAP over DTLS) | ✘            | ✔                |
| Signed packages                              | ✔            | ✔                |
| Rollouts                                     | ✔            | ✔                |
| Large scale rollouts                         | ✘            | ✔                |
| Multiple organizations                       | ✘            | ✔                |
| Fully monitored updates                      | ✔            | ✔                |
| Teams                                        | ✘            | ✔                |
| HTTP API                                     | ✘            | ✔                |
| Package upload                               | ✔            | ✔                |
| Multiple products                            | ✘            | ✔                |
| Advanced device filter                       | ✘            | ✔                |
| Multiple users                               | ✘            | ✔                |
