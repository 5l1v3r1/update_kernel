#/bin/bash

function pause() {
  read -sn 1 -p "Press any key to continue"
  echo ""
}

function checkroot {
  if [ $USER == 'root' ]; then
    echo ''
    echo -e "\e[1;93mInstalling Kernel update"
    pause; select_kernel
  else
    echo -e '\e[1;31m[ERROR]\e[0m \e[1mRoot is required\e[0m'
  fi
}

function v41412 {
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
  #dpkg -i ~/kernel/*.deb
  echo -e '\e[0m'

  echo -e '\e[1;33m[ CLEANING UP ]\e[0m'
  rm -rf ~/kernel/
  echo -e '\e[1;32m[ DONE ]\e[0m'
  #echo -e '\e[1;32mTo apply update please do:\e[0m \e[1;96mshutdown -r 0\e[0m'
  reboot
}

function v4159 {
  echo 'Current Version: '; uname -r
  echo ''
  mkdir ~/kernel
  echo -e '\e[1;32m[+]\e[0m\e[1;93m ~/kernel/\e[0m'
  echo -e '\e[1;32m[+]\e[0m\e[1;93m Downloading new kernel\e[0m'
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.9/linux-headers-4.15.9-041509_4.15.9-041509.201803111231_all.deb -P ~/kernel/ -q

  echo -e '\e[1;32m[+]\e[0m\e[1;93m Downloading new kernel\e[0m'
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.9/linux-headers-4.15.9-041509-generic_4.15.9-041509.201803111231_amd64.deb -P ~/kernel/ -q

  echo -e '\e[1;32m[+]\e[0m\e[1;93m Downloading new kernel\e[0m'
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.9/linux-headers-4.15.9-041509-lowlatency_4.15.9-041509.201803111231_amd64.deb -P ~/kernel/ -q

  echo -e '\e[1;32m[+]\e[0m\e[1;93m Downloading new kernel\e[0m'
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.9/linux-image-4.15.9-041509-generic_4.15.9-041509.201803111231_amd64.deb -P ~/kernel/ -q

  echo -e '\e[1;32m[+]\e[0m\e[1;93m Downloading new kernel\e[0m'
  wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.9/linux-image-4.15.9-041509-lowlatency_4.15.9-041509.201803111231_amd64.deb -P ~/kernel/ -q

  echo -e '\e[1;32m[+]\e[0m\e[1;93m Installing New kernel\e[0m'

  echo -e '\e[1;96m'
  #dpkg -i ~/kernel/*.deb
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

function select_kernel {
  _menu_items=("v4.14.12" "v4.15.9" "Quit")
  select menu in "${_menu_items[@]}"
  do
  	case $menu in
  	"v4.14.12") clear; v41412; break
  	;;
  	"v4.15.9") clear; v4159; break
  	;;
  	"Quit") echo -e "Goodbye, \e[1;31m$USER\e[0m"; break 2
  	;;
  	*) echo -e "\e[1;35m[ ! ]\e[0m Not a valid selection!"; sleep 1s; clear; select_kernel; break
  	esac
  done
}

checkroot
