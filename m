From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: small correction for services.5
Date: Sat, 22 May 2010 08:51:19 +0200
Message-ID: <AANLkTildY_oO48CaGT1M1V3tZ6T65HRZXj3zGyw4fKIt@mail.gmail.com>
References: <20100411092353.421f8cda@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100411092353.421f8cda-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Apr 11, 2010 at 7:23 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> Removed link to BUGS section (has commented).
>
> --- services.5 =9A2010-03-26 17:46:41.000000000 +0300
> +++ /tmp/services.5 =9A =9A 2010-04-11 09:20:37.000000000 +0400
> @@ -120,7 +120,7 @@
> =9A.TP
> =9A.I aliases
> =9Ais an optional space or tab separated list of other names for this
> -service (but see the BUGS section below).
> +service.
> =9AAgain, the names are case
> =9Asensitive.
> =9A.PP

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
