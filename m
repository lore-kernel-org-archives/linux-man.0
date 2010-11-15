From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] Typo in getrlimit.2
Date: Mon, 15 Nov 2010 07:49:41 +0100
Message-ID: <AANLkTi=tkCZbdnfsFG3kiOedgMD3akj6ji5NiiasYygS@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

Here is a trivial patch.

Denis

diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
index 805d232..1a71cb9 100644
--- a/man2/getrlimit.2
+++ b/man2/getrlimit.2
@@ -466,7 +466,7 @@ for the process specified by
 Could not find a process with the ID specified in
 .IR pid .
 .SH VERSIONS
-.BR The
+The
 .BR prlimit ()
 system call is available since Linux 2.6.36.
 Library support is available since glibc 2.13.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
