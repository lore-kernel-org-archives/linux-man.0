From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCTH 0/2] pthread_mutexattr_setrobust() and pthread_mutex_consistent()
Date: Mon, 11 Sep 2017 22:34:50 +0200
Message-ID: <CAKgNAkj42OzjR0iqeR5LbS=uuLLpv2GXTXRnSw3_grxCQi3+7g@mail.gmail.com>
References: <CAJYFCiMZN09HaHpvKgxz3mqzmcaXAWmkz=BmgOW9WVdRKOhDsg@mail.gmail.com>
 <36ab9ec0-b496-c007-c12f-065fd618e7fd@gmail.com> <CAJYFCiPM6Hy1cPF2mUBu5bVqxNX+5kvKnJZLhYzMMwuMiHCKeg@mail.gmail.com>
 <20170826210528.GA32472@HP.internal.baidu.com> <CAJYFCiN-g+GjD8StCLue60i6pOw7jZnRGn2=2znPFkFw_FDyqQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJYFCiN-g+GjD8StCLue60i6pOw7jZnRGn2=2znPFkFw_FDyqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Yubin

On 11 September 2017 at 03:50, Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> just re-sending this to see whether anybody is still interested.

Sorry for the slow response. I'm working on these pages. Give me a few days.

Cheers,

Michael

> Yubin
>
> 2017-08-27 5:05 GMT+08:00 Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> On Tue, Aug 22, 2017 at 10:19:48AM +0800, Yubin Ruan wrote:
>>> 2017-08-22 8:33 GMT+08:00 Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>>> > Hello Yubin
>>> >
>>> > On 08/20/2017 11:42 AM, Yubin Ruan wrote:
>>> >> Hi Michael,
>>> >> This patch series introduce three pthread functions for linux-man:
>>> >>     * pthread_mutexattr_setrobust()
>>> >>     * pthread_mutexattr_getrobust()
>>> >>     * pthread_mutex_consistent()
>>> >>
>>> >> I put pthread_mutexattr_setrobust() and pthread_mutexattr_getrobust()
>>> >> altogether since they are related.
>>> >>
>>> >> I obtain my information about these functions mainly from reading the
>>> >> glibc source code and do some testing. There might be some mistake,
>>> >> but they are mostly correct (95% or so).
>>> >>
>>> >> Following this email would be those man pages in plain text and nroff
>>> >> format. I have tested those nroff file on my Linux box using man, and
>>> >> it look pretty well. Please point out if there are any mistake in
>>> >> formatting.
>>> >
>>> > Thanks for the drafts. Could I ask you to review the man-pages(7)
>>> > page. There's a number of details described in that page
>>> > which should be fixed in the drafts. Also, please try rendering
>>> > your pages with "man -l <page>". This will show problems with
>>> > the example code. See the chown(2) man page example for
>>> > the required escape sequences for "\n" and the single quote.
>>>
>>> No problem. I would fix the formatting issues.
>>
>> Hi Michael,
>>
>> Sorry that it took so long.
>>
>> Following is the renew patch. I have corrected several formatting issues (i.e.,
>> \n , - , but I can't find anything wrong with ' ) and some typos. The only
>> issue I cannot solve is that the new `pthread_mutex_consistent(3)` page is too
>> short that it shows at the very bottom... please help with this.
>>
>> Also, please find attached three verification snippets.
>>
>>
>> Signed-off-by: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  man3/pthread_mutex_consistent.3    |  60 +++++++++++
>>  man3/pthread_mutexattr_setrobust.3 | 199 +++++++++++++++++++++++++++++++++++++
>>  2 files changed, 259 insertions(+)
>>  create mode 100644 man3/pthread_mutex_consistent.3
>>  create mode 100644 man3/pthread_mutexattr_setrobust.3
>>
>> diff --git a/man3/pthread_mutex_consistent.3 b/man3/pthread_mutex_consistent.3
>> new file mode 100644
>> index 0000000..6d5bc81
>> --- /dev/null
>> +++ b/man3/pthread_mutex_consistent.3
>> @@ -0,0 +1,60 @@
>> +.\" Copyright (c) 2017, Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> +.\"
>> +.\" %%%LICENSE_START(VERBATIM)
>> +.\" Permission is granted to make and distribute verbatim copies of this
>> +.\" manual provided the copyright notice and this permission notice are
>> +.\" preserved on all copies.
>> +.\"
>> +.\" Permission is granted to copy and distribute modified versions of this
>> +.\" manual under the conditions for verbatim copying, provided that the
>> +.\" entire resulting derived work is distributed under the terms of a
>> +.\" permission notice identical to this one.
>> +.\"
>> +.\" Since the Linux kernel and libraries are constantly changing, this
>> +.\" manual page may be incorrect or out-of-date.  The author(s) assume no
>> +.\" responsibility for errors or omissions, or for damages resulting from
>> +.\" the use of the information contained herein.  The author(s) may not
>> +.\" have taken the same level of care in the production of this manual,
>> +.\" which is licensed free of charge, as they might when working
>> +.\" professionally.
>> +.\"
>> +.\" Formatted or processed versions of this manual, if unaccompanied by
>> +.\" the source, must acknowledge the copyright and authors of this work.
>> +.\" %%%LICENSE_END
>> +.\"
>> +.TH PTHREAD_MUTEXATTR_SETROBUST 3 2017-08-20 "Linux" "Linux Programmer's Manual"
>> +.SH NAME
>> +pthread_mutex_consistent \- make the robust mutex consistent
>> +.SH SYNOPSIS
>> +.nf
>> +.B #include <pthread.h>
>> +.PP
>> +.BI "int pthread_mute_consistent(pthread_mute_t *" mutex ");"
>> +.fi
>> +.PP
>> +Compile and link with \fI\-pthread\fP.
>> +.SH DESCRIPTION
>> +This function make a robust mutex consistent if it is in a inconsistent
>> +state. A mutex can be left in a inconsistent state if its owner terminate
>> +while holding the mutex, in which situation the next owner who acquire the
>> +mutex will succeed and be notified by the return value of
>> +.B EOWNERDEAD.
>> +
>> +.SH RETURN VALUE
>> +On success,
>> +.IR pthread_mutex_consistent()
>> +return 0. Otherwise an error value is returned to indicate the error.
>> +
>> +.SH ERRORS
>> +.TP
>> +.B EINVAL
>> +The mutex is either not robust or it is not in a inconsistent state.
>> +
>> +.SH SEE ALSO
>> +.ad l
>> +.nh
>> +.BR pthread_mutexattr_init (3),
>> +.BR pthread_mutex_lock (3),
>> +.BR pthread_mutexattr_setrobust (3),
>> +.BR pthread_mutexattr_getrobust (3),
>> +.BR pthreads (7)
>> diff --git a/man3/pthread_mutexattr_setrobust.3 b/man3/pthread_mutexattr_setrobust.3
>> new file mode 100644
>> index 0000000..3add496
>> --- /dev/null
>> +++ b/man3/pthread_mutexattr_setrobust.3
>> @@ -0,0 +1,199 @@
>> +.\" Copyright (c) 2017, Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> +.\"
>> +.\" %%%LICENSE_START(VERBATIM)
>> +.\" Permission is granted to make and distribute verbatim copies of this
>> +.\" manual provided the copyright notice and this permission notice are
>> +.\" preserved on all copies.
>> +.\"
>> +.\" Permission is granted to copy and distribute modified versions of this
>> +.\" manual under the conditions for verbatim copying, provided that the
>> +.\" entire resulting derived work is distributed under the terms of a
>> +.\" permission notice identical to this one.
>> +.\"
>> +.\" Since the Linux kernel and libraries are constantly changing, this
>> +.\" manual page may be incorrect or out-of-date.  The author(s) assume no
>> +.\" responsibility for errors or omissions, or for damages resulting from
>> +.\" the use of the information contained herein.  The author(s) may not
>> +.\" have taken the same level of care in the production of this manual,
>> +.\" which is licensed free of charge, as they might when working
>> +.\" professionally.
>> +.\"
>> +.\" Formatted or processed versions of this manual, if unaccompanied by
>> +.\" the source, must acknowledge the copyright and authors of this work.
>> +.\" %%%LICENSE_END
>> +.\"
>> +.TH PTHREAD_MUTEXATTR_SETROBUST 3 2017-08-20 "Linux" "Linux Programmer's Manual"
>> +.SH NAME
>> +pthread_mutexattr_getrobust, pthread_mutexattr_setrobust,
>> +pthread_mutexattr_getrobust_np, pthread_mutexattr_setrobust_np
>> +\- get and set the robustness attribute of a mutex attribute object
>> +.SH SYNOPSIS
>> +.nf
>> +.B #include <pthread.h>
>> +.PP
>> +.BI "int pthread_mutexattr_getrobust(const pthread_mutexattr_t *" attr, "int *" robustness ");"
>> +.BI "int pthread_mutexattr_setrobust(const pthread_mutexattr_t *" attr, "int *" robustness ");"
>> +.BI "int pthread_mutexattr_getrobust_np(const pthread_mutexattr_t *" attr, "int *" robustness ");"
>> +.BI "int pthread_mutexattr_setrobust_np(const pthread_mutexattr_t *" attr, "int *" robustness ");"
>> +.fi
>> +.PP
>> +Compile and link with \fI\-pthread\fP.
>> +.SH DESCRIPTION
>> +The
>> +.BR pthread_mutexattr_getrobust()
>> +and
>> +.BR pthread_mutexattr_setrobust()
>> +functions get and set the robustness attribute of a
>> +initialized mutex attribute object, respectively.
>> +The robustness attribute specifies the behavior of the mutex
>> +when its owner dies without unlocking it. These two
>> +functions are specified in POSIX. Glibc's NPTL has
>> +.BR pthread_mutexattr_getrobust_np (3)
>> +and
>> +.BR pthread_mutexattr_setrobust_np (3)
>> +respectively but they are just aliases, with the "np" standing for "Native Posix".
>> +See
>> +.BR NPTL (7).
>> +.PP
>> +Currently there are only two possible values for the
>> +.IR robustness
>> +attribute:
>> +.TP
>> +.BR PTHREAD_MUTEX_STALLED
>> +is the default value for a mutex attribute object. If a mutex is initialized
>> +with a
>> +.BR PTHREAD_MUTEX_STALLED
>> +attribute object and its owner dies without unlocking it, it is kept locked
>> +afterwards and any future attempts to call
>> +.IR pthread_mutex_lock (3)
>> +on this mutex will block indefinitely.
>> +.TP
>> +.B PTHREAD_MUTEX_ROBUST
>> +can be set on a mutex attribute object so that when the owner of the mutex
>> +dies or when the process containing such a locked mutex performs
>> +.IR execve (2)
>> +, any future attempts to call
>> +.IR pthread_mutex_lock (3)
>> +on this mutex will suceed and return
>> +.B EOWNERDEAD
>> +to indicate that the original owner no longer exists and the mutex is left in
>> +an inconsistent state. Usually after
>> +.B EOWNERDEAD
>> +is returned, the next owner should call
>> +.IR pthread_mutex_consistent (3)
>> +on the acquired mutex to make it consistent again before using it any further.
>> +If the next owner unlock it using
>> +.IR pthread_mutex_unlock (3)
>> +before making it consistent, the mutex will be unusable permanently and any
>> +subsequent attempts to lock it using
>> +.IR pthread_mutex_lock (3)
>> +will return
>> +.B ENOTRECOVERABLE.
>> +If the next owner terminates before calling
>> +.IR pthread_mutex_consistent (3)
>> +, furture
>> +.IR pthread_mutex_lock (3)
>> +on this mutex will still return
>> +.B EOWNERDEAD.
>> +
>> +
>> +Glibc defines
>> +.B PTHREAD_MUTEX_STALLED_NP
>> +and
>> +.B PTHREAD_MUTEX_ROBUST_NP
>> +as aliases of
>> +.B PTHREAD_MUTEX_STALLED
>> +and
>> +.B PTHREAD_MUTEX_ROBUST
>> +respectively.
>> +
>> +Note that the
>> +.IR attr
>> +argument of
>> +.IR pthread_mutexattr_getrobust()
>> +and
>> +.IR pthread_mutexattr_setrobust()
>> +should refer to a mutex attribute object that was initialized by
>> +.IR pthread_mutexattr_init (3)
>> +, otherwise the behavior is undefined.
>> +.SH RETURN VALUE
>> +On success, zero is returned by
>> +.IR pthread_mutexattr_getrobust()
>> +and the value pointed to by the
>> +.IR robustness
>> +parameter is set to the robustness attribute of
>> +.IR attr.
>> +Otherwise, an error number shall be returned. On success
>> +.IR pthread_mutexattr_setrobust()
>> +set the robustness attribute into the mutex attribute object
>> +.IR attr
>> +and return zero, otherwise a error number is returned to indicate the error.
>> +.SS Glibc\-specificed features
>> +In glibc's implementation,
>> +.IR pthread_mutexattr_getrobust()
>> +always return zero.
>> +.SH ERRORS
>> +.TP
>> +.B EINVAL
>> +A value other than
>> +.B PTHREAD_MUTEX_STALLED
>> +or
>> +.B PTHREAD_MUTEX_ROBUST
>> +is passed into
>> +.IR pthread_mutexattr_setrobust().
>> +
>> +.SH EXAMPLE
>> +.PP
>> +The program demonstrate a simple usecase of the robustness attribute of a
>> +pthread mutex attribute object. In this program, a thread holding the mutex
>> +dies prematurely withough unlocking the mutex. Another thread acquires it
>> +successfully and get EOWNERDEAD.
>> +
>> +.SS Program source
>> +.EX
>> +#include <stdio.h>
>> +#include <unistd.h>
>> +#include <pthread.h>
>> +#include <errno.h>
>> +
>> +pthread_mutex_t lock;
>> +
>> +void *original_owner_thread(void *ptr)
>> +{
>> +    printf("[original owner] Setting lock...\\n");
>> +    pthread_mutex_lock(&lock);
>> +    printf("[original owner] Locked. Now exiting without unlocking.\\n");
>> +    pthread_exit(NULL);
>> +}
>> +
>> +int main(int argc, char *argv[])
>> +{
>> +    pthread_t lock_getter;
>> +    pthread_mutexattr_t attr;
>> +    pthread_mutexattr_init(&attr);   /* initialize the attribute object */
>> +    pthread_mutexattr_setrobust(&attr, PTHREAD_MUTEX_ROBUST); /* set robustness */
>> +
>> +    pthread_mutex_init(&lock, &attr);   /* initialize the lock */
>> +
>> +    pthread_create(&lock_getter, NULL, original_owner_thread, NULL);
>> +    sleep(2);   /* original_owner_thread should have exited now */
>> +
>> +    printf("Attempting to acquire the unlocked robust mutex.\\n");
>> +    int ret_code = pthread_mutex_lock(&lock);
>> +    if(EOWNERDEAD == ret_code) {
>> +        printf("EOWNERDEAD returned. Make the mutex consistent now\\n");
>> +        pthread_mutex_consistent(&lock);
>> +    }
>> +
>> +    pthread_mutex_unlock(&lock);
>> +
>> +    return 0;
>> +}
>> +.EE
>> +.SH SEE ALSO
>> +.ad l
>> +.nh
>> +.BR pthread_mutex_init (3),
>> +.BR pthread_mutex_consistent (3),
>> +.BR pthread_mutex_lock (3)
>> +.BR pthreads (7)
>> --
>> 2.7.4
>>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
