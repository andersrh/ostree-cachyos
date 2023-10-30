FROM quay.io/fedora-ostree-desktops/silverblue:39 AS builder

RUN cd /etc/yum.repos.d/ && wget https://copr.fedorainfracloud.org/coprs/bieszczaders/kernel-cachyos/repo/fedora-$(rpm -E %fedora)/bieszczaders-kernel-cachyos-fedora-$(rpm -E %fedora).repo && \
wget https://copr.fedorainfracloud.org/coprs/bieszczaders/kernel-cachyos-addons/repo/fedora-$(rpm -E %fedora)/bieszczaders-kernel-cachyos-addons-fedora-$(rpm -E %fedora).repo

# Add cliwrap in order to be able to build initramfs
RUN rpm-ostree cliwrap install-to-root /

RUN rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos-bore-eevdf

RUN rpm-ostree install libcap-ng-devel procps-ng-devel uksmd-rawhide
RUN systemctl enable uksmd.service

# Clear cache, /var and /tmp and commit ostree
RUN rm -rf /tmp/* /var/* && mkdir -p /var/tmp && chmod -R 1777 /var/tmp && \
ostree container commit
