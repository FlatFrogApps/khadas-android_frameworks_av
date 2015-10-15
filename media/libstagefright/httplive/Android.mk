LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=               \
        HTTPDownloader.cpp      \
        LiveDataSource.cpp      \
        LiveSession.cpp         \
        M3UParser.cpp           \
        PlaylistFetcher.cpp     \
        StreamSniffer.cpp

LOCAL_C_INCLUDES:= \
	$(TOP)/frameworks/av/media/libstagefright \
	$(TOP)/frameworks/native/include/media/openmax \
	$(TOP)/external/openssl/include \
    $(TOP)/external/curl/include \
    $(TOP)/vendor/amlogic/frameworks/av/LibPlayer/third_parts/libcurl-ffmpeg/include

LOCAL_CFLAGS += -Werror -Wall
LOCAL_CLANG := true

LOCAL_STATIC_LIBRARIES := libstagefright_hevcutils libcurl_base libcurl_common

LOCAL_SHARED_LIBRARIES := \
        libbinder \
        libcrypto \
        libcutils \
        libmedia \
        libstagefright \
        libstagefright_foundation \
        libutils \
        libamffmpeg \
        libcurl

LOCAL_MODULE:= libstagefright_httplive

ifeq ($(TARGET_ARCH),arm)
    LOCAL_CFLAGS += -Wno-psabi
endif

include $(BUILD_SHARED_LIBRARY)
