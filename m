From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] syslog.3: ATTRIBUTES: Note functions that are thread safe with exceptions
Date: Wed, 9 Jul 2014 17:29:56 +0800
Message-ID: <1404898196-3437-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions openlog() and closelog() are thread safe.
The functions syslog() and vsyslog() are thread safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/syslog.3 | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/man3/syslog.3 b/man3/syslog.3
index 4c77ab4..94b870b 100644
--- a/man3/syslog.3
+++ b/man3/syslog.3
@@ -249,6 +249,23 @@ debug-level message
 The function
 .BR setlogmask (3)
 can be used to restrict logging to specified levels only.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw21 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR openlog (),
+.BR closelog ()
+T}	Thread safety	MT-Safe
+T{
+.BR syslog (),
+.BR vsyslog ()
+T}	Thread safety	MT-Safe env locale
+.TE
 .SH CONFORMING TO
 The functions
 .BR openlog (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
