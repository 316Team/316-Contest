import pexpect
import sys

child = pexpect.spawn('ssh root@172.16.4.68')
fout = file('mylog.txt','w')
child.logfile = fout

child.expect("passowrd:")
child.sendline("lablab")
child.expect('#')
child.sendline('ulimit -u 6400')
child.expect('#')