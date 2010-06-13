From: Francesco Cosoleto <cosoleto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] msgctl.2, semctl.2, shmctl.2: Move ipcs from section 8 to section 1
Date: Sun, 13 Jun 2010 11:12:43 +0200
Message-ID: <1276420363-6226-2-git-send-email-cosoleto@gmail.com>
References: <1276420363-6226-1-git-send-email-cosoleto@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1276420363-6226-1-git-send-email-cosoleto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Francesco Cosoleto <cosoleto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Francesco Cosoleto <cosoleto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/msgctl.2 |    2 +-
 man2/semctl.2 |    2 +-
 man2/shmctl.2 |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/msgctl.2 b/man2/msgctl.2
index 2ecbdcf..9514f85 100644
--- a/man2/msgctl.2
+++ b/man2/msgctl.2
@@ -316,7 +316,7 @@ The
 and
 .B MSG_INFO
 operations are used by the
-.BR ipcs (8)
+.BR ipcs (1)
 program to provide information on allocated resources.
 In the future these may modified or moved to a /proc file system
 interface.
diff --git a/man2/semctl.2 b/man2/semctl.2
index fba8d7d..457a395 100644
--- a/man2/semctl.2
+++ b/man2/semctl.2
@@ -467,7 +467,7 @@ The
 and
 .B SEM_INFO
 operations are used by the
-.BR ipcs (8)
+.BR ipcs (1)
 program to provide information on allocated resources.
 In the future these may modified or moved to a /proc file system
 interface.
diff --git a/man2/shmctl.2 b/man2/shmctl.2
index d893947..5552bd3 100644
--- a/man2/shmctl.2
+++ b/man2/shmctl.2
@@ -375,7 +375,7 @@ The
 and
 .B SHM_INFO
 operations are used by the
-.BR ipcs (8)
+.BR ipcs (1)
 program to provide information on allocated resources.
 In the future these may modified or moved to a /proc file system
 interface.
-- 
1.6.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
