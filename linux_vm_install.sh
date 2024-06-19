# (Modified) script from https://github.com/westenfelder

etaf 4; echo "\nLinux Pwn/RE Install Script"; tput setaf 7;
tput setaf 3; echo "\nRunning as admin? [y/n] \c"; tput setaf 7;
read admin

if [ $admin = 'y' ]
then

    # Prereqs
    tput setaf 2; echo "\nUpdate apt packages"; tput setaf 7;
    apt update
    apt upgrade -y

    tput setaf 2; echo "\nInstall curl"; tput setaf 7;
    apt install curl -y

    tput setaf 2; echo "\nInstall wget"; tput setaf 7;
    apt install wget -y
    
    tput setaf 2; echo "\nInstall make"; tput setaf 7;
    apt install make -y

    tput setaf 2; echo "\nInstall git"; tput setaf 7;
    apt install git -y

    tput setaf 2; echo "\nInstall github cli"; tput setaf 7;
    apt install gh -y


    # Installers
    tput setaf 2; echo "\nInstall cmake"; tput setaf 7;
    snap install cmake --classic

    tput setaf 2; echo "\nInstall gcc"; tput setaf 7;
    apt install gcc

    tput setaf 2; echo "\nInstall gdb"; tput setaf 7;
    apt install gdb
    
    # tput setaf 2; echo "\nInstall PEDA"; tput setaf 7;
    # git clone https://github.com/longld/peda.git /home/$SUDO_USER/peda
    # echo "source /home/$SUDO_USER/peda/peda.py" >> /home/$SUDO_USER/.gdbinit

    tput setaf 2; echo "\nInstall pwndbg"; tput setaf 7;
    cd ~
    git clone https://github.com/pwndbg/pwndbg
    cd pwndbg
    ./setup.sh

    tput setaf 2; echo "\nInstall radare2"; tput setaf 7;
    git clone https://github.com/radareorg/radare2
    cd radare2
    sys/install.sh

    tput setaf 2; echo "\nInstall r2ghidra"; tput setaf 7;
    r2pm update
    r2pm -ci r2ghidra

    tput setaf 2; echo "\nInstall r2-dec"; tput setaf 7;
    r2pm -U
    r2pm -i r2dec

    tput setaf2; echo "\nInstall r2frida"; tput setaf 7;
    $ r2pm -ci r2frida

    tput setaf 2; echo "\nInstall objdump"; tput setaf 7;
    apt install binutils -y
    

    tput setaf 2; echo "\nInstall nasm"; tput setaf 7;
    apt install nasm -y

    tput setaf 2; echo "\nInstall strace"; tput setaf 7;
    apt install strace -y

    tput setaf 2; echo "\nInstall ltrace"; tput setaf 7;
    apt install ltrace -y

    tput setaf 2; echo "\nInstall net-tools"; tput setaf 7;
    apt install net-tools -y

    tput setaf 2; echo "\nInstall powershell"; tput setaf 7;
    snap install powershell --classic



    tput setaf 2; echo "\nInstall tmux"; tput setaf 7;
    apt install tmux -y

    tput setaf 2; echo "\nInstall vim"; tput setaf 7;
    apt install vim -y

    tput setaf 2; echo "\nInstall batcat"; tput setaf 7;
    apt install bat -y



    # Install Python
    tput setaf 2; echo "\nInstall python"; tput setaf 7;
    apt install python3

    # tput setaf 2; echo "\nInstall python virtual environments"; tput setaf 7;
    # apt install python3.10-venv -y

    tput setaf 2; echo "\nInstall pip"; tput setaf 7;
    apt install pip -y


    # Install python packages
    tput setaf 2; echo "\nInstall z3"; tput setaf 7;
    sudo -u $SUDO_USER pip install z3-solver

    tput setaf 2; echo "\nInstall angr"; tput setaf 7;
    sudo -u $SUDO_USER pip install angr

    tput setaf 2; echo "\nInstall angr management"; tput setaf 7;
    sudo -u $SUDO_USER pip install angr-management

    tput setaf 2; echo "\nInstall pwntools"; tput setaf 7;
    sudo -u $SUDO_USER pip install pwntools

    tput setaf 2; echo "\nInstall ropper"; tput setaf 7;
    sudo -u $SUDO_USER pip install ropper
    
    

    #Fixes
    tput setaf 2; echo "\nCleanup"; tput setaf 7;
    apt --fix-broken install -y
    apt autoremove -y


    # Finished
    tput setaf 1; echo "\nInstall Complete"; tput setaf 7;

    # Restart
    tput setaf 4; echo "Please restart - will need to re-establish ssh connection\n"; tput setaf 7;
    tput setaf 3; echo "Restart system now? [y/n] \c"; tput setaf 7;
    read restart

    if [$restart = 'y']
    then
        reboot;
    fi
fi
