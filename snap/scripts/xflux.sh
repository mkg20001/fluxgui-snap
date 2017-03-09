#!/bin/bash

len="32"
qemu=""

#check if 32 or 64
uname -m | grep '64' > /dev/null && len="64"
#check if we need qemu (everything except i386/amd64 and similar)
uname -m | grep 'arm' > /dev/null && qemu="true"

bin="$SNAP/bin/xflux$len"

[ ! -z "$qemu" ] && echo "$0: Requires qemu to run on $(uname -m). Will be added soon." && exit 2

$bin $@
exit $?
