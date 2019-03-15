#!/usr/bin/env zsh

alias hstg="mkdir -p ~/huawei-storage && sshfs admin@10.213.37.36:/share/ ~/huawei-storage"
alias hgpu="ssh root@10.213.37.34"
alias hgpufs="mkdir -p ~/huawei-gpu && sshfs root@10.213.37.34:/ ~/huawei-gpu"
alias tbgpu="ssh -NfL 6006:localhost:6006 root@10.213.37.34"
alias ddd="dsm_make && dsmlaunch"

# add entries to /etc/hosts if you use domains
# /etc/hosts
# 10.208.88.188 rnd-github-usa-g.huawei.com
# 10.193.5.117 email-us.huawei.com
# 10.208.119.42 login.huawei.com
# 10.208.119.43 w3.huawei.com
# 10.208.124.99 rnd-jira-usa.inhuawei.com
alias cnet=" sudo route del default gw 0.0.0.0 enp6s0
sudo ip route add 10.208.88.0/24 via 10.193.35.1 dev enp6s0
sudo ip route add 10.213.37.0/24 via 10.193.35.1 dev enp6s0
sudo ip route add 10.193.5.0/24 via 10.193.35.1 dev enp6s0
sudo ip route add 10.208.119.0/24 via 10.193.35.1 dev enp6s0
sudo ip route add 10.208.124.0/24 via 10.193.35.1 dev enp6s0
"

alias lcm_fix="sudo ifconfig lo multicast
sudo route add -net 224.0.0.0 netmask 240.0.0.0 dev lo
"

# DSM setup
if [ -d ~/Developer/Github/DSMv2 ]; then
    # home of the DSM workspace to avoid hardcoding paths
    export DSM_WORKSPACE=~/Developer/Github/DSMv2
    # setup the rest of the DSM environmental variables, such as camera serial numbers, etc
    source $DSM_WORKSPACE/dsm_database/dsm_setup_environment
fi
