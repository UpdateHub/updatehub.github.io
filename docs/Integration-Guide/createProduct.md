## Create a product

To create a new `Product` you have to access the **UpdateHub** interface through the internet browser. Once you enter the **UpdateHub** just follow the steps to generate a new `Product` as you can find them [here](../Dashboard/creatingProduct.md).

After the `Product` has been created a _Unique Identifier Number_ is generated to identify it. This number, should be added to your build in order to allow the **UpdateHub** agent, which runs inside the target device, to communicate with the **UpdateHub** management server.

For convenience, you can add the `UPDATEHUB_PRODUCT_UID` to your `conf/local.conf` configuration file when prototyping. However, as this is a information that will be permanent for the whole product life cycle, it should be put inside your distribution configuration file, or image recipe.

The `UPDATEHUB_PRODUCT_UID` will be shown to you when you create your product inside the management server. It will look as:

```
UPDATEHUB_PRODUCT_UID = "05344b71c3e9f8..."
```

In case you didn't copy the `Product` _Unique Identifier Number_ in the moment that you create it on the **UpdateHub** dashboard don't worry. To get access to this information again you must click on the `Product` icon and the _Unique Identifier Number_ will be shown to you.
