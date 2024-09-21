#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a23

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9

# Assert
TARGET_OTA_ASSERT_DEVICE := a23

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := bengal
TARGET_BOARD_PLATFORM := bengal
QCOM_BOARD_PLATFORMS := bengal
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 450

# Kernel
TARGET_KERNEL_ARCH := $(TARGET_ARCH)
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_TAGS_OFFSET := 0x01e00000

BOARD_KERNEL_CMDLINE := \
	console=null \
	androidboot.hardware=qcom \
	androidboot.memcg=1 \
	lpm_levels.sleep_disabled=1 \
	video=vfb:640x400,bpp=32,memsize=3072000 \
	msm_rtb.filter=0x237 \
	service_locator.enable=1 \
	androidboot.usbcontroller=4e00000.dwc3 \
	swiotlb=2048 \
	loop.max_part=7 \
	cgroup.memory=nokmem,nosocket \
	firmware_class.path=/vendor/firmware_mnt/image \
	printk.devkmsg=on \
	androidboot.selinux=permissive

BOARD_MKBOOTIMG_ARGS := \
    --dtb $(DEVICE_PATH)/prebuilt/dtb.img \
    --board SRPUK11C005 \
    --kernel_offset 0x00008000 \
    --ramdisk_offset 0x02000000 \
    --tags_offset 0x01e00000 \
    --dtb_offset 0x01f00000 \
    --header_version 2
BOARD_ROOT_EXTRA_FOLDERS := \
    carrier \
    efs \
    omr \
    optics \
    prism \
    spu
	
# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 0x01800000
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_ODM := odm
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9122611200

BOARD_ROOT_EXTRA_FOLDERS := \
    carrier \
    efs \
    omr \
    optics \
    prism \
    spu

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_BOARD_PLATFORM_GPU := qcom-adreno610
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Encryption
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# TWRP Configuration
TW_DEVICE_VERSION := 1_MRX7014
TW_THEME := portrait_hdpi
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 306
TW_DEFAULT_BRIGHTNESS := 255
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone50/temp"
TW_Y_OFFSET := 80
TW_H_OFFSET := -80
TW_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BACKUP_EXCLUSIONS := /data/fonts
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_NTFS_3G := true
PRODUCT_ENFORCE_VINTF_MANIFEST := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_FRAMERATE := 90

# TWRP Configuration: Logd
TWRP_EVENT_LOGGING := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_LOGD := true
