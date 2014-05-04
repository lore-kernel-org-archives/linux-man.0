From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] proc.5: cfix
Date: Sat,  3 May 2014 21:24:33 -0400
Message-ID: <1399166675-16019-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/proc.5 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index be6b755..123bc8f 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -155,14 +155,14 @@ bits for all file-mapped pages associated with the process.
 .IP
 Clearing the PG_Referenced and ACCESSED/YOUNG bits provides a method
 to measure approximately how much memory a process is using.
-One first inspects the values in the "Referenced:" fields
+One first inspects the values in the "Referenced" fields
 for the VMAs shown in
 .IR /proc/[pid]/smaps
 to get an idea of the memory footprint of the
 process.
 One then clears the PG_Referenced and ACCESSED/YOUNG bits
 and, after some measured time interval,
-once again inspects the values in the "Referenced:" fields
+once again inspects the values in the "Referenced" fields
 to get an idea of the change in memory footprint of the
 process during the measured interval.
 If one is interested only in inspecting the selected mapping types,
-- 
2.0.0.rc0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
