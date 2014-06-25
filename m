From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getfsent.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Wed, 25 Jun 2014 11:12:06 +0800
Message-ID: <1403665926-11682-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions setfsent(), getfsent(), endfsent(), getfsspec()
and getfsfile() are not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getfsent.3 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/man3/getfsent.3 b/man3/getfsent.3
index 022895a..12c883a 100644
--- a/man3/getfsent.3
+++ b/man3/getfsent.3
@@ -112,6 +112,22 @@ Upon failure or end-of-file, these functions return NULL and 0, respectively.
 .\" The
 .\" .BR getfsent ()
 .\" function appeared in 4.0BSD; the other four functions appeared in 4.3BSD.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw35 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR setfsent (),
+.BR getfsent (),
+.BR endfsent (),
+.BR getfsspec (),
+.BR getfsfile ()
+T}	Thread safety	MT-Unsafe
+.TE
 .SH CONFORMING TO
 These functions are not in POSIX.1-2001.
 Several operating systems have them, for example,
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
