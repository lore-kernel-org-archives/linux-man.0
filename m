From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: small improvement in the setsid.2
Date: Mon, 24 May 2010 17:48:19 +0200
Message-ID: <AANLkTimFmEO8_R_VILFBSXrzyfrNOlFzD4t1lcRBqMSH@mail.gmail.com>
References: <20100524155900.002412ef@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100524155900.002412ef-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, May 24, 2010 at 1:59 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> --- man-pages-git/man2/setsid.2 2010-03-26 17:46:41.000000000 +0300
> +++ /tmp/setsid.2 =9A =9A =9A 2010-05-24 15:55:48.000000000 +0400
> @@ -56,7 +56,7 @@
> =9Ais set to indicate the error.
> =9A.SH ERRORS
> =9A.TP
> -.BR EPERM .
> +.BR EPERM
> =9AThe process group ID of any process
> =9Aequals the PID of the calling process.
> =9AThus, in particular,

Thanks. Applied for 3.25.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
