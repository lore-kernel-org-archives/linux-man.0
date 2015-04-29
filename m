From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] bsearch.3: ATTRIBUTES: Note functions that is thread-safe
Date: Wed, 29 Apr 2015 18:09:18 +0800
Message-ID: <1430302166-1700-2-git-send-email-zenglg.jy@cn.fujitsu.com>
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
- bsearch: MT-Safe

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/bsearch.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/bsearch.3 b/man3/bsearch.3
index 22c2ee3..ac0b1f4 100644
--- a/man3/bsearch.3
+++ b/man3/bsearch.3
@@ -74,6 +74,19 @@ function returns a pointer to a matching member of the
 array, or NULL if no match is found.
 If there are multiple elements that
 match the key, the element returned is unspecified.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR bsearch ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001, C89, C99.
 .SH EXAMPLE
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
