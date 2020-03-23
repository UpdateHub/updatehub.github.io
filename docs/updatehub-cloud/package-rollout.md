
As *Package* and *Rollout* are strictly linked, we chose to address both in a single section.
In summary, we can say that a *Rollout* is the process of applying a *Package* to certain devices
 but in subsections below more detailed description is given.

## Manipulating a Package

A *Package* is a update which will add or remove information to an image that is running on a device that is in the field.
First, a modified image will be sent to the server with a specific command (see more in uhupkg) and then it is available in the *Package* subsection, becoming available to be selected in a new rollout.

In dashboard, the *Package* is available after you join in a specific *Product*.

In this session we will cover:

- [Viewing the package list](#viewing-the-package-list)
- [More informations about a package](#more-informations-about-a-package)


### Viewing the package list

The *Packages* page, in the same fashion as the *Devices* page, exhibit a list with information about the packages inside a specific *Product* the user selected, such as:

- *Package Unique Identifier* (UID)
- Version
- Supported hardware list
- Status
- Size
- Upload date

Each one of these items help the user find a specific package. To filter more efficiently the packages you can select and associate them by the following items during the search:

- Status of each package can be found depending on the situation for the *Rollout*
    - *Available*: the package is ready to be downloaded
    - *Upload in Progress*: package during the uploaded process
    - *Removed*: packages that were removed from the packages list
    - *Pending Progress*: packages being checked by the server
    - *Packages with Error*: packages that failed the system checksum
- Version for the package
- Supported hardware

<p align="center">
  <img src="../../img/updatehub-cloud/package-rollout/packageList.png">
</p>

### More informations about a package

In the *Package Details* page the user may have a deeper look into a particular *Package* and its information.

Beyond the information already present on the *Package List*, you will find more data about the *Objects* and their details which is used by the **UpdateHub** agent during the object's installation.

<p align="center">
  <img src="../../img/updatehub-cloud/package-rollout/package.png">
</p>

Once you entered in the *Package Details* you have the option to remove the package from the *Rollout* if necessary by clicking on the *trash can* icon. The package will be visible and accessible but won't be available anymore.

## Administering a Rollout 

*Rollout* is the process of sending updates from the server to the devices registered in a certain product. To start a rollout, the update package must be sent to the server and then the process can be initiated by product * overview * or by the subsection rollout.

In this session we will cover:

- [Ways to create a rollout](#ways-to-create-a-rollout)
    - [All devices](#all-devices)
    - [Select the target devices](#select-the-target-devices)
- [Register of rollouts](#register-of-rollouts)
- [Detailing a rollout](#detailing-a-rollout)

### Ways to create a rollout

There are two methods to execute the *Rollout*: the simpler way is update all the versions of the *Devices* present on the field at once; the other way is to selecting which *Devices* receives the update through *Advanced Mode* option. 

#### All devices

To update all devices in the field to the same version you just need to go to the *Overview* or *Rollouts* page and click on *Create Rollout*. A box to choose the *version* will appear. After you make this choice just click on *Save* to initiate the *Rollout* later or *Save and Start* launch it straightaway.

<p align="center">
  <img src="../../img/updatehub-cloud/package-rollout/createRollout.png">
</p>

#### Select the target devices 

The other way is to select which equipment receives the * Rollout * is using the *Advanced Mode* option that allows the use of selection filters for devices.

In advanced mode, you can create and name tasks that define the filters that will be applied, selecting which devices will receive the update. In addition to the available filters, UpdateHub provides *Fault Tolerance*, which is a percentage that can be set by the user to abort the *Rollout* automatically if the failure rate exceeds the specified limit.

!!! warning "It is advised to use *Fault Tolerance* percentage because this is safe measure."

<p align="center">
  <img src="../../img/updatehub-cloud/package-rollout/createRolloutAdvanced.png">
</p>

The Devices can be filter by their Version, Hardware, Device Identifier (e.g: the MAC address) and Device Attributes (e.g: kernel version, device total memory). Finally Save the Rollout to start later or Save and Start it immediately.

### Register of rollouts

The *Rollout List* exhibit every *Rollouts* available for the *Product* chosen and a brief information about them, such as name, version, creation, status and progress.

<p align="center">
  <img src="../../img/updatehub-cloud/package-rollout/rolloutList.png">
</p>

### Detailing a rollout

The **UpdateHub** also gives all the information in details of each specific *Rollout*, allowing a complete overview of the individual process. Among the information displayed inside the *Rollout Details* you will find:

- *Version*: the version of *Rollout* that the *Device* will receive
- *Creation Date*: the date that the *Rollout* was created
- *Tasks*: this area shows the each task that is part of the *Rollout*. Each task includes a number of information, such as:
    - *Number of Devices*: all the *Devices* available for the *Rollout*, including the number of process concluded, failed, and remaining in one or various tasks are displayed here
    - *Fault tolerance*: that's the percentage limit of failures which can occur during the *Rollout* until the **UpdateHub** aborts the running rollout process, including any pending tasks
- *Play/Pause Rollout*: whenever the user wants to play or pause the *Rollout* the option is available, unless the process is aborted or the user chooses to archive it
- *Archive the Rollout*: once the rollout is not necessary anymore it can be archived and stopped definitely

<p align="center">
  <img src="../../img/updatehub-cloud/package-rollout/rolloutDetails.png">
</p>
