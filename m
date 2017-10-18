From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Draft pthread_spin_lock(3) manual page
Date: Wed, 18 Oct 2017 10:11:42 +0200
Message-ID: <CAKgNAkigca=v31L0hDMR7PdNEHgS8mhB6KWR0qZew-jhYD8dwg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

Following on from the pthread_spin_init(3) page, I also recently
drafted a manual page for the pthread_spin_lock() and
pthread_spin_unlock() APIs. Again, comments and suggestions for
improvements would be most welcome.

Thanks,

Michael

PTHREAD_SPIN_LOCK(3)    Linux Programmer's Manual    PTHREAD_SPIN_LOCK(3)

NAME
       pthread_spin_lock,   pthread_spin_trylock,  pthread_spin_unlock  -
       lock and unlock a spin lock

SYNOPSIS
       #include <pthread.h>

       int pthread_spin_lock(pthread_spinlock_t *lock);
       int pthread_spin_trylock(pthread_spinlock_t *lock);
       int pthread_spin_unlock(pthread_spinlock_t *lock);

       Compile and link with -pthread.

   Feature   Test   Macro    Requirements    for    glibc    (see    fea=E2=
=80=90
   ture_test_macros(7)):

       pthread_spin_lock(), pthread_spin_trylock():
           _POSIX_C_SOURCE >=3D 200112L

DESCRIPTION
       The  pthread_spin_lock()  function locks the spin lock referred to
       by lock.  If the spin lock  is  currently  unlocked,  the  calling
       thread  acquires  the  lock immediately.  If the spin lock is cur=E2=
=80=90
       rently locked by another thread, the calling thread spins, testing
       the  lock  until  it becomes available, at which point the calling
       thread acquires the lock.

       Calling pthread_spin_lock() on a lock that is already held by  the
       caller results in undefined behavior.

       The  pthread_spin_trylock()  function is like pthread_spin_lock(),
       except that if the spin lock referred  to  by  lock  is  currently
       locked,  then,  instead  of spinning, the call returns immediately
       with the error EBUSY.

       The pthread_spin_unlock() function unlocks the spin lock  referred
       to  lock.   If  any threads are spinning on the lock, one of those
       threads will then acquire the lock.

       Calling pthread_spin_unlock() on a lock that is not  held  by  the
       caller results in undefined behavior.

RETURN VALUE
       On  success, there functions return zero.  On failure, they return
       an error number.

ERRORS
       pthread_spin_lock() may fail with the following errors:

       EDEADLOCK
              The system detected a deadlock condition.

       pthread_spin_trylock() can fail with the following errors:

       EBUSY  The spin lock is currently locked by another thread.

VERSIONS
       These functions first appeared in glibc in version 2.2.

CONFORMING TO
       POSIX.1-2001.

NOTES
       Applying any of the functions described on this page to an  unini=E2=
=80=90
       tialized spin lock results in undefined behavior.

       Carefully read NOTES in pthread_spin_init(3).

SEE ALSO
       pthread_spin_destroy(3), pthread_spin_init(3), pthreads(7)

Linux                           2017-09-30           PTHREAD_SPIN_LOCK(3)


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
