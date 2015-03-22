From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] boot.7: Mention `systemd(1)' and its related `bootup(7)'
Date: Sun, 22 Mar 2015 20:47:39 +0100
Message-ID: <550F1C5B.4020101@gmail.com>
References: <892a44c6ff3d40b79ca3121c3290fae0-mfwitten@gmail.com> <f5773ca5390e4f248b6cbc2f2b047f0d-mfwitten@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f5773ca5390e4f248b6cbc2f2b047f0d-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/11/2015 10:00 PM, Michael Witten wrote:
> It's important that the reader receive contemporary information.

Quite! Thanks for this. Applied.

Cheers,

Michael



> Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man7/boot.7 | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/man7/boot.7 b/man7/boot.7
> index 0b209d8..4541b8c 100644
> --- a/man7/boot.7
> +++ b/man7/boot.7
> @@ -114,6 +114,15 @@ program
>  to which are passed the parameters that haven't already been
>  handled by the kernel.
>  .SS Root user-space process
> +.TP
> +Note:
> +The following description applies to an OS based on UNIX System V Release 4.
> +Namely, a number of widely used systems have adopted a related but
> +fundamentally alternative approach known as
> +.BR systemd (1),
> +for which the bootup process is detailed in its associated
> +.BR bootup (7).
> +.LP
>  When
>  .I /sbin/init
>  starts, it reads
> @@ -141,11 +150,8 @@ that actually start/stop the individual services.
>  .SS Boot scripts
>  .TP
>  Note:
> -The following description applies to an OS based on UNIX System V Release 4,
> -which currently covers most commercial UNIX systems (Solaris, HP-UX, Irix,
> -Tru64) as well as the major Linux distributions (Red Hat, Debian, Mandriva,
> -SUSE, Ubuntu).
> -Some systems (Slackware Linux, FreeBSD, OpenBSD)
> +The following description applies to an OS based on UNIX System V Release 4.
> +Namely, a number of widely used systems (Slackware Linux, FreeBSD, OpenBSD)
>  have a somewhat different scheme for boot scripts.
>  .LP
>  For each managed service (mail, nfs server, cron, etc.), there is
> @@ -199,7 +205,7 @@ To allow a system administrator to change these
>  inputs without editing an entire boot script,
>  some separate configuration file is used, and is located in a specific
>  directory where an associated boot script may find it
> -(\fI/etc/sysconfig\fR on Red Hat systems).
> +(\fI/etc/sysconfig\fR on older Red Hat systems).
>  
>  In older UNIX systems, such a file contained the actual command line
>  options for a daemon, but in modern Linux systems (and also
> @@ -213,6 +219,8 @@ the variable values.
>  .IR /etc/rc[S0\-6].d/ ,
>  .I /etc/sysconfig/
>  .SH SEE ALSO
> +.BR bootup (7)
> +.BR systemd (1)
>  .BR inittab (5),
>  .BR bootparam (7),
>  .BR init (1),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
