From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man-pages bug: ualarm
Date: Thu, 18 Apr 2013 21:02:14 +0200
Message-ID: <CAKgNAkjnnbR-ToZQRuN45H_CiOBdwt-Q5LS9ixHJmuFT9sS0RA@mail.gmail.com>
References: <BLU0-SMTP2746B1EB235E6F88982A287B1CF0@phx.gbl>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BLU0-SMTP2746B1EB235E6F88982A287B1CF0-MsuGFMq8XAE@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Hillegeer <nicolas-jJtG57l/RRZ54TAoqtyWWQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Nicolas,

On Thu, Apr 18, 2013 at 3:01 PM, Nicolas Hillegeer
<nicolas-jJtG57l/RRZ54TAoqtyWWQ@public.gmane.org> wrote:
> Version of man-pages: 3.44
>
> This stumped me for a while, it seem that when the usecs argument is 0, no
> alarm is fired.
>
> I did not test it, but I reckon that an existing alarm even gets cancelled,
> as mentioned here: http://www.mkssoftware.com/docs/man3/ualarm.3.asp
>
> Is this an omission or did I read badly, or does it not work like that on
> linux and am I seeing a fluke or testing wrongly?
>
> Thanks by the way, you're doing a great job with the manpages, they help the
> intrepid beginning linux dev a lot!
>
> If I'm wrong, please inform, because I'm relying on the 0 = cancel'ing
> behaviour right now in one of my apps.

Interesting point. POSIX.1-2001 does not specify the behavior here and
no other system that I checked documents what happens. However,
alarm(0) causes any pending alarm to be canceled, and by extension one
would expect ualarm(0) to do the same everywhere as well. Certainly,
that's what Linux does. I've added a NOTE on this point to the man
page.

Cheers,

Michael


--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
