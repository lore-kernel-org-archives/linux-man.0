From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] resolver.3: documents missing options used by _res
 structure defined in resolv.h and indicates defaults options
Date: Mon, 9 Mar 2015 11:38:53 +0100
Message-ID: <20150309103853.GA10262@free.fr>
References: <20090505194602.GA7897@cavendish.icomputing.pl>
 <1425761903-22748-1-git-send-email-saulery@free.fr>
 <54FC0642.6050800@gmail.com>
 <20150308120348.GB2050@free.fr>
 <54FD4AB6.3090102@gmail.com>
 <20150309075456.GA1253@free.fr>
 <54FD6CC3.1000706@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54FD6CC3.1000706-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: 527136-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Le lundi 09 mars 2015 =C3=A0 10:49:55, Michael Kerrisk (man-pages) a =C3=
=A9crit :
> On 03/09/2015 08:54 AM, St=C3=A9phane Aulery wrote:
> > Le lundi 09 mars 2015 =C3=A0 08:24:38, Michael Kerrisk (man-pages) =
a =C3=A9crit :
> >=20
> >>>>> +.B RES_BLAST
> >>>>> +When resolvers want to even out the load on their nameservers,=
 following
> >>>>> +them.=20
> >>>>
> >>>> I do not understand that last sentence. Could you clarify please=
=2E
> >>>
> >>> I must admit that it's not clear to me either. I think this means=
 that
> >>> server alias are swapped between each request. I have wrong? The =
word
> >>> "blast" leaves me skeptical.
> >>>
> >>> What I found in code source:
> >>>
> >>> Form res_send.c
> >>>
> >>> /*
> >>> * Some resolvers want to even out the load on their nameservers.
> >>> * Note that RES_BLAST overrides RES_ROTATE.
> >>> */
> >>> if (__builtin_expect ((statp->options & RES_ROTATE) !=3D 0, 0) &&
> >>>    (statp->options & RES_BLAST) =3D=3D 0) {
> >>>       struct sockaddr_in6 *ina;
> >>>       unsigned int map;
> >>>
> >>>       n =3D 0;
> >>>       while (n < MAXNS && EXT(statp).nsmap[n] =3D=3D MAXNS)
> >>>          n++;
> >>>       if (n < MAXNS) {
> >>>          ina =3D EXT(statp).nsaddrs[n];
> >>>          map =3D EXT(statp).nsmap[n];
> >>>          for (;;) {
> >>>             ns =3D n + 1;
> >>>             while (ns < MAXNS
> >>>                && EXT(statp).nsmap[ns] =3D=3D MAXNS)
> >>>                ns++;
> >>>             if (ns =3D=3D MAXNS)
> >>>                break;
> >>>             EXT(statp).nsaddrs[n] =3D EXT(statp).nsaddrs[ns];
> >>>             EXT(statp).nsmap[n] =3D EXT(statp).nsmap[ns];
> >>>             n =3D ns;
> >>>          }
> >>>          EXT(statp).nsaddrs[n] =3D ina;
> >>>          EXT(statp).nsmap[n] =3D map;
> >>>       }
> >>> }
> >>
> >> Okay -- I leave it to your discretion to choose what to do here.
> >=20
> > No please, I need your help.
>=20
> Sorry -- the code is not clear to me, and I don't have the time=20
> to investigate deeper.

Thank you for your help.

> Google turns up this detail from the O'Reilly DNS and BIND
> book:
>=20
>     "Blast" all recursive servers by sending queries to=20
>     the simultaneously. Not implemented yet.
>=20
> The first sentence makes sense. I'm not sure whether
> the second is true for glibc or not. But, I just grepped
> the entire C source code for Fedora 20, and found no users=20
> of RES_BLAST, so indeed maybe it is not implemented.

Options not implemented are explicitly mentioned. [1]
So for me it is.

I propose:

    Send each query simultaneously and recursively to all servers.

[1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dresolv/res_d=
ebug.c;hb=3D95f386609f378063b35e0c4ede8c2d2ceea91f51#l564

Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
