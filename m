From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] resolver.3: documents missing options used by _res structure
 defined in resolv.h and indicates defaults options
Date: Mon, 09 Mar 2015 08:24:38 +0100
Message-ID: <54FD4AB6.3090102@gmail.com>
References: <20090505194602.GA7897@cavendish.icomputing.pl> <1425761903-22748-1-git-send-email-saulery@free.fr> <54FC0642.6050800@gmail.com> <20150308120348.GB2050@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150308120348.GB2050-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, 527136-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello St=C3=A9phane,

On 03/08/2015 01:03 PM, St=C3=A9phane Aulery wrote:
> Hi Michael,
>=20
> I made another patch with all your remarks.

Did you send it already. (No hurry--it's just that I wonder if I missed=
 it.)

> Le dimanche 08 mars 2015 =C3=A0 09:20:18, Michael Kerrisk (man-pages)=
 a =C3=A9crit :
>>
>>> +.TP
>>> +.B RES_USE_INET6
>>> +Try a AAAA query before an A query inside the
>>
>> s/a AAAA/an AAAA/
>=20
> This is a copy of resolv.conf.5. I will fix this too.

Yup. Thanks.

>>> +.B RES_BLAST
>>> +When resolvers want to even out the load on their nameservers, fol=
lowing
>>> +them.=20
>>
>> I do not understand that last sentence. Could you clarify please.
>=20
> I must admit that it's not clear to me either. I think this means tha=
t
> server alias are swapped between each request. I have wrong? The word
> "blast" leaves me skeptical.
>=20
> What I found in code source:
>=20
>>From resolv.h:
>=20
> #define RES_BLAST       0x00020000      /* blast all recursive server=
s */
>=20
> Form res_send.c
>=20
> /*
> * Some resolvers want to even out the load on their nameservers.
> * Note that RES_BLAST overrides RES_ROTATE.
> */
> if (__builtin_expect ((statp->options & RES_ROTATE) !=3D 0, 0) &&
>    (statp->options & RES_BLAST) =3D=3D 0) {
>       struct sockaddr_in6 *ina;
>       unsigned int map;
>=20
>       n =3D 0;
>       while (n < MAXNS && EXT(statp).nsmap[n] =3D=3D MAXNS)
>          n++;
>       if (n < MAXNS) {
>          ina =3D EXT(statp).nsaddrs[n];
>          map =3D EXT(statp).nsmap[n];
>          for (;;) {
>             ns =3D n + 1;
>             while (ns < MAXNS
>                && EXT(statp).nsmap[ns] =3D=3D MAXNS)
>                ns++;
>             if (ns =3D=3D MAXNS)
>                break;
>             EXT(statp).nsaddrs[n] =3D EXT(statp).nsaddrs[ns];
>             EXT(statp).nsmap[n] =3D EXT(statp).nsmap[ns];
>             n =3D ns;
>          }
>          EXT(statp).nsaddrs[n] =3D ina;
>          EXT(statp).nsmap[n] =3D map;
>       }
> }

Okay -- I leave it to your discretion to choose what to do here.

>>> Note this option overrides
>>> +.BR RES_ROTATE .
>>> +.TP
>>> +.B RES_USEBSTRING
>>> +Make reverse IPv6 lookups using the bit-label format described in =
RFC 2673;
>>> +if this option is not set, then nibble format is used (since glibc=
 2.3.4).
>>
>> Does the "(since glibc 2.3.4)" apply to the option, or to the
>> "then nibble format is used"? It's not clear. If the former, then wr=
ite
>=20
> I don't no. I picked this from resolv.conf.5.
> It should be for RES_USEBSTRING.

Okay.

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
