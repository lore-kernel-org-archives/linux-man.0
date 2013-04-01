From: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>
Subject: [PATCH] man2 : syscall.2 : add notes
Date: Mon,  1 Apr 2013 14:33:49 +0900
Message-ID: <1364794429-20477-1-git-send-email-ch0.han@lge.com>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364361092-5948-1-git-send-email-ch0.han-Hm3cg6mZ9cc@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gunho.lee-Hm3cg6mZ9cc@public.gmane.org, Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Add notes that caution users when passing arguments to syscall.2.

Signed-off-by: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>
---
Modified notes as you suggested and added some example which show how to handle 64bit argument
 man2/syscall.2 |   30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/man2/syscall.2 b/man2/syscall.2
index 0675943..180a0e4 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -79,6 +79,36 @@ and an error code is stored in
 .BR syscall ()
 first appeared in
 4BSD.
+
+Each architecture ABI has its own requirements on how system call arguments are passed to the kernel.
+For system calls that have a glibc wrapper (i.g., most system calls) glibc handles the details of copy arguments to the right registers in a manner suitable for the architecture.
+However, when using
+.BR syscall ()
+to make a system call,
+the caller may need to handle architecture-dependent details.
+For example, on ARM architecture, a
+.I "long long"
+argument is considered to be 8-byte aligned and to be split into two 4-byte arguments.
+
+.BR readahead ()
+system call could be called like below in ARM architecture.
+
+syscall(__NR_readahead, fd, 
+.I 0
+, (unsigned int)(
+.I offset
+>> 32), (unsigned int)(
+.I offset
+& 0xFFFFFFFF), count)
+
+.I offset
+is 64 bit and should be 8-byte aligned.
+Thus, a padding is inserted before
+.I offset
+and
+.I offset
+is split into two 32 bit arguments.
+
 .SH EXAMPLE
 .nf
 #define _GNU_SOURCE
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
