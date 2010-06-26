From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: getaddrinfo(3) bug
Date: Sat, 26 Jun 2010 14:42:21 +0200
Message-ID: <AANLkTilKYaVlOdHYNvfmkt5cgmWipMdiE1k0n09klNDi@mail.gmail.com>
References: <AANLkTin62DCx2CbEGjasHY7jx1XEUedAUJG-0ObpUkXA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTin62DCx2CbEGjasHY7jx1XEUedAUJG-0ObpUkXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Walls <sawalls-63aXycvo3TyHXe+LvDLADg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Scot,

On Thu, Jun 24, 2010 at 6:27 PM, Scott Walls <sawalls-63aXycvo3TyHXe+LvDLADg@public.gmane.org> wrote:
> manpages-dev version 3.23-1
> Ubuntu 10.04
> man 3 getaddrinfo
> On line 74-75, in the description of the ai_flags member, it says "Multiple
> flags are specified by logically OR-ing them together."
> This should say "Multiple flags are specified by bitwise OR-ing them
> together."
> I believe this to be true for the following reasons:
>
> the result of logical OR ( || ) is always 1 or 0 (this is how it is defined
> in Harbinson and Steele, at least), so it would be impossible to extract out
> the different bitflags
> on lines 80 "and ai_flags to (AI_V4MAPPED | AI_ADDRCONFIG)" it seems that
> bitwise or is the proper choice
>
> If you need any more information, please feel free to ask.
> Thanks
> Scott Walls

Thanks. Of course you are right. Changed for man-pages-3.26.

thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
