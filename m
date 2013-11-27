From: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Subject: [PATCH] kcmp: reword slightly awkward section
Date: Wed, 27 Nov 2013 08:43:28 -0800
Message-ID: <1385570608-2824-1-git-send-email-shawn@churchofgit.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/kcmp.2 | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/man2/kcmp.2 b/man2/kcmp.2
index c4fa3f4..5cde64e 100644
--- a/man2/kcmp.2
+++ b/man2/kcmp.2
@@ -117,10 +117,13 @@ are ignored.
 .PP
 Note the
 .BR kcmp ()
-is not protected against false positives which may have place if tasks are
+is not protected against false positives which may occur if tasks are
 running.
-Which means one should stop tasks being inspected with this syscall to obtain
-meaningful results.
+One should stop tasks by sending
+.BR SIGSTOP
+(see
+.BR signal (7))
+prior to inspection with this syscall to obtain meaningful results.
 .SH RETURN VALUE
 The return value of a successful call to
 .BR kcmp ()
-- 
1.8.4.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
