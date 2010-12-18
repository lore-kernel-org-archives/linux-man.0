From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: Re: [PATCH] Typos in man2/getrlimit.2
Date: Sat, 18 Dec 2010 22:48:22 +0300
Message-ID: <20101218224822.4e3478ae@keeper.home.local>
References: <AANLkTi=XkLN+t5iFT+uretO7V=p1mZnazH++DfFm42WK@mail.gmail.com>
	<AANLkTinoHfyBS=aoWfQhugxAV3DZva0W4Vy9y0rPCvh9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinoHfyBS=aoWfQhugxAV3DZva0W4Vy9y0rPCvh9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

=D0=92 Fri, 3 Dec 2010 06:52:19 +0100
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:

> Hello Denis,
>=20
> On Mon, Nov 29, 2010 at 9:20 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> > Hello,
> >
> > Here are the last bits against ea03a3a.
>=20
> Thanks. Applied for 3.22.

Still here, 3.32

http://git.kernel.org/?p=3Ddocs/man-pages/man-pages.git;a=3Dblob;f=3Dma=
n2/getrlimit.2;h=3D52f99ab204993e981000da39842bdbc32788b6b2;hb=3Dc84860=
e9ca1c89bfc42591d3320e568d4656f1d4

> > @@ -551,7 +551,7 @@ main(int argc, char *argv[])
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 newp =3D &new;
> > =C2=A0 =C2=A0 }
> >
> > - =C2=A0 =C2=A0/* Set CPU time limit of target prcess; retrieve and=
 display
> > + =C2=A0 =C2=A0/* Set CPU time limit of target process; retrieve an=
d display
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0previous limit */
> >
> > =C2=A0 =C2=A0 if (prlimit(pid, RLIMIT_CPU, newp, &old) =3D=3D \-1)
> >



--=20
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
