From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mq_notify.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 13 May 2015 14:53:48 +0800
Message-ID: <1431500032-26865-6-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1431500032-26865-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431500032-26865-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think mq_notify() is thread-safe. But, there
is not marking of mq_notify() in glibc document.
- mq_notify: MT-Safe

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mq_notify.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/mq_notify.3 b/man3/mq_notify.3
index 9709e19..e1a7c2f 100644
--- a/man3/mq_notify.3
+++ b/man3/mq_notify.3
@@ -171,6 +171,19 @@ error if
 is NULL, and the caller is not currently registered to receive
 notifications for the queue
 .IR mqdes .
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR mq_notify ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
