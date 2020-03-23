# Handling a Device 

The *Device* is the system entity that stores the characteristics of a physical device. Through these characteristics, filters can be applied during a search or when performing a rollout.

The *Devices* page displays the list of registered devices for the *Product*.

In this session we will cover:

- [Registering a device](#registering-a-device)
- [Listing all devices of a product](#listing-all-devices-of-a-product)
- [Accessing the details of a device](#accessing-the-details-of-a-device)
- [Rollout history of a device](#rollout-history-of-a-device)
- [Checking out](#checking-out)

## Registering a device

A device that uses an image with the correct layers and a set of variables necessary to support UpdateHub will be automatically registered on the system when in activity, check the server for updates the first time.

!!! info "Besides UpdateHub keys, we can create a [*RSA Key*](/advanced/#generating-rsa-key) for add security in comunication."

## Listing all devices of a product

When you access the subsection *Device* within a *Product*, all devices registered for that product will be listed. ** UpdateHub ** also allows the use of filters, guaranteeing the user an excellent organizational capacity, even when managing a large number of devices at the same time.

<p align="center">
  <img src="../../img/updatehub-cloud/device/deviceList.png">
</p>

## Accessing the details of a device

When you click on one of the listed devices, the *Device details* page loads and will provide access to detailed information about a specific *Device*, such as:

- The *Unique Identifier* (UID)
- The device identity values (e.g. MAC* address, CPU serial number or other)
- Current installed package version
- Hardware model
- Device state (enabled or disabled)
- Device attributes
- Latest rollout update

<p align="center">
  <img src="../../img/updatehub-cloud/device/deviceDetails.png">
</p>

### Rollout history of a device

The *Rollout* history of the device allow an easy access to the current and previous device's update status, such as duration, logs about errors and date of the events.

During a normal situation the device *Rollout* will be displayed showing the moment that started, going through all the process until the point that is finished, like in the image below:

<p align="center">
  <img src="../../img/updatehub-cloud/device/finished.png">
</p>

In the case of some kind of problem happens during the update process, the **UpdateHub** will provide a visual feedback of the moment it occurred. To examine the failure you need to select *See Device Log*.

<p align="center">
  <img src="../../img/updatehub-cloud/device/deviceLog.png">
</p>

This data about the device ensures the user has all information needed for any upcoming situation, being capable of manage his devices within the entire *Product* lifetime.

## Checking out

To check if the *Rollout* worked and the device is up to date you just need type in your device the command below.

```
cat /etc/os-release
```
And the version you use in *Rollout* will be shown.