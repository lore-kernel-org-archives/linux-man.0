From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] setlocale.3: ATTRIBUTES: Note functions that isn't thread-safe
Date: Thu, 23 Apr 2015 12:51:47 +0800
Message-ID: <1429764710-8598-7-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429764710-8598-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
The marking of functions in glibc is:
- setlocale: MT-Unsafe const:locale env

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/setlocale.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/setlocale.3 b/man3/setlocale.3
index 5dd289a..632257d 100644
--- a/man3/setlocale.3
+++ b/man3/setlocale.3
@@ -173,6 +173,19 @@ The string returned is such that a subsequent call with that string
 and its associated category will restore that part of the process's
 locale.
 The return value is NULL if the request cannot be honored.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lbw26
+l l l.
+Interface	Attribute	Value
+T{
+.BR setlocale ()
+T}	Thread safety	MT-Unsafe const:locale env
+.TE
+
 .SH CONFORMING TO
 C89, C99, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
