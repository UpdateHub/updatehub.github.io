# Security Credentials

The securty credentials are used to authenticate and authorize requests from
your project build system.

### Creating your API access key

The upload of update packages to the management server requires the
use of an application access key which is specific to your user.

{% hint style=info' %}

**Important**: If you loose the access key, you must revoke it and
generate a new one.

{% endhint %}

Please click on your email on the top-right of the web interface and
select `Settings` on the dropdown menu. You will be directed to the
user settings page. On the `Application access` area click on the
`Request Access Key` button. Fill in the key name and choose the API
key owner as `Me`, then click on `Save`.

The next modal window shows you your newly created access id and access
key:

![updatehub access key detail](/img/management-platform/access-key-modal.png)

With those credentials the **updatehub** Yocto layers will have the necessary
information to access the management server API and push new updates.
