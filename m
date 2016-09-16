From: Mats Wichmann <mats-mBRmNHn34rVzbRFIqnYvSA@public.gmane.org>
Subject: Re: Missing "restrict" keyword in function signatures
Date: Fri, 16 Sep 2016 14:03:49 -0600
Message-ID: <eff57742-9c5a-e8a1-f87e-312f25fa098d@wichmann.us>
References: <CALgdb5+XAEqE4k+-BeuVxYFh_8TBP4Q-Xt5LMc=BmLD6jS1dHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALgdb5+XAEqE4k+-BeuVxYFh_8TBP4Q-Xt5LMc=BmLD6jS1dHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ori Avtalion <ori-prZfzsrDuP2LwutG50LtGA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/16/2016 03:06 AM, Ori Avtalion wrote:
> Hi,
> 
> None of the function signatures in man pages list the "restrict"
> keywords, even if the actual function signatures in the headers have
> them.
> 
> Some example functions that use "restrict":
> * memcpy (src and dest must not overlap)
> * strtod
> 
> Is this an intentional omission?

It's an interesting question. These largely come from ISO C, and I
recall reading that glibc developers consider the qualifier rather
useless, noting something like "since ISO C uses it, we have to also".

This is one of the interesting pieces of text in ISO C11 on it (6.7.3):

An object that is accessed through a restrict-qualified pointer has a
special association with that pointer. This association, defined in
6.7.3.1 below, requires that all accesses to that object use, directly
or indirectly, the value of that particular ponter. 135) The intended
use of the restrict qualifier (like the register storage class) is to
promote optimization, and deleting all instances of the qualifier from
all preprocessing translation units composing a conforming program does
not change its meaning (i.e., observable behavior).


So you could argue that since there is no behavioral change from
adding/omitting it, it doesn't help programmers when used in the manpage
functions signatures.  But that's just me noodling out loud.  You could
also argue that since ISO C uses it, glibc headers use it, and POSIX
pages use it it's kind of silly to leave restrict out.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
