From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Typo in pthread_getschedparam(3)
Date: Sun, 2 Aug 2009 14:02:29 +0200
Message-ID: <cfd18e0f0908020502u41bcd30chfcbfac4498960953@mail.gmail.com>
References: <78ed569a3120ef840168cfb0b2c27c46.squirrel@mail.stardawn.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <78ed569a3120ef840168cfb0b2c27c46.squirrel-Zd6/SMYpz31T4FTSkWmNU9i2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: leslie.polzer-hi6Y0CQ0nG0@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Jul 25, 2009 at 11:33 AM, Leslie P.
Polzer<sky-A/mCt7huS1RhCjiJDEAuBxvVK+yQ3ZXh@public.gmane.org> wrote:
>
> http://www.kernel.org/doc/man-pages/online/pages/man3/pthread_setsche=
dparam.3.html
>
> =A0 =A0 =A0 pthread_setschedparam, =A0pthread_setschedparam =A0- set/=
get scheduling policy and
> =A0 =A0 =A0 parameters of a thread
>
> should be
>
> =A0 =A0 =A0 pthread_setschedparam, =A0pthread_getschedparam =A0- set/=
get scheduling policy and
> =A0 =A0 =A0 parameters of a thread =A0 =A0 =A0 =A0 ^^^

Thanks. Fixed for man-pages-3.23.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
