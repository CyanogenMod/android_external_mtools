# Copyright 2014 The Android Open Source Project

LOCAL_PATH := $(call my-dir)
MTOOLS := \
          mattrib \
          mcat \
          mcd \
          mclasserase \
          mcopy \
          mdel \
          mdeltree \
          mdir \
          mdu \
          mformat \
          minfo \
          mlabel \
          mmd \
          mmount \
          mmove \
          mpartition \
          mrd \
          mren \
          mtype \
          mtoolstest \
          mshortname \
          mshowfat  \
          mbadblocks  \
          mzip \
#
# mtools
#

include $(CLEAR_VARS)
HOST_ID := -DCPU_x86_64 -DVENDOR_unknown -DOS_linux_gnu
CFLAGS += -DHAVE_CONFIG_H -DSYSCONFDIR=\"$(sysconfdir)\" $(HOST_ID)
LOCAL_MODULE := mtools
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := buffer.c \
                   charsetConv.c \
                   codepages.c \
                   config.c \
                   copyfile.c \
                   devices.c \
                   dirCache.c \
                   directory.c \
                   direntry.c \
                   expand.c \
                   fat.c \
                   fat_free.c \
                   file.c \
                   file_name.c \
                   filter.c \
                   floppyd_io.c \
                   force_io.c \
                   hash.c \
                   init.c \
                   llong.c \
                   match.c \
                   mainloop.c \
                   mattrib.c \
                   mbadblocks.c \
                   mcat.c \
                   mcd.c \
                   mclasserase.c \
                   mcopy.c \
                   mdel.c \
                   mdir.c \
                   mdoctorfat.c \
                   mdu.c \
                   mformat.c \
                   minfo.c \
                   misc.c \
                   missFuncs.c \
                   mk_direntry.c \
                   mlabel.c \
                   mmd.c \
                   mmount.c \
                   mmove.c \
                   mpartition.c \
                   mshortname.c \
                   mshowfat.c \
                   mzip.c \
                   mtools.c \
                   patchlevel.c \
                   plain_io.c \
                   precmd.c \
                   privileges.c \
                   scsi.c \
                   signal.c \
                   stream.c \
                   streamcache.c \
                   subdir.c \
                   unixdir.c \
                   tty.c \
                   vfat.c \
                   xdf_io.c

LOCAL_CFLAGS := $(CFLAGS)

include $(BUILD_HOST_EXECUTABLE)

#
# symlinks to mtools
#

MTOOLS_SYMLINKS := $(addsuffix /$(HOST_EXECUTABLE_SUFFIX), $(addprefix $(HOST_OUT_EXECUTABLES)/,$(MTOOLS)))
$(MTOOLS_SYMLINKS) : MTOOLS_BINARY := $(addsuffix /$(HOST_EXECUTABLE_SUFFIX),$(LOCAL_MODULE))
$(MTOOLS_SYMLINKS): $(LOCAL_INSTALLED_MODULE) $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> $<"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide)ln -sf $(MTOOLS_BINARY) $@
