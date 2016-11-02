# OpenStack 命令或技巧记录

- glance 上传镜像

`$glance image-create --name IMAGE_NAME --disk-format qcow2 --container-format bare --progress < IMAGE.qcow2`
