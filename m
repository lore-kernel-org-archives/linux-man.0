From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/RFC] resolver_r.3: New page documenting res_ninit() et al
Date: Mon, 4 Jul 2011 12:48:57 +0300
Message-ID: <CACKs7VB_hoonsERpihxPSW=eQVu0LYDffao37xz5G9+vAV_J0w@mail.gmail.com>
References: <20110704051737.GA15844@elie>
	<20110704053331.GA16153@elie>
	<CACKs7VCC_gkVEeci+ctTQ-H+YPsErN9cWb-CczvVUW5pG3zmDw@mail.gmail.com>
	<20110704093719.GB25520@elie>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110704093719.GB25520@elie>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Kettenis <mark.kettenis-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Martin Ferrari <tincho-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Robert Edmonds <edmonds-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

On Mon, Jul 4, 2011 at 12:37 PM, Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
[...]
>> Ages ago I
>> stole the info from their resolver.3 page and merged it with the pag=
e
>> distributed with glibc (the current version is taken from there as
>> well, IIRC). The patch got somehow lost through the cracks, I think.=
=2E.
>>
>> Or do you see any licensing issues with doing that?
>
> libbind's manpages are permissively (ISC) licensed and so pretty much
> hassle-free to reuse. =A0Could you send a link or other pointer (e.g.=
,
> message-id) to your patch?

That was before there was a linux-man mailing list; I still have
Michael's replies, but apparently I don't the one I sent. I will check
my home computer, maybe I have a copy of it there. I'll get back with
a reply if I manage to find it.

On re-reading Michael's replies, I see there was a problem with the
format of the man pages - the one from libbind is using mdoc, while
the one in man-pages uses the newer man(7) format. Just a heads up.

>
>> OTOH, if you want to keep your approach and add another page for the
>> reentrant functions, you might want to add a pointer in resolver.3 s=
o
>> people know there's another page as well :).
>
> I snuck in a link in the SEE ALSO section. =A0If you have ideas for
> where to broach the subject elsewhere (maybe in the paragraph
> discussing _res?), I'd be happy to take them. :)

Maybe at the beginning you could say that the man page documents only
the non-reentrant functions? OTOH, as far as I can make of the old
email exchange, the current man page is based on what BIND
4.9.something was shipping, probably before anybody started thinking
about multithreading :).

>
> Thanks for looking it over.
> Jonathan
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
