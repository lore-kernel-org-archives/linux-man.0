From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ftw.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 29 Apr 2015 18:09:19 +0800
Message-ID: <1430302166-1700-3-git-send-email-zenglg.jy@cn.fujitsu.com>
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
- nftw: MT-Safe cwd
- ftw:  MT-Safe

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ftw.3 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/man3/ftw.3 b/man3/ftw.3
index b24cfd6..b421c00 100644
--- a/man3/ftw.3
+++ b/man3/ftw.3
@@ -350,6 +350,22 @@ and that value is returned as the result of
 .SH VERSIONS
 .BR nftw ()
 is available under glibc since version 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR nftw ()
+T}	Thread safety	MT-Safe cwd
+T{
+.BR ftw ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001, POSIX.1-2008, SVr4, SUSv1.
 POSIX.1-2008 marks
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
