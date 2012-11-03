From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] proc.5: tfix
Date: Sat,  3 Nov 2012 23:53:06 +0100
Message-ID: <1351983187-7963-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/proc.5 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 88af7c5..2db68e3 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1623,7 +1623,7 @@ These reserved huge pages
 guarantee that an application will be able to allocate a
 huge page from the pool of huge pages at fault time.
 .TP
-.IR HugePages_Surp " %lu (since Linux 2.56.24)"
+.IR HugePages_Surp " %lu (since Linux 2.6.24)"
 (\fBCONFIG_HUGETLB_PAGE\fP is required.)
 This is the number of huge pages in
 the pool above the value in
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
