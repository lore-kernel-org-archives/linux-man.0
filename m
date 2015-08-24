From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] termios.3: srcfix: add FIXME
Date: Mon, 24 Aug 2015 18:19:56 +0800
Message-ID: <1440411596-2566-7-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1440411596-2566-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440411596-2566-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/termios.3 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man3/termios.3 b/man3/termios.3
index 02aee64..1ea5236 100644
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -994,6 +994,13 @@ T{
 .BR cfsetispeed (),
 .BR cfsetospeed (),
 .BR cfsetspeed ()
+.\" FIXME: the following markings are different from which in glibc manual,
+.\" markings in glibc manual are more detailed.
+.\" tcsendbreak: MT-Unsafe race:tcattr(filedes)/bsd
+.\" tcflow: MT-Unsafe race:tcattr(filedes)/bsd
+.\" glibc manual says /bsd indicate the preceding marker only applies
+./" when the underlying kernel is a BSD kernel.
+.\" So, it is safety in Linux kernel.
 T}	Thread safety	MT-Safe
 .TE
 .ad
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
