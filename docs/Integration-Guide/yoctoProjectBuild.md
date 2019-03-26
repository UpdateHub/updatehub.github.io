## Integrating onto a existing product

To include the **UpdateHub** together with your Yocto Project build, you need to choose the BSP integration layer you need, and add it to project configuration. You can easily do that using the `bitbake-layers` utility:

```
$: bitbake-layers layerindex-fetch meta-updatehub-<bsp> -b rocko
```

For example, if you wish to integrate the **UpdateHub** into a project using a Raspberry Pi3 or a BeagleBone Black board, you can do it very easily as in the next two examples.

For Raspberry Pi3, you can do that using:

```
$: bitbake-layers layerindex-fetch meta-updatehub-raspberrypi -b rocko
```

And for BeagleBone Black, you can use:

```
$: bitbake-layers layerindex-fetch meta-updatehub-ti -b rocko
```
