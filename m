From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] initgroups.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 12 Mar 2015 10:52:41 +0800
Message-ID: <1426128761-887-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/initgroups.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/initgroups.3 b/man3/initgroups.3
index 4ed7d51..25cdee2 100644
--- a/man3/initgroups.3
+++ b/man3/initgroups.3
@@ -85,6 +85,19 @@ See the underlying system call
 .nf
 \fI/etc/group\fP		group database file
 .fi
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR initgroups ()
+T}	Thread safety	MT-Safe locale
+.TE
+
 .SH CONFORMING TO
 SVr4, 4.3BSD.
 .SH SEE ALSO
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
