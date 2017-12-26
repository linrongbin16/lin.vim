#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg() {
    echo "Brief:"
    echo "    unset [host]-[ip] mapping"
    echo "Usage:"
    echo "    $cmdname [host/ip]"
    echo "Try again"
    echo ""
}

makesure() {
    read yes
    confirm=0
    if [[ $yes == "yes" ]]; then
        confirm=1
    fi
    if [[ $yes == "Yes" ]]; then
        confirm=1
    fi
    if [[ $yes == "Y" ]]; then
        confirm=1
    fi
    if [[ $yes == "y" ]]; then
        confirm=1
    fi
    if [[ $confirm -eq 0 || "$confirm" == "0" ]]; then
        echo "error: user not confirm"
        exit 1
    fi
}


if [[ $# -lt 1 ]]; then
    helpmsg
    exit 1
fi

zh_hosts="/etc/hosts"
zh_hosts_new="$zh_hosts.new"
while [[ -f $zh_hosts_new ]]; do
    zh_hosts_new="$zh_hosts_new.new"
done
zh_hosts_old="$zh_hosts.old"

hostname="$(echo -e "$1" | sed 's/^ *//g' | sed 's/ *$//g')"

if ! hostip $hostname 1>/dev/null 2>&1 ; then
    echo "error: $hostname not found"
    exit 1
fi

ipaddr="$(hostip $hostname)"

echo -n "[lin-vim] unset host-ip: '$ipaddr  $hostname', yes? "
makesure

sudo touch $zh_hosts
sudo touch $zh_hosts_new
sudo chmod +w,o+w $zh_hosts_new
while IFS='' read -r oneline || [[ -n "$oneline" ]]; do
    onehost="$(echo -e "$oneline" | awk '{print $2}' | sed 's/^ *//g' | sed 's/ *$//g')"
    if [[ ${onehost} != ${hostname} ]]; then
        sudo echo "$oneline" >> $zh_hosts_new
    fi
done < "$zh_hosts"

sudo cp $zh_hosts $zh_hosts_old
sudo mv $zh_hosts_new $zh_hosts
