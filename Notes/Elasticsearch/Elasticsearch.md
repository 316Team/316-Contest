- 查看集群节点的状态

```shell
$ curl -s 'localhost:9200/_cat/nodes?v'
```

- 查看集群磁盘空间

```shell
$ curl -s 'localhost:9200/_cat/allocation?v'
```

- 检查集群设置

```shell
$ curl 'http://localhost:9200/_cluster/settings?pretty'
```

- 查看包含UNASSIGNED的shards

```shell
$ curl -s localhost:9200/_cat/shards?v | grep UNASSIGNED
```
