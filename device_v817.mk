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
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/com.stericsson.hardware.fm.receiver.xml:system/etc/permissions/com.stericsson.hardware.fm.receiver.xml
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# ZTE rmt_storage_recovery
PRODUCT_COPY_FILES += \
    device/zte/v817/recovery/sbin/rmt_storage_recovery:recovery/root/sbin/rmt_storage_recovery

## Hardware properties
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## ZTE ramdisk
#PRODUCT_COPY_FILES += \
#    device/zte/v817/ramdisk/fstab.nand.msm7627a:root/fstab.nand.msm7627a \
#    device/zte/v817/ramdisk/fstab.qcom:root/fstab.qcom \
#    device/zte/v817/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
#    device/zte/v817/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
#    device/zte/v817/ramdisk/init.qcom.rc:root/init.qcom.rc \
#    device/zte/v817/ramdisk/init.qcom.ril.path.sh:root/init.qcom.ril.path.sh \
#    device/zte/v817/ramdisk/init.qcom.unicorn-dpi.sh:root/init.qcom.unicorn-dpi.sh \
#    device/zte/v817/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
#    device/zte/v817/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
#    device/zte/v817/ramdisk/init.target.rc:root/init.target.rc \
#    device/zte/v817/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc
## ZTE ramdisk - test
PRODUCT_COPY_FILES += \
    device/zte/v817/ramdisk/test:root/fstab.qcom \
    device/zte/v817/ramdisk/test:root/init.qcom.rc \
    device/zte/v817/ramdisk/test:root/init.qcom.usb.rc \
    device/zte/v817/ramdisk/test:root/initlogo.rle \
    device/zte/v817/ramdisk/test:root/lpm.rc \
    device/zte/v817/ramdisk/test:root/ueventd.qcom.rc

### BEGIN: build properties
### Copy from arubislim (Galaxy Core)

## Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.checkjni=0 \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.dexopt-flags=v=a,o=v,m=y,u=y \
    dalvik.vm.heapsize=48m

## Development settings
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    ro.adb.secure=1 \
    ro.secure=1 \
    ro.allow.mock.location=0

## Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.force_highendgfx=1

## Disable kernel error
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.qemu=0

## Loop ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.delay=3000 \
    ro.telephony.call_ring.multiple=false

## Other
PRODUCT_PROPERTY_OVERRIDES += \
    DEVICE_PROVISIONED=1 \
    dev.sfbootcomplete=0 \
    ro.config.play.bootsound=0 \
    ro.setupwizard.enable_bypass=1

## RIL, telephony
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    ro.telephony.default_network=0 \
    rild.libargs=-d/dev/smd0 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.multi.rild=true

## USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

## WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180

## WiFi AP
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.ap.interface=wlan0

## QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    dev.pm.dyn_sample_period=700000 \
    dev.pm.dyn_samplingrate=1 \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

### End: build properties

$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_v817
PRODUCT_DEVICE := v817
