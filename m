From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] seccomp(2): expand SECCOMP_RET_KILL documentation
Date: Wed, 5 Jul 2017 10:47:24 +0200
Message-ID: <567cea14-bd18-f839-8aef-4a0837132e8c@gmail.com>
References: <20170606215350.23062-1-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170606215350.23062-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/06/2017 11:53 PM, Mike Frysinger wrote:
> From: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> First clarify that the process cannot catch this SIGSYS signal.  While
> the text currently says that, it's easy (imo) to read ambiguously and
> that it's referring to default behavior (no handler -> process exits).
> 
> Then add details regarding coredump behavior.  Before Linux 4.11, there
> was no way to get coredumps from such crashes.  Now we can at least get
> crashes from single threaded processes.

Thanks, Mike. Patch applied.

Cheers,

Michael

> Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  man2/seccomp.2 | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/man2/seccomp.2 b/man2/seccomp.2
> index 7d0e721894b4..ec1df0c9efca 100644
> --- a/man2/seccomp.2
> +++ b/man2/seccomp.2
> @@ -378,6 +378,22 @@ The process terminates as though killed by a
>  signal
>  .RI ( not
>  .BR SIGKILL ).
> +Even if a signal handler has been registered and otherwise catches
> +.BR SIGSYS ,
> +the handler will be ignored in this case and the process always terminates.
> +
> +.\" See these commits:
> +.\" seccomp: dump core when using SECCOMP_RET_KILL (b25e67161c295c98acda92123b2dd1e7d8642901)
> +.\" seccomp: Only dump core when single-threaded (d7276e321ff8a53106a59c85ca46d03e34288893)
> +Before Linux 4.11, any process terminated this way would not trigger a coredump
> +(even though
> +.B SIGSYS
> +is documented in
> +.BR signal (7)
> +as having a default core action).
> +Since Linux 4.11, single threaded processes follow standard coredump behavior,
> +but multithreaded processes still do not.
> +There is no workaround currently for multithreaded processes.
>  .TP
>  .BR SECCOMP_RET_TRAP
>  This value results in the kernel sending a
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
