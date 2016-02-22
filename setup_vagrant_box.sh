#!/bin/sh
if [ ! -e ./Vagrantfile -o ! -e ./package.box ]; then
    echo "not found ./Vagrantfile or ./package.box"
    exit
fi

BOX=`sed -n 's/^.*config.vm.box.*=.*"\(.*\)"/\1/p' ./Vagrantfile`

if [ -z ${BOX} ]; then
    echo "not found config.vm.box parameter in ./Vagrantfile"
    exit
fi

echo "##### ${BOX} setup start\n"

echo "##### vagrant destroy\n"
vagrant destroy -f

echo "##### vagrant box add ${BOX}\n"
vagrant box add -c -f ${BOX} ./package.box

echo "##### ${BOX} setup end\n"
