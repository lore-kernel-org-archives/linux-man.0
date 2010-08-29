From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small fix for open.2
Date: Sun, 29 Aug 2010 06:39:35 +0200
Message-ID: <AANLkTi=Jdg2pXwmtwEWqDzdUKz6Q4O8k80b01s-7c6=Z@mail.gmail.com>
References: <20100717125848.41342e70@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100717125848.41342e70-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

Thanks. Applied for 3.26.

Cheers,

Michael


On Sat, Jul 17, 2010 at 10:58 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrot=
e:
> Hello.
>
> --- man-pages-git/man2/open.2 =9A 2010-07-17 09:02:09.000000000 +0400
> +++ /tmp/open.2 2010-07-17 12:56:34.000000000 +0400
> @@ -679,7 +679,7 @@
> =9Aand
> =9A.B O_RSYNC
> =9Ato the same numerical value as
> -.BR O_SYNC
> +.BR O_SYNC .
> =9AMost Linux file systems don't actually implement the POSIX
> =9A.B O_SYNC
> =9Asemantics, which require all metadata updates of a write
>
>
>
> --
> Best Regards,
> Yuri Kozlov
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
