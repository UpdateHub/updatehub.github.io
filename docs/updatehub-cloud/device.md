# Handling a Device 

The *Device* is the system entity that stores the characteristics of a physical *Device*. Through these characteristics, filters can be applied during a search or when performing a *Rollout*.

The *Devices* page displays the list of registered *Devices* for the *Product*.

In this session we will cover:

- [Registering a Device](#registering-a-device)
- [Listing all Devices of a Product](#listing-all-devices-of-a-product)
- [Accessing the details of a Device](#accessing-the-details-of-a-device)
- [*Rollout* history of a Device](#rollout-history-of-a-device)
- [Checking out](#checking-out)


## Registering a device

A *Device* that uses an image with the correct layers and a set of variables necessary to support **UpdateHub** will be automatically registered on the system when functional, check the server for updates the first time.

!!! info "Besides UpdateHub keys, we can create a [*RSA Key*](/advanced/#generating-rsa-key) for additional security in communication."


## Listing all Devices of a Product

When you access the subsection *Device* within a *Product*, all *Devices* registered for that *Product* will be listed. **UpdateHub** also allows the use of filters, guaranteeing the user an excellent organizational capacity, even when managing a large number of *Devices* at the same time.

<p align="center">
  <img src="../../img/updatehub-cloud/device/deviceList.png">
</p>


## Accessing the details of a Device

When you click on one of the listed *Devices*, the *Device details* page loads and will provide access to detailed information about a specific *Device*, such as:

- The *Unique Identifier* (UID)
- The *Device* identity values (e.g. MAC* address, CPU serial number, or other)
- Current installed *Package* version
- Hardware model
- *Device* state (enabled or disabled)
- *Device* attributes
- Latest Rollout update

<p align="center">
  <img src="../../img/updatehub-cloud/device/deviceDetails.png">
</p>


### Rollout history of a Device

The *Rollout* history of the *Device* allows easy access to the current and previous *Device's* update status, such as duration, logs about errors, and date of the events.

During a normal situation the *Device* the *Rollout* will be displayed showing the moment that started, going through all the process until the point that is finished, like in the image below:

<p align="center">
  <img src="../../img/updatehub-cloud/device/finished.png">
</p>

In the case of some kind of problem that happens during the update process, the **UpdateHub** will provide visual feedback of the moment it occurred. To examine the failure you need to select *See Device Log*.

<p align="center">
  <img src="../../img/updatehub-cloud/device/deviceLog.png">
</p>

This data about the *Devices* ensures the user has all information needed for any upcoming situation, being capable of managing his *Devices* within the entire *Product* lifetime.


## Checking out

To check if the *Rollout* worked and the *Devices* is up to date you just need to type in your *Devices* the command below.

```
cat /etc/os-release
```
And the version you use in *Rollout* will be shown.
