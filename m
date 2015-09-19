From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] futex.2: drop pointless editorializing
Date: Sat, 19 Sep 2015 00:29:14 -0400
Message-ID: <1442636954-31590-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Man pages are technical references to track reality rather than
pointlessly complain about details.
---
 man2/futex.2 | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/man2/futex.2 b/man2/futex.2
index 64dd7fb..7bc2324 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -296,10 +296,8 @@ Initial futex support was merged in Linux 2.5.7 but with different semantics
 from what was described above.
 A 4-argument system call with the semantics
 described in this page was introduced in Linux 2.5.40.
-In Linux 2.5.70, one argument
-was added.
-In Linux 2.6.7, a sixth argument was added\(emmessy, especially
-on the s390 architecture.
+In Linux 2.5.70, a fifth argument was added.
+In Linux 2.6.7, a sixth argument was added.
 .SH CONFORMING TO
 This system call is Linux-specific.
 .SH NOTES
-- 
2.5.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
