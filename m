From: Manfred Spraul <manfred@colorfullife.com>
Subject: [PATCH 03/20] include/linux/sem.h: Correctly document sem_ctime
Date: Thu, 25 May 2017 20:50:50 +0200
Message-ID: <20170525185107.12869-4-manfred@colorfullife.com>
References: <20170508222345.GA52073@beast>
 <20170525185107.12869-1-manfred@colorfullife.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170525185107.12869-1-manfred@colorfullife.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com, Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 1vier1@web.de, Davidlohr Bueso <dave@stgolabs.net>, mingo@kernel.org, peterz@infradead.org, fabf@skynet.be, Manfred Spraul <manfred@colorfullife.com>, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

sem_ctime is initialized to the semget() time and then updated at every
semctl() that changes the array.
Thus it does not represent the time of the last change.

Especially, semop() calls are only stored in sem_otime, not in sem_ctime.

This is already described in ipc/sem.c, I just overlooked that there is
a comment in include/linux/sem.h and man semctl(2) as well.

So: Correct wrong comments.

Signed-off-by: Manfred Spraul <manfred@colorfullife.com>
Cc: linux-man@vger.kernel.org
---
 include/linux/sem.h      | 2 +-
 include/uapi/linux/sem.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/sem.h b/include/linux/sem.h
index 9db1409..be5cf2e 100644
--- a/include/linux/sem.h
+++ b/include/linux/sem.h
@@ -30,7 +30,7 @@ struct sem {
 /* One sem_array data structure for each set of semaphores in the system. */
 struct sem_array {
 	struct kern_ipc_perm	sem_perm;	/* permissions .. see ipc.h */
-	time_t			sem_ctime;	/* last change time */
+	time_t			sem_ctime;	/* create/last semctl() time */
 	struct list_head	pending_alter;	/* pending operations */
 						/* that alter the array */
 	struct list_head	pending_const;	/* pending complex operations */
diff --git a/include/uapi/linux/sem.h b/include/uapi/linux/sem.h
index dd73b90..67eb903 100644
--- a/include/uapi/linux/sem.h
+++ b/include/uapi/linux/sem.h
@@ -23,7 +23,7 @@
 struct semid_ds {
 	struct ipc_perm	sem_perm;		/* permissions .. see ipc.h */
 	__kernel_time_t	sem_otime;		/* last semop time */
-	__kernel_time_t	sem_ctime;		/* last change time */
+	__kernel_time_t	sem_ctime;		/* create/last semctl() time */
 	struct sem	*sem_base;		/* ptr to first semaphore in array */
 	struct sem_queue *sem_pending;		/* pending operations to be processed */
 	struct sem_queue **sem_pending_last;	/* last pending operation */
-- 
2.9.3
