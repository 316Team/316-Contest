import os
import sys

import ansible.runner

# 由于2.0里面没有 runner 模块，所以被弃用

# print len(sys.argv)
if len(sys.argv) != 3:
    print "usage: ansible-script <host-pattern> [scriptname and parms]"
    exit(1)
group_name = sys.argv[1]
script_name = sys.argv[2]

if not os.path.exists(script_name.split()[0]):
    print "%s:no such file" % (script_name.split()[0])
    exit(1)
results = ansible.runner.Runner(
    pattern=group_name, forks=5,
    module_name='script', module_args=script_name,
).run()

exit_code = 0

# print results
# print results['contacted'].items()
if not results['contacted'].items():
    print "No hosts found"
    sys.exit(1)
print "RESULTS ***********"
for (hostname, result) in results['contacted'].items():
    #       print result
    #       print "%s >>> %s" % (hostname, result['stdout'])
    if result['rc'] != 0:
        exit_code = result['rc']
        status = "failed"
        print '\033[1;31;40m'  # change frontcolor to red
        print "%s >>> %s \n%s" % (hostname, status, result['stdout'])
    else:
        status = "success"
        print '\033[1;32;40m'  # change frontcolor to green
        print "%s >>> %s \n%s" % (hostname, status, result['stdout'])
print '\033[0m'  # change frontcolor to default
sys.exit(exit_code)
