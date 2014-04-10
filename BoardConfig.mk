# inherit from the proprietary version
-include vendor/zte/v817/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := msm7627a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a5
TARGET_ARCH_VARIANT := armv7-a-neon

ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := 8225

## kernel
BOARD_EGL_CFG := device/zte/v817/egl.cfg
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom loglevel=1 vmalloc=200M
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096
# kernel source
TARGET_KERNEL_SOURCE := kernel/zte/v817
TARGET_KERNEL_CONFIG := msm7627a-perf_defconfig
TARGET_PREBUILT_KERNEL := device/zte/v817/kernel
TARGET_PROVIDES_INIT_TARGET_RC := true

## recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_PREBUILT_RECOVERY_KERNEL := device/zte/v817/recovery/kernel
TARGET_RECOVERY_FSTAB := device/zte/v817/recovery/recovery.fstab
RECOVERY_FSTAB_VERSION := 2
BOARD_RECOVERY_SWIPE := true

BOARD_CUSTOM_GRAPHICS := ../../../device/zte/v817/recovery/graphics.c

# fix this up by examining /proc/mtd on a running device
# blocks x 1024
BOARD_BOOTIMAGE_PARTITION_SIZE := 13901824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# BOARD_RECOVERY_HANDLES_MOUNT := true
# BOARD_USES_MMCUTILS := true
# BOARD_HAS_SDCARD_INTERNAL := true
TARGET_USERIMAGES_USE_EXT4 := true

# Board
# - tslib -> touch screen libs
# TARGET_HAVE_TSLIB := true
# - bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Display
DEVICE_RESOLUTION = 480x854
TARGET_BOARD_PLATFORM_GPU := qcom-adreno203
TARGET_QCOM_DISPLAY_VARIANT := caf
BOARD_HAS_FLIPPED_SCREEN := false

# Wifi
BOARD_WLAN_DEVICE := ath6kl
# WPA_SUPPLICANT_VERSION := VER_0_8_X
# BOARD_WPA_SUPPLICANT_DRIVER := NL80211
# BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
# BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_ath6kl
# BOARD_HOSTAPD_DRIVER := NL80211
# WIFI_EXT_MODULE_NAME := "cfg80211"
# WIFI_EXT_MODULE_PATH := "/system/lib/modules/cfg80211.ko"
# WIFI_AP_DRIVER_MODULE_NAME := "ath6kl_sdio"
# WIFI_AP_DRIVER_MODULE_PATH := "/system/lib/modules/ath6kl_sdio.ko"
# WIFI_AP_DRIVER_MODULE_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1"
# WIFI_DRIVER_MODULE_NAME := "ath6kl_sdio"
# WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/ath6kl_sdio.ko"
# WIFI_DRIVER_MODULE_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1"

# RIL
# BOARD_USES_LEGACY_RIL := true

# sepolicy - sd-ext
BOARD_SEPOLICY_DIRS += device/zte/v817/sepolicy
BOARD_SEPOLICY_UNION += \
    file_contexts

# UMS
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"

# qcom
BOARD_USES_QCNE := true

# GPS HAL
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Camera
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT -DNEEDS_VECTORIMPL_SYMBOLS

# Healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm7x27a

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
# BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/v817/bluetooth

# FM
# BOARD_HAVE_QCOM_FM := true

# Audio
# HAVE_HTC_AUDIO_DRIVER := true
# BOARD_USES_GENERIC_AUDIO := true

# Device specific libs
TARGET_PROVIDES_LIBLIGHT := true
TARGET_PROVIDES_LIBAUDIO := true

# Javascript, Browser and Webkit
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome
TARGET_FORCE_CPU_UPLOAD := true

## Filesystem
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p15
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw
BOARD_DATA_DEVICE := /dev/block/mmcblk0p13
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p12
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
