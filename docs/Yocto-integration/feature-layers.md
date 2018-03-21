### 1. `meta-updatehub`: OpenEmbedded/Yocto Project support layer for updatehub

This layer provides the core functinality needed to integrate a Yocto build
project with **updatehub** services.

You will also need to include at least another layer related to the manufacturer
of the machine you are developing to.

[github.com/updatehub/meta-updatehub](https://github.com/updatehub/meta-updatehub)

### 5. `meta-updatehub-qa`: OpenEmbedded/Yocto Project updatehub QA metadata

This layer provides the functionality used for regression and as Quality
Assurance tests for **updatehub**.

It is not intended to be used by end users, although it can be used as a
reference when doing new platform integrations.

[github.com/updatehub/meta-updatehub-qa](https://github.com/updatehub/meta-updatehub-qa)
