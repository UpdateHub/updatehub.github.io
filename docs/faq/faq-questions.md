## General

### What is **UpdateHub**?
**UpdateHub** is a tool that turns all of the firmware process easy and secure. It runs all tasks involved in the updating execution and allows the user to set the behavior of activity flow. The **UpdateHub** also allows the user to check and manage his device’s fleet in a unique location.

### Which versions are available?
**UpdateHub** has two flavors: *Open Source* and *Cloud*. The tool is made of two parts: an agent (internal in devices) and a server. The **UpdateHub Agent** is the same in both versions, but the server on the *Open Source* version is hosted by the user, while **UpdateHub Cloud** is hosted in a dedicated, secure cloud server.

### The use of **UpdateHub** is free?
The *Open Source* version is totally free forever. The *Cloud* version allows registering up to 5 free devices.

### How do I use it?
The installing and use processes are described in detail in our tutorial [Quick starting with Raspberry Pi 3](../../quick-starting-with-raspberrypi3.md).

### Which operational systems supported it?
The **UpdateHub** works with [**Yocto Project Embedded Linux**](https://www.yoctoproject.org/) and [**Zephyr Project**-based](https://zephyrproject.org/) devices.

### The **UpdateHub** can update the applications in the device?
No. The **UpdateHub** deals with the updates in an atomic way, to reduce the risk of errors and simplify the Quality Assurance process which every update package usually goes through during the product development cycle.


## Dashboard

### Why does the *Rollout* process appear unfinished?
It happens because the process continues allowing new *Devices* to the existing *Rollout*. It's also important to cover the cases where manufacturing happens without network connectivity and the adding *Devices* occurs later.
That is the reason why **UpdateHub** works on, how we call, an infinite *Rollout*.

### The **UpdateHub** uses which connections type to update the device?
The **UpdateHub Agent** in **Linux** uses HTTPS to connect to *Cloud*, or in the case of **Zephyr**, the connection is made through *CoAP* (Constrained Application Protocol).

### How to access my *Product* UID?
The *Product* UID is your *Product*’s unique identifier and is essential to **UpdateHub** works. It’s shown when the *Product* was created, but also can be consulted in *Dashboard*, in the *Product* page clicking on the icon of *Product*.

### How do I know my *RSA key*?
The *RSA key* is available just in creation, so if you lost this, you must create a new key (and save the key in a secure local).

### A *Rollout* configured to cover all *Devices* will cover even the *Devices* connected to the platform after the *Rollout* created?
Yes. That’s why **UpdateHub** never finishes a *Rollout* and even if new *Devices* are connected it can “join” the live *Rollout* if the filter matches.

### Why does my *Rollout* does not reach 100%?
It happens when *Devices* are not updated because of external factors as network failure, or when its next probe time has not been reached yet.


### What’s the *Fault Tolerance* in the *Rollout* settings?
This rate allows the *Rollout* process to fail on some *Devices*, and if the rate is exceeded the *Rollout* process is interrupted, keeping the devices that have successfully completed updated, but not continuing for those the *Devices* are still pending.


## Pricing

### How is **UpdateHub** charged?
**UpdateHub** billing is metered depending on the resources used during the period. We prepared an Account Explained at the menu [Pricing](https://updatehub.io/pricing/#pricing). Check it out! It’s also possible to estimate these costs by the [**UpdateHub Calculator**](https://updatehub.io/estimate/#estimate).

### Is it possible to get an estimate before starting to use it?
Sure. You can estimate your monthly billing using the [**UpdateHub Calculator**](https://updatehub.io/estimate/#estimate) or by contacting our team directly by form contact form.

### How do I estimate the cost using the *Calculator*?
On [Pricing](https://updatehub.io/pricing/#pricing), go to *Estimate your costs* bottom and select the number of devices that will be activated. In the left menu, firstly you’ll choose how many devices you would like to update. Then, choose the update size and how many update rollouts you will do. Lastly, by selecting the percentage of devices included for each update rollout, you will get the *Devices* and *Rollout* billing estimate.

### The billing is different from that estimated. What happened?
The [**UpdateHub Calculator**](https://updatehub.io/estimate/#estimate) considers the main fees charged on **UpdateHub** to generate an estimative. It doesn’t mean that all fees will be covered every time or with the same value. For example, if *Devices* are already activated, the activation fee won't be charged. As well as the percentage of devices included in a *Rollout* update may be less than 100%.

### What Activation fee cover? Is it charged monthly?
The activation fee will be charged only when a device is activated. But take care, if you deactivate a device and activate it after billing, so its activation fee will be charged again. But, if you disable one device and activate it in the same month, the fee will be charged just one time.

### I'm using **UpdateHub Cloud** on 5 devices, but I need to add a new one. How to upgrade my account?
In your *Dashboard*, access the *Billing* by clicking on the account icon on the top right, and later click on *Unlock unlimited usage*. Just fill the field and, your account now is premium.
