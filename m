From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] if_nameindex.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 12 Mar 2015 11:01:03 +0800
Message-ID: <1426129263-1500-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/if_nameindex.3 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/man3/if_nameindex.3 b/man3/if_nameindex.3
index 2e38fbf..9d38c6e 100644
--- a/man3/if_nameindex.3
+++ b/man3/if_nameindex.3
@@ -101,6 +101,21 @@ function first appeared in glibc 2.1, but before glibc 2.3.4,
 the implementation supported only interfaces with IPv4 addresses.
 Support of interfaces that don't have IPv4 addresses is available only
 on kernels that support netlink.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR if_nameindex (),
+.br
+.BR if_freenameindex ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 RFC\ 3493, POSIX.1-2001.
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
