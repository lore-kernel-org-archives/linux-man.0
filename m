From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] resolver.3: documents missing options used by _res
 structure defined in resolv.h and indicates defaults options
Date: Mon, 9 Mar 2015 08:54:56 +0100
Message-ID: <20150309075456.GA1253@free.fr>
References: <20090505194602.GA7897@cavendish.icomputing.pl>
 <1425761903-22748-1-git-send-email-saulery@free.fr>
 <54FC0642.6050800@gmail.com>
 <20150308120348.GB2050@free.fr>
 <54FD4AB6.3090102@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54FD4AB6.3090102-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: 527136-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Le lundi 09 mars 2015 =C3=A0 08:24:38, Michael Kerrisk (man-pages) a =C3=
=A9crit :
> Hello St=C3=A9phane,
>=20
> On 03/08/2015 01:03 PM, St=C3=A9phane Aulery wrote:
> > Hi Michael,
> >=20
> > I made another patch with all your remarks.
>=20
> Did you send it already. (No hurry--it's just that I wonder if I miss=
ed it.)

I was waiting your answers to the question bellow before.

> >>> +.B RES_BLAST
> >>> +When resolvers want to even out the load on their nameservers, f=
ollowing
> >>> +them.=20
> >>
> >> I do not understand that last sentence. Could you clarify please.
> >=20
> > I must admit that it's not clear to me either. I think this means t=
hat
> > server alias are swapped between each request. I have wrong? The wo=
rd
> > "blast" leaves me skeptical.
> >=20
> > What I found in code source:
> >=20
> >>From resolv.h:
> >=20
> > #define RES_BLAST       0x00020000      /* blast all recursive serv=
ers */
> >=20
> > Form res_send.c
> >=20
> > /*
> > * Some resolvers want to even out the load on their nameservers.
> > * Note that RES_BLAST overrides RES_ROTATE.
> > */
> > if (__builtin_expect ((statp->options & RES_ROTATE) !=3D 0, 0) &&
> >    (statp->options & RES_BLAST) =3D=3D 0) {
> >       struct sockaddr_in6 *ina;
> >       unsigned int map;
> >=20
> >       n =3D 0;
> >       while (n < MAXNS && EXT(statp).nsmap[n] =3D=3D MAXNS)
> >          n++;
> >       if (n < MAXNS) {
> >          ina =3D EXT(statp).nsaddrs[n];
> >          map =3D EXT(statp).nsmap[n];
> >          for (;;) {
> >             ns =3D n + 1;
> >             while (ns < MAXNS
> >                && EXT(statp).nsmap[ns] =3D=3D MAXNS)
> >                ns++;
> >             if (ns =3D=3D MAXNS)
> >                break;
> >             EXT(statp).nsaddrs[n] =3D EXT(statp).nsaddrs[ns];
> >             EXT(statp).nsmap[n] =3D EXT(statp).nsmap[ns];
> >             n =3D ns;
> >          }
> >          EXT(statp).nsaddrs[n] =3D ina;
> >          EXT(statp).nsmap[n] =3D map;
> >       }
> > }
>=20
> Okay -- I leave it to your discretion to choose what to do here.

No please, I need your help.

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
