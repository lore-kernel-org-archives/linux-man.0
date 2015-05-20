From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_join.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 20 May 2015 18:00:09 +0800
Message-ID: <1432116011-10181-8-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1432116011-10181-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432116011-10181-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think pthread_join() is thread-safe. But, there
is not marking of pthread_join() in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_join.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/pthread_join.3 b/man3/pthread_join.3
index 00eafb9..3340172 100644
--- a/man3/pthread_join.3
+++ b/man3/pthread_join.3
@@ -95,6 +95,19 @@ Another thread is already waiting to join with this thread.
 No thread with the ID
 .I thread
 could be found.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR pthread_join ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
