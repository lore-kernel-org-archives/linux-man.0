From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] shm_open.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 13 May 2015 14:53:51 +0800
Message-ID: <1431500032-26865-9-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1431500032-26865-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431500032-26865-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
markings of functions in glibc are:
- shm_open:   MT-Safe locale
- shm_unlink: MT-Safe locale

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/shm_open.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/shm_open.3 b/man3/shm_open.3
index 3ad7592..a4eb22a 100644
--- a/man3/shm_open.3
+++ b/man3/shm_open.3
@@ -248,6 +248,20 @@ a
 that does not exist.
 .SH VERSIONS
 These functions are provided in glibc 2.2 and later.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw24 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR shm_open (),
+.BR shm_unlink ()
+T}	Thread safety	MT-Safe locale
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001.
 .LP
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
