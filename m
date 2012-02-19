From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: aio_error query
Date: Sun, 19 Feb 2012 15:40:59 +1300
Message-ID: <CAKgNAkg9ELf7WHxsB=PuGTj2KifW2pZqT6i5VBAfRX_ajqvcEw@mail.gmail.com>
References: <4F1B32A4.1010809@jguk.org> <CAKgNAkgjOss__FerDwEqMW2MY2Bs0pwyVuNURuvoKAw7si4u_w@mail.gmail.com>
 <4F3FA267.4000208@jguk.org> <CAKgNAkg2KYca3mA-Nd6_uRDDQpZmb+SFmLbZOFug9jVvHnB8NA@mail.gmail.com>
 <4F400BFB.5050409@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F400BFB.5050409-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jon

On Sun, Feb 19, 2012 at 9:37 AM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hi Michael
>
> Michael Kerrisk wrote, On 18/02/12 18:18:
> [...]
>
>>>
>>> http://pubs.opengroup.org/onlinepubs/009604599/functions/xsh_chap02_03.html
>>> http://www.cl.cam.ac.uk/cgi-bin/manpage?3+errno
>>>
>>>>> errno is an int, and the values I think are not
>>>>> guaranteed to be positive (like with glibc). I work on a system where
>>>>> they
>>>>> are all negative.
>>
>>
>> What is the system?
>
>
> http://www.mpcdata.com/mediasdk/

Is this actually a UNIX system?

> [..]
>
>> What you say is now clearer to me, and sounds reasonable. Still, I'm
>> curious about this other system you are using; I think on every system
>> I encountered, error numbers are positive.
>
> Perhaps errno macros as positive numbers are a de facto convention.

It appears to be so, but AFAICS you're correct about POSIX not
mandating it. I'll check into this some more.

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
