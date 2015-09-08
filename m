From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] thrd_create.3: Add entry for thrd_create function
Date: Tue, 08 Sep 2015 08:35:40 +0200
Message-ID: <55EE81BC.3000304@gmail.com>
References: <1441665962-14853-1-git-send-email-j.m.torrespalma@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441665962-14853-1-git-send-email-j.m.torrespalma-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Juan Manuel Torres Palma <j.m.torrespalma-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Juan,

On 09/08/2015 12:46 AM, Juan Manuel Torres Palma wrote:
> This patch adds a new entry for thrd_create function, belonging
> to ISO C11 threads.h API. More than a patch, I see it as a RFC
> so someone can tell me if I'm going in the right direction.

Okay. Thanks for working on this?

> My patchset for C11 threads.h is still pending of revision
> on glibc, but I have already started working on documentation
> for man-pages.

Do you know have an idea when this patch series will make it
into glibc? That info should appear in VERSIONS section in the page.

> Most of the work in this file is based in pthread_create.3, that was
> written by Michael Kerrisk. Please, let me know if I should mention
> you on the copyright header.

Not sure yet. As me again later, when we see how the draft evolves.

> Signed-off-by: Juan Manuel Torres Palma <j.m.torrespalma-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man3/thrd_create.3 | 104 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 man3/thrd_create.3
> 
> diff --git a/man3/thrd_create.3 b/man3/thrd_create.3
> new file mode 100644
> index 0000000..1e8eb53
> --- /dev/null
> +++ b/man3/thrd_create.3
> @@ -0,0 +1,104 @@
> +.\" Copyright (c) 2015 Juan Manuel Torres Palma <j.m.torrespalma-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +.\"
> +.\" %%%LICENSE_START(VERBATIM)
> +.\" Permission is granted to make and distribute verbatim copies of this
> +.\" manual provided the copyright notice and this permission notice are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions of this
> +.\" manual under the conditions for verbatim copying, provided that the
> +.\" entire resulting derived work is distributed under the terms of a
> +.\" permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, this
> +.\" manual page may be incorrect or out-of-date.  The author(s) assume no
> +.\" responsibility for errors or omissions, or for damages resulting from
> +.\" the use of the information contained herein.  The author(s) may not
> +.\" have taken the same level of care in the production of this manual,
> +.\" which is licensed free of charge, as they might when working
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied by
> +.\" the source, must acknowledge the copyright and authors of this work.
> +.\" %%%LICENSE_END
> +.\"
> +.TH THRD_CREATE 3 2015-07-23 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +thrd_create \- create a new thread
> +.SH SYNOPSIS
> +.nf
> +.B #include <threads.h>
> +
> +.BI "int thrd_create(thrd_t *" thread ", thrd_start_t " func ", void *" arg );
> +.fi
> +.sp
> +Compile and link with \fI\-lpthread\fP or \fI\-pthread\fP.

Is compiling with -pthread not the preferred way? And so I'd drop mention 
of -lpthread.

> +.SH DESCRIPTION
> +Create a new thread that executes
> +.IR func ();
> +being
> +.IR arg
> +the argument passed to
> +.IR func ().

The English here isn't quite right.

arg will be passed as the argument of func.

It would be helpful to let the reader know that thrd_start_t is

typedef int (* thrd_start_t)(void *) thrd_start_t.

Put that in the SYNOPSIS. I think.

> +The new thread could finish in any of the following ways:
> +.IP * 2
> +By calling
> +.BR thrd_exit (3).
> +.IP *
> +By reaching a
> +.I return
> +statement. 

Surely this should be: "by reaching a return statement *inside func*"

> This is equivalent to calling
> +.BR thrd_exit (3),
> +returning the value specified in the
> +.I return
> +statement.
> +.IP *
> +Any of the threads in the process calls
> +.BR exit (3),
> +or the main thread performs a return from
> +.IR main ().
> +This causes the termination of all threads in the process.
> +
> +When called, a successful call to
> +.BR thrd_create (),
> +if successful, the ID of the new thread in the buffer pointed to by
> +.IR thread ;

Have a reread of the last sentence. Too many "successful".

> +this identifier is used to refer to the thread
> +in subsequent calls to other thread functions.
> +
> +.SS Linux-specific details
> +The
> +.IR <threads.h>
> +API is implemented on top of
> +.IR <pthread.h>
> +functions, so most of the documentation found for
> +.IR <pthread.h>
> +is applicable for
> +.IR <threads.h>
> +too.
> +.SH RETURN VALUE
> +.TP
> +.B thrd_success
> +Indicates that new thread has been created successfully.
> +.TP
> +.B thrd_nomem
> +The new thread could not be spawned because there was not
> +sufficient memory to allocate resources.
> +.TP
> +.B thrd_error
> +Any other error occurred and the new thread could not be created.
> +.SH ERRORS
> +All the errors caused by
> +.IR <threads.h>
> +functions are notified via return values. Check
> +.B RETURN VALUE
> +section for more details.
> +.SH CONFORMING TO
> +ISO/IEC 9899:2011, C11.

This looks like two standards are listed. I'd prefer either 
just "C11" or else "C11 (ISO/IEC 9899:2011)".

> +.SH SEE ALSO
> +.ad l
> +.nh

Ordering the following alphabetically:

> +.BR thrd_exit (3),
> +.BR thrd_join (3),
> +.BR thrd_current (3)

Should we mention pthread_create(3) here?

Ultimately, I think a "threads(7)" (or "cthreads(7)") page
(like pthreads(7)) may be desirable. All of the pages for
the new C11 functions would link to that page, and vice versa.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
