From: "Kirill A. Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Subject: [PATCH] semop.2: fix typo in example
Date: Sun, 28 Sep 2008 20:41:42 +0300
Message-ID: <1222623702-7803-1-git-send-email-kirill@shutemov.name>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Kirill A. Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Kirill A. Shutemov <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
---
 man2/semop.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man2/semop.2 b/man2/semop.2
index f5f54a9..b934018 100644
--- a/man2/semop.2
+++ b/man2/semop.2
@@ -505,7 +505,7 @@ and then increment the semaphore value by one.
     sops[1].sem_op = 1;         /* Increment value by one */
     sops[1].sem_flg = 0;
 
-    if (semop(semid, &sop, 2) == \-1) {
+    if (semop(semid, sops, 2) == \-1) {
         perror("semop");
         exit(EXIT_FAILURE);
     }
-- 
1.5.6.5.GIT

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
