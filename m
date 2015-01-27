From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] getrandom.2: clarification of open questions
Date: Tue, 27 Jan 2015 22:27:48 +0100
Message-ID: <1422394068-10106-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

With his last patches for getrandom.2 Michael Kerrisk posed a few
questions and left some comments in the man-page. This patch
seeks to clarify the open issues.

 72 For example, if the call is interrupted by a signal handler,
 73 it may return a partially filled buffer, or fail with the error
 74 .BR EINTR .
 75 .\" Tested with buffer sizes > 256 bytes: both partial reads
 76 .\" and EINTR can occur, with the former being more frequent.
 77 .\"

Michael's observation agrees with the code.
For buffer size > 256: If the buffer is still empty EINTR occurs. If
any number of bytes has been read to the buffer, that number is returned.
The comment can be removed.

 78 .\" mtk: In the absence of signals, in my testing, even very large reads
 79 .\" return full buffers. I found that reads of up to 33554431 always
 80 .\" returned a filled buffer. Specifying 'buflen' > 33554431 always
 81 .\" returned just 33554431 bytes. (I'm not sure where that number comes
        from.

The maximum number of bytes transferred is limited for /dev/urandom to
nbytes = min_t(size_t, nbytes, INT_MAX >> (ENTROPY_SHIFT + 3));
// <= 0x1fffff

and for /dev/random to
nbytes = min_t(size_t, nbytes, SEC_XFER_SIZE); // <= 0x200

Lets put this into the NOTES section.

 224 When reading from
 225 .IR /dev/random ,
 226 blocking requests of any size can be interrupted by a signal
 227 (the call fails with the error
 228 .BR EINTR ).

Thats ok.

 82 If the pool has not yet been initialized, then the call blocks, unless
 83 .B GRND_RANDOM
 84 is specified in
 85 .IR flags .
 86 .\" FIXME We need a bit more information here.
 87 .\"       The reader will ask: when is /dev/urandom initialized?
 88 .\"       There should be some text here to explain that.

Entropy is collected from different sources, e.g.
 - time of reaping a thread
 - MAC address of a network interfaces
 - Allwinner security ID
 - ROM content of a firewire device
 - ...

When more than 128 bits have been collected, the pool is set to initialized.

I suggest that detailed information about the initialization should be provided
on the random.4 page.

I added a paragraph in the NOTES section.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/getrandom.2 | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/man2/getrandom.2 b/man2/getrandom.2
index f66cebe..469da27 100644
--- a/man2/getrandom.2
+++ b/man2/getrandom.2
@@ -72,20 +72,10 @@ No such guarantees apply for larger buffer sizes.
 For example, if the call is interrupted by a signal handler,
 it may return a partially filled buffer, or fail with the error
 .BR EINTR .
-.\" Tested with buffer sizes > 256 bytes: both partial reads
-.\" and EINTR can occur, with the former being more frequent.
-.\"
-.\" mtk: In the absence of signals, in my testing, even very large reads
-.\" return full buffers. I found that reads of up to 33554431 always
-.\" returned a filled buffer. Specifying 'buflen' > 33554431 always
-.\" returned just 33554431 bytes. (I'm not sure where that number comes from.
 If the pool has not yet been initialized, then the call blocks, unless
 .B GRND_RANDOM
 is specified in
 .IR flags .
-.\" FIXME We need a bit more information here.
-.\"       The reader will ask: when is /dev/urandom initialized?
-.\"       There should be some text here to explain that.
 
 The
 .I flags
@@ -179,6 +169,25 @@ was introduced in version 3.17 of the Linux kernel.
 .SH CONFORMING TO
 This system call is Linux-specific.
 .SH NOTES
+.SS Maximum number of bytes returned
+As of Linux 3.19 the following limits apply:
+.IP * 3
+When reading from
+.I /dev/urandom
+a maximum of 33554431 bytes is returned by a single call to
+.BR getrandom ()
+on a system where
+.I int
+has a size of 32 bits.
+.IP *
+When reading from
+.I /dev/random
+a maximum of 512 bytes is returned.
+.SS Initilization of the entropy pool
+The kernel collects bits of entropy from environment.
+When a sufficient number of random bits has been collected the
+.I /dev/urandom
+entropy pool is set to initialized.
 .SS Interruption by a signal handler
 A call to
 .BR getrandom ()
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
