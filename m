From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] futex.7: broken sentence
Date: Fri, 19 Jul 2013 14:29:49 +0200
Message-ID: <51E9313D.1070501@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello,

futex(7) man page contains broken sentence. Attached patch proposes one 
possible fix for this problem.

peter

diff --git a/man7/futex.7 b/man7/futex.7
index 31d91a1..2c5b56c 100644
--- a/man7/futex.7
+++ b/man7/futex.7
@@ -51,7 +51,7 @@ in which case the application is commonly called 
multithreaded.
  .SS Semantics
  .PP
  Any futex operation starts in user space,
-but it may necessary to communicate with the kernel using the
+but it may be necessary to communicate with the kernel using the
  .BR futex (2)
  system call.
  .PP
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
