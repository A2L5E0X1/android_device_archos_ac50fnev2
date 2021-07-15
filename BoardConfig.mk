#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## Device Path
DEVICE_PATH := device/archos/ac50fnev2

# Arch
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6580
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Charger
BACKLIGHT_PATH := "/sys/class/leds/lcd-backlight/brightness"
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# CPU
TARGET_CPU_SMP := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true

# Graphics
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_HARDWARE_3D := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# Include
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1 androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x04000000 --second_offset 0x00f00000 --tags_offset 0x0e000000
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel

# Lineage Hardware
BOARD_HARDWARE_CLASS := $(DEVICE_PATH)/cmhw

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 # mmcblk0p7 (16384*1024)
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456 # mmcblk0p19 (262144*1024)
BOARD_FLASH_BLOCK_SIZE := 4096 # blockdev --getbsz /dev/block/mmcblk0
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 # mmcblk0p8 (16384*1024)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2726297600 # mmcblk0p18 (2662400*1024)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12446072832 # mmcblk0p20 (12154368*1024)

# Platform
TARGET_BOARD_PLATFORM := mt6580

# Props
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6580

# RIL
BOARD_RIL_CLASS := ../../../$(DEVICE_PATH)/ril

# SELinux
BOARD_SECCOMP_POLICY := $(DEVICE_PATH)/seccomp

include device/mediatek/sepolicy/sepolicy.mk

# Shims
LINKER_FORCED_SHIM_LIBS := \
    /system/vendor/bin/thermal|libshim_ifc.so \
    /system/vendor/lib/libcam_utils.so|libshim_ui.so \
    /system/vendor/lib/libgui_ext.so|libshim_gui.so \
    /system/vendor/lib/libmtk_mmutils.so|libshim_ui.so \
    /system/vendor/lib/libui_ext.so|libshim_ui.so \
    /system/vendor/lib/mtk-ril.so|libshim_ifc.so \
    /system/vendor/lib/mtk-rilmd2.so|libshim_ifc.so

# Vendor
TARGET_COPY_OUT_VENDOR := system/vendor

# Wifi
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WLAN_DEVICE := MediaTek
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_FW_PATH_PARAM := /dev/wmtWifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
