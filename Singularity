Bootstrap: arch

%post
    cd /usr/src
    cp /etc/hosts .
    sed -i '/::/d' hosts
    cp hosts /etc/hosts
    git clone https://github.com/proycon/LaMachine --branch develop
    cd /usr/src/LaMachine
    bash bootstrap.sh dev

%test
    /usr/bin/lamachine-test.sh
