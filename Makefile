TARGET := iphone:clang:latest:14.0
ifeq ($THEOS_PACKAGE_SCHEME, rootless)
    export ARCHS = arm64 arm64e
endif
INSTALL_TARGET_PROCESSES = SpringBoard

TWEAK_NAME = Rounded
$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

SUBPROJECTS += Preferences

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
