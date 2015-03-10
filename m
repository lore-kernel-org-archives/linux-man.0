From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] resolver.3: documents missing options used by _res
 structure defined in resolv.h and indicates defaults options
Date: Wed, 11 Mar 2015 00:33:48 +0100
Message-ID: <20150310233348.GA2511@free.fr>
References: <54FD6CC3.1000706@gmail.com>
 <1425933851-16360-1-git-send-email-saulery@free.fr>
 <54FECB89.5000401@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54FECB89.5000401-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, 527136-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello walter,

Le mardi 10 mars 2015 =C3=A0 11:46:33, walter harms a =C3=A9crit :
>=20
> Am 09.03.2015 21:44, schrieb St=C3=A9phane Aulery:
> > Missing options: RES_INSECURE1, RES_INSECURE2, RES_NOALIASES, USE_I=
NET6,
> > ROTATE, NOCHECKNAME, RES_KEEPTSIG, BLAST, USEBSTRING, NOIP6DOTINT, =
USE_EDNS0,
> > SNGLKUP, SNGLKUPREOP, RES_USE_DNSSEC, NOTLDQUERY, DEFAULT
> >=20
> > Written from the glibc source and resolv.conf.5.
> >=20
> > Debian bug #527136 reported by Jakub Wilk <ubanus-iA+eEnwkJgzk1uMJSBkQmQ@public.gmane.org>
> >=20
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D527136
> > Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> > ---
> >  man3/resolver.3 | 99 +++++++++++++++++++++++++++++++++++++++++++++=
+++++++-----
> >  1 file changed, 91 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/man3/resolver.3 b/man3/resolver.3
> > index 19c4192..06704b1 100644
> > --- a/man3/resolver.3
> > +++ b/man3/resolver.3
> > @@ -197,19 +197,20 @@ which is not the default.
> >  Accept authoritative answers only.
> >  .BR res_send ()
> >  continues until
> > -it finds an authoritative answer or returns an error.  [Not curren=
tly
> > -implemented].
> > +it finds an authoritative answer or returns an error.
> > +[Not currently implemented].
> >  .TP
> >  .B RES_USEVC
> >  Use TCP connections for queries rather than UDP datagrams.
> >  .TP
> >  .B RES_PRIMARY
> >  Query primary domain name server only.
> > +[Not currently implemented].
>=20
> pitpicking:
>  the phrase is normally "not yet implemented"

That's not me. We can change it ?

> perhaps you can add as comment what version you have tested to
> give pple a hint where to look.

I have not tested. It is written in code:

https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dresolv/res_debug=
=2Ec;hb=3D44a6213c8eebf3f69712a5fba9a33bbb90a79023#l565

=46or that matter to seek versions, why not just give the version of th=
is
that is implemented. This will be information that does not expires.

> >  .TP
> >  .B RES_IGNTC
> >  Ignore truncation errors.
> > -Don't retry with TCP.  [Not currently
> > -implemented].
> > +Don't retry with TCP.
> > +[Not currently implemented].
> >  .TP
> >  .B RES_RECURSE
> >  Set the recursion desired bit in queries.
> > @@ -238,10 +239,92 @@ domain and in parent domains.
> >  This option is used by
> >  .BR gethostbyname (3).
> >  [Enabled by default].
> > -.PP
> > -This list is not complete.
> > -You can find some other flags described in
> > -.BR resolv.conf (5).
> > +.TP
> > +.B RES_INSECURE1
> > +Accept a response from a wrong server and show it on standard outp=
ut
> > +(for debug purpose only).
>=20
> is there a debug mode switch or is this a compiletime option ?
> this could be of interest for admins that do not want this.
>=20
> just my 2 cents,
>  wh

That's options are always available. The message display is subjected t=
o the
simultaneous use of RES_DEBUG option. However, the commentary and optio=
n name
imply that it is to test security flaws, but at your own risk:

    /*
    * response from wrong server? ignore it.
    * XXX - potential security hazard could
    * be detected here.
    */

I realize that my description may not be entirely fair. It could be :

    Accept a response from a wrong server. Potential security hazard
    could be detected here, but you need to compile glibc with debuggin=
g
    enabled and use RES_DEBUG option.

Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
