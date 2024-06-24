#!/usr/bin/env python3
#todo: update this
from pwn import *

# connect to challeng problem at specified port
chall_host = '192.168.2.99'
chall_port = '55984'

chall_filename = './temp_filename' # include path to access file
context.bits = 32 # working with a 32 bit binary
context.log_level = 'DEBUG'
context(arch='i386', os='linux')

if args.REMOTE: #if we want to run against the remote server
    p = remote(chall_host, chall_port)
elif args.GDB:
    p = process(chall_filename) #program we are attacking
    #gdb commands to run when attatching
    gdbScript = '''
    info func
    '''
    gdb.attach(p, aslr=False, gdbscript=gdbscript)
else:
    p = process(chall_filename)


# Do the Stuff

# Assemble Payload
temp = b'temp'
payload = b''.join(
        [temp,p32(temp),p64(temp)
    ]
)
p.sendline(payload)
#p.recvall()
p.interactive()
p.close()
