#/bin/bash
# Fix Meltdown Exploit (CVE-2017-5754)

function pause() {
  read -sn 1 -p "Press any key to continue"
  echo ""
}

function checkroot {
  if [ $USER == 'root' ]; then
    echo ''
    echo -e "\e[1;93mInstalling Kernel update\e[0m \e[1;32mv4.14.12\e[0m"
    pause; fix
  else
    echo -e '\e[1;31m[ERROR]\e[0m \e[1mRoot is required\e[0m'
  fi
}

function fix {
  echo 'Current Version: '; uname -r
  echo ''
  mkdir ~/kernel
  echo -e '\e[1;32m[+]\e[0m\e[1;93m ~/kernel/\e[0m'
  echo -e '\e[1;32m[+]\e[0m\e[1;93m Downloading new kernel\e[0m'
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-headers-4.14.12-041412_4.14.12-041412.201801051649_all.deb -P ~/kernel/ -q

  echo -e '\e[1;32m[+]\e[0m\e[1;93m Downloading new kernel\e[0m'
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-headers-4.14.12-041412-generic_4.14.12-041412.201801051649_amd64.deb -P ~/kernel/ -q

  echo -e '\e[1;32m[+]\e[0m\e[1;93m Downloading new kernel\e[0m'
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-headers-4.14.12-041412-lowlatency_4.14.12-041412.201801051649_amd64.deb -P ~/kernel/ -q

  echo -e '\e[1;32m[+]\e[0m\e[1;93m Downloading new kernel\e[0m'
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-image-4.14.12-041412-generic_4.14.12-041412.201801051649_amd64.deb -P ~/kernel/ -q

  echo -e '\e[1;32m[+]\e[0m\e[1;93m Downloading new kernel\e[0m'
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.14.12/linux-image-4.14.12-041412-lowlatency_4.14.12-041412.201801051649_amd64.deb -P ~/kernel/ -q

  echo -e '\e[1;32m[+]\e[0m\e[1;93m Installing New kernel\e[0m'

  echo -e '\e[1;96m'
  dpkg -i ~/kernel/*.deb
  echo -e '\e[0m'

  echo -e '\e[1;33m[ CLEANING UP ]\e[0m'
  rm -rf ~/kernel/
  echo -e '\e[1;32m[ DONE ]\e[0m'
  #echo -e '\e[1;32mTo apply update please do:\e[0m \e[1;96mshutdown -r 0\e[0m'
  reboot
}

function reboot {
  echo ''
  echo -e '\e[1;95mReboot system now? (y/n)'; read _yn
  if [[ $_yn =~ ^[Yy]$ ]]; then
    echo -e '\e[1;32m[ DONE ]\e[0m'
    echo -e '\e[1mRebooting...'; sleep 1s
    shutdown -r 0
  else
    echo -e '\e[1;32m[ DONE ]\e[0m'
  fi
}

checkroot
