#!/bin/bash
#add for chkconfig
#chkconfig: 2345 70 30
#descrption: This is VM status script
#processname: CheckVM
checkVM(){
        sleep 10s
        CHECK_STATUS="$(xe vm-list params=name-label power-state=halted |grep name-label | awk '{print $5}')"
        if [[ "$CHECK_STATUS" != "" ]];then
                startVM
                checkVM
        fi
}

startVM(){
        sleep 20s
        for status in $CHECK_STATUS;do
                echo "$status" | xargs -n1 -i xe vm-start force=true vm={}
        done

}
checkVM
