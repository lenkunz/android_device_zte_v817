
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit device configuration
$(call inherit-product, device/zte/v817/device_v817.mk)
$(call inherit-product, device/qcom/msm7x27a/BoardConfig.mk)

# resolution
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 854

# Release name
PRODUCT_RELEASE_NAME := v817

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := v817
PRODUCT_NAME := cm_v817
PRODUCT_BRAND := zte
PRODUCT_MODEL := v817
PRODUCT_MANUFACTURER := zte
