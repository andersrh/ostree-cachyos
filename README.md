# ostree-cachyos
This is a custom image of Fedora Silverblue with the CachyOS kernel integrated.

This image was built by the people behind the CachyOS kernel for Fedora project (https://copr.fedorainfracloud.org/coprs/bieszczaders/kernel-cachyos) for Fedora Silverblue 39.

At the time of writing it's not possible to install our kernel on a running Silverblue 39 installation, hence we provide this custom made image as a solution to this problem until a solution is being found.

The packages on this repo will be updated once a day in order to be up-to-date with the latest changes made by the Fedora community as well as the latest versions of our kernels. 

You can rebase to this image by running the following command:

```
rpm-ostree rebase ostree-unverified-registry:ghcr.io/andersrh/ostree-cachyos/silverblue:main-39
```
