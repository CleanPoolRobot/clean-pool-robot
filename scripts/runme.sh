#!/usr/bin/env bash
# Start the Raspberry Pi in fully functional mode!

qemu-system-arm -kernel ./environment/qemu-rpi-kernel/kernel-qemu-3.10.25-wheezy \
                -cpu arm1176 \
                -m 256 \
                -M versatilepb \
                -no-reboot -serial stdio \
                -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" \
                -hda ./environment/rpi.img
