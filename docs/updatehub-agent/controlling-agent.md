
Changing the **UpdateHub Agent** is very useful to user, because depending of the enviroment and goal, the settings must are custom. In this section we show the ways to interact and setting the **UpdateHub Agent** through the [Callbacks](#callbacks) use and the [SDK](#software-development-kit) functions.

## Callbacks

Callbacks are called during process flows that trigger sets of scripts and allow the user to add behavior to the **UpdateHub Agent** without changing the agent’s code directly. Callbacks are called upon entering individual states and then execute the assigned scripts. If the user wants, it is possible to change the callback call directly in the code to the most appropriate point of execution of the scripts.

There are three types of the callback:

**State change**: this callback is called on state changes and informs the current state of the machine. The [*Probe*](), [*Download*](), [*Install*](), [*Reboot*](), and [*Error*]() *states* use it.

**Validate**: it is called before the state machine starts, and by default, it is called when an update is installed. It allows the execution of tests that guarantee the system’s functionality according to the user's needs.

**Rollback**: is called when the **Validate callback** fails to validate the new firmware version successfully. In this case, the system must be reverted to the previous version, and actions might need to be taken, such as, for example, reversing the data migration made from the old system to the new one. After that, the agent reboots the device to the old installation.

The callbacks are added during the **Yocto Project** image generating. To this, the script must be available in *meta-updatehub/updatehub*, together with the recipe (.bb) containing the settings necessary to install and run the script.

Below we present the same script examples that quickly implement and allow agent behavior  flexibility.

Here we have a simple function that checks a specified address to allow it to continue the process. In the *Reboot state*, the callback makes the agent ask a defined server for permission to proceed and wait for a 200 status code as an answer; anything different will cancel the reboot.

<script src="https://gist.github.com/Domarys/f3e59d06fc4a3aa82c71555080a083fa.js"></script>

Energy and data use management is critical in remote devices, so turning off the unused resources is smart. A script to turn on the GSM connection, for instance, is a good idea and is simple, as shown below:

<script src="https://gist.github.com/Domarys/4626c2ade9bc2c4167a7bd31119a04f0.js"></script>

The code checks the current state and, if the state is probe state, it activates the GSM connection, allowing the device checks to available updates on the server to update.

Many different use cases are applied in the **UpdateHub Agent** through the callbacks use. Still, sometimes you want to put this logic inside the application, for instance, to use a graphic screen or use more complex logic that depends on multiple data sources, for example. Those more advanced use cases can be fulfilled using the **UpdateHub SDK**, in various programming languages, as described in the [SDK section]().

## Software Development Kit

The **UpdateHub** has an SDK that allows easy iteration with the **UpdatHub Agent**. There are four options of SDK: [Rust](https://github.com/UpdateHub/updatehub/tree/master/updatehub-sdk), [Python](https://github.com/UpdateHub/agent-sdk-python), [Qt](https://github.com/UpdateHub/agent-sdk-qt), and [Go](https://github.com/UpdateHub/agent-sdk-go). All provide the very same structure and support, being different just the language used.

The SDK provides the following API requests:

[**Direct download**](../state-machine/#direct-download-request) - allows you to pass to **UpdateHub Agent** the link to immediate and direct download.

[**Local install**](../state-machine/#local-install-request) - inform the **UpdateHub Agent** of the address in the local storage that contains the *.uhupkg*.

[**Probe request**](../state-machine/#probe-request) - send the control of agent to *Probe state*.

[**Abort download**](../state-machine/#abort-download-request) - cancel the download process.

[**Info**](../state-machine/#log-request) - pass the information of the **UpdateHub Agent** to the user.

[**Log**](../state-machine/#info-request) - presents the log register.

!!! info ""

	All of these are detailed in [The State Machine and the Flows subsection](../state-machine), where we explain in detail which states can call each request.

Whenever you need to interact with the **UpdateHub Agent** workflow inside your application, the SDK helps in reducing the hassle to do so.

We provide an example, in all SDK versions, which shows how to listen to a specific state change. Below we show the code snippet of the *listener* function in each available language together with the link where the full implementation can be found.

In Rust, it is available in [updatehub/updatehub-sdk/examples/listener.rs](https://github.com/UpdateHub/updatehub/blob/master/updatehub-sdk/examples/listener.rs):

<script src="https://gist.github.com/Domarys/61c4de9f43ee8239004c4a8035aeb722.js"></script>

The Python version is in [agent-sdk-python/examples/state_change_listener.py](https://github.com/UpdateHub/agent-sdk-python/blob/master/examples/state_change_listener.py):

<script src="https://gist.github.com/Domarys/81da6b2c295c86cb11e3b482480dc87a.js"></script>

To see the QT listener, access in [agent-sdk-qt/examples/qt/main.cpp](https://github.com/UpdateHub/agent-sdk-qt/blob/master/examples/qt/main.cpp):

<script src="https://gist.github.com/Domarys/943eba301a5aa8a9e0185ac5dae5abef.js"></script>

You can check the Go code by visiting [agent-sdk-go/examples/listerner/main.go](https://github.com/UpdateHub/agent-sdk-go/blob/v2/examples/listener/main.go):

<script src="https://gist.github.com/Domarys/1ef1d9ff75e4e6887a3d66f381a5a935.js"></script>

Keep in your mind that in case of doubt or difficulties you can access our [Gitter](https://gitter.im/UpdateHub/community?source=orgpage) or send us an email at contact@updatehub.io, we will stay happy to support you.
