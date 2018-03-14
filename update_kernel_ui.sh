#!/bin/bash
_zenity="/usr/bin/zenity"

# Install or not?
_out="/tmp/update_kernel.$$"

# Install or not?
zenity --question --title "Install kernel v4.14.12-lowlatency"
case $? in
  0) echo "Starting Download..."
  ;;
  1) echo "Canceled"; exit 0
  ;;
  *) echo "Canceled"; exit 0
  ;;
esac

mkdir ~/kernel

if [ $? -eq 0 ]; then
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-headers-4.14.12-041412_4.14.12-041412.201801051649_all.deb -P ~/kernel/ -q  | tee >(${_zenity} --width=200 --height=100 \
  				    --title="Downloading" --progress \
			        --pulsate --text="Downloading new kernel...[1]" \
              --auto-kill --auto-close \
              --percentage=10) >${_out}
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-headers-4.14.12-041412-generic_4.14.12-041412.201801051649_amd64.deb -P ~/kernel/ -q  | tee >(${_zenity} --width=200 --height=100 \
              --title="Downloading" --progress \
              --pulsate --text="Downloading new kernel...[2]" \
              --auto-kill --auto-close \
              --percentage=10) >${_out}

  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-headers-4.14.12-041412-lowlatency_4.14.12-041412.201801051649_amd64.deb -P ~/kernel/ -q  | tee >(${_zenity} --width=200 --height=100 \
              --title="Downloading" --progress \
              --pulsate --text="Downloading new kernel...[3]" \
              --auto-kill --auto-close \
              --percentage=10) >${_out}

  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-image-4.14.12-041412-generic_4.14.12-041412.201801051649_amd64.deb -P ~/kernel/ -q  | tee >(${_zenity} --width=200 --height=100 \
              --title="Downloading" --progress \
              --pulsate --text="Downloading new kernel...[4]" \
              --auto-kill --auto-close \
              --percentage=10) >${_out}

  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-image-4.14.12-041412-lowlatency_4.14.12-041412.201801051649_amd64.deb -P ~/kernel/ -q  | tee >(${_zenity} --width=200 --height=100 \
              --title="Downloading" --progress \
              --pulsate --text="Downloading new kernel...[5]" \
              --auto-kill --auto-close \
              --percentage=10) >${_out}

  dpkg -i ~/kernel/*.deb  | tee >(${_zenity} --width=200 --height=100 \
              --title="Downloading" --progress \
              --pulsate --text="Downloading new kernel...[6]" \
              --auto-kill --auto-close \
              --percentage=10) >${_out}
else
  ${_zenity} --error --text="Error during installation... Canceled..."
fi

# Cleaning up
rm -rf ~/kernel/

zenity --question --title "Reboot Now?"
case $? in
  0) echo "Rebooting..."; reboot
  ;;
  1) echo "Canceled..."; exit 0
  ;;
  *) echo "Canceled..."; exit 0
  ;;
esac
