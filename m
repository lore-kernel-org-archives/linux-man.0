From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sigaltstack.2: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 13 May 2015 14:53:52 +0800
Message-ID: <1431500032-26865-10-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1431500032-26865-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431500032-26865-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
The marking of functions in glibc is:
- sigaltstack: MT-Safe

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man2/sigaltstack.2 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man2/sigaltstack.2 b/man2/sigaltstack.2
index fb58593..a33d59b 100644
--- a/man2/sigaltstack.2
+++ b/man2/sigaltstack.2
@@ -155,6 +155,19 @@ was less than
 An attempt was made to change the alternate signal stack while
 it was active (i.e., the process was already executing
 on the current alternate signal stack).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR sigaltstack ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 SUSv2, SVr4, POSIX.1-2001.
 .SH NOTES
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
