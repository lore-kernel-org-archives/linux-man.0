From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: abs.3
Date: Thu, 09 Oct 2014 19:51:09 +0200
Message-ID: <5436CB0D.6040709@bfs.de>
References: <CAGc9EvdrJA+_jnkRsxLpXgRcHSZnsvETtgMjC0aTgsgsm8Ap0Q@mail.gmail.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9EvdrJA+_jnkRsxLpXgRcHSZnsvETtgMjC0aTgsgsm8Ap0Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 09.10.2014 13:24, schrieb Jonny Grant:
> http://man7.org/linux/man-pages/man3/abs.3.html
> 
> Hello
> This page shows:
> 
> "GCC handles abs() and labs() as built-in functions. GCC 3.0 also
>        handles llabs() and imaxabs() as built-ins."
> 
> As GCC3 has been around for 10 years now.. should these be combined? e.g.
> 
> " GCC handles abs(), labs(), llabs() and imaxabs() as built-in functions."
> 
> There may be other man pages with similar GCC 3.0 references that
> could be combined now.
> 

I would add "By default gcc ..." since you have a switch not to use built-in's at all.

re,
 wh

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
