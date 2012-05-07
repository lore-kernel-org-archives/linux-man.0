From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clock_getres.2: tfix
Date: Tue, 8 May 2012 09:20:38 +1200
Message-ID: <CAKgNAki72VuX5TPhQTC3WrTuL62usFSGO7CoSO3cPTVS2LO9Jw@mail.gmail.com>
References: <1336419296-4823-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336419296-4823-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, May 8, 2012 at 7:34 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> Introduced in 63f0f3d and 22594a3.

Applied!

Thanks David.

Cheers,

Michael


> ---
> =A0man2/clock_getres.2 | =A0 =A08 ++++----
> =A01 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/man2/clock_getres.2 b/man2/clock_getres.2
> index 40c44a2..a1e27ad 100644
> --- a/man2/clock_getres.2
> +++ b/man2/clock_getres.2
> @@ -127,7 +127,7 @@ Setting this clock requires appropriate privilege=
s.
> =A0This clock is affected by discontinuous jumps in the system time
> =A0(e.g., if the system administrator manually changes the clock),
> =A0and by the incremental adjustments performed by
> -.BR adjtime (2)
> +.BR adjtime (3)
> =A0and NTP.
> =A0.TP
> =A0.B CLOCK_MONOTONIC
> @@ -136,7 +136,7 @@ some unspecified starting point.
> =A0This clock is not affected by discontinuous jumps in the system ti=
me
> =A0(e.g., if the system administrator manually changes the clock),
> =A0but is affected by the incremental adjustments performed by
> -.BR adjtime (2)
> +.BR adjtime (3)
> =A0and NTP.
> =A0.TP
> =A0.BR CLOCK_MONOTONIC_RAW " (since Linux 2.6.28; Linux-specific)"
> @@ -146,7 +146,7 @@ Similar to
> =A0but provides access to a raw hardware-based time
> =A0that is not subject to NTP adjustments or
> =A0the incremental adjustments performed by
> -.BR adjtime (2).
> +.BR adjtime (3).
> =A0.TP
> =A0.B CLOCK_PROCESS_CPUTIME_ID
> =A0High-resolution per-process timer from the CPU.
> @@ -239,7 +239,7 @@ On Linux, these clocks are not settable
> =A0.\" See http://bugzilla.kernel.org/show_bug.cgi?id=3D11972
> =A0.SH "SEE ALSO"
> =A0.BR date (1),
> -.BR adjtime (2),
> +.BR adjtime (3),
> =A0.BR gettimeofday (2),
> =A0.BR settimeofday (2),
> =A0.BR time (2),
> --
> 1.7.10
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
