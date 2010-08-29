From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for fork.2
Date: Sun, 29 Aug 2010 06:25:37 +0200
Message-ID: <AANLkTik2L3wTn5TDBbSTmykAZFh3k97A4PGfftoo28YC@mail.gmail.com>
References: <20100818213103.41245b8b@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100818213103.41245b8b-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

Thanks. I applied this for 3.26.

Cheers,

Michael


On Wed, Aug 18, 2010 at 7:31 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
> --- man-pages-git/man2/fork.2 =9A 2010-03-26 17:46:41.000000000 +0300
> +++ /tmp/fork.2 2010-08-18 21:29:45.000000000 +0400
> @@ -84,8 +84,8 @@
> =9Afrom its parent
> =9A.RB ( aio_read (3),
> =9A.BR aio_write (3)),
> -nor does it inherit any asynchronous I/O contexts from its parent
> -.RB ( see io_setup (2)).
> +nor does it inherit any asynchronous I/O contexts from its parent (s=
ee
> +.BR io_setup (2)).
> =9A.PP
> =9AThe process attributes in the preceding list are all specified
> =9Ain POSIX.1-2001.
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
