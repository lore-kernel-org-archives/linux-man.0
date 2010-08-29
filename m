From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for epoll_ctl.2
Date: Sun, 29 Aug 2010 06:29:04 +0200
Message-ID: <AANLkTini+LsZGjg2EqunFC7bU=qF5vz0m1NqkS3Gh9nW@mail.gmail.com>
References: <20100814095315.0b88bf18@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100814095315.0b88bf18-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

Thanks. Applied for 3.26.

Cheers,

Michael

On Sat, Aug 14, 2010 at 7:53 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
> --- man-pages-git/man2/epoll_ctl.2 =9A =9A =9A2010-03-26 17:46:41.000=
000000 +0300
> +++ /tmp/epoll_ctl.2 =9A =9A2010-08-14 09:51:09.000000000 +0400
> @@ -81,12 +81,12 @@
> =9Atypedef union epoll_data {
> =9A =9A void =9A =9A =9A =9A*ptr;
> =9A =9A int =9A =9A =9A =9A =9Afd;
> - =9A =9A__uint32_t =9A u32;
> - =9A =9A__uint64_t =9A u64;
> + =9A =9Auint32_t =9A u32;
> + =9A =9Auint64_t =9A u64;
> =9A} epoll_data_t;
>
> =9Astruct epoll_event {
> - =9A =9A__uint32_t =9A events; =9A =9A =9A/* Epoll events */
> + =9A =9Auint32_t =9A events; =9A =9A =9A/* Epoll events */
> =9A =9A epoll_data_t data; =9A =9A =9A =9A/* User data variable */
> =9A};
> =9A.fi
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
