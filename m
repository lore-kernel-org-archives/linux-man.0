From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] mprotect.2: fix off-by-one error in a memory range
Date: Thu, 01 Sep 2011 00:05:49 +0900
Message-ID: <4E5E4DCD.5080607@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: Just a simple typo, maybe.
See the address range in DESCRIPTION section.


diff --git a/man2/mprotect.2 b/man2/mprotect.2
--- a/man2/mprotect.2
+++ b/man2/mprotect.2
@@ -98,7 +98,7 @@ Internal kernel structures could not be allocated.
.B ENOMEM
Addresses in the range
.RI [ addr ,
-.IR addr + len ]
+.IR addr + len \- 1 ]
are invalid for the address space of the process,
or specify one or more pages that are not mapped.
(Before kernel 2.4.19, the error

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
