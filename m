From: Nikanth Karthikesan <knikanth-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] ioprio_set.2: CAP_SYS_ADMIN is not reqd to set IOPRIO_CLASS_IDLE anymore
Date: Tue, 8 Jul 2008 12:07:39 +0530
Message-ID: <200807081207.39693.knikanth@suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Since linux-2.6.25 CAP_SYS_ADMIN capability is not required to set 
IOPRIO_CLASS_IDLE.

Signed-off-by: Nikanth Karthikesan <knikanth-l3A5Bk7waGM@public.gmane.org>

---
 man2/ioprio_set.2 |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

Index: b/man2/ioprio_set.2
===================================================================
--- a/man2/ioprio_set.2
+++ b/man2/ioprio_set.2
@@ -293,11 +293,12 @@ capability can change the priority of an
 .B "What is the desired priority"
 Attempts to set very high priorities
 .RB ( IOPRIO_CLASS_RT )
-or very low ones
-.RB ( IOPRIO_CLASS_IDLE )
 require the
 .B CAP_SYS_ADMIN
-capability.
+capability. Kernel versions till 2.6.24 require
+.B CAP_SYS_ADMIN
+capability even to set very low priority
+.RB ( IOPRIO_CLASS_IDLE ).
 .PP
 A call to
 .BR ioprio_set ()
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
