# code by @YumeYuka

baseDir="$(dirname "$(readlink -f "$0")")"
[ -f "$baseDir/skt-utils.sh" ] && . "$baseDir/skt-utils.sh" || exit

until_boot 90

nohup_bin "$baseDir/intelligent"