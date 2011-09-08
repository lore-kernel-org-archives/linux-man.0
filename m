From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] small improvement for poll.2
Date: Thu, 8 Sep 2011 16:00:00 +0200
Message-ID: <CAKgNAkjvThY0j3HefTwPPaLiKbfOoktO_7-bjGMmA5w=11vxMQ@mail.gmail.com>
References: <20101216185719.142f4d72@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101216185719.142f4d72-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Dec 16, 2010 at 4:57 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> --- man-pages-git/man2/poll.2 =9A 2010-11-02 13:41:53.000000000 +0300
> +++ /tmp/poll.2 2010-12-16 18:55:52.000000000 +0300
> @@ -191,7 +191,8 @@
> =9Abecomes ready or until a signal is caught.
> =9A.PP
> =9AOther than the difference in the precision of the
> -timeout argument, the following
> +.I timeout
> +argument, the following
> =9A.BR ppoll ()
> =9Acall:
> =9A.nf

Applied for 3.33.

Thanks, Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
