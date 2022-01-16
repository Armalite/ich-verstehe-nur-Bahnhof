# Python Subprocess Non Blocking

Creating a non blocking sub process to output file tail and poll for new lines
```Python
import time
import subprocess
import select

f = subprocess.Popen(['tail','-F',filename],\
        stdout=subprocess.PIPE,stderr=subprocess.PIPE)
p = select.poll()
p.register(f.stdout)

while True:
    if p.poll(1):
        print f.stdout.readline()
    time.sleep(1)
```
