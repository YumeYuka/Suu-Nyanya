#=================================================================================================================
# Copyright (c) 2023-present Anne Sakitin (Tianwan Ayana) & YumeYuka.                                            =
#                                                                                                                =
# Part of the SUU project.                                                                                       =
# Part of the NGA project.                                                                                       =
# Licensed under the F2DLPR License.                                                                             =
#                                                                                                                =
# YOU MAY NOT USE THIS FILE EXCEPT IN COMPLIANCE WITH THE LICENSE.                                               =
# Provided "AS IS", WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,                                                =
# unless required by applicable law or agreed to in writing.                                                     =
#                                                                                                                =
# For details about the SUU project, visit: https://www.mod.latestfile.zip.                                      =
# For details about the NGA project, visit: http://app.niggergo.work.                                            =
# For details about the F2DLPR License terms and conditions, visit: http://license.fileto.download.              =
#=================================================================================================================

[ -f "$MODPATH/skt-utils.sh" ] && . "$MODPATH/skt-utils.sh" || abort '! File "skt-utils.sh" does not exist!'
skt_install_init "config.fvv" # Don't write code before this line!

Config="$MODPATH/config.fvv"
Config_DIR="/sdcard/Android/Suu-Nyanya/"

not_magisk && {
  is_ksu && {
    skt_print "Root Type: KernelSU"
    skt_print "KernelSU Version: $KSU_VER"
    skt_print "KernelSU Version Code: $KSU_VER_CODE"
    skt_print "KernelSU Kernel Version Code: $KSU_KERNEL_VER_CODE"
  }
  is_ap && {
    skt_print "Root Type: APatch"
    skt_print "APatch Version: $APATCH_VER"
    skt_print "APatch Version Code: $APATCH_VER_CODE"
  }
} || {
  skt_print "Root Type: Magisk"
  skt_print "Magisk Version: $MAGISK_VER"
  skt_print "Magisk Version Code: $MAGISK_VER_CODE"
}
skt_print "Device Architecture: $ARCH"
skt_print "Is 64-bit: $IS64BIT"
skt_print "API Level: $API"
newline
skt_print "让杂乱无章的文件世界变得如同精美画卷般整洁可爱喵~✨"
newline
skt_print "刷入后自行评估文件位置移动带来的后果"
newline

[ -d "$Config_DIR" ] && {
  skt_print "是否覆盖配置文件..."
  skt_print "按下音量下键覆盖(其他任意键取消)"
  newline
  [ $(until_key) = down ] && {
    skt_print "配置文件已覆盖"
    cp -f "$Config" "$Config_DIR"
    true
  } || skt_print "配置文件未覆盖"
  true
} || {
  mkdir -p "$Config_DIR"
  cp -f "$Config" "$Config_DIR"
}
get_target_bin Suu-Nyanya
newline
skt_print "配置路径在 /sdcard/Android/Suu-Nyanya/config.fvv"
skt_print "Github: https://github.com/YumeYuka/Suu-Nyanya"
skt_print "如果可以的话,请给我一个Star"
newline
skt_print "按下音量下键跳转浏览器进入Github地址(其他任意键取消)"
newline

[ $(until_key) = down ] && {
  skt_print "已跳转"
  goto_url 'https://github.com/YumeYuka/Suu-Nyanya'
  true
} || skt_print "已取消跳转"

skt_install_done # Don't write code after this line!