#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux 

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File
# systemctl enable podman.socket

dnf5 -y install dnf5-plugins python3-jsonschema
dnf5 -y copr enable @asahi/kernel
dnf5 -y copr enable @asahi/mesa
dnf5 -y copr enable @asahi/flatpak
dnf5 -y copr enable @asahi/u-boot
dnf5 -y copr enable @asahi/packit-builds
dnf5 -y remove kernel kernel-core kernel-modules kernel-modules-core kernel-uki-virt kernel-modules-extra \
  kernel-headers kernel-tools kernel-tools-libs
dnf5 -y versionlock delete kernel kernel-core kernel-modules \
  kernel-modules-core kernel-tools kernel-tools-libs
dnf5 -y install kernel kernel-core \
  kernel-modules kernel-modules-core kernel-tools kernel-tools-libs

dnf5 -y --repo=copr:copr.fedorainfracloud.org:@asahi:mesa install mesa spirv-llvm-translator18 virglrenderer
dnf5 -y install mesa-asahi-24.08-flatpak
dnf5 -y install arm-trusted-firmware crust-firmware uboot-tools
dnf5 -y install asahi-audio asahi-scripts m1n1

