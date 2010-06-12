From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: small improvement for pread.2
Date: Sat, 12 Jun 2010 17:38:53 +0200
Message-ID: <AANLkTim68T-MaL2ZLtxx__EOmYZnc2r_jfJUMwUaHGfV@mail.gmail.com>
References: <20100612101520.4edbb0de@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100612101520.4edbb0de-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Jun 12, 2010 at 8:15 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.

Thanks. Applied for man-pages-3.25.

Cheers,

Michael


> --- pread.2 =9A =9A 2010-03-26 17:46:41.000000000 +0300
> +++ /tmp/pread.2 =9A =9A =9A =9A2010-06-12 10:11:33.000000000 +0400
> @@ -65,7 +65,7 @@
> =9A.BR pwrite (),
> =9Aor
> =9Aend of file, in the case of
> -.BR pread (),
> +.BR pread ()),
> =9Aor \-1 on error, in which case
> =9A.I errno
> =9Ais set to indicate the error.
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
