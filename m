From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] unix.7
Date: Mon, 15 Nov 2010 06:19:01 +0100
Message-ID: <AANLkTinQ7LYw3dgdQOBXZkh7ttC9Hr98Qebnh=FO=wgm@mail.gmail.com>
References: <20101111205640.5ad22f64@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101111205640.5ad22f64-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Yuri,

On Thu, Nov 11, 2010 at 6:56 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.

Thanks.
Applied for 3.32.

Cheers,

Michael

> --- man-pages-git/man7/unix.7 =9A 2010-11-02 13:41:53.000000000 +0300
> +++ /tmp/unix.7 2010-11-11 20:48:52.000000000 +0300
> @@ -332,7 +332,8 @@
> =9A.TP
> =9A.B EINVAL
> =9AInvalid argument passed.
> -A common cause is the missing setting of AF_UNIX
> +A common cause is the missing setting of
> +.B AF_UNIX
> =9Ain the
> =9A.I sun_type
> =9Afield of passed addresses or the socket being in an
>
> --
> Best Regards,
> Yuri Kozlov
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
