#!/bin/bash
# expect 无密码登录mysql

expect -c "
spawn mysql -uroot -p
expect \"Enter passowrd\"
send \"\r\"
expect eof
"