From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] getrandom(2) : new man page
Date: Sat, 13 Sep 2014 15:15:56 +0200
Message-ID: <1410614156-16175-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Theodore Ts\\'o" <tytso-3s7WtUTddSA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Kernel 3.17 introduces a new system call getrandom(2).

The man page in this patch is based on the commit message by
Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
CC: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
---
 man2/getrandom.2 | 198 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 198 insertions(+)
 create mode 100644 man2/getrandom.2

diff --git a/man2/getrandom.2 b/man2/getrandom.2
new file mode 100644
index 0000000..e649eea
--- /dev/null
+++ b/man2/getrandom.2
@@ -0,0 +1,198 @@
+.\" Copyright (C) 2014, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
+.\" Copyright (C) 2014, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
+.\"
+.\" %%%LICENSE_START(VERBATIM)
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of
+.\" this manual under the conditions for verbatim copying, provided that
+.\" the entire resulting derived work is distributed under the terms of
+.\" a permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume.
+.\" no responsibility for errors or omissions, or for damages resulting.
+.\" from the use of the information contained herein.  The author(s) may.
+.\" not have taken the same level of care in the production of this.
+.\" manual, which is licensed free of charge, as they might when working.
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\" %%%LICENSE_END
+
+.TH GETRANDOM 2 2014-09-13 "Linux" "Linux Programmer's Manual"
+.SH NAME
+getrandom \- fill buffer with random bytes
+.SH SYNOPSIS
+.B #include <linux/random.h>
+.sp
+.BI "int getrandom(void *"buf ", size_t " buflen ", unsigned int " flags );
+.SH DESCRIPTION
+The system call
+.BR getrandom ()
+fills the buffer pointed to by
+.I buf
+with up to
+.I buflen
+random bytes which can be used to seed user space random number
+generators (i.e., DRBG's) or for other cryptographic uses.
+It should not be used for Monte Carlo simulations or other programs/algorithms
+which are doing probabilistic sampling.
+.PP
+.I flags
+is a bit mask.
+The following bits can be set in
+.IR flags :
+.TP
+.B GRND_RANDOM
+If this flags bit is set, then random bytes are draw from the
+.I /dev/random
+pool instead of the
+.I /dev/urandom
+pool.
+The
+.I /dev/random
+pool is limited based on the entropy that can be obtained from environmental
+noise, so if there is insufficient entropy, the requested number of bytes may
+not be returned.
+.TP
+.B GRND_NONBLOCK
+If this bit is set and there is no entropy available at all,
+.BR getrandom ()
+will return -1 with
+.I errno
+set to
+.BR EAGAIN .
+If the
+.B GRND_NONBLOCK
+bit is not set and there is no entropy available at all
+.BR getrandom ()
+will block.
+.PP
+The
+.BR getentropy ()
+system call in OpenBSD can be emulated using the following
+function:
+
+.in +4n
+.nf
+int
+getentropy(void *buf, size_t buflen)
+{
+    int ret;
+
+    if (buflen > 256)
+        goto failure;
+    ret = getrandom(buf, buflen, 0);
+    if (ret < 0)
+        return ret;
+    if (ret == buflen)
+        return 0;
+failure:
+    errno = EIO;
+    return -1;
+}
+.fi
+.in
+.SH RETURN VALUE
+On success,
+.BR getrandom ()
+returns the number of bytes that were copied to the buffer
+.IR buf .
+This may not be all the bytes requested by the caller via
+.I buflen
+if insufficient entropy was present in the
+.IR/dev/random pool ,
+or if the system call was interrupted by a signal.
+.PP
+On error, -1 is returned, and
+.I errno
+is set appropriately.
+.SH ERRORS
+.TP
+.B EINVAL
+An invalid flag was passed to
+.BR getrandom ().
+.TP
+.B EFAULT
+The address referenced in parameter
+.I buf
+is outside the accessible address space.
+.TP
+.B EAGAIN
+The requested entropy was not available, and
+.BR getrandom ()
+would have blocked if the
+.B GRND_NONBLOCK
+flag was not set.
+.TP
+.B EINTR
+While blocked waiting for entropy, the call was interrupted by a signal
+handler; see the description of how interrupted
+.BR read (2)
+calls on "slow" devices are handled with and without the
+.B SA_RESTART
+flag in the
+.BR signal (7)
+man page.
+.SH NOTES
+For small requests 
+.RI ( buflen
+<= 256)
+.IR getrandom ()
+will not return
+.B EINTR
+when reading from the
+.I /dev/urandom
+pool once the entropy pool has been initialized,
+and it will return all of the bytes that have been requested.
+This is the recommended way to use
+.BR getrandom (),
+and is designed for compatibility with OpenBSD's
+.BR getentropy ()
+system call.
+.PP
+However, if you are using
+.BR GRND_RANDOM ,
+then
+.IR getrandom ()
+may block until the entropy accounting determines that sufficient environmental
+noise has been gathered such that
+.IR getrandom ()
+will be operating as a NRBG instead of a DRBG for those people who are working
+in the NIST SP 800-90 regime.
+Since it may block for a long time, these guarantees do NOT apply.
+The user may want to interrupt a hanging process using a signal, so blocking
+until all of the requested bytes are returned would be unfriendly.
+.PP
+For this reason, the user of
+.IR getrandom ()
+MUST always check the return value, in case it returns some error,
+or if fewer bytes than requested was returned.
+In the case of
+.RB ! GRND_RANDOM
+and small request, the latter should never happen, but the careful userspace
+code (and all crypto code should be careful) should check for this anyway!
+.PP
+Finally, unless you are doing long-term key generation (and perhaps not even
+then), you probably shouldn't be using
+.B GRND_RANDOM.
+The cryptographic algorithms used for
+.I /dev/urandom
+are quite conservative, and so should be sufficient for all purposes.
+The disadvantage of
+.I GRND_RANDOM
+is that it can block, and the increased complexity required to deal with
+partially fulfilled
+.IR getrandom ()
+requests.
+.SH VERSIONS
+.BR getrandom ()
+was introduced in version 3.17.0 of the Linux kernel for the x86 and amd64 architecture,
+.\" FIXME . Patch is in next-20140913.
+and is expected to be delivered in 3.18.0 for other architectures.
+.SH CONFORMING TO
+This system call is Linux-specific.
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
