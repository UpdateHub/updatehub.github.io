## Device Details

The `Device Details` page provides you access to detailed information about a specific `Device` such as:

- The Unique Identifier (UID)
- The device identity values (e.g. MAC* address, CPU serial number or other)
- Current installed package version
- Hardware model
- Device state (enabled or disabled)
- Device attributes

Besides the device information, the `Rollout` history of the device allow an easy access to the current and previous device's update status, such as duration, logs about errors and date of the events.

![device details](/img/Dashboard/deviceDetails.png)

During a normal situation the device `Rollout` will be displayed showing the moment that started, going through all the process until the point that is finished, like in the image below:

![device finished](/img/Dashboard/finished.png)

In the case of some kind of problem happens during the update process, the **updatehub** will provide a visual feedback of the moment it occured. To examine the failure you need to select `See Device Log`.

![device installation](/img/Dashboard/deviceLog.png)

This data about the device ensures the user has all information needed for any upcoming situation, being capable of manage his devices within the entire `Product` lifetime.
