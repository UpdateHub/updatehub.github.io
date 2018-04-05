### Advanced Rollout

Whenever you need more control over the Rollout of a several Devices` at once use the option `Advanced Mode`.

Follow the steps ahead:

- Fist click on *Create a New Rollout*
- When the window shows up to select the `Rollout` version click on *Advanced Mode*
- A `Task` will be automatically generated
- Use the filters offered by the updatehub
- Indicate `Fault Tolerance` percentage
- Filter `Devices` by their:
    - Version
    - Hardware
    - *Device Identifier*
    - *Device Attributes*
- With multiple `Tasks` define the policy to begin new update processes by setting the starting point when a selected percentage of it is reached and the user can set if it must begin automatically or manually
- *Save* the `Rollout` to start later or *Save and Start* it immediately

![rollout advanced](/img/Dashboard/rolloutAdvancedTest.png)

{% hint style="info" %}
  - *You can create as many Tasks as possible as long there is Devices available for the Rollout.*
  - *Its possible to choose names for each individual Task in order to organize and identify them.*
  - *If the Rollout is not created because some sort of conflict occur a error box shows up and offers the option to stop all the rollouts with problems or force the operation [not recommended].*
{% endhint %}
