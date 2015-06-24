From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] dlopen.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 24 Jun 2015 17:28:36 +0800
Message-ID: <1435138119-30051-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think
* dlopen(),
* dlerror(),
* dlsym(),
* dlclose(),
* dladdr(),
* dlvsym()
are thread-safe. But, there are not
markings of them in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/dlopen.3 | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/man3/dlopen.3 b/man3/dlopen.3
index cb5dbf9..53d3f16 100644
--- a/man3/dlopen.3
+++ b/man3/dlopen.3
@@ -396,6 +396,25 @@ provided by glibc since version 2.1,
 does the same as
 .BR dlsym ()
 but takes a version string as an additional argument.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw29 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR dlopen (),
+.BR dlerror (),
+.BR dlsym (),
+.br
+.BR dlclose (),
+.BR dladdr (),
+.BR dlvsym ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001 describes
 .BR dlclose (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
