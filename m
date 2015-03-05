From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: Add a FIXME about alternative ipv6 alternative ABI
Date: Thu, 5 Mar 2015 14:47:37 +0100
Message-ID: <20150305134737.GA4494@free.fr>
References: <20150303232828.GA17654@free.fr>
 <CAKgNAkiL=jpTS7ox-uSAkU1FGS9RV92fgT4urWvv9AcsWZ9MEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkiL=jpTS7ox-uSAkU1FGS9RV92fgT4urWvv9AcsWZ9MEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

Le mercredi 04 mars 2015 =C3=A0 08:49:09, Michael Kerrisk (man-pages) a=
 =C3=A9crit :
>=20
> On 4 March 2015 at 00:28, St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org> wrot=
e:
> >
> > Pv6 header /usr/include/linux/in.h has an alternative at
> > /usr/include/bits/in.h in specific condition (cf.
> > /usr/include/bits/in.h).
> >
> > Is it good to mention it in ipv6.7 and how?
>=20
> Sorry -- I don't really understand what you mean. Could you say more?

The constant SOL_IPV6 is defined in a file libc6:
https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dbits/in.h;hb=3DH=
EAD

The Debian version of this file contains the following warning:

#ifndef _NETINET_IN_H
# error "Never use <bits/in.h> directly; include <netinet/in.h>
# instead."
#endif

/* If the application has already included linux/in6.h from a linux-bas=
ed
   kernel then we will not define the IPv6 IPPROTO_* defines, in6_addr =
(nor the
   defines), sockaddr_in6, or ipv6_mreq.  The ABI used by the linux-ker=
nel and
   glibc match exactly.  Neither the linux kernel nor glibc should brea=
k this
   ABI without coordination.  */
#ifdef _UAPI_LINUX_IN6_H
/* This is not quite the same API since the kernel always defines s6_ad=
dr16 and
   s6_addr32. This is not a violation of POSIX since POSIX says "at lea=
st the
   following member" and that holds true.  */
# define __USE_KERNEL_IPV6_DEFS
#endif


It is like asking whether to add a note to ipv6.7, what you want to do.

Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
