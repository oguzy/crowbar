# Kickstart file automatically generated by anaconda.

install
cdrom
#key --skip
lang en_US.UTF-8
keyboard us
text
# crowbar
rootpw --iscrypted $1$H6F/NLec$Fps2Ut0zY4MjJtsa1O2yk0
firewall --disabled
authconfig --enableshadow --enablemd5
selinux --disabled
timezone --utc UTC
bootloader --timeout=1 --location=mbr --driveorder=sda --extlinux
zerombr
ignoredisk --only-use=sda
clearpart --all --drives=sda
part /boot --fstype ext4 --size=100 --ondisk=sda
part swap --recommended
part pv.6 --size=1 --grow --ondisk=sda
volgroup lv_admin --pesize=32768 pv.6
logvol / --fstype ext4 --name=lv_root --vgname=lv_admin --size=1 --grow
reboot

%packages --nobase
@core
@standard
createrepo
device-mapper-multipath
dracut-nohostonly
dracut-norescue
fipscheck
firewalld
iptables-services
kernel
openssh
syslinux-extlinux
trousers

-audit
-biosdevname
-e2fsprogs
-iprutils
-NetworkManager
-plymouth
-polkit
-sendmail
%end

%post --nochroot
export PS4='${BASH_SOURCE}@${LINENO}(${FUNCNAME[0]}): '
set -x
(
    ls -al /tmp
    mount
    mkdir -p /mnt/sysimage/tftpboot/redhat_dvd/dell
    cp -a /mnt/source/. /mnt/sysimage/tftpboot/redhat_dvd/.
) &>/mnt/sysimage/root/post-install-copy.log
%end

%post
export OS_TOKEN="fedora-19"
export BASEDIR="/tftpboot/redhat_dvd"
export PS4='${BASH_SOURCE}@${LINENO}(${FUNCNAME[0]}): '
set -x
exec &>/root/post-install.log

. /tftpboot/redhat_dvd/extra/redhat-common-post.sh
%end