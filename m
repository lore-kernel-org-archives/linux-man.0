From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 15568] New: O_NONBLOCK is NOOP on block devices
Date: Wed, 17 Mar 2010 23:16:08 GMT
Message-ID: <bug-15568-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=15568

           Summary: O_NONBLOCK is NOOP on block devices
           Product: Documentation
           Version: unspecified
    Kernel Version: 2.6.18-2.6.32
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: mh-linux-kernel-AB0c8HnZplU@public.gmane.org
        Regression: No


Created an attachment (id=25573)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=25573)
Patch to man page v. 3.25

Timing results indicate that the O_NONBLOCK flag produces no noticable
effect on read or writev to a Linux block device.

I always perform aligned ios which are a multiple of the sector size
which also allows the use of O_DIRECT if desired.  For testing, I've
been using 2.6.22, 2.6.24 kernels, 2.6.32 kernels (fedora core and
ubuntu distros) on both x86_64 and 32 bit arm architectures and get
similar results on every variation of hardware and kernel tested.

To extract the following data, I used the following set of system
calls in a loop driven by poll, surrounding read and write calls
immediately with time checks.

fd = open( filename, O_RDWR | O_NONBLOCK | O_NOATIME );
gettimeofday( &time, 0 );
read( fd, pos, len );
writev( fd, iov, count );
poll( pfd, npfd, timeoutms );

Byte counts are displayed in hex.  On my core 2 duo laptop, for
example, io to or from the buffer cache typically takes 100 to 125
micro seconds to transfer 64k.

----------------------------------------------------------------------
BUFFER CACHE NOT FULL, NONBLOCKING 64K WRITES AS EXPECTED

write fd:3 0.000117s bytes:10000 remain:0
write fd:3 0.000115s bytes:10000 remain:0
write fd:3 0.000116s bytes:10000 remain:0
write fd:3 0.000118s bytes:10000 remain:0
write fd:3 0.000125s bytes:10000 remain:0
write fd:3 0.000126s bytes:10000 remain:0
write fd:3 0.000101s bytes:10000 remain:0

----------------------------------------------------------------------
READING AND WRITING, BUFFER CACHE FULL

read  fd:3 0.006351s bytes:10000 remain:0
write fd:3 0.001235s bytes:200   remain:0
write fd:3 0.002477s bytes:200   remain:0
read  fd:3 0.005010s bytes:10000 remain:0
write fd:3 0.001243s bytes:200   remain:0
read  fd:3 0.005028s bytes:10000 remain:0
write fd:3 0.000506s bytes:200   remain:0
write fd:3 0.000106s bytes:10000 remain:0
write fd:3 0.000812s bytes:200   remain:0
write fd:3 0.000108s bytes:10000 remain:0
write fd:3 0.000807s bytes:200   remain:0
write fd:3 0.002652s bytes:200   remain:0
write fd:3 0.000107s bytes:10000 remain:0
write fd:3 0.000141s bytes:10000 remain:0
write fd:3 0.002232s bytes:200   remain:0

These are not worst-case, but rather best case results!  For an
example of more worse case results, using a usb flash device,
frequently (about once a second or so) under heavier load I see reads
or writes blocked for 500ms or more when vmstat and top report more
than 90% idle / wait.  500ms to perform a 512 byte "non blocking" io
with a nearly idle cpu is an eternity in computer time; more than
10,000 times longer than it should take to memcpy all or even a
portion of the data or return EAGAIN.

I discovered this because, even though they succeed, all of these
"non" blocking system calls are blocking so much so that they easily
choke process non blocking socket io.

I think this O_NONBLOCK behavior has aspects that could probably be
classified as both a documentation and a kernel defect depending upon
whether the existing open(2) man page documents the intended behavior
of read and write or not.  Alan Cox suggested a man page patch.  The
attached one correctly describes the existing behavior while reserving
future nonblocking semantics.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
