
# Inherit some common CM stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/goyawifi/full_goyawifi.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := goyawifi
PRODUCT_NAME := lineage_goyawifi
