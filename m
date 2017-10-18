From: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Draft pthread_spin_lock(3) manual page
Date: Wed, 18 Oct 2017 08:07:37 -0700
Message-ID: <fe6d752e-60a1-c8de-698c-ddd19d432110@redhat.com>
References: <CAKgNAkigca=v31L0hDMR7PdNEHgS8mhB6KWR0qZew-jhYD8dwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkigca=v31L0hDMR7PdNEHgS8mhB6KWR0qZew-jhYD8dwg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 10/18/2017 01:11 AM, Michael Kerrisk (man-pages) wrote:
> Hello all,
> 
> Following on from the pthread_spin_init(3) page, I also recently
> drafted a manual page for the pthread_spin_lock() and
> pthread_spin_unlock() APIs. Again, comments and suggestions for
> improvements would be most welcome.

Overall looks good, just a few nits.
 
> Thanks,
> 
> Michael
> 
> PTHREAD_SPIN_LOCK(3)    Linux Programmer's Manual    PTHREAD_SPIN_LOCK(3)
> 
> NAME
>        pthread_spin_lock,   pthread_spin_trylock,  pthread_spin_unlock  -
>        lock and unlock a spin lock
> 
> SYNOPSIS
>        #include <pthread.h>
> 
>        int pthread_spin_lock(pthread_spinlock_t *lock);
>        int pthread_spin_trylock(pthread_spinlock_t *lock);
>        int pthread_spin_unlock(pthread_spinlock_t *lock);
> 
>        Compile and link with -pthread.
> 
>    Feature   Test   Macro    Requirements    for    glibc    (see    fea‐
>    ture_test_macros(7)):
> 
>        pthread_spin_lock(), pthread_spin_trylock():
>            _POSIX_C_SOURCE >= 200112L
> 
> DESCRIPTION
>        The  pthread_spin_lock()  function locks the spin lock referred to
>        by lock.  If the spin lock  is  currently  unlocked,  the  calling
>        thread  acquires  the  lock immediately.  If the spin lock is cur‐
>        rently locked by another thread, the calling thread spins, testing
>        the  lock  until  it becomes available, at which point the calling
>        thread acquires the lock.
> 
>        Calling pthread_spin_lock() on a lock that is already held by  the
>        caller results in undefined behavior.

Similarly if you call pthread_spin_lock on an uninitilized lock you get
undefined behaviour (see EINVAL below). We don't detect this in glibc right
now because it's a waste of time, but we might some day for some reason I
can't know today (say we robustify spin locks). Even if you talk about
this case in pthread_spin_init(), it bears repeating again here.
 
>        The  pthread_spin_trylock()  function is like pthread_spin_lock(),
>        except that if the spin lock referred  to  by  lock  is  currently
>        locked,  then,  instead  of spinning, the call returns immediately
>        with the error EBUSY.
> 
>        The pthread_spin_unlock() function unlocks the spin lock  referred
>        to  lock.   If  any threads are spinning on the lock, one of those
>        threads will then acquire the lock.
> 
>        Calling pthread_spin_unlock() on a lock that is not  held  by  the
>        caller results in undefined behavior.
> 
> RETURN VALUE
>        On  success, there functions return zero.  On failure, they return
>        an error number.
> 
> ERRORS
>        pthread_spin_lock() may fail with the following errors:
> 
>        EDEADLOCK
>               The system detected a deadlock condition.

In practice we might have EINVAL some day here to indicate the lock
was not initialized, and that can be returned for all functions if
the cost of detection is low.

> 
>        pthread_spin_trylock() can fail with the following errors:
> 
>        EBUSY  The spin lock is currently locked by another thread.

I always find the 'can fail' wording a bit wishy-washy for my tastes
and prefer: 'shall fail', along with a statement that defines the
conditions for failure. I say this only because English is not as
precise as I'd like so using 'shall' instead of 'can' makes this
failure mode clearer, indicating to the reader that it will happen
(here it's a bit obvious from the semantics of the function, since
otherwise trylock would be useless).

> 
> VERSIONS
>        These functions first appeared in glibc in version 2.2.
> 
> CONFORMING TO
>        POSIX.1-2001.
> 
> NOTES
>        Applying any of the functions described on this page to an  unini‐
>        tialized spin lock results in undefined behavior.
> 
>        Carefully read NOTES in pthread_spin_init(3).
> 
> SEE ALSO
>        pthread_spin_destroy(3), pthread_spin_init(3), pthreads(7)
> 
> Linux                           2017-09-30           PTHREAD_SPIN_LOCK(3)
> 
> 


-- 
Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
