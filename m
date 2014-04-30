From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 03/10] Fix prototypes for semop() and semtimedop()
Date: Wed, 30 Apr 2014 21:42:35 +0200
Message-ID: <1398886962-10633-4-git-send-email-rv@rasmusvillemoes.dk>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The nsops arguments have type size_t, not unsigned, and the
timeout argument of semtimedop() is const.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man2/semop.2 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/semop.2 b/man2/semop.2
index c55473b..8f70e63 100644
--- a/man2/semop.2
+++ b/man2/semop.2
@@ -41,10 +41,10 @@ semop, semtimedop \- System V semaphore operations
 .B #include <sys/ipc.h>
 .B #include <sys/sem.h>
 .sp
-.BI "int semop(int " semid ", struct sembuf *" sops ", unsigned " nsops );
+.BI "int semop(int " semid ", struct sembuf *" sops ", size_t " nsops );
 .sp
-.BI "int semtimedop(int " semid ", struct sembuf *" sops ", unsigned " nsops ,
-.BI "               struct timespec *" timeout );
+.BI "int semtimedop(int " semid ", struct sembuf *" sops ", size_t " nsops ,
+.BI "               const struct timespec *" timeout );
 .fi
 .sp
 .in -4n
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
