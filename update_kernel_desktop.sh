#!/bin/bash
_zenity="/usr/bin/zenity"

_out="/tmp/update_kernel.$$"

function checkroot {
  if [ $(id -u) = 0 ]; then
    echo ''
    echo -e "\e[1;93mInstalling Kernel update"
    select_kernel
  else
    zenity --error --title "ERROR" --text "Please use sudo"; exit 1
    #echo -e '\e[1;31m[ERROR]\e[0m \e[1mRoot is required\e[0m'
  fi
}

function restart {
  zenity --question --title "Reboot" --text "Reboot Now?"
  case $? in
    0) echo "Rebooting..."; reboot
    ;;
    1) echo "Canceled..."; exit 0
    ;;
    *) echo "Canceled..."; exit 0
    ;;
  esac
}

function v41412 {
  # Install or not?
  zenity --question --title "Install kernel v4.14.12"
  case $? in
    0) echo "Starting Download..."
    ;;
    1) echo "Canceled"; select_kernel
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

}

function v4150 {
  # Install or not?
  zenity --question --title "Install kernel v4.15.9"
  case $? in
    0) echo "Starting Download..."
    ;;
    1) echo "Canceled"; select_kernel
    ;;
    *) echo "Canceled"; exit 0
    ;;
  esac

  mkdir ~/kernel

  if [ $? -eq 0 ]; then
    (
    echo "# Downloading new kernel...[1]"
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.18/linux-headers-4.15.18-041518_4.15.18-041518.201804190330_all.deb -P ~/kernel/ -q
    echo "20"

    echo "# Downloading new kernel...[2]"
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.18/linux-headers-4.15.18-041518-generic_4.15.18-041518.201804190330_amd64.deb -P ~/kernel/ -q
    echo "30"

    echo "# Downloading new kernel...[3]"
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.18/linux-headers-4.15.18-041518-lowlatency_4.15.18-041518.201804190330_amd64.deb -P ~/kernel/ -q
    echo "45"

    echo "# Downloading new kernel...[4]"
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.18/linux-image-4.15.18-041518-generic_4.15.18-041518.201804190330_amd64.deb -P ~/kernel/ -q
    echo "60"

    echo "# Downloading new kernel...[5]"
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.18/linux-image-4.15.18-041518-lowlatency_4.15.18-041518.201804190330_amd64.deb -P ~/kernel/ -q
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

}

function v4167 {
  # Install or not?
  zenity --question --title "Install kernel v4.16.7"
  case $? in
    0) echo "Starting Download..."
    ;;
    1) echo "Canceled"; select_kernel
    ;;
    *) echo "Canceled"; exit 0
    ;;
  esac

  mkdir ~/kernel

  if [ $? -eq 0 ]; then
    (
    echo "# Downloading new kernel...[1]"
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.16.7/linux-headers-4.16.7-041607_4.16.7-041607.201805021131_all.deb -P ~/kernel/ -q
    echo "20"

    echo "# Downloading new kernel...[2]"
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.16.7/linux-headers-4.16.7-041607-generic_4.16.7-041607.201805021131_amd64.deb -P ~/kernel/ -q
    echo "30"

    echo "# Downloading new kernel...[3]"
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.16.7/linux-headers-4.16.7-041607-lowlatency_4.16.7-041607.201805021131_amd64.deb -P ~/kernel/ -q
    echo "45"

    echo "# Downloading new kernel...[4]"
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.16.7/linux-image-unsigned-4.16.7-041607-generic_4.16.7-041607.201805021131_amd64.deb -P ~/kernel/ -q
    echo "60"

    echo "# Downloading new kernel...[5]"
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.16.7/linux-image-unsigned-4.16.7-041607-lowlatency_4.16.7-041607.201805021131_amd64.deb -P ~/kernel/ -q
    echo "70"

    echo "# Downloading new kernel...[6]"
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.16.7/linux-modules-4.16.7-041607-generic_4.16.7-041607.201805021131_amd64.deb -P ~/kernel/ -q
    echo "80"

    echo "# Downloading new kernel...[7]"
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.16.7/linux-modules-4.16.7-041607-lowlatency_4.16.7-041607.201805021131_amd64.deb -P ~/kernel/ -q
    echo "90"

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

}

function select_kernel {
  version=$(zenity --list 0 "v4.14.12" 1 "v4.15.18" 2 "v4.16.7" --column="id" \
  --column="Select kernel" --hide-column=1 --print-column=1)
  case $version in
    0) echo 'Installing: v4.14.12'; v41412
    ;;
    1) echo 'Installing: v4.15.18'; v4150
    ;;
    2) echo 'Installing: v4.16.7'; v4167
    ;;
    *) echo 'Invalid option'; exit 0
    ;;
  esac
}

#select_kernel
checkroot

# Reboot now?
restart
