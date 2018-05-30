```shell
#!/bin/bash

### BEGIN INIT INFO
# Provides:             celery # 名称
# Required-Start:       $remote_fs $syslog
# Required-Stop:        $remote_fs $syslog
# Default-Start:        2 3 4 5
# Default-Stop:         0 1 6
# Short-Description:    Celery # 服务简单介绍
# Description:          Celery # 服务详细介绍
### END INIT INFO

DIR="/home/root/test"
# 脚本或命令所在的目录
DAEMON="/usr/local/celery"
# 运行脚本或命令
DAEMON_NAME=test-celery
# 定义服务名

DAEMON_OPTS="-A v2 work -l info"
# 子命令

DAEMON_USER=root
# 服务运行的用户

PIDFILE=/var/run/$DAEMON_NAME.pid
# 定义PID文件存储位置

. /lib/lsb/init-functions

fail_unless_root() {
        if [ "$(id -u)" != '0' ]; then
                log_failure_msg "$DAEMON_NAME must be run as root"
                exit 1
        fi
}
# 判断是否为root用户运行，如果不是root用户运行则退出

do_start () {
    log_daemon_msg "Starting system $DAEMON_NAME daemon"
    start-stop-daemon --start --background --chdir $DIR --pidfile $PIDFILE --make-pidfile --user $DAEMON_USER --chuid $DAEMON_USER --startas /bin/bash -- -c "exec $DAEMON $DAEMON_OPTS >> /var/log/$DAEMON_NAME.log 2>&1" || true
    # 将此服务挂在后台，并生成PID文件，指定为root用户启动，同时生成日志文件
    log_end_msg $?
}
do_stop () {
   log_daemon_msg "Stopping system $DAEMON_NAME daemon"
   start-stop-daemon --stop --pidfile $PIDFILE --retry 10 || true
   log_end_msg $?
}

case "$1" in

    start|stop)
        fail_unless_root
        do_${1}
        ;;

    restart|reload|force-reload)
        fail_unless_root
        do_stop
        do_start
        ;;

    status)
        status_of_proc "$DAEMON_NAME" "$DAEMON_NAME" && exit 0 || exit $?
        ;;

    *)
        echo "Usage: /etc/init.d/$DAEMON_NAME {start|stop|restart|status}"
        exit 1
        ;;
	# 若输入命令错误则提示
esac
exit 0
```
