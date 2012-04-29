From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] mallopt.3: fix program source to match behaviour example
Date: Sun, 29 Apr 2012 14:07:51 +0200
Message-ID: <1335701271-10490-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Call mallopt with argv[1] only if a parameter is given
---
 man3/mallopt.3 |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/man3/mallopt.3 b/man3/mallopt.3
index ddb1aed..03f1e9a 100644
--- a/man3/mallopt.3
+++ b/man3/mallopt.3
@@ -543,11 +543,11 @@ main(int argc, char *argv[])
             fprintf(stderr, "%s <M_CHECK_ACTION\-value>\\n", argv[0]);
             exit(EXIT_FAILURE);
         }
-    }
 
-    if (mallopt(M_CHECK_ACTION, atoi(argv[1])) != 1) {
-        fprintf(stderr, "mallopt() failed");
-        exit(EXIT_FAILURE);
+        if (mallopt(M_CHECK_ACTION, atoi(argv[1])) != 1) {
+            fprintf(stderr, "mallopt() failed");
+            exit(EXIT_FAILURE);
+        }
     }
 
     p = malloc(1000);
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
