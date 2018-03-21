## Rollout Management

The rollout is the process of deploying a specific version of your software, a `Package`, to a set of `Devices`.

When a new software version for the `Devices` you have on the field is ready to be deployed it´s possible to start the `Rollout`. All the process happens over-the-air (OTA). Besides, if something goes wrong and a failure is detected the **updatehub** will abort the `Rollout` automatically.

There are two methods to execute the `Rollout`.

The simpler way shows all the versions of the `Devices` present on the field to be updated at once.

<img class="borderless" alt="updatehub create rollout" src="/img/createRollout.png">

But if you need more depth and control over the `Rollout` you can choose to filter how to do it by selecting:

* Name of the Task
* Device version
* Unique identifier number
* Failure tolerance
* Type of hardware
* Device Attributes

It is possible to add more than one task to be done using this method. The **updatehub** can complete task by task, creating the opportunity to organize and have a better management of the updates. By choosing to execute the `Rollout` this way you will have complete control over when and which devices will receive the updates.

<img class="borderless" alt="updatehub create rollout advanced" src="/img/createRolloutAdvanced.png">
