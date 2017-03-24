# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# inherit from the proprietary version
-include vendor/samsung/goyawifi/BoardConfigVendor.mk

$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libft2_intermediates)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libft2_intermediates/export_includes)

# Target info
USE_CAMERA_STUB := true
BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOARD_PLATFORM := mrvl
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true

TARGET_BOOTLOADER_BOARD_NAME := PXA986
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# Kernel
TARGET_KERNEL_SOURCE  := kernel/samsung/goyawifi
#TARGET_KERNEL_CONFIG  := pxa986_goyawifi_rev02_defconfig
TARGET_KERNEL_CONFIG  := pxa986_goyawifi_rev02_recovery_defconfig
BOARD_KERNEL_CMDLINE  := 
BOARD_KERNEL_BASE     := 0x10000000
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x01000000
BOARD_KERNEL_PAGESIZE := 2048
    
# Recovery
BOARD_UMS_LUNFILE := "/sys/class/android_usb/f_mass_storage/lun0/file"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := device/samsung/goyawifi/rootdir/etc/fstab.pxa988

RECOVERY_VARIANT := twrp

#TARGET_USERIMAGES_USE_EXT4 := true
#BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 6379536384
#BOARD_CACHEIMAGE_PARTITION_SIZE := 1442840576
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 22036873216
#BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 1541398
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 1761598
BOARD_KERNELIMAGE_PARTITION_SIZE := 1761598
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 167246915
BOARD_CACHEIMAGE_PARTITION_SIZE := 37853377
BOARD_USERDATAIMAGE_PARTITION_SIZE := 577657213
BOARD_FLASH_BLOCK_SIZE := 4096

# Vold
#BOARD_VOLD_MAX_PARTITIONS := 17
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun%d/file"

# Charging mode
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME := "battery"

#TWRP
DEVICE_RESOLUTION := 1024x600
TW_THEME := landscape_mdpi
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
BOARD_HAS_NO_REAL_SDCARD := true

