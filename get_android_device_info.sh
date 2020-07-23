#!/system/bin/sh

if [ ! $(which getprop) ]; then
   echo -e "\nThis script must run in Android devices\nExiting ...\n"
   exit 1
fi

propsList=("ro.bootimage.build.date" \
"ro.bootimage.build.date.utc" \
"ro.bootimage.build.fingerprint" \
"ro.bootloader" \
"ro.bootmode" \
"ro.build.ab_update" \
"ro.build.characteristics" \
"ro.build.date" \
"ro.build.date.utc" \
"ro.build.description" \
"ro.build.display.id" \
"ro.build.fingerprint" \
"ro.build.flavor" \
"ro.build.hardware.version" \
"ro.build.host" \
"ro.build.id" \
"ro.build.product" \
"ro.build.system_root_image" \
"ro.build.tags" \
"ro.build.thumbprint" \
"ro.build.type" \
"ro.build.user" \
"ro.build.vendorprefix" \
"ro.build.version.all_codenames" \
"ro.build.version.base_os" \
"ro.build.version.ci" \
"ro.build.version.codename" \
"ro.build.version.incremental" \
"ro.build.version.min_supported_target_sdk" \
"ro.build.version.preview_sdk" \
"ro.build.version.preview_sdk_fingerprint" \
"ro.build.version.release" \
"ro.build.version.sdk" \
"ro.build.version.security_patch" \
"ro.build.version.type" \
"ro.carrier" \
"ro.config.wallpaper" \
"ro.control_privapp_permissions" \
"ro.crypto.allow_encrypt_override" \
"ro.crypto.fs_crypto_blkdev" \
"ro.crypto.state" \
"ro.crypto.type" \
"ro.crypto.volume.filenames_mode" \
"ro.hardware" \
"ro.hardware.egl" \
"ro.hardware.vulkan" \
"ro.oem.key1" \
"ro.oem_unlock_supported" \
"ro.opa.device_model_id" \
"ro.opengles.version" \
"ro.product.board" \
"ro.product.brand" \
"ro.product.cert" \
"ro.product.cpu.abi" \
"ro.product.cpu.abilist" \
"ro.product.cpu.abilist32" \
"ro.product.cpu.abilist64" \
"ro.product.device" \
"ro.product.first_api_level" \
"ro.product.locale" \
"ro.product.locale.language" \
"ro.product.locale.region" \
"ro.product.manufacturer" \
"ro.product.mod_device" \
"ro.product.model" \
"ro.product.name" \
"ro.product.system.brand" \
"ro.product.system.device" \
"ro.product.system.manufacturer" \
"ro.product.system.model" \
"ro.product.system.name" \
"ro.product.vendor.brand" \
"ro.product.vendor.device" \
"ro.product.vendor.manufacturer" \
"ro.product.vendor.model" \
"ro.product.vendor.name" \
"ro.secure" \
"ro.secureboot.devicelock" \
"ro.secureboot.lockstate" \
"ro.system.build.date" \
"ro.system.build.date.utc" \
"ro.system.build.fingerprint" \
"ro.system.build.id" \
"ro.system.build.tags" \
"ro.system.build.type" \
"ro.system.build.version.release" \
"ro.system.build.version.sdk" \
"ro.treble.enabled" \
"ro.vendor.boot.serialno" \
"ro.vendor.build.date" \
"ro.vendor.build.date.utc" \
"ro.vendor.build.description" \
"ro.vendor.build.fingerprint" \
"ro.vendor.build.id" \
"ro.vendor.build.security_patch" \
"ro.vendor.build.tags" \
"ro.vendor.build.type" \
"ro.vendor.build.version.qcom" \
"ro.vendor.build.version.release" \
"ro.vendor.build.version.sdk" \
"ro.vendor.carrier" \
"ro.vendor.product.cpu.abilist" \
"ro.vendor.product.cpu.abilist32" \
"ro.vendor.product.cpu.abilist64" \
"ro.vendor.product.device" \
"ro.vendor.product.display" \
"ro.vendor.product.name" \
"sys.oem_unlock_allowed" \
"wifi.interface")

device_manufacturer="$(getprop ro.product.manufacturer)"
device_model="$(getprop ro.product.model)"
device_name="$(getprop ro.product.name)"

echo -e "\n[*] Creating the file $(getprop ro.product.manufacturer)_$(getprop ro.product.model)_$(getprop ro.product.name)_device_info.txt ..."
touch /sdcard/"${device_manufacturer}_${device_model}_${device_name}"_device_info.txt

echo "    The device info will be written inside this file"

echo -e "\n\n[*] Writing device info into the file ..."
for property in "${propsList[@]}"; do
   echo "${property}: $(getprop ${property})" >> /sdcard/"${device_manufacturer}_${device_model}_${device_name}"_device_info.txt 
done

echo -e "\n\nDone\nThe file is inside the Internal Storage of the device\n"
