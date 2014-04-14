# Inherit the msm7x27a-common definitions
$(call inherit-product, device/qcom/msm7x27a/msm7x27a.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product-if-exists, vendor/zte/v817/v817-vendor.mk)

LOCAL_PATH := device/zte/v817

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS += device/zte/v817/overlay

## LDPI assets
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

## FM Radio permissions
#PRODUCT_COPY_FILES += \
#    frameworks/base/data/etc/com.stericsson.hardware.fm.receiver.xml:system/etc/permissions/com.stericsson.hardware.fm.receiver.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# ZTE rmt_storage_recovery
PRODUCT_COPY_FILES += \
    device/zte/v817/recovery/sbin/rmt_storage_recovery:recovery/root/sbin/rmt_storage_recovery \
    device/zte/v817/recovery/sbin/nv_set:recovery/root/sbin/nv_set

## Hardware properties
#    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
#    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
#    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
#    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
#    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
#    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

#Bluetooth configuration files
#PRODUCT_COPY_FILES += \
#   system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

## ZTE ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/zte/v817/ramdisk,root)

## Packages
#wlan
#PRODUCT_PACKAGES += \
#    dhcpcd.conf

# EXT4 Support
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    cpueater

# Graphics
PRODUCT_PACKAGES += \
    libgenlock \
    libgralloc \
    libhwcomposer

# Light
PRODUCT_PACKAGES += \
    liblight

# Audio
#PRODUCT_PACKAGES += \
#    libaudio

# Camera
#PRODUCT_PACKAGES += \
#    libtscamera-ext

# Power
PRODUCT_PACKAGES += \
    power.msm7x27a

# CyanogenMOD
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

## Start - Another from Samsung Galaxy Core
# Audio
PRODUCT_COPY_FILES += \
    device/zte/v817/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/zte/v817/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf

# Keychar
PRODUCT_COPY_FILES += \
    device/zte/v817/prebuilt/usr/keychars/7x27a_kp.kcm:system/usr/keychars/7x27a_kp.kcm

# Keylayout
PRODUCT_COPY_FILES += \
    device/zte/v817/prebuilt/usr/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    device/zte/v817/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/zte/v817/prebuilt/usr/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl \
## End - Another from Samsung Galaxy Core

$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_v817
PRODUCT_DEVICE := v817
