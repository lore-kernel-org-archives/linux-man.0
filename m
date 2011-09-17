From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] prctl.2: PR_SET_DUMPABLE makes process non-ptrace-attachable
Date: Sat, 17 Sep 2011 07:17:56 +0200
Message-ID: <CAKgNAkj4vJjAYrvPR6zqVLk9Q1=hQF6h=89xRgz1AGUmC0MB5A@mail.gmail.com>
References: <20110506154952.1282C1909ED@elbrus2.mtv.corp.google.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110506154952.1282C1909ED-r6u+3jvoQ04KgorLzL7FmE7CuiCeIGUxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Pluzhnikov <ppluzhnikov-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Paul!

On Fri, May 6, 2011 at 5:49 PM, Paul Pluzhnikov <ppluzhnikov-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org=
> wrote:
> Michael,
>
> We've recently discovered that GDB will fail to attach to any process=
 that
> sets itself non-dumpable. Tested on kernel 2.6.32, with:
>
>
> #include <stdio.h>
> #include <stdlib.h>
> #include <sys/prctl.h>
> #include <unistd.h>
>
> int main(int argc, char *argv[])
> {
> =A0if (prctl(PR_SET_DUMPABLE, 0, 0, 0) !=3D 0) {
> =A0 =A0perror("prctl");
> =A0}
> =A0printf("Run gdb %s %d\n", argv[0], getpid());
> =A0sleep(20);
> =A0abort();
> }
>
>
> ./a.out
> Run gdb ./a.out 30476
>
>
> gdb -q =A0./a.out 30476
> Reading symbols from /tmp/a.out...done.
> Attaching to program: /tmp/a.out, process 30476
> ptrace: Operation not permitted.
> /tmp/30476: No such file or directory.
>
>
>
> Attached patch (against current git trunk) documents this behavior.

Thanks. Applied for man-pages-3.34.

Cheers,

Michael


> diff --git a/man2/prctl.2 b/man2/prctl.2
> index bb455fa..b469071 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -60,7 +60,7 @@ is called with a first argument describing what to =
do
> =A0arguments with a significance depending on the first one.
> =A0The first argument can be:
> =A0.TP
> -.BR PR_CAPBSET_READ " (since Linux 2.6.25)
> +.BR PR_CAPBSET_READ " (since Linux 2.6.25)"
> =A0Return (as the function result) 1 if the capability specified in
> =A0.I arg2
> =A0is in the calling thread's capability bounding set,
> @@ -120,6 +120,9 @@ for security reasons, this feature has been remov=
ed.
> =A0.I /proc/sys/fs/suid_dumpable
> =A0in
> =A0.BR proc (5).)
> +Processes that are not dumpable can not be attached via
> +.BR ptrace(2)
> +.BR PTRACE_ATTACH "."
> =A0.TP
> =A0.BR PR_GET_DUMPABLE " (since Linux 2.3.20)"
> =A0Return (as the function result) the current state of the calling
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
