From: Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Subject: semctl: wrong type on semid_ds
Date: Sat, 04 May 2013 20:27:50 +0200
Message-ID: <51855326.2070406@truelite.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

in the semctl(2) man page (2012-05-31 version) I found a definitions of
semid_ds with:

...
unsigned short  sem_nsems; /* No. of semaphores in set */
...

but that's defined as:

  unsigned long int sem_nsems;          /* number of semaphores in set */

in /usr/include/bits/sem.h (at least in my debian)

I also found it defined as:

int                     sem_nsems;      /* no. of semaphores in array */


in /usr/src/linux-3.7.6/include/linux/sem.h

Regards
Simone
-- 
Simone Piccardi - KeyID:2A972F9D - JabberID:piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org
http://piccardi.gnulinux.it - http://www.fountainpen.it
Prima ti ignorano, poi ti deridono, poi ti combattono.  Poi vinci.
                                                 M. K. Ghandi
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
