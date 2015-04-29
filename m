From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sysconf.3: ATTRIBUTES: Note functions that is thread-safe
Date: Wed, 29 Apr 2015 18:09:26 +0800
Message-ID: <1430302166-1700-10-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1430302166-1700-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430302166-1700-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
The marking of functions in glibc is:
- sysconf: MT-Safe env

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sysconf.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/sysconf.3 b/man3/sysconf.3
index 99a2c41..276629f 100644
--- a/man3/sysconf.3
+++ b/man3/sysconf.3
@@ -324,6 +324,19 @@ is not changed.
 In the case of options, a positive value is returned if a queried option
 is available, and \-1 if it is not.
 In the case of limits, \-1 means that there is no definite limit.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR sysconf ()
+T}	Thread safety	MT-Safe env
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
