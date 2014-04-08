## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := v817

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/v817/device_v817.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := v817
PRODUCT_NAME := cm_v817
PRODUCT_BRAND := zte
PRODUCT_MODEL := v817
PRODUCT_MANUFACTURER := zte
