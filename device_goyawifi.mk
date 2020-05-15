$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/goyawifi/goyawifi-vendor.mk)

# Enable higher-res drawables while keeping mdpi as primary source
PRODUCT_AAPT_CONFIG := large mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

PRODUCT_CHARACTERISTICS := tablet

DEVICE_PACKAGE_OVERLAYS += device/samsung/goyawifi/overlay

PRODUCT_PROPERTY_OVERRIDES := \
    ro.carrier=wifi-only

# fstab:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.pxa988:root/fstab.pxa988 \
    $(LOCAL_PATH)/rootdir/extra.fstab:recovery/root/etc/extra.fstab \
    $(LOCAL_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab

# init.rc's:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.recovery.pxa988.rc:root/init.recovery.pxa988.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.rc:root/init.pxa988.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.usb.rc:root/init.pxa988.usb.rc \
    $(LOCAL_PATH)/rootdir/init.pxa988.tel.rc:root/init.pxa988.tel.rc

# Init files
PRODUCT_PACKAGES += \
    fstab.pxa988 \
    init.pxa988.rc \
    init.pxa988.usb.rc \
    ueventd.pxa988.rc
    
# uevent.rc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/ueventd.pxa988.rc:root/ueventd.pxa988.rc


# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Enable repeatable keys in cwm
# Set property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=true \
    ro.cm.hardware.cabc=/sys/class/mdnie/mdnie/cabc \
    ro.bq.gpu_to_cpu_unsupported=1 \
    wifi.interface=wlan0 \
    wifi.softap.interface=wlan0 \
    wifi.supplicant_scan_interval=30 \
    dalvik.vm.heapsize=128m \
    ro.carrier=wifi-only \
    ro.cwm.enable_key_repeat=true \
    ro.cwm.repeatable_keys=114,115

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

DEFAULT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	persist.service.adb.enable=1 \
	persist.sys.usb.config=mtp,adb \
	sys.disable_ext_animation=1    

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
