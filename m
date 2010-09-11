From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Couple of small issues
Date: Sat, 11 Sep 2010 06:46:09 +0200
Message-ID: <AANLkTikRu19i0JQm78AKqmdF75ftJKG6JGCkAvptXWRd@mail.gmail.com>
References: <20100702094656.GA3504@marx.bitnet>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100702094656.GA3504-LhEd4YUrAk/R7s880joybQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jruohonen-X3B1VOXEql0@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jukka,

On Fri, Jul 2, 2010 at 11:46 AM, Jukka Ruohonen <jruohonen-X3B1VOXEql0@public.gmane.org> wrot=
e:
> Hi.
>
> Two small issues:
>
> 1. At least FreeBSD and NetBSD define ffs(3) in <strings.h>, as
> =A0 mandated/recommended by POSIX.

I'm not sure what you want to say here. Does something need fixing in
ffs(3)? It's not obvious to me.

> 2. In endian(3) there are some historical notes that are incorrect or=
 at
> =A0 least unclear.

Can you elaborate.

> I could probably go and audit rest of the manual pages that contains =
(often
> outdated or plain wrong) references to the BSDs and other operating s=
ystems.

That would be good.

> While reading the changelog, I noticed (an implicit?) trend towards t=
rying
> to limit the documentation to Linux only. I think this is a good idea=
;
> surely there is enough work to keep the manual pages updated with res=
pect to
> Linux alone.

I'm not sure if I know what the implicit rend is ;-). But, obviously,
the focus is Linux (with some attention to portability).

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
