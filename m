From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clarify the multithreaded behavior of ioprio_set
Date: Sun, 29 Jul 2012 07:12:05 +0200
Message-ID: <CAKgNAkh1b9ZqvxFCw1tPD-kWwcHLy2rt3M+4H1BxKPRyhdV0Vg@mail.gmail.com>
References: <1338849830-30588-1-git-send-email-cmccabe@alumni.cmu.edu>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1338849830-30588-1-git-send-email-cmccabe-VL1tVIhH15PQjUSlxSEPGw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin McCabe <cmccabe-VL1tVIhH15PQjUSlxSEPGw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?= <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Colin,

On Tue, Jun 5, 2012 at 12:43 AM, Colin McCabe <cmccabe-VL1tVIhH15PQjUSlxSEPGw@public.gmane.org> =
wrote:
> From: Colin Patrick McCabe <cmccabe-VL1tVIhH15PQjUSlxSEPGw@public.gmane.org>

Thanks for the patch. I've applied the slightly different version
shown at the foot of this mail.

Thanks also =D0=9C=D0=B0=D1=80=D0=BA for the note on this point. I'll a=
ttend to your other
point shortly.

Cheers,

Michael


> Signed-off-by: Colin McCabe <cmccabe-VL1tVIhH15PQjUSlxSEPGw@public.gmane.org>
> ---
>  man2/ioprio_set.2 |   25 ++++++++++++++++++++++---
>  1 files changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/man2/ioprio_set.2 b/man2/ioprio_set.2
> index 37b4dc1..807c655 100644
> --- a/man2/ioprio_set.2
> +++ b/man2/ioprio_set.2
> @@ -36,13 +36,13 @@ The
>  and
>  .BR ioprio_set ()
>  system calls respectively get and set the I/O scheduling class and
> -priority of one or more processes.
> +priority of one or more threads.
>
>  The
>  .I which
>  and
>  .I who
> -arguments identify the process(es) on which the system
> +arguments identify the thead(s) on which the system
>  calls operate.
>  The
>  .I which
> @@ -52,7 +52,7 @@ is interpreted, and has one of the following values=
:
>  .TP
>  .B IOPRIO_WHO_PROCESS
>  .I who
> -is a process ID identifying a single process.
> +is a process ID or thread ID identifying a single process or thread.
>  .TP
>  .B IOPRIO_WHO_PGRP
>  .I who
> @@ -186,6 +186,25 @@ kernel 2.6.13.
>  .SH "CONFORMING TO"
>  These system calls are Linux-specific.
>  .SH NOTES
> +Two or more processes or threads can share an I/O context.  This wil=
l be the
> +case when
> +.BR clone (2)
> +was called with the
> +.B CLONE_IO
> +flag.
> +
> +However, by default, the distinct threads of a process will
> +.B not
> +share the same I/O context.  This means that if you want to change t=
he I/O
> +priority of all threads in a process, you may need to call
> +.BR ioprio_set()
> +on all of the threads.  The thread ID you would need for this operat=
ion is that
> +which is returned by
> +.BR gettid(),
> +not
> +.BR pthread_self()
> +or another userspace API.
> +
>  Glibc does not provide wrapper for these system calls; call them usi=
ng
>  .BR syscall (2).
>
> --
> 1.7.7
>


--- a/man2/ioprio_set.2
+++ b/man2/ioprio_set.2
@@ -39,13 +39,13 @@ The
 and
 .BR ioprio_set ()
 system calls respectively get and set the I/O scheduling class and
-priority of one or more processes.
+priority of one or more threads.

 The
 .I which
 and
 .I who
-arguments identify the process(es) on which the system
+arguments identify the thead(s) on which the system
 calls operate.
 The
 .I which
@@ -55,7 +55,7 @@ is interpreted, and has one of the following values:
 .TP
 .B IOPRIO_WHO_PROCESS
 .I who
-is a process ID identifying a single process.
+is a process ID or thread ID identifying a single process or thread.
 .TP
 .B IOPRIO_WHO_PGRP
 .I who
@@ -192,6 +192,25 @@ These system calls are Linux-specific.
 Glibc does not provide wrapper for these system calls; call them using
 .BR syscall (2).

+Two or more processes or threads can share an I/O context.
+This will be the case when
+.BR clone (2)
+was called with the
+.B CLONE_IO
+flag.
+However, by default, the distinct threads of a process will
+.B not
+share the same I/O context.
+This means that if you want to change the I/O
+priority of all threads in a process, you may need to call
+.BR ioprio_set ()
+on each of the threads.
+The thread ID that you would need for this operation
+is the one that is returned by
+.BR gettid (2)
+or
+.BR clone (2).
+
 These system calls only have an effect when used
 in conjunction with an I/O scheduler that supports I/O priorities.
 As at kernel 2.6.17 the only such scheduler is the Completely Fair Que=
uing
+was called with the
+.B CLONE_IO
+flag.
+However, by default, the distinct threads of a process will
+.B not
+share the same I/O context.
+This means that if you want to change the I/O
+priority of all threads in a process, you may need to call
+.BR ioprio_set ()
+on each of the threads.
+The thread ID that you would need for this operation
+is the one that is returned by
+.BR gettid (2)
+or
+.BR clone (2).
+
 These system calls only have an effect when used
 in conjunction with an I/O scheduler that supports I/O priorities.
 As at kernel 2.6.17 the only such scheduler is the Completely Fair Que=
uing

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
