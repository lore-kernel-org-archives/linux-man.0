From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: Re: small improvement for mbind.2 (more)
Date: Tue, 19 Oct 2010 16:33:47 +0400
Message-ID: <20101019163347.3f095af9@keeper.home.local>
References: <20101019104022.062a4205@keeper.home.local>
	<AANLkTi=dJ6qH126JC0Sz6S2vRbc0KdvEuP2xJdQZ0Qdv@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=dJ6qH126JC0Sz6S2vRbc0KdvEuP2xJdQZ0Qdv-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

=D0=92 Tue, 19 Oct 2010 12:38:39 +0200
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:

> Hello Yuri,
>=20
> On Tue, Oct 19, 2010 at 8:40 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wro=
te:
> > Hello.
> >
> > --- man-pages-git/man2/mbind.2 =C2=A02010-03-26 17:46:41.000000000 =
+0300
> > +++ /tmp/mbind.2 =C2=A0 =C2=A0 =C2=A0 =C2=A02010-10-19 10:38:48.000=
000000 +0400
> > @@ -48,11 +48,12 @@
> >
> > =C2=A0If the memory range specified by the
> > =C2=A0.IR addr " and " len
> > -arguments includes an "anonymous" region of memory\(emthat is
> > +arguments includes an "anonymous" region of memory \(em that is
> > =C2=A0a region of memory created using the
> > =C2=A0.BR mmap (2)
> > =C2=A0system call with the
> > -.BR MAP_ANONYMOUS \(emor
> > +.BR MAP_ANONYMOUS
> > +\(em or
>=20
> Usual typesetting usage in English is not to surround em-dashes with
> spaces, so I didn't apply this piece.

Ok. I didn't know it.

--=20
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
