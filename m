From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nroff syntax issue in man3/getutent.3
Date: Tue, 2 Nov 2010 00:18:01 +0100
Message-ID: <AANLkTikF9UQ9+q1TB3voccYwDPWOYKC-B+1hAe2YQh=-@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

Here is another one, other pages look fine.

Denis

diff --git a/man3/getutent.3 b/man3/getutent.3
index 13bd9e7..8e160d2 100644
--- a/man3/getutent.3
+++ b/man3/getutent.3
@@ -209,7 +209,7 @@ Glibc adds reentrant versions
 .sp
 .nf
 .BR "#define _GNU_SOURCE" "    /* or _SVID_SOURCE or _BSD_SOURCE;
-.R "\&                          see feature_test_macros(7) */
+\&                          see feature_test_macros(7) */
 .B #include <utmp.h>
 .sp
 .BI "int getutent_r(struct utmp *" ubuf ", struct utmp **" ubufp );
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
