From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/4] tee.2: tfix
Date: Thu, 22 Oct 2015 16:44:12 +0200
Message-ID: <1445525054-2880-2-git-send-email-jwilk@jwilk.net>
References: <1445525054-2880-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445525054-2880-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/sigaction.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/sigaction.2 b/man2/sigaction.2
index 2a4400e..e764b2a 100644
--- a/man2/sigaction.2
+++ b/man2/sigaction.2
@@ -399,7 +399,7 @@ of the (configurable) system jiffy (see
 .\" measurement unit was HZ, which was the same as clock ticks
 .\" (sysconf(_SC_CLK_TCK)).  In 2.6, HZ became configurable, and
 .\" was *still* used as the unit to return the info these fields,
-.\" with the result that the field values depended on the the
+.\" with the result that the field values depended on the
 .\" configured HZ.  Of course, the should have been measured in
 .\" USER_HZ instead, so that sysconf(_SC_CLK_TCK) could be used to
 .\" convert to seconds.  I have a queued patch to fix this:
-- 
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
