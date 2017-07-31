#!/bin/bash
# set -o nounset
# set -o errexit
# set -o verbose
# set -x
# use method: bash delet_registry_image.sh IMAGE_NAME
# This script is used to remove the docker private repository image

sudo curl -k https://root:password@www.root-registry.com/v2/_catalog
registry_path="/docker-registry/data/docker/registry/v2/repositories/"
# Instructions: If you use a variable directly, the end hava '\r', so we must use "sed 's/\r//g'" to remove '\r'
refrence="$(sudo curl -v --silent -H "Accept: application/vnd.docker.distribution.manifest.v2+json" -X GET -k https://root:password@www.root-registry.com/v2/$1/manifests/latest 2>&1 | grep Docker-Content-Digest | awk '{print $3}' | sed 's/\r//g')"
echo "$refrence"
URL="https://root:password@www.root-registry.com/v2/$1/manifests/$refrence"
echo "${URL}"
sudo curl -X DELETE -k "https://root:password@www.root-registry.com/v2/$1/manifests/$refrence"
echo "$1"
echo "$registry_path"
sleep 20
registry_name=$(sudo docker ps -a | grep "registry:2" | awk '{print $13}')
echo "$registry_name"
sudo service docker-registry stop
sleep 10
garbage-collect="$(sudo docker run -it --name gc --rm --volumes-from "$registry_name" registry:2 garbage-collect /etc/docker/registry/config.yml)"
sleep 10
delete_repositories="$(sudo rm -rf "$registry_path""$1")"
echo "$registry_path$1"
sudo service docker-registry start
sleep 10
sudo curl -k https://root:password@www.root-registry.com/v2/_catalog
