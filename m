From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: PR_{SET,GET}_CHILD_SUBREAPER
Date: Fri, 8 Feb 2013 10:35:34 +0100
Message-ID: <CAKgNAkiSDk87FwgRJ2BZmH+s-qvHk+4mg0jmxar1kMbSLSLUEw@mail.gmail.com>
References: <20130111160047.GA30380@tango.0pointer.de> <1360175589-3667-1-git-send-email-shawnlandden@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360175589-3667-1-git-send-email-shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kay Sievers <kay-tD+1rO4QERM@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Shawn, Lennart, Kay,

On Wed, Feb 6, 2013 at 7:33 PM, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
> Signed-off-by: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man2/prctl.2 |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index e4a1030..fd78f48 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -379,6 +379,23 @@ if the kernel is configured with
>  .B CONFIG_SECCOMP
>  enabled.
>  .TP
> +.BR PR_SET_CHILD_SUBREAPER " (since Linux 3.3)"
> +Designates this process as a service manager for its' (immediate and
> +indirect) offspring processes. Any process whose immediate parent
> +dies and whose ancestry includes a process where this flag is set wi=
ll
> +be reparented to the closest process with this flag set, instead of =
PID
> +1. A 'subreaper' hence receives
> +.B SIGHCLD
> +signals for any orphaned
> +offspring processes, that otherwise would be received by
> +.BR init (8).
> +.TP
> +.BR PR_GET_CHILD_SUBREAPER " (since Linux 3.3)"
> +Returns whether calling process is a child subreaper (see
> +.BR PR_SET_CHILD_SUBREAPER ),
> +in the location pointed to by
> +.IR "(int\ *) arg2" .
> +.TP
>  .BR PR_SET_SECUREBITS " (since Linux 2.6.26)"
>  Set the "securebits" flags of the calling thread to the value suppli=
ed in
>  .IR arg2 .

Shawn, there was some imprecision in your patch. I've instead come up
with an alternative.

Kay, Lennart, is the following correct?

       PR_SET_CHILD_SUBREAPER (since Linux 3.4)
              If  arg2 is nonzero, set the "child subreaper" attribute
              of the calling process;  if  arg2  is  zero,  unset  the
              attribute.   When  a  process  is marked as a child sub=E2=
=80=90
              reaper, all of the children that it creates,  and  their
              descendants,  will  be marked as having a subreaper.  in
              effect, a subreaper fulfills the role of init(1) for its
              descendant  processes.   Upon  termination  of a process
              that is orphaned (i.e., its immediate parent has already
              terminated)  and marked as having a subreaper, the near=E2=
=80=90
              est still  living  ancestor  subreaper  will  receive  a
              SIGCHLD  signal and be able to wait(2) on the process to
              diiscover its termination status.

       PR_GET_CHILD_SUBREAPER (since Linux 3.4)
              Return the "child subreaper" setting of the  caller,  in
              the location pointed to by (int *) arg2.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
