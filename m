From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] small improvement for recv.2
Date: Thu, 8 Sep 2011 16:04:25 +0200
Message-ID: <CAKgNAkgo-KHJnuF97xpF9Y=hiam-1U9ZCtyXKPCOPfp8BV-LdA@mail.gmail.com>
References: <20110313092029.1e80cef8@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110313092029.1e80cef8-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Mar 13, 2011 at 7:20 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> --- recv.2 =9A =9A =9A2010-12-26 12:01:43.851106424 +0300
> +++ /tmp/recv.2 2011-03-13 09:18:14.432032807 +0300
> @@ -360,7 +360,9 @@
> =9A.PP
> =9AThe
> =9A.I msg_flags
> -field in the msghdr is set on return of
> +field in the
> +.IR msghdr
> +is set on return of
> =9A.BR recvmsg ().
> =9AIt can contain several flags:
> =9A.TP

Applied for 3.33.

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
