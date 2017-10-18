From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Draft pthread_spin_init(2) manual page
Date: Wed, 18 Oct 2017 10:10:33 +0200
Message-ID: <CAKgNAkh+wT26bTkWzyWg7K6S8CAcbbGoDx5Tha4QzP5sYKC7RA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

I recently drafted a manual page for the pthread_spin_init() and
pthread_spin_destroy() APIs. Comments and suggestions for improvements
would be most welcome.

Thanks,

Michael


PTHREAD_SPIN_INIT(3)    Linux Programmer's Manual    PTHREAD_SPIN_INIT(3)

NAME
       pthread_spin_init,  pthread_spin_destroy - initialize or destroy a
       spin lock

SYNOPSIS
       #include <pthread.h>

       int pthread_spin_init(pthread_spinlock_t *clock int pshared);
       int pthread_spin_destroy(pthread_spinlock_t *clock);

       Compile and link with -pthread.

   Feature   Test   Macro    Requirements    for    glibc    (see    fea=E2=
=80=90
   ture_test_macros(7)):

       pthread_spin_init(), pthread_spin_destroy():
           _POSIX_C_SOURCE >=3D 200112L

DESCRIPTION
       The  pthread_spin_init() function allocates any resources required
       for the use of the spin lock referred to by lock  and  initializes
       the  lock  to be in the unlocked state.  The pshared argument must
       have one of the following values:

       PTHREAD_PROCESS_PRIVATE
              The spin lock is to be operated on only by threads  in  the
              same  process as the thread that calls pthread_spin_init().
              (Attempting  to  share  the  spin  lock  between  processes
              results in undefined behavior.)

       PTHREAD_PROCESS_SHARED
              The  spin  lock  may  be  operated  on by any thread in any
              process that has access to the memory containing  the  lock
              (i.e..,  the  lock may be in a shared memory object that is
              shared among multiple processes).

       Calling pthread_spin_init() on a spin lock that has  already  been
       initialized results in undefined behavior.

       The pthread_spin_destroy() function destroys a previously initial=E2=
=80=90
       ized spin lock, freeing any resources that were allocated for that
       lock.   Destroying  a  spin lock that has not been previously been
       initialized or destroying a spin lock while another  thread  holds
       the lock results in undefined behavior.

       Once  a  spin lock has been destroyed, performing any operation on
       the   lock   other   than   once   more   initializing   it   with
       pthread_spin_init() results in undefined behavior.

RETURN VALUE
       On  success, there functions return zero.  On failure, they return
       an error number.  In the event that pthread_spin_init() fails, the
       lock is not initialized.

ERRORS
       pthread_spin_init() may fail with the following errors:

       EAGAIN The  system  has insufficient resources to initialize a new
              spin lock.

       ENOMEM Insufficient memory to initialize the spin lock.

VERSIONS
       These functions first appeared in glibc in version 2.2.

CONFORMING TO
       POSIX.1-2001.

       Support for process-shared spin locks  is  a  POSIX  option.   The
       option is supported in the glibc implementation.

NOTES
       Spin locks should be employed in conjunction with real-time sched=E2=
=80=90
       uling policies (SCHED_FIFO, or possibly SCHED_RR).   Use  of  spin
       locks   with   nondeterministic   scheduling   policies   such  as
       SCHED_OTHER probably indicates a design mistake.  The  problem  is
       that  if  a  thread operating under such a policy is scheduled off
       the CPU while it holds a spin lock, then other threads will  waste
       time  spinning  on  the  lock  until  the lock holder is once more
       rescheduled and releases the lock.

       Warning: if threads create a deadlock  situation  while  employing
       spin locks, those threads will spin forever consuming CPU time.

SEE ALSO
       pthread_spin_lock(3), pthread_spin_unlock(3), pthreads(7)

Linux                           2017-09-30           PTHREAD_SPIN_INIT(3)


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
