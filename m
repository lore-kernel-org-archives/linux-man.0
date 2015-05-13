From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getifaddrs.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 13 May 2015 14:53:43 +0800
Message-ID: <1431500032-26865-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think getifaddrs() and freeifaddrs() are not
thread-safe. But, there is not markings of getifaddrs() and
freeifaddrs() in glibc document.
- getifaddrs:  MT-Safe
- freeifaddrs: MT-Safe

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getifaddrs.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/getifaddrs.3 b/man3/getifaddrs.3
index ae6ac8e..0437b08 100644
--- a/man3/getifaddrs.3
+++ b/man3/getifaddrs.3
@@ -167,6 +167,20 @@ the implementation supported only IPv4 addresses;
 IPv6 support was added in glibc 2.3.3.
 Support of address families other than IPv4 is available only
 on kernels that support netlink.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw27 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getifaddrs (),
+.BR freeifaddrs ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 Not in POSIX.1-2001.
 This function first appeared in BSDi and is
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
