From: Bo Borgerson <gigabo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] sem_overview.7: Fix typo (semget => shmget)
Date: Mon, 29 Mar 2010 19:01:01 -0700
Message-ID: <4BB15B5D.7050706@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020006010207000104060303"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------020006010207000104060303
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

The sem_overview(7) man page makes reference to "a System V shared 
memory segment created using semget(2)".  Was this intended to be 
"shmget(2)"?

Please see attached patch against current git master.

Thanks,

Bo

--------------020006010207000104060303
Content-Type: text/x-diff;
 name="0001-sem_overview.7-Fix-typo-semget-shmget.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-sem_overview.7-Fix-typo-semget-shmget.patch"

>From cc406c10dd443f79e9073f053619a9c475ec97ad Mon Sep 17 00:00:00 2001
From: Bo Borgerson <gigabo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Mon, 29 Mar 2010 18:12:33 -0700
Subject: [PATCH] sem_overview.7: Fix typo (semget => shmget)

In reference to creation of a SysV shared memory segment.
---
 man7/sem_overview.7 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man7/sem_overview.7 b/man7/sem_overview.7
index ef354fe..fb706d2 100644
--- a/man7/sem_overview.7
+++ b/man7/sem_overview.7
@@ -88,7 +88,7 @@ A thread-shared semaphore is placed in an area of memory shared
 between by the threads of a process, for example, a global variable.
 A process-shared semaphore must be placed in a shared memory region
 (e.g., a System V shared memory segment created using
-.BR semget (2),
+.BR shmget (2),
 or a POSIX shared memory object built created using
 .BR shm_open (3)).
 
-- 
1.6.3.3


--------------020006010207000104060303--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
