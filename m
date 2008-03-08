From: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [Patch] Fix the prototype of personality(2)
Date: Sat, 08 Mar 2008 20:04:47 +0800 (CST)
Message-ID: <20080308.200447.90797012.xiyou.wangcong@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


According to the source code of Linux kernel, the type of the
return value of personality(2) should be long instead of int.

Signed-off-by: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---

Index: man-pages-2.78/man2/personality.2
===================================================================
--- man-pages-2.78.orig/man2/personality.2
+++ man-pages-2.78/man2/personality.2
@@ -33,7 +33,7 @@ personality \- set the process execution
 .SH SYNOPSIS
 .B #include <sys/personality.h>
 .sp
-.BI "int personality(unsigned long " persona );
+.BI "long personality(unsigned long " persona );
 .SH DESCRIPTION
 Linux supports different execution domains, or personalities, for each
 process.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
