From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH v2] bindresvport.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 24 Apr 2013 14:46:12 +0800
Message-ID: <1366785972-12231-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Before glibc 2.17, bindresvport() is not thread-safe.
Since glibc 2.17, it is thread-safe, the patch can refer to URL:
http://sourceware.org/git/?p=glibc.git;a=commit;h=f6da27e53695ad1cc0e2a9490358decbbfdff5e5

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/bindresvport.3 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man3/bindresvport.3 b/man3/bindresvport.3
index d2e73a4..2c7152d 100644
--- a/man3/bindresvport.3
+++ b/man3/bindresvport.3
@@ -89,6 +89,16 @@ is not NULL and
 .I sin->sin_family
 is not
 .BR AF_INET .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+Before glibc 2.17, the
+.BR bindresvport ()
+uses a static variable that is not protected, so it is not thread-safe.
+
+Since glibc 2.17, the
+.BR bindresvport ()
+uses a lock to protect static variable, so it is thread-safe.
+.\" Modified in commit f6da27e53695ad1cc0e2a9490358decbbfdff5e5
 .SH CONFORMING TO
 Not in POSIX.1-2001.
 Present on the BSDs, Solaris, and many other systems.
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
