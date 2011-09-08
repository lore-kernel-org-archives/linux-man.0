From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] small improvement for poll.2 (+1)
Date: Thu, 8 Sep 2011 16:03:21 +0200
Message-ID: <CAKgNAkhXbg-9pw8yoG1H-nrt2-3Z=qCEBS8eTSTmBz39T9rgTw@mail.gmail.com>
References: <20101216190323.49351495@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101216190323.49351495-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Dec 16, 2010 at 5:03 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> --- man-pages-git/man2/poll.2 =9A 2010-11-02 13:41:53.000000000 +0300
> +++ /tmp/poll.2 2010-12-16 19:00:47.000000000 +0300
> @@ -228,7 +229,9 @@
> =9A.BR ppoll ()
> =9Adiffers from
> =9A.BR poll ()
> -only in the precision of the timeout argument).
> +only in the precision of the
> +.I timeout
> +argument).
>
> =9AThe
> =9A.I timeout_ts

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
