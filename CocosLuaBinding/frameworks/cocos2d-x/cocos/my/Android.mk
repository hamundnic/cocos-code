LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
 
LOCAL_MODULE := cocos_custom_static
 
LOCAL_MODULE_FILENAME := libmy
 
LOCAL_SRC_FILES := \
CustomClass.cpp
 
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH) \
$(LOCAL_PATH)./
 
LOCAL_C_INCLUDES := $(LOCAL_PATH) \
$(LOCAL_PATH)./
 
LOCAL_CFLAGS += -Wno-psabi
LOCAL_EXPORT_CFLAGS += -Wno-psabi
 
LOCAL_WHOLE_STATIC_LIBRARIES := cocos2dx_static
 
include $(BUILD_STATIC_LIBRARY)
 
$(call import-module,.)