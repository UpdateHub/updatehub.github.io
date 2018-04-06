### Advanced Rollout

Whenever you need more control over the `Rollout` of a several `Devices` at once use the option `Advanced Mode`.

Follow the steps ahead:

- Fist click on *Create a New Rollout*
- When the window shows up to select the `Rollout` version click on *Advanced Mode*
- A `Task` will be automatically generated
- Use the filters offered by the updatehub
- Indicate `Fault Tolerance` percentage
- Filter `Devices` by their:
    - Version
    - Hardware
    - Device Identifier (e.g: the MAC address)
    - Device Attributes (e.g: kernel version, device total memory)
- With multiple `Tasks` define the policy to begin new update processes by setting the starting point when a selected percentage of it is reached and the user can set if it must begin automatically or manually
- `Save` the `Rollout` to start later or `Save and Start` it immediately

![create rollout advanced](/img/Dashboard/createRolloutAdvanced.png)

It is important to bear in mind that you can create as many `Tasks` as possible as long there is `Devices` available for the `Rollout` and choose names for each individual `Task` in order to organize and identify them.
