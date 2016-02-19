From: =?utf-8?Q?St=C3=A9phane?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: clearenv(3): implies that it's a security tool
Date: Fri, 19 Feb 2016 17:43:57 +0100 (CET)
Message-ID: <897576803.90721840.1455900237078.JavaMail.root@zimbra51-e8.priv.proxad.net>
References: <20160219162222.GB14410@alcor.net>
Reply-To: =?utf-8?Q?St=C3=A9phane?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160219162222.GB14410-GlOw+ZFk85JeoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Zimmerman <mdz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, control-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
Cc: Michael Kerrisk  <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 679323-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

tags 679323 + fixed-upstream
stop

-----

Will be fixed in man-pages-4.04.

See commit c66649c83598652222ff2a464e5b82284e6b1acf=20
by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 2016-02-19 12:04:51 (GMT)

https://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/man3/cl=
earenv.3?id=3Dc66649c83598652222ff2a464e5b82284e6b1acf



----- Matt Zimmerman <mdz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> a =C3=A9crit=C2=A0:
> On Fri, Feb 19, 2016 at 12:59:05PM +0100, Michael Kerrisk (man-pages)=
 wrote:
> > On 18 February 2016 at 21:34, Matt Zimmerman <mdz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote=
:
> > > Thanks for following up.  My recommendation is to say something l=
ike:
> > >
> > > This function DOES NOT securely erase the contents of the environ=
ment.
> > > Security-conscious applications which need to do this should use =
=2E...
> > > instead.
> >=20
> > So, I think this report is a little confused, but mainly because of
> > the poor description in the man page.
> >=20
> > The security-conscious applications in this context are those that
> > want to precisely control the environment passed to an exec()ed
> > program. clearenv() cannot, indeed must not, try to erase the buffe=
rs
> > containing the environment definitions. (See putenv(3) to understan=
d
> > why.) I've adjusted the man page in away that I hope explains thing=
s
> > better:
> >=20
> >        The  clearenv()  function  may  be  useful  in security-cons=
cious
> >        applications that want to precisely control the environment =
 that
> >        is  passed  to  programs executed using exec(3).  The applic=
ation
> >        would do this by first clearing the environment and  then  a=
dding
> >        select environment variables.
> >=20
> >        Note that the main effect of clearenv() is to adjust the val=
ue of
> >        the pointer environ(7); this function does not erase the con=
tents
> >        of the buffers containing the environment definitions.
>=20
> Yes, that's much clearer, thank you!

Case classified, thank you for your help Matt and Michael!

Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
