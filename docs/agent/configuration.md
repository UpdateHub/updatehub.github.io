**updatehub** Agent configuration file is located at ```/etc/updatehub.conf``` on the device's root filesystem.

{% hint style='tip' %}
In most of scenarios the configuration file is generated automatically by Yocto build process,
however you can change as you need.
{% endhint %}

The file is INI format. Example:

```
[Polling]
Interval=2h
Enabled=false

[Update]
DownloadDir=/tmp/download
SupportedInstallModes=mode1,mode2

[Network]
ServerAddress=http://addr:80

[Firmware]
MetadataPath=/usr/share/metadata

[Storage]
RuntimeSettingsPath=/var/lib/updatehub.conf
```

* ```Polling```
    * ```Interval``` the time interval on which each automatic poll will be done. Default: 1h
    * ```Enabled``` enable/disable the automatic polling. Default: enabled

* ```Update```
    * ```DownloadDir``` the directory on which the update files will be downloaded. Default: /tmp
    * ```SupportedInstallModes``` the install modes supported by this target. Possible values:
        * dry-run
        * copy
        * flash
        * imxkobs
        * raw
        * tarball
        * ubifs

* ```Network```
    * ```ServerAddress``` the address used in the network requests. Default: https://api.updatehub.io

* ```Firmware```
    * ```MetadataPath``` the directory on which are located the firmware metadata scripts. Default: /usr/share/updatehub

* ```Storage```
    * ```RuntimeSettingsPath``` the file on which will be saved the runtime settings along reboots. Default: /var/lib/updatehub.conf
