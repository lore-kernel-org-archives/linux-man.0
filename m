From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] capabilities.7: ffix
Date: Wed,  6 Mar 2013 23:25:46 +0100
Message-ID: <1362608746-29066-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/capabilities.7 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index 64b642e..1b5fcc4 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -1040,7 +1040,7 @@ enabled (1) in these sets.
 Since Linux 3.8,
 .\" 7b9a7ec565505699f503b4fcf61500dceb36e744
 all non-existent capabilities (above
-.B CAP_LAST_CAP)
+.BR CAP_LAST_CAP )
 are shown as disabled (0).
 
 The
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
