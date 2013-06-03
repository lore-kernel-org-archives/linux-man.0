From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: semctl: wrong type on semid_ds
Date: Mon, 03 Jun 2013 18:47:30 +0200
Message-ID: <51ACC8A2.6070706@gmail.com>
References: <51855326.2070406@truelite.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51855326.2070406-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/04/13 20:27, Simone Piccardi wrote:
> Hi,
> 
> in the semctl(2) man page (2012-05-31 version) I found a definitions of
> semid_ds with:
> 
> ...
> unsigned short  sem_nsems; /* No. of semaphores in set */
> ...
> 
> but that's defined as:
> 
>   unsigned long int sem_nsems;          /* number of semaphores in set */
> 
> in /usr/include/bits/sem.h (at least in my debian)
> 
> I also found it defined as:
> 
> int                     sem_nsems;      /* no. of semaphores in array */
> 
> 
> in /usr/src/linux-3.7.6/include/linux/sem.h

Thanks Simone. You're right. I applied the patch below.

Cheers,

Michael

diff --git a/man2/semctl.2 b/man2/semctl.2
index d1bc542..c9124d7 100644
--- a/man2/semctl.2
+++ b/man2/semctl.2
@@ -88,7 +88,7 @@ struct semid_ds {
     struct ipc_perm sem_perm;  /* Ownership and permissions */
     time_t          sem_otime; /* Last semop time */
     time_t          sem_ctime; /* Last change time */
-    unsigned short  sem_nsems; /* No. of semaphores in set */
+    unsigned long   sem_nsems; /* No. of semaphores in set */
 };
 .in
 .fi
@@ -462,6 +462,17 @@ or greater than the implementation limit
 .SH CONFORMING TO
 SVr4, POSIX.1-2001.
 .\" SVr4 documents more error conditions EINVAL and EOVERFLOW.
+
+POSIX.1-2001 specifies the
+.I sem_nsems
+field of the
+.I semid_ds
+structure as having the type
+.IR "unsigned\ short" ,
+and the field is so defined on most other systems.
+It was also so defined on Linux 2.2 and earlier,
+but, since Linux 2.4, the field has the type
+.IR "unsigned\ long" .
 .SH NOTES
 The inclusion of
 .I <sys/types.h>


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
