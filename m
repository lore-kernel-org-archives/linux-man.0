From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sched_rr_get_interval.2: update Linux notes
Date: Tue, 11 Oct 2011 16:52:51 +0200
Message-ID: <CAKgNAkgq42JVZ0whV-13Qq=3QJNgbuApxJuLHeg4sUtkbexDMA@mail.gmail.com>
References: <4E942B24.2080608@ladisch.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E942B24.2080608-P6GI/4k7KOmELgA04lAiVw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Clemens Ladisch <clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Clemens,

On Tue, Oct 11, 2011 at 1:40 PM, Clemens Ladisch <clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org> w=
rote:
> Signed-off-by: Clemens Ladisch <clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org>

Thanks for this. Do you have a pointer to the relevant kernel commit?

Cheers,

Michael


> --- a/man2/sched_rr_get_interval.2
> +++ b/man2/sched_rr_get_interval.2
> @@ -98,18 +98,24 @@
> =A0.\" for SCHED_RR processes. =A0For RR processes the timeslice is a=
lways
> =A0.\" DEF_TIMESLICE, or 0.1 secs.
> =A0.\" Was the following really true for older kernels?
> -.\" Must build a 2.6.8 kernel and retest, and rewrite the following =
text
> -.\" appropriately.
> +.\" It is again true for at least Linux 2.6.12, but stopped in 2.6.2=
4.
> =A0POSIX does not specify any mechanism for controlling the size of t=
he
> =A0round-robin time quantum.
> =A0However, Linux provides a (nonportable) method of doing this.
> -The quantum can be controlled by adjusting the process's nice value =
(see
> +The quantum of both
> +.B SCHED_RR
> +and
> +.B SCHED_OTHER
> +processes can be controlled by adjusting the process's nice value (s=
ee
> =A0.BR setpriority (2)).
> =A0Assigning a negative (i.e., high) nice value results in a longer q=
uantum;
> =A0assigning a positive (i.e., low) nice value results in a shorter q=
uantum.
> =A0The default quantum is 0.1 seconds;
> =A0the degree to which changing the nice value affects the
> =A0quantum has varied somewhat across kernel versions.
> +Since Linux 2.6.24, the
> +.B SCHED_RR
> +quantum cannot be modified.
> =A0.\" .SH BUGS
> =A0.\" As of Linux 1.3.81
> =A0.\" .BR sched_rr_get_interval ()
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
