From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: aio manuals
Date: Sun, 6 May 2012 00:26:13 +1200
Message-ID: <CAKgNAkj68CwJFkqYNvz5X5Jt+6xTwVb1eR+vSkXmFYorQvHJ5A@mail.gmail.com>
References: <20110309180600.GA14533@saboteur.suse.cz> <x49ei6gnpsx.fsf@segfault.boston.devel.redhat.com>
 <20110316104356.GB32095@saboteur.suse.cz> <x49pqpr9m5l.fsf@segfault.boston.devel.redhat.com>
 <20110316152018.GG2096@saboteur.suse.cz> <20111013082918.GA17800@saboteur.suse.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111013082918.GA17800-n1fJoQsqRnsVI8jrpt9EEQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Oct 13, 2011 at 9:29 PM, Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org> wrote:
> Hi!
>> > > So should we settle for memset()? I could update send updated pa=
tch
>> > > then.
>> >
>> > Yeah, memset is what I typically have done.
>> >
>>
>> Here comes updated patch.
>
> I've checked the latest man pages git and these changes aren't there
> yet. Any comments?

So, I'm struggling. What is the relationship between the io_*()
functions in libaio and the io_*() syscalls?

The page was attempting to document the system calls, which use
aio_context_t structures,

Cheers,

Michael



>> From 61ea8972c02120ed534554b134c45086243d911e Mon Sep 17 00:00:00 20=
01
>> From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
>> Date: Wed, 16 Mar 2011 16:14:19 +0100
>> Subject: [PATCH] Fix io_* manuals.
>>
>> The manuals says that we should use aio_context_t as type for ctpx
>> handle. That is wrong as the functions are defined with io_context_t=
 in
>> libaio.h.
>>
>> Also as the io_context_t is opaque type, it should be initalized wit=
h:
>>
>> memset(&ctpx, 0, sizeof(ctpx));
>>
>> Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
>> ---
>> =A0man2/io_cancel.2 =A0 =A0| =A0 =A02 +-
>> =A0man2/io_destroy.2 =A0 | =A0 =A02 +-
>> =A0man2/io_getevents.2 | =A0 =A02 +-
>> =A0man2/io_setup.2 =A0 =A0 | =A0 =A08 ++++++--
>> =A0man2/io_submit.2 =A0 =A0| =A0 =A02 +-
>> =A05 files changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/man2/io_cancel.2 b/man2/io_cancel.2
>> index a3fc213..1e21869 100644
>> --- a/man2/io_cancel.2
>> +++ b/man2/io_cancel.2
>> @@ -32,7 +32,7 @@ io_cancel \- cancel an outstanding asynchronous I/=
O operation
>> =A0.\"#include <linux/aio.h>
>> =A0.sp
>> =A0.\" .HP 16
>> -.BI "int io_cancel(aio_context_t " ctx_id ", struct iocb *" iocb ,
>> +.BI "int io_cancel(io_context_t " ctx_id ", struct iocb *" iocb ,
>> =A0.BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0struct io_event *" result );
>> =A0.\" .ad
>> =A0.\" .hy
>> diff --git a/man2/io_destroy.2 b/man2/io_destroy.2
>> index 6a165e1..47d031a 100644
>> --- a/man2/io_destroy.2
>> +++ b/man2/io_destroy.2
>> @@ -31,7 +31,7 @@ io_destroy \- destroy an asynchronous I/O context
>> =A0.\" #include <linux/aio.h>
>> =A0.sp
>> =A0.\" .HP 17
>> -.BI "int io_destroy(aio_context_t " ctx );
>> +.BI "int io_destroy(io_context_t " ctx );
>> =A0.\" .ad
>> =A0.\" .hy
>> =A0.sp
>> diff --git a/man2/io_getevents.2 b/man2/io_getevents.2
>> index e990f6d..a337404 100644
>> --- a/man2/io_getevents.2
>> +++ b/man2/io_getevents.2
>> @@ -32,7 +32,7 @@ io_getevents \- read asynchronous I/O events from =
the completion queue
>> =A0.\" #include <linux/aio.h>
>> =A0.sp
>> =A0.\" .HP 19
>> -.BI "int io_getevents(aio_context_t " ctx_id ", long " min_nr ", lo=
ng " nr ,
>> +.BI "int io_getevents(io_context_t " ctx_id ", long " min_nr ", lon=
g " nr ,
>> =A0.BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct io_event *" events \
>> =A0", struct timespec *" timeout );
>> =A0.\" .ad
>> diff --git a/man2/io_setup.2 b/man2/io_setup.2
>> index d9b5117..851b0c4 100644
>> --- a/man2/io_setup.2
>> +++ b/man2/io_setup.2
>> @@ -31,7 +31,7 @@ io_setup \- create an asynchronous I/O context
>> =A0.\" #include <linux/aio.h>
>> =A0.sp
>> =A0.\" .HP 15
>> -.BI "int io_setup(unsigned " nr_events ", aio_context_t *" ctxp );
>> +.BI "int io_setup(unsigned " nr_events ", io_context_t *" ctxp );
>> =A0.\" .ad
>> =A0.\" .hy
>> =A0.sp
>> @@ -42,8 +42,12 @@ Link with \fI\-laio\fP.
>> =A0.BR io_setup ()
>> =A0creates an asynchronous I/O context capable of receiving
>> =A0at least \fInr_events\fP.
>> -\fIctxp\fP must not point to an AIO context that already exists, an=
d must
>> +The \fIctxp\fP must not point to an AIO context that already exists=
, and must
>> =A0be initialized to 0 prior to the call.
>> +
>> +Note that io_context_t is opaque type and thuss \fIctxp\fP should b=
e zeroed
>> +with memset(&ctpx, 0, sizeof(ctpx)).
>> +
>> =A0On successful creation of the AIO context, \fI*ctxp\fP is filled =
in
>> =A0with the resulting handle.
>> =A0.SH "RETURN VALUE"
>> diff --git a/man2/io_submit.2 b/man2/io_submit.2
>> index 1eae429..3b6bbf2 100644
>> --- a/man2/io_submit.2
>> +++ b/man2/io_submit.2
>> @@ -31,7 +31,7 @@ io_submit \- submit asynchronous I/O blocks for pr=
ocessing
>> =A0.\" #include <linux/aio.h>
>> =A0.sp
>> =A0.\" .HP 16
>> -.BI "int io_submit(aio_context_t " ctx_id ", long " nr \
>> +.BI "int io_submit(io_context_t " ctx_id ", long " nr \
>> =A0", struct iocb **" iocbpp );
>> =A0.\" .ad
>> =A0.\" .hy
>> --
>> 1.6.4.2
>>
>
>
> --
> Cyril Hrubis
> chrubis-AlSwsSmVLrQ@public.gmane.org



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
