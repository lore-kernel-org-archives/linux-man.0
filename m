From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getopt.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Wed, 25 Jun 2014 14:29:25 +0800
Message-ID: <1403677765-23418-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions getopt(), getopt_long() and getopt_long_only() are
not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getopt.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/getopt.3 b/man3/getopt.3
index 21b7dad..891cc64 100644
--- a/man3/getopt.3
+++ b/man3/getopt.3
@@ -315,6 +315,20 @@ wildcard expansion and so should not be considered as options.
 This behavior was removed in
 .BR bash (1)
 version 2.01, but the support remains in glibc.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw24 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getopt (),
+.BR getopt_long (),
+.BR getopt_long_only ()
+T}	Thread safety	MT-Unsafe env
+.TE
 .SH CONFORMING TO
 .TP
 .BR getopt ():
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
