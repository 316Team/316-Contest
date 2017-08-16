#!/bin/bash
set -x

checkVM(){
	CHECK_STATUS="$(xe vm-list params=name-label power-state=halted | grep name-label | awk '{print $5}')"
	if [[ "$CHECK_STATUS" != "" ]];then
		echo -e "This is checkVM\n"
		startVM
		checkVM
	else
		echo "ALL OF VM IS RUNNING!!!"
	fi
}

startVM(){
	for status in $(CHECK_STATUS);do
		echo "$status" | xargs -n1 -i xe vm-start force=true vm={}
		echo "$status"
		echo -e "This is startVM function\n"
	done

}
checkVM
