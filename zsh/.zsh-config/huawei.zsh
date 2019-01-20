#!/usr/bin/env zsh

alias hstg="mkdir -p ~/huawei-storage && sshfs admin@10.213.37.36:/share/ ~/huawei-storage"
alias hgpu="ssh root@10.213.37.34"
alias hgpufs="mkdir -p ~/huawei-gpu && sshfs root@10.213.37.34:/ ~/huawei-gpu"
alias tbgpu="ssh -NfL 6006:localhost:6006 root@10.213.37.34"


# DSM setup
if [ -d ~/Developer/Github/DSMv2 ]; then
    # home of the DSM workspace to avoid hardcoding paths
    export DSM_WORKSPACE=~/Developer/Github/DSMv2
    # setup the rest of the DSM environmental variables, such as camera serial numbers, etc
    source $DSM_WORKSPACE/dsm_database/dsm_setup_environment
fi
