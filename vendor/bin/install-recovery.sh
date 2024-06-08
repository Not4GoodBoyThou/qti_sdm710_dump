#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:b971e55fdd074f7f1477bb1189e8a56c97b32a64; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:4e63062500f4913f92b8e68d807ec413182e0c7e \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:b971e55fdd074f7f1477bb1189e8a56c97b32a64 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
