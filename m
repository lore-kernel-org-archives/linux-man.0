From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getrlimit.2: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 13 May 2015 14:53:44 +0800
Message-ID: <1431500032-26865-2-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1431500032-26865-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431500032-26865-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think prlimit() is thread-safe. But, there
is not marking of prlimit() in glibc document.
getrlimit() and setrlimit() match glibc markings.
- getrlimit: MT-Safe
- setrlimit: MT-Safe
- prlimit:   MT-Safe

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man2/getrlimit.2 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
index 211ff69..ec464fe 100644
--- a/man2/getrlimit.2
+++ b/man2/getrlimit.2
@@ -508,6 +508,21 @@ The
 .BR prlimit ()
 system call is available since Linux 2.6.36.
 Library support is available since glibc 2.13.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw35 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR getrlimit (),
+.BR setrlimit (),
+.BR prlimit ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 .BR getrlimit (),
 .BR setrlimit ():
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
