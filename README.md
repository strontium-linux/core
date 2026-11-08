# Strontium Linux Core

Get started with Strontium Linux. This repository contains the resources to build your own Strontium Linux ISO. It contains the minimal and LXQt versions of Strontium Linux.

## Distro Versions

There are currently 2 variants of Strontium Linux.

### 1. Strontium Linux Minimal

Strontium Linux Minimal contains the base Fedora 44 environment with nothing additional installed.

The blueprint can be found in `blueprint-minimal.toml`.

### 2. Strontium Linux LXQt

Strontium Linux LXQt contains the base Fedora 44 envrionment, as well as the LXQt packages group. Packages such as Falkon browser are also included as part of this group, provding a function desktop environment.

The blueprint can be found in `blueprint-lxqt.toml`.

## Dependencies

You need to install the dependencies for `composer-cli` before getting started. It is recommended that you use a Fedora system.

```bash
# Install dependencies
sudo dnf install osbuild-composer composer-cli -y

# Enable the osbuild-composer socket
sudo systemctl enable --now osbuild-composer.socket

# Add your user to the weldr group
sudo usermod -aG weldr $USER

# Create the weldr group
newgrp weldr
```

## How To Build

1. Push the blueprint

```bash
composer-cli blueprints push blueprint-[version].toml # e.g. composer-cli blueprints push blueprint-minimal.toml
```

2. Build the image

```bash
composer-cli compose start [blueprint-name] image-installer # e.g. composer-cli compose start strontium-minimal image-installer
```

3. Retrieve the ISO

```bash
composer-cli compose image [blueprint-commit-hash] # e.g. composer-cli compose image c8cf5e8a-54a0-4361-9def-edea81742d9b
```

4. Run the ISO

You can use your preferred virtual machine like QEMU to run the live ISO or boot it from a USB stick.
