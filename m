From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] cciss.4: tfix
Date: Sat, 14 Jun 2014 08:52:59 +0400
Message-ID: <1402721579-3971-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man4/cciss.4 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man4/cciss.4 b/man4/cciss.4
index 030ef69..65ce461 100644
--- a/man4/cciss.4
+++ b/man4/cciss.4
@@ -329,10 +329,10 @@ The
 .B cciss
 driver is a block
 driver as well as a SCSI driver and only the tape drives and medium
-changers are presented to the SCSI midlayer
+changers are presented to the SCSI midlayer.
 Furthermore, unlike more
 straightforward SCSI drivers, disk I/O continues through the block
-side during the SCSI error-recovery process
+side during the SCSI error-recovery process.
 Therefore, the
 .B cciss
 driver implements only the first two of these actions,
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
