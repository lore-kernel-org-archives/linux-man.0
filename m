From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] login.3: ATTRIBUTES: Note functions that aren't thread-safe
Date: Thu, 16 Apr 2015 13:09:33 +0800
Message-ID: <1429160978-15236-2-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1429160978-15236-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429160978-15236-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

login:  MT-Unsafe race:utent sig:ALRM timer
logout: MT-Unsafe race:utent sig:ALRM timer

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/login.3 | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/man3/login.3 b/man3/login.3
index fe03b5a..98d3b91 100644
--- a/man3/login.3
+++ b/man3/login.3
@@ -109,6 +109,41 @@ user accounting log file, configured through
 .B _PATH_WTMP
 in
 .I <paths.h>
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lbw20
+l l l.
+Interface	Attribute	Value
+T{
+.BR login (),
+.br
+.BR logout ()
+T}	Thread safety	T{
+MT-Unsafe race:utent
+.br
+sig:ALRM timer
+T}
+.TE
+
+In the above table,
+.I utent
+in
+.I race:utent
+signifies that if any of the functions
+.BR setutent (3),
+.BR getutent (3),
+or
+.BR endutent (3)
+are used in parallel in different threads of a program,
+then data races could occur.
+.BR login (3)
+and
+.BR logout (3)
+calls those functions,
+so we use race:utent to remind users.
 .SH CONFORMING TO
 Not in POSIX.1-2001.
 Present on the BSDs.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
