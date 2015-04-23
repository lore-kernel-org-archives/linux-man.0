From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] gethostid.3: ATTRIBUTES: Note functions that isn't thread-safe
Date: Thu, 23 Apr 2015 12:51:42 +0800
Message-ID: <1429764710-8598-2-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429764710-8598-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.
markings of functions in glibc are:
- gethostid: MT-Safe hostid env locale
- sethostid: MT-Unsafe const:hostid

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/gethostid.3 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/man3/gethostid.3 b/man3/gethostid.3
index bbeb4a5..4b46deb 100644
--- a/man3/gethostid.3
+++ b/man3/gethostid.3
@@ -89,6 +89,22 @@ to store the host ID.
 .B EPERM
 The calling process's effective user or group ID is not the same
 as its corresponding real ID.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lbw25
+l l l.
+Interface	Attribute	Value
+T{
+.BR gethostid ()
+T}	Thread safety	MT-Safe hostid env locale
+T{
+.BR sethostid ()
+T}	Thread safety	MT-Unsafe const:hostid
+.TE
+
 .SH CONFORMING TO
 4.2BSD; these functions were dropped in 4.4BSD.
 SVr4 includes
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
