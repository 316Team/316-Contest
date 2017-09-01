- 将`ls`的执行结果传递给 `xe vm-import`

```bash
$ ls *.xva | xargs -n1 -i xe vm-import filename={}
```
