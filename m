From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: aio manuals
Date: Mon, 07 May 2012 09:44:11 -0400
Message-ID: <x4962c8t8b8.fsf@segfault.boston.devel.redhat.com>
References: <20110309180600.GA14533@saboteur.suse.cz>
	<x49ei6gnpsx.fsf@segfault.boston.devel.redhat.com>
	<20110316104356.GB32095@saboteur.suse.cz>
	<x49pqpr9m5l.fsf@segfault.boston.devel.redhat.com>
	<20110316152018.GG2096@saboteur.suse.cz>
	<20111013082918.GA17800@saboteur.suse.cz>
	<CAKgNAkj68CwJFkqYNvz5X5Jt+6xTwVb1eR+vSkXmFYorQvHJ5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkj68CwJFkqYNvz5X5Jt+6xTwVb1eR+vSkXmFYorQvHJ5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Michael Kerrisk's message of "Sun, 6 May 2012 00:26:13 +1200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Thu, Oct 13, 2011 at 9:29 PM, Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org> wrote=
:
>> Hi!
>>> > > So should we settle for memset()? I could update send updated p=
atch
>>> > > then.
>>> >
>>> > Yeah, memset is what I typically have done.
>>> >
>>>
>>> Here comes updated patch.
>>
>> I've checked the latest man pages git and these changes aren't there
>> yet. Any comments?
>
> So, I'm struggling. What is the relationship between the io_*()
> functions in libaio and the io_*() syscalls?

The io_* library calls are wrappers around the system calls.  In some
cases, the wrappers simply pass the arguments on to the system call.  I=
n
other cases, there is some work performed by the library.

> The page was attempting to document the system calls, which use
> aio_context_t structures,

Well, aio_context_t is not a structure, it's just an unsigned long.

I guess that we'll ultimately need the io_* syscalls documented in
chapter 2, and the library function documented in chapter 3, right?

Cheers,
Jeff


>>> From 61ea8972c02120ed534554b134c45086243d911e Mon Sep 17 00:00:00 2=
001
>>> From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
>>> Date: Wed, 16 Mar 2011 16:14:19 +0100
>>> Subject: [PATCH] Fix io_* manuals.
>>>
>>> The manuals says that we should use aio_context_t as type for ctpx
>>> handle. That is wrong as the functions are defined with io_context_=
t in
>>> libaio.h.
>>>
>>> Also as the io_context_t is opaque type, it should be initalized wi=
th:
>>>
>>> memset(&ctpx, 0, sizeof(ctpx));
>>>
>>> Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
>>> ---
>>> =C2=A0man2/io_cancel.2 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>> =C2=A0man2/io_destroy.2 =C2=A0 | =C2=A0 =C2=A02 +-
>>> =C2=A0man2/io_getevents.2 | =C2=A0 =C2=A02 +-
>>> =C2=A0man2/io_setup.2 =C2=A0 =C2=A0 | =C2=A0 =C2=A08 ++++++--
>>> =C2=A0man2/io_submit.2 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>>> =C2=A05 files changed, 10 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/man2/io_cancel.2 b/man2/io_cancel.2
>>> index a3fc213..1e21869 100644
>>> --- a/man2/io_cancel.2
>>> +++ b/man2/io_cancel.2
>>> @@ -32,7 +32,7 @@ io_cancel \- cancel an outstanding asynchronous I=
/O operation
>>> =C2=A0.\"#include <linux/aio.h>
>>> =C2=A0.sp
>>> =C2=A0.\" .HP 16
>>> -.BI "int io_cancel(aio_context_t " ctx_id ", struct iocb *" iocb ,
>>> +.BI "int io_cancel(io_context_t " ctx_id ", struct iocb *" iocb ,
>>> =C2=A0.BI " =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct =
io_event *" result );
>>> =C2=A0.\" .ad
>>> =C2=A0.\" .hy
>>> diff --git a/man2/io_destroy.2 b/man2/io_destroy.2
>>> index 6a165e1..47d031a 100644
>>> --- a/man2/io_destroy.2
>>> +++ b/man2/io_destroy.2
>>> @@ -31,7 +31,7 @@ io_destroy \- destroy an asynchronous I/O context
>>> =C2=A0.\" #include <linux/aio.h>
>>> =C2=A0.sp
>>> =C2=A0.\" .HP 17
>>> -.BI "int io_destroy(aio_context_t " ctx );
>>> +.BI "int io_destroy(io_context_t " ctx );
>>> =C2=A0.\" .ad
>>> =C2=A0.\" .hy
>>> =C2=A0.sp
>>> diff --git a/man2/io_getevents.2 b/man2/io_getevents.2
>>> index e990f6d..a337404 100644
>>> --- a/man2/io_getevents.2
>>> +++ b/man2/io_getevents.2
>>> @@ -32,7 +32,7 @@ io_getevents \- read asynchronous I/O events from=
 the completion queue
>>> =C2=A0.\" #include <linux/aio.h>
>>> =C2=A0.sp
>>> =C2=A0.\" .HP 19
>>> -.BI "int io_getevents(aio_context_t " ctx_id ", long " min_nr ", l=
ong " nr ,
>>> +.BI "int io_getevents(io_context_t " ctx_id ", long " min_nr ", lo=
ng " nr ,
>>> =C2=A0.BI " =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 struct io_event *" events \
>>> =C2=A0", struct timespec *" timeout );
>>> =C2=A0.\" .ad
>>> diff --git a/man2/io_setup.2 b/man2/io_setup.2
>>> index d9b5117..851b0c4 100644
>>> --- a/man2/io_setup.2
>>> +++ b/man2/io_setup.2
>>> @@ -31,7 +31,7 @@ io_setup \- create an asynchronous I/O context
>>> =C2=A0.\" #include <linux/aio.h>
>>> =C2=A0.sp
>>> =C2=A0.\" .HP 15
>>> -.BI "int io_setup(unsigned " nr_events ", aio_context_t *" ctxp );
>>> +.BI "int io_setup(unsigned " nr_events ", io_context_t *" ctxp );
>>> =C2=A0.\" .ad
>>> =C2=A0.\" .hy
>>> =C2=A0.sp
>>> @@ -42,8 +42,12 @@ Link with \fI\-laio\fP.
>>> =C2=A0.BR io_setup ()
>>> =C2=A0creates an asynchronous I/O context capable of receiving
>>> =C2=A0at least \fInr_events\fP.
>>> -\fIctxp\fP must not point to an AIO context that already exists, a=
nd must
>>> +The \fIctxp\fP must not point to an AIO context that already exist=
s, and must
>>> =C2=A0be initialized to 0 prior to the call.
>>> +
>>> +Note that io_context_t is opaque type and thuss \fIctxp\fP should =
be zeroed
>>> +with memset(&ctpx, 0, sizeof(ctpx)).
>>> +
>>> =C2=A0On successful creation of the AIO context, \fI*ctxp\fP is fil=
led in
>>> =C2=A0with the resulting handle.
>>> =C2=A0.SH "RETURN VALUE"
>>> diff --git a/man2/io_submit.2 b/man2/io_submit.2
>>> index 1eae429..3b6bbf2 100644
>>> --- a/man2/io_submit.2
>>> +++ b/man2/io_submit.2
>>> @@ -31,7 +31,7 @@ io_submit \- submit asynchronous I/O blocks for p=
rocessing
>>> =C2=A0.\" #include <linux/aio.h>
>>> =C2=A0.sp
>>> =C2=A0.\" .HP 16
>>> -.BI "int io_submit(aio_context_t " ctx_id ", long " nr \
>>> +.BI "int io_submit(io_context_t " ctx_id ", long " nr \
>>> =C2=A0", struct iocb **" iocbpp );
>>> =C2=A0.\" .ad
>>> =C2=A0.\" .hy
>>> --
>>> 1.6.4.2
>>>
>>
>>
>> --
>> Cyril Hrubis
>> chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
