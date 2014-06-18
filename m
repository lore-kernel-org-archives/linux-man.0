From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] makedev.3: ATTRIBUTES: Note macros that are thread-safe
Date: Wed, 18 Jun 2014 16:01:46 +0800
Message-ID: <1403078506-24020-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The macros makedev(), major() and minor() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/makedev.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/makedev.3 b/man3/makedev.3
index f6d191c..fb55f96 100644
--- a/man3/makedev.3
+++ b/man3/makedev.3
@@ -59,6 +59,20 @@ they return, respectively, the major and minor components.
 These macros can be useful to, for example,
 decompose the device IDs in the structure returned by
 .BR stat (2).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw27 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR makedev (),
+.BR major (),
+.BR minor ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 The
 .BR makedev (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
