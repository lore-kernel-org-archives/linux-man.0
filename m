From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Draft pthread_spin_lock(3) manual page
Date: Thu, 19 Oct 2017 19:46:07 +0200
Message-ID: <CAKgNAkjTZZWQpAwgg-m7Z-W=CQfS39CU5F+rr1B3msgf4SEBww@mail.gmail.com>
References: <CAKgNAkigca=v31L0hDMR7PdNEHgS8mhB6KWR0qZew-jhYD8dwg@mail.gmail.com>
 <fe6d752e-60a1-c8de-698c-ddd19d432110@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fe6d752e-60a1-c8de-698c-ddd19d432110-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Carlos,

Thanks for looking the page over.

On 18 October 2017 at 17:07, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 10/18/2017 01:11 AM, Michael Kerrisk (man-pages) wrote:
>> Hello all,
>>
>> Following on from the pthread_spin_init(3) page, I also recently
>> drafted a manual page for the pthread_spin_lock() and
>> pthread_spin_unlock() APIs. Again, comments and suggestions for
>> improvements would be most welcome.
>
> Overall looks good, just a few nits.
>
>> Thanks,
>>
>> Michael
>>
>> PTHREAD_SPIN_LOCK(3)    Linux Programmer's Manual    PTHREAD_SPIN_LOCK(3=
)
>>
>> NAME
>>        pthread_spin_lock,   pthread_spin_trylock,  pthread_spin_unlock  =
-
>>        lock and unlock a spin lock
>>
>> SYNOPSIS
>>        #include <pthread.h>
>>
>>        int pthread_spin_lock(pthread_spinlock_t *lock);
>>        int pthread_spin_trylock(pthread_spinlock_t *lock);
>>        int pthread_spin_unlock(pthread_spinlock_t *lock);
>>
>>        Compile and link with -pthread.
>>
>>    Feature   Test   Macro    Requirements    for    glibc    (see    fea=
=E2=80=90
>>    ture_test_macros(7)):
>>
>>        pthread_spin_lock(), pthread_spin_trylock():
>>            _POSIX_C_SOURCE >=3D 200112L
>>
>> DESCRIPTION
>>        The  pthread_spin_lock()  function locks the spin lock referred t=
o
>>        by lock.  If the spin lock  is  currently  unlocked,  the  callin=
g
>>        thread  acquires  the  lock immediately.  If the spin lock is cur=
=E2=80=90
>>        rently locked by another thread, the calling thread spins, testin=
g
>>        the  lock  until  it becomes available, at which point the callin=
g
>>        thread acquires the lock.
>>
>>        Calling pthread_spin_lock() on a lock that is already held by  th=
e
>>        caller results in undefined behavior.
>
> Similarly if you call pthread_spin_lock on an uninitilized lock you get
> undefined behaviour (see EINVAL below). We don't detect this in glibc rig=
ht

I added the uninitialized lock case to the text.

> now because it's a waste of time, but we might some day for some reason I
> can't know today (say we robustify spin locks). Even if you talk about
> this case in pthread_spin_init(), it bears repeating again here.
>
>>        The  pthread_spin_trylock()  function is like pthread_spin_lock()=
,
>>        except that if the spin lock referred  to  by  lock  is  currentl=
y
>>        locked,  then,  instead  of spinning, the call returns immediatel=
y
>>        with the error EBUSY.
>>
>>        The pthread_spin_unlock() function unlocks the spin lock  referre=
d
>>        to  lock.   If  any threads are spinning on the lock, one of thos=
e
>>        threads will then acquire the lock.
>>
>>        Calling pthread_spin_unlock() on a lock that is not  held  by  th=
e
>>        caller results in undefined behavior.
>>
>> RETURN VALUE
>>        On  success, there functions return zero.  On failure, they retur=
n
>>        an error number.
>>
>> ERRORS
>>        pthread_spin_lock() may fail with the following errors:
>>
>>        EDEADLOCK
>>               The system detected a deadlock condition.
>
> In practice we might have EINVAL some day here to indicate the lock
> was not initialized, and that can be returned for all functions if
> the cost of detection is low.

Okay. (I presume you did not mean any text needs to be added to the page.)

>>        pthread_spin_trylock() can fail with the following errors:
>>
>>        EBUSY  The spin lock is currently locked by another thread.
>
> I always find the 'can fail' wording a bit wishy-washy for my tastes
> and prefer: 'shall fail', along with a statement that defines the
> conditions for failure. I say this only because English is not as
> precise as I'd like so using 'shall' instead of 'can' makes this
> failure mode clearer, indicating to the reader that it will happen
> (here it's a bit obvious from the semantics of the function, since
> otherwise trylock would be useless).

Changed to "shall fail" (but this is not the only page with that problem :-=
} ).

Thanks,

Michael


>> VERSIONS
>>        These functions first appeared in glibc in version 2.2.
>>
>> CONFORMING TO
>>        POSIX.1-2001.
>>
>> NOTES
>>        Applying any of the functions described on this page to an  unini=
=E2=80=90
>>        tialized spin lock results in undefined behavior.
>>
>>        Carefully read NOTES in pthread_spin_init(3).
>>
>> SEE ALSO
>>        pthread_spin_destroy(3), pthread_spin_init(3), pthreads(7)
>>
>> Linux                           2017-09-30           PTHREAD_SPIN_LOCK(3=
)
>>
>>
>
>
> --
> Cheers,
> Carlos.



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
