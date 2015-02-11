From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fgetpwent.3: ATTRIBUTES: Note function that is not thread-safe
Date: Wed, 11 Feb 2015 15:41:56 +0800
Message-ID: <1423640516-25520-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fgetpwent.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/fgetpwent.3 b/man3/fgetpwent.3
index 3076494..3c4a57a 100644
--- a/man3/fgetpwent.3
+++ b/man3/fgetpwent.3
@@ -98,6 +98,18 @@ structure.
 .TP
 .I /etc/passwd
 password database file
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fgetpwent ()
+T}	Thread safety	MT-Unsafe race:fpwent
+.TE
 .SH CONFORMING TO
 SVr4.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
