#!/bin/bash
# Check docker container status

container_status="$(sudo docker ps -aq)"
if [[ $container_status != "" ]];then
	echo "There have container"
	sudo docker run -d -P --rm busybox /bin/bash echo "Heoll world"
#	sudo docker rm -f $(sudo docker ps -aq)
else
	echo "Don't have container"
#	sudo docker run -it -d -p 5672:5672 --restart=always rabbitmq:3-management
fi
