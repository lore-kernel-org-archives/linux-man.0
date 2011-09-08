From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] small improvement for poll.2 (+2)
Date: Thu, 8 Sep 2011 16:02:12 +0200
Message-ID: <CAKgNAkhZ8u9sVb6m4NN-rGWhc4iNrGvxuch8JDhu5OiqiZtKxA@mail.gmail.com>
References: <20101217184003.51939de4@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101217184003.51939de4-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Dec 17, 2010 at 4:40 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> --- man-pages-git/man2/poll.2 =9A 2010-11-02 13:41:53.000000000 +0300
> +++ /tmp/poll.2 2010-12-17 18:39:02.000000000 +0300
> @@ -287,7 +287,9 @@
> =9AThe
> =9A.BR poll ()
> =9Alibrary call was introduced in libc 5.4.28
> -(and provides emulation using select(2) if your kernel does not
> +(and provides emulation using
> +.BR select (2)
> +if your kernel does not
> =9Ahave a
> =9A.BR poll ()
> =9Asystem call).

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
