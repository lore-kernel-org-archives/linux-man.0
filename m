From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strcasecmp.3: ATTRIBUTES: Note functions that are thread safe with exceptions
Date: Thu, 10 Jul 2014 09:41:45 +0800
Message-ID: <1404956505-4662-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions strcasecmp() and strncasecmp() are thread safe
with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strcasecmp.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/strcasecmp.3 b/man3/strcasecmp.3
index 7887e9f..fc17cc0 100644
--- a/man3/strcasecmp.3
+++ b/man3/strcasecmp.3
@@ -73,6 +73,19 @@ an integer less than, equal to, or greater than zero if
 bytes thereof) is found, respectively, to be
 less than, to match, or be greater than
 .IR s2 .
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw27 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR strcasecmp (),
+.BR strncasecmp ()
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 4.4BSD, POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
