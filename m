From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for random.4
Date: Sun, 29 Aug 2010 06:37:44 +0200
Message-ID: <AANLkTimhzqmu=bpNd9LS_jp8AkY2FOJ9u3qtSqqQZFbK@mail.gmail.com>
References: <20100727125959.50e76c23@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100727125959.50e76c23-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

Thanks. Applied for 3.26.

Cheers,

Michael

On Tue, Jul 27, 2010 at 10:59 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrot=
e:
> Hello.
>
> --- man-pages-git/man4/random.4 2010-03-26 17:46:41.000000000 +0300
> +++ /tmp/random.4 =9A =9A =9A 2010-07-27 12:59:14.000000000 +0400
> @@ -59,7 +59,7 @@
> =9A.IR /dev/urandom
> =9Ashould be used for everything except long-lived GPG/SSL/SSH keys.
>
> -If a seed file is saved across reboots as recommended above (all maj=
or
> +If a seed file is saved across reboots as recommended below (all maj=
or
> =9ALinux distributions have done this since 2000 at least), the outpu=
t is
> =9Acryptographically secure against attackers without local root acce=
ss as
> =9Asoon as it is reloaded in the boot sequence, and perfectly adequat=
e for
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
