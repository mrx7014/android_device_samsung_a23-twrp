#set -o xtrace
FDEVICE="a23"

fox_get_target_device() {
local chkdev
  if echo "$BASH_SOURCE" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif set | grep BASH_ARGV | grep -w \"$FDEVICE\"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif echo "${BASH_SOURCE[0]}" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif echo "$0" | grep -q "$FDEVICE"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  fi
}

if [ -z "$FOX_BUILD_DEVICE" ]; then
	fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"
	export ALLOW_MISSING_DEPENDENCIES=true
	export FOX_VANILLA_BUILD=1
	export FOX_ENABLE_APP_MANAGER=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_LZ4_BINARY=1
	export FOX_USE_ZSTD_BINARY=1
	export FOX_USE_DATE_BINARY=1
	export FOX_USE_BUSYBOX_BINARY=1
	export FOX_USE_GREP_BINARY=1
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export FOX_RECOVERY_SYSTEM_EXT_PARTITION="/dev/block/mapper/system_ext"
	export FOX_RECOVERY_PRODUCT_PARTITION="/dev/block/mapper/product"
	export OF_ENABLE_ALL_PARTITION_TOOLS=1
	export FOX_USE_DMSETUP=1
	export FOX_DELETE_INITD_ADDON=1
	export FOX_DELETE_AROMAFM=1
	export FOX_USE_UPDATED_MAGISKBOOT=1
	export OF_LOOP_DEVICE_ERRORS_TO_LOG=1
	export OF_SKIP_DECRYPTED_ADOPTED_STORAGE=1
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi
#
# about
export OF_MAINTAINER="MRX7014"
export FOX_BUILD_TYPE="Unofficial"
export TARGET_DEVICE_ALT="a23"
export FOX_VERSION="R12.1"
