From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] lsearch.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 29 Apr 2015 18:09:22 +0800
Message-ID: <1430302166-1700-6-git-send-email-zenglg.jy@cn.fujitsu.com>
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
markings of functions in glibc are:
- lfind:   MT-Safe
- lsearch: MT-Safe

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/lsearch.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/lsearch.3 b/man3/lsearch.3
index 3b4637d..f192960 100644
--- a/man3/lsearch.3
+++ b/man3/lsearch.3
@@ -77,6 +77,20 @@ NULL if no match is found.
 returns a pointer to
 a matching member of the array, or to the newly added member if no
 match is found.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw18 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR lfind (),
+.BR lsearch ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
 Present in libc since libc-4.6.27.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
