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
  (
  echo "# Downloading new kernel...[1]"
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-headers-4.14.12-041412_4.14.12-041412.201801051649_all.deb -P ~/kernel/ -q
  echo "20"

  echo "# Downloading new kernel...[2]"
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-headers-4.14.12-041412-generic_4.14.12-041412.201801051649_amd64.deb -P ~/kernel/ -q
  echo "30"

  echo "# Downloading new kernel...[3]"
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-headers-4.14.12-041412-lowlatency_4.14.12-041412.201801051649_amd64.deb -P ~/kernel/ -q
  echo "45"

  echo "# Downloading new kernel...[4]"
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-image-4.14.12-041412-generic_4.14.12-041412.201801051649_amd64.deb -P ~/kernel/ -q
  echo "60"

  echo "# Downloading new kernel...[5]"
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-image-4.14.12-041412-lowlatency_4.14.12-041412.201801051649_amd64.deb -P ~/kernel/ -q
  echo "70"
  
  echo "# Installing new kernel"
  dpkg -i ~/kernel/*.deb
  echo "100"
  echo "# Finished updating kernel"

  ) |
  # Progress bar
  ${_zenity} --progress --title "Status" --text "Downloading New kernel...[1]" --percentage=0 --auto-close --auto-kill

  # Done
  ${_zenity} --info --title "Information" --text "Done" --width "100" --height "50"

else
  # Error handler
  ${_zenity} --error --text="Error during installation... Canceled..."
  rm -rf ~/kernel/
  exit 1
fi

# Cleaning up
rm -rf ~/kernel/

zenity --question --title "Reboot" --text "Reboot Now?"
case $? in
  0) echo "Rebooting..."; reboot
  ;;
  1) echo "Canceled..."; exit 0
  ;;
  *) echo "Canceled..."; exit 0
  ;;
esac
