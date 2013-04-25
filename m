From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fmtmsg.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 25 Apr 2013 11:49:04 +0800
Message-ID: <1366861744-16118-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Before glibc 2.16, fmtmsg() is not thread-safe.
Since glibc 2.16, it is thread-safe, the patch can refer to URL:
http://sourceware.org/git/?p=glibc.git;a=commit;h=7724defcf8873116fe4efab256596861eef21a94

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fmtmsg.3 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man3/fmtmsg.3 b/man3/fmtmsg.3
index f4b3d6f..3e3d3f9 100644
--- a/man3/fmtmsg.3
+++ b/man3/fmtmsg.3
@@ -222,6 +222,16 @@ is the string printed when a message of this class is processed by
 .SH VERSIONS
 .BR fmtmsg ()
 is provided in glibc since version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+Before glibc 2.16, the
+.BR fmtmsg ()
+uses a static variable that is not protected, so it is not thread-safe.
+
+Since glibc 2.16, the
+.BR fmtmsg ()
+uses a lock to protect static variable, so it is thread-safe.
+.\" Modified in commit 7724defcf8873116fe4efab256596861eef21a94
 .SH CONFORMING TO
 The functions
 .BR fmtmsg ()
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
