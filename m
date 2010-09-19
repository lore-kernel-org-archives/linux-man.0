From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Document struct sigevent in sigevent(7)
Date: Sun, 19 Sep 2010 18:23:03 +0200
Message-ID: <AANLkTin1o4JQ98zmsox6Qg9R5oaPCswieATTd98rCSjY@mail.gmail.com>
References: <20090415111442.GN8940@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090415111442.GN8940-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Petr,

First of all, my apologies for the enormous delay on following up on this patch.

On Wed, Apr 15, 2009 at 1:14 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> The sigevent structure is used as a common interface for several
> asynchronous pthreads functions; also, getaddrinfo_a() uses it
> and in the future, other library functions might.
>
> Currently, it is completely non-descript in some cases, plus
> there are two competing descriptions in timer_create(2) and
> mq_notify(3) (the former appears to be based on the latter).
> This patch attempts to unify the descriptions in a single
> manual page and networks it to the rest, so that I do not
> have to add yet another description for the getaddrinfo_a(3)
> manual page (currently in the works).
>
> P.S.: There are two unresolved issues with this patch - the
> timer_create(2) requirement of real-time signal requirements
> is somewhat confusing and it seems that SIGEV_THREAD_ID can
> be or'd with SIGEV_SIGNAL or not. I did not have time to research
> this so far, so I decided to rather send it in and see if someone
> knows about this off the top of their head.

I understand your motivations for writing this patch, in terms of
eliminating redundancy, and possible out-of-syncness in various pages.
However,  this patch suffers from several of the problems that I aimed
to avoid when I added the timer_create.2 page:

* By the nature of the APIs, the descriptions need to add some
API-specific content for the various 'notification' values. Your patch
partially addresses that, but in unifying the content, it loses some
per-API information.

* The patch introduces incorrect information. E.g., for SIGEV_SIGNAL,
not all APIs set si_uid and si_pid. Message queues do, but POSIX
timers don't (it makes no sense)

* Not all 'notification' values are valid for all APIS. As far as I
know, SIGEV_THREAD_ID is valid only for POSIX timers.

Like I say, when I wrote the timer_create.2 page, I ran into the same
problems, which is why I partially duplicated content, rather than
writing a separate page. Of course, this solution doesn't scale well,
as you highlight. So I think your idea is the right way to go, but it
needs tweaking. I propose to add the version below. Comments welcome.

Thanks,

Michael


.\" Copyright (C) 2006, 2010 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\" Copyright (C) 2009 Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
.\"
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of this
.\" manual under the conditions for verbatim copying, provided that the
.\" entire resulting derived work is distributed under the terms of a
.\" permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume no
.\" responsibility for errors or omissions, or for damages resulting from
.\" the use of the information contained herein.  The author(s) may not
.\" have taken the same level of care in the production of this manual,
.\" which is licensed free of charge, as they might when working
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\"
.TH SIGEVENT 7 2010-09-19 "GNU" "Linux Programmer's Manual"
.SH NAME
struct sigevent \- structure for notification from asynchronous routines
.SH SYNOPSIS
.nf

union sigval {          /* Data passed with notification */
    int     sival_int;         /* Integer value */
    void   *sival_ptr;         /* Pointer value */
};

struct sigevent {
    int          sigev_notify; /* Notification method */
    int          sigev_signo;  /* Notification signal */
    union sigval sigev_value;  /* Data passed with
                                  notification */
    void       (*sigev_notify_function) (union sigval);
                     /* Function used for thread
                        notification (SIGEV_THREAD) */
    void        *sigev_notify_attributes;
                     /* Attributes for notification thread
                        (SIGEV_THREAD) */
    pid_t        sigev_notify_thread_id;
                     /* ID of thread to signal (SIGEV_THREAD_ID) */
};
.fi
.SH DESCRIPTION
.PP
The
.I sigevent
structure is used by various APIs
to describe the way a process is to be notified about an event
(e.g., completion of an asynchronous request, expiration of a timer,
or the arrival of a message).
.PP
The definition shown in the SYNOPSIS is approximate:
some of the fields in the
.I sigevent
structure may be defined as part of a union.
Programs should only employ those fields relevant
to the value specified in
.IR sigev_notify .
.PP
The
.I sigev_notify
field specifies how notification is to be performed.
This field can have one of the following values:
.TP 8
.BR SIGEV_NONE
A "null" notification: don't do anything when the event occurs.
.TP
.BR SIGEV_SIGNAL
Notify the process by sending the signal specified in
.IR sigev_signo .
.IP
If the signal is caught with a signal handler that was registered using the
.BR sigaction (2)
.B SA_SIGINFO
flag, then the following fields are set in the
.I siginfo_t
structure that is passed as the second argument of the handler:
.RS 8
.TP 10
.I si_code
This field is set to a value that depends on the API
delivering the notification.
.TP
.I si_signo
This field is set to the signal number (i.e., the same value as in
.IR sigev_signo ).
.TP
.I si_value
This field is set to the value specified in
.IR sigev_value .
.RE
.IP
Depending on the API, other fields may also be set in the
.I siginfo_t
structure.
.IP
The same information is also available if the signal is accepted using
.BR sigwaitinfo (2).
.TP
.BR SIGEV_THREAD
Notify the process by invoking
.I sigev_notify_function
"as if" it were the start function of a new thread.
(Among the implementation possibilities here are that
each timer notification could result in the creation of a new thread,
or that a single thread is created to receive all notifications.)
The function is invoked with
.I sigev_value
as its sole argument.
If
.I sigev_notify_attributes
is not NULL, it should point to a
.I pthread_attr_t
structure that defines attributes for the new thread (see
.BR pthread_attr_init (3)).
.TP
.BR SIGEV_THREAD_ID " (Linux-specific)"
.\" | SIGEV_SIGNAL vs not?
Currently used only by POSIX timers; see
.BR timer_create (2).
.SH CONFORMING TO
POSIX.1-2001.
.SH "SEE ALSO"
.BR timer_create (2),
.BR aio_fsync (3),
.\" .BR lio_listio (3),
.\" FIXME This page will be added later .BR getaddrinfo_a (3),
.BR mq_notify (3),
.BR pthreads (7)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
