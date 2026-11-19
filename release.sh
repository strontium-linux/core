#!/bin/bash

echo "Pushing blueprints..."
composer-cli blueprints push blueprint-minimal.toml
composer-cli blueprints push blueprint-lxqt.toml
composer-cli blueprints push blueprint-home.toml
echo "Successfully pushed blueprints"

echo "Starting to build ISOs..."
composer-cli compose start strontium-minimal image-installer
composer-cli compose start strontium-lxqt image-installer
composer-cli compose start strontium-home image-installer
echo "Successfully started to build ISOs"

watch -n 5 composer-cli compose status
