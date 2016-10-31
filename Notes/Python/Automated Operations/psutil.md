# 安装

```
$sudo pip install psutil
```

# 使用

- 获取当前物理内存总大小及使用大小

```
In [1]:import psutil
In [2]:mem = psutil.virtual_memory()
In [3]:mem.total,mem.used
Out[3]:(2099245056, 533659648)
```

> 1、CPU 信息<br>
> Linux 操作系统的 CPU 利用率有以下几部分：<br>
> - User Time: 执行用户进程的时间百分比
> - System Time: 执行内核进程和中断的时间百分比
> - Wait IO: 由于 IO 等待而使 CPU 处于 idle（空闲）状态的时间百分比
> - Idle: CPU 处于 idle 状态的时间百分比

```
In [1]:import psutil
In [2]:psutil.cpu_times()
# 使用 cpu_times 方法获取 CPU 完整信息，需要显示所有逻辑 CPU 信息
In [3]:psutil.cpu_times(percpu=True)
# 指定方法变量 percpu=True
Out [3]: [scputimes(user=8.27, nice=0.0, system=7.72, idle=1225.81, iowait=29.69, irq=0.64, softirq=0.0, steal=0.0, guest=0.0, guest_nice=0.0)]
In [4]:psutil.cpu_times().user
# 获取单项数据信息，如用户 user 的 CPU 时间比
Out [4]:8.35
In [5]:psutil.cpu_count()
# 获取 CPU 的逻辑个数，默认 logical=True4
Out [5]:4
In [6]:psutil.cpu_count(logcial=False)
# 获取 CPU 的物理个数
Out [6]:2
```

> 2、内存信息<br>
> Linux 系统的内存利用率信息涉及 total （内存总数）、used（已使用的内存数）、free（空闲内存数）、buffers (缓冲使用数）、cache （缓存使用数）、swap （交换分区使用数）等

```
In [1]:import psutil
In [2]:mem = psutil.virtual_memory()
# 获取内存完整信息
Out[2]: svmem(total=2099245056, available=1866289152, percent=11.1, used=534257664, free=1564987392, active=261656576, inactive=218779648, buffers=78057472, cached=223244288, shared=479232)
In [3]:mem.total
# 获取内存总数
Out[3]:2099245056
In [4]:mem.free
# 获取空闲内存数
Out[4]:1564987392
In [5]:psutil.swap_memory()
# 获取 SWAP 分区信息
Out[5]:sswap(total=17002516480L, used=5455712256L, free=11546804224L, percent=32.1, sin=0, sout=0)
```

> 3、磁盘信息<br>
> 在系统的所有磁盘信息中，更加值得关注的是磁盘的利用率及IO信息，其中磁盘的利用率使用 psutil.disk_usage 方法获取。<br>
> 磁盘 IO 信息包括 read_count （读 IO 数）、write_count （写 IO 数）、read_bytes （IO 读字节数）、write_bytes (IO 写字节数）、read_time（磁盘读时间）、write_time（磁盘写时间）

```
In [1]:import psutil
In [2]:psutil.disk_partitions()
# 获取磁盘完整信息
Out[2]:[sdiskpart(device='/dev/mapper/ubuntu--vg-root', mountpoint='/', fstype='ext4', opts='rw,errors=remount-ro'),sdiskpart(device='/dev/sda1', mountpoint='/boot', fstype='ext2', opts='rw')]
In [3]:psutil.disk_usage('/')
# 获取分区（参数）的使用情况
Out[3]:sdiskusage(total=18716360704, used=8459464704, free=9282560000, percent=47.7)
In [4]:psutil.disk_io_counters()
# 获取硬盘总的 IO 个数、读写信息
Out[4]:sdiskio(read_count=121385, write_count=65321, read_bytes=3525189632L, write_bytes=1545812992L, read_time=47949600L, write_time=14484730L)
In [5]:psutil.disk_io_counters(perdisk=True)
# 获取单个分区 IO 个数、读写信息
Out[5]:{'dm-0': sdiskio(read_count=20832, write_count=4997, read_bytes=278672384, write_bytes=35270656, read_time=874316, write_time=249644, read_merged_count=0, write_merged_count=0, busy_time=36604),
 'dm-1': sdiskio(read_count=192, write_count=0, read_bytes=786432, write_bytes=0, read_time=456, write_time=0, read_merged_count=0, write_merged_count=0, busy_time=444),
 'sda1': sdiskio(read_count=339, write_count=6, read_bytes=1174528, write_bytes=6144, read_time=1616, write_time=0, read_merged_count=269, write_merged_count=0, busy_time=968),
 'sda2': sdiskio(read_count=2, write_count=0, read_bytes=2048, write_bytes=0, read_time=16, write_time=0, read_merged_count=0, write_merged_count=0, busy_time=16),
 'sda5': sdiskio(read_count=12263, write_count=1453, read_bytes=279860224, write_bytes=35266560, read_time=583584, write_time=16000, read_merged_count=8846, write_merged_count=3509, busy_time=34524),
 'sr0': sdiskio(read_count=0, write_count=0, read_bytes=0, write_bytes=0, read_time=0, write_time=0, read_merged_count=0, write_merged_count=0, busy_time=0)}
```

> 4、网络信息<br>
> 系统的网络信息与磁盘 IO 类似，涉及几个关键点，包括 bytes_sent （发送字节数）、bytes_recv=28220119（接收字节数）、packets_sent=200978（发送数据包数）、packets_recv=212672（接收数据包数）等

```
In [1]:import psutil
In [2]:psutil.net_io_counters()
# 获取网络总的 IO 信息，默认 pernic=False
Out[2]:snetio(bytes_sent=151390, bytes_recv=511733, packets_sent=1205, packets_recv=1668, errin=0, errout=0, dropin=0, dropout=0)
In [3]:psutil.net_io_counters(pernic=True)
# pernic=True 输出每个网络接口的 IO 信息
Out[3]:{'docker0': snetio(bytes_sent=0, bytes_recv=0, packets_sent=0, packets_recv=0, errin=0, errout=0, dropin=0, dropout=0),
 'eth0': snetio(bytes_sent=15257, bytes_recv=388855, packets_sent=183, packets_recv=379, errin=0, errout=0, dropin=0, dropout=0),
 'eth1': snetio(bytes_sent=139731, bytes_recv=126986, packets_sent=1056, packets_recv=1336, errin=0, errout=0, dropin=0, dropout=0),
 'lo': snetio(bytes_sent=0, bytes_recv=0, packets_sent=0, packets_recv=0, errin=0, errout=0, dropin=0, dropout=0)}
```

> 5、其他系统信息<br>
> psutil 模块还支持获取用户登录、开机时间等信息

```
In [1]:import psutil
In [2]:psutil.users()
# 返回当前登录系统的用户信息
Out[2]:[suser(name='asura', terminal='tty1', host='', started=1471829632.0),
 suser(name='asura', terminal='pts/0', host='192.168.56.101', started=1471829760.0)]
In [3]:import psutil, datetime
In [4]:psutil.boot_time()
# 获取开机时间，以Linux 时间戳格式返回
Out[4]:1471829592.0
In [5]:datetime.datetime.fromtimestamp(psutil.boot_time()).strftime("%Y-%m-%d %H:%M:%S")
# 转换成自然时间格式
Out[5]:'2016-08-22 08:59:15'
```

> 进程信息<br>
> psutil 模块在获取进程信息方面也提供了很好的支持，包括使用 psutil.pids()方法获取所有进程 PID，使用 psutil.Process() 方法获取单个进程的名称、路径、状态、系统资源利用率等信息

```
In [1]:import psutil
In [2]:psutil.pids()
# 列出所有进程 PID
Out[2]:[1,2,3,4,5,6,7,8,9,10……]
In [3]:p = psutil.Process(2424)
# 实例化一个Process 对象，参数为一进程 PID
In [4]:p.name()
# 进程名
Out[4]:'java'
In [5]:p.exe()
# 进程 bin 路径
Out[5]:'/usr/java/jdk1.6.0_45/bin/java'
In [6]:p.cwd()
# 进程工作目录绝对路径
Out[6]:'/usr/local/hadoop-1.2.1'
In [7]:p.status()
# 进程状态
Out[7]:'sleeping'
In [8]:p.create_time()
# 进程创建时间，时间戳格式
Out[8]:1471835205.96
In [9]:p.uids()
# 进程 uid 信息
Out[9]:puids(real=0,effective=0,saved=0)
In [10]:p.cpu_times()
# 进程 CPU 时间信息，包括 user、system 两个 CPU 时间
Out[10]:pcputimes(user=0.02, system=0.01, children_user=0.0, children_system=0.0)
In [11]:p.cpu_affinity()
# get 进程 CPU 亲和度，如要设置进程 CPU 亲和度，将 CPU 号作为参数即可
Out[11]:[0,1,2,3]
In [12]:p.memory_percent()
# 进程内存利用率
Out[12]:14.146465467