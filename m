From: Armin Catovic <armin.catovic-IzeFyvvaP7pWk0Htik3J/w@public.gmane.org>
Subject: Minimum M_TRIM_THRESHOLD value for default linux glibc malloc
 implementation is 64 KiB?
Date: Thu, 15 May 2014 13:33:21 +0000
Message-ID: <0BC249219DEF854CB6667A1C7F8B18D222EA00D1@ESGSCMB101.ericsson.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

Even if I set M_TRIM_THRESHOLD to 0, the lowest contiguous free block before the program break needs to be 64 KiB before it can be "trimmed". Is this a known fact, or am I doing something wrong here? I created a quick test program that calls malloc_stats (1) before any malloc operations, (2) after malloc of buflen bytes, and (3) after freeing the previously malloc-ed block. Here are some printouts.

acatovic@ubuntu:~/memdev$ ./malloc-prof
Usage: ./malloc-prof -b <N bytes> -n <NUM> [-t <X KiB>] [-p <Y KiB>]

   -b <N bytes>            Allocate a buffer of N bytes. Mandatory.
   -n <NUM>                Perform NUM number of malloc()/free() operations. Mandatory.
   -t <X KiB>              Set M_TRIM_THRESHOLD to X * 1024 bytes. See mallopt(3) for more info.
   -p <Y KiB>              Set M_TOP_PAD to Y * 1024 bytes. See mallopt(3) for more info.


acatovic@ubuntu:~/memdev$ ./malloc-prof -b 4096 -n 1 -p 0 -t 0
malloc_stats() BEFORE malloc():
Arena 0:
system bytes     =          0
in use bytes     =          0
Total (incl. mmap):
system bytes     =          0
in use bytes     =          0
max mmap regions =          0
max mmap bytes   =          0
malloc_stats() AFTER malloc(), buflen=4096, num=1
Arena 0:
system bytes     =       8192
in use bytes     =       4104
Total (incl. mmap):
system bytes     =       8192
in use bytes     =       4104
max mmap regions =          0
max mmap bytes   =          0
malloc_stats AFTER free():
Arena 0:
system bytes     =       8192
in use bytes     =          0
Total (incl. mmap):
system bytes     =       8192
in use bytes     =          0
max mmap regions =          0
max mmap bytes   =          0


acatovic@ubuntu:~/memdev$ ./malloc-prof -b 32768 -n 1 -p 0 -t 0
malloc_stats() BEFORE malloc():
Arena 0:
system bytes     =          0
in use bytes     =          0
Total (incl. mmap):
system bytes     =          0
in use bytes     =          0
max mmap regions =          0
max mmap bytes   =          0
malloc_stats() AFTER malloc(), buflen=32768, num=1
Arena 0:
system bytes     =      36864
in use bytes     =      32776
Total (incl. mmap):
system bytes     =      36864
in use bytes     =      32776
max mmap regions =          0
max mmap bytes   =          0
malloc_stats AFTER free():
Arena 0:
system bytes     =      36864
in use bytes     =          0
Total (incl. mmap):
system bytes     =      36864
in use bytes     =          0
max mmap regions =          0
max mmap bytes   =          0


acatovic@ubuntu:~/memdev$ ./malloc-prof -b 65536 -n 1 -p 0 -t 0
malloc_stats() BEFORE malloc():
Arena 0:
system bytes     =          0
in use bytes     =          0
Total (incl. mmap):
system bytes     =          0
in use bytes     =          0
max mmap regions =          0
max mmap bytes   =          0
malloc_stats() AFTER malloc(), buflen=65536, num=1
Arena 0:
system bytes     =      69632
in use bytes     =      65544
Total (incl. mmap):
system bytes     =      69632
in use bytes     =      65544
max mmap regions =          0
max mmap bytes   =          0
malloc_stats AFTER free():
Arena 0:
system bytes     =       4096
in use bytes     =          0
Total (incl. mmap):
system bytes     =       4096
in use bytes     =          0
max mmap regions =          0
max mmap bytes   =          0



Not sure what info you need, but this is the libc version:

acatovic@ubuntu:~/memdev$ ldd malloc-prof
     linux-gate.so.1 =>  (0xb7712000)
     libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xb7555000)
     /lib/ld-linux.so.2 (0xb7713000)
acatovic@ubuntu:~/memdev$ /lib/i386-linux-gnu/libc.so.6
GNU C Library (Ubuntu EGLIBC 2.15-0ubuntu10.5) stable release version 2.15, by Roland McGrath et al.
Copyright (C) 2012 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.
Compiled by GNU CC version 4.6.3.
Compiled on a Linux 3.2.50 system on 2013-09-30.
Available extensions:
     crypt add-on version 2.1 by Michael Glad and others
     GNU Libidn by Simon Josefsson
     Native POSIX Threads Library by Ulrich Drepper et al
     BIND-8.2.3-T5B
libc ABIs: UNIQUE IFUNC
For bug reporting instructions, please see:
<http://www.debian.org/Bugs/>.



Regards,

Armin Catovic
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
