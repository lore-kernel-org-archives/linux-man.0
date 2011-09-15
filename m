From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] timerfd_create.2: fix timerfd_settime() argument description
Date: Thu, 15 Sep 2011 06:19:17 +0200
Message-ID: <CAKgNAkgXLZwqhT2cOU+u_Y4NisnTva9T+d2nSMV8kCRo-SA55A@mail.gmail.com>
References: <1304176790.10600.24.camel@soyuz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1304176790.10600.24.camel@soyuz>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jonjic-iEixELS/QsY1GQ1Ptb7lUw@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Tomislav

On Sat, Apr 30, 2011 at 5:19 PM, Tomislav Jonjic <jonjic-iEixELS/QsY1GQ1Ptb7lUw@public.gmane.org> w=
rote:
> The initial expiration of the timer in timerfd_settime() is specified=
 by
> new_value.it_value, both for relative _and_ absolute timers.

Thanks. Applied for man-pages-3.33.

Cheers,

Michael


> diff --git a/man2/timerfd_create.2 b/man2/timerfd_create.2
> index c09e030..ae9d922 100644
> --- a/man2/timerfd_create.2
> +++ b/man2/timerfd_create.2
> @@ -152,7 +152,7 @@ are zero, the timer expires just once, at the tim=
e specified by
> =A0The
> =A0.I flags
> =A0argument is either 0, to start a relative timer
> -.RI ( new_value.it_interval
> +.RI ( new_value.it_value
> =A0specifies a time relative to the current value of the clock specif=
ied by
> =A0.IR clockid ),
> =A0or
>
> --
> Tomislav Jonjic
>
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
