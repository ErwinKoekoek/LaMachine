Bootstrap: arch

%post
    echo "Server = http://ftp.nluug.nl/os/Linux/distr/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
    pacman --noconfirm -Syyu git
    cd /usr/src
    cp /etc/hosts .
    sed -i '/::/d' hosts
    cp hosts /etc/hosts
    git clone https://github.com/proycon/LaMachine
    cd /usr/src/LaMachine
    bash bootstrap.sh

%test
    /usr/bin/lamachine-test.sh

