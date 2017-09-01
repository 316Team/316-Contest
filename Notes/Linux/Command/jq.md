- 使用 jq，只显示 docker ip ：

```bash
$ sudo docker inspect CONTAINER_NAME | jq .[0].NetworkSettings.IPAddress
"172.17.0.2"
$ sudo docker inspect CONTAINER_NAME | jq .[0].NetworkSettings.Gateway
"172.17.0.1"
```
