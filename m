From: Tobias Stoeckmann <tobias-Ddw9a119yAU@public.gmane.org>
Subject: typo in dlopen.3
Date: Mon, 21 Dec 2009 13:04:25 +0100
Message-ID: <20091221120425.GA20100@fungi.pizza.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

in man-pages 3.23 is a typo in dlopen(3).


With kind regards,

Tobias Stoeckmann

--- man-pages-3.23/man3/dlopen.3~	2009-12-21 13:00:58.000000000 +0100
+++ man-pages-3.23/man3/dlopen.3	2009-12-21 13:02:13.000000000 +0100
@@ -141,7 +141,7 @@
 returns.
 If this cannot be done, an error is returned.
 .PP
-Zero of more of the following values may also be ORed in
+Zero or more of the following values may also be ORed in
 .IR flag :
 .TP
 .B RTLD_GLOBAL
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
