From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] posix_memalign.3: ffix
Date: Wed, 18 Apr 2012 23:00:12 +0200
Message-ID: <1334782812-23000-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/posix_memalign.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/posix_memalign.3 b/man3/posix_memalign.3
index 822cb43..5d33cba 100644
--- a/man3/posix_memalign.3
+++ b/man3/posix_memalign.3
@@ -198,7 +198,7 @@ The function
 comes from POSIX.1d.
 
 The function
-.I aligned_alloc ()
+.BR aligned_alloc ()
 is specified in the C11 standard.
 .\"
 .SS Headers
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
