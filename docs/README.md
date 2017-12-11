# What is updatehub?

**updatehub** is an enterprise-grade solution for remote update of Linux-based
devices with the aim of helping to secure and improve connected devices,
by providing a robust and easy software update process.

# Workflow

![updatehub workflow](/img/workflow.png)

To create a update rollout for a set of devices it's important to understand the
worflow to do so. This will help avoid problems that compromise the
devices' stability and security.

**updatehub** works in rollouts that will gradually update every device. Each
device has an update agent that periodically asks the server for new available
updates, downloading and applying it when one is available.

When a new version of the image for the device is built and is ready for
distribution with **updatehub** the built images are packaged, signed with the
developer's key and then pushed to the *management server*. This process
guarantees that a new update is only accepted by the *management server* if
it matches the protocols and standards required for a update and blocks
malicious elements from updating the devices with malware.

By pushing an update package to the *management server* a new rollout will be
created for the update. This rollout can be configured, scheduled or started
immediately, and devices that probes the *management server* for new updates
will receive the available package URIs, and then request the update package.

On the devices a small program will be running that is responsible for querying,
downloading and applying new updates called *updatehub agent*. That program will
be added to the system when the device is installed for the first time with an
image that has been prepared to work with **updatehub**.

After the file has been downloaded, the package is validated on the device
again, and the system is replaced with the newer version on the package. During
this process the agent reports back to the server on every step of the new
update.

When the update has been finished the *updatehub agent* in the device reports
back to the *management server* one last time to report the status of the
update.

The process of querying for an update up to reporting back the conclusion to
the *management server* is repeated for every device that can be updated using
the packaged image, until all devices have been updated or a threshold of update
failures is reach during the rollout.
