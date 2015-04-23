From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sleep.3: ATTRIBUTES: Note functions that isn't thread-safe
Date: Thu, 23 Apr 2015 12:51:49 +0800
Message-ID: <1429764710-8598-9-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429764710-8598-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
The marking of functions in glibc is:
- sleep: MT-Unsafe sig:SIGCHLD/linux

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sleep.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/sleep.3 b/man3/sleep.3
index e50d617..f761ed8 100644
--- a/man3/sleep.3
+++ b/man3/sleep.3
@@ -41,6 +41,19 @@ seconds have elapsed or a signal arrives which is not ignored.
 Zero if the requested time has elapsed,
 or the number of seconds left to sleep,
 if the call was interrupted by a signal handler.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lbw27
+l l l.
+Interface	Attribute	Value
+T{
+.BR sleep ()
+T}	Thread safety	MT-Unsafe sig:SIGCHLD/linux
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH BUGS
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
