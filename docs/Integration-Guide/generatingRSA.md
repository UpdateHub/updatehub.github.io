## Generating RSA Key

The **UpdateHub** verifies the authenticity of every `Package` update prior applying it. To do so, it uses a RSA key that to check if the `Package` has not been modified or corrupted by any means. Each device will contain the public key, `public_key.pem`, included on the device image, which will validate any received `Package` before unpacking, which must have been signed with the private key, `private_key.pem`, when generating the update package.

{% hint style='info' %}
**Important**: Once a device is deployed using a RSA key, the same key is used to validate every update package. It is important to keep the RSA keys safe or you'll not be able to send updates for those devices.
{% endhint %}

The generation of the RSA keys requires the `openssl` utility. The private RSA key is generated using the command below:

```
$: mkdir -p ~/updatehub-keys
$: openssl genpkey -algorithm RSA -out ~/updatehub-keys/private_key.pem -pkeyopt rsa_keygen_bits:4096
```
Next we need to extract the public RSA key from the private key. Use the following command:

```
$: openssl rsa -pubout -in ~/updatehub-keys/private_key.pem -out ~/updatehub-keys/public_key.pem
```

The keys need to be enabled inside your Yocto Project build configuration, so **UpdateHub** can deploy the public key inside the generated image and use the private key to sign the update package. You must set the `UPDATEHUB_UHUPKG_PRIVATE_KEY` and `UPDATEHUB_UHUPKG_PRIVATE_KEY` variables inside your `conf/local.conf` file as seen next:

```
UPDATEHUB_UHUPKG_PRIVATE_KEY = "~/updatehub-keys/private_key.pem"
UPDATEHUB_UHUPKG_PUBLIC_KEY = "~/updatehub-keys/public_key.pem"
```
