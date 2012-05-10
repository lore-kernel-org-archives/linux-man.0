From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: ffix
Date: Fri, 11 May 2012 06:25:37 +1200
Message-ID: <CAKgNAkjj6LZvOtoBpaha4qoPYB67w94K9qvqmb=GKR2af_HQYQ@mail.gmail.com>
References: <1336665448-7303-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336665448-7303-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks David!

Cheers,

Michael


On Fri, May 11, 2012 at 3:57 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
> =A0man5/proc.5 | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man5/proc.5 b/man5/proc.5
> index ace0941..2ba1daa 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -95,7 +95,7 @@ The format is one \fIunsigned long\fP ID
> =A0plus one \fIunsigned long\fP value for each entry.
> =A0The last entry contains two zeros.
> =A0.TP
> -.I /proc/[pid]/cgroup " (since Linux 2.6.24)"
> +.IR /proc/[pid]/cgroup " (since Linux 2.6.24)"
> =A0.\" =A0 =A0 =A0Info in Documentation/cgroups/cgroups.txt
> =A0This file describes control groups to which the process/task belon=
gs.
> =A0For each cgroup hierarchy there is one entry containing
> --
> 1.7.10
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
