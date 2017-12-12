From: Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] vsock.7: document VSOCK socket address family
Date: Tue, 12 Dec 2017 09:23:10 +0000
Message-ID: <20171212092310.GA6985@stefanha-x1.localdomain>
References: <20171205105618.30049-1-stefanha@redhat.com>
 <cce43383-f42d-3c46-a34a-26e1c6a82af9@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cce43383-f42d-3c46-a34a-26e1c6a82af9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jorgen Hansen <jhansen-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dexuan Cui <decui-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2017 at 08:32:20PM +0100, Michael Kerrisk (man-pages) wrote:
> On 12/05/2017 11:56 AM, Stefan Hajnoczi wrote:
> > +Data is transferred using the usual
> > +.BR send (2)
> > +and
> > +.BR recv (2)
>=20
> Or equally, write(2) and read(2), right? By failing to mention those, the
> text subtly implies that send(2) and recv(2) are preferred, but I don't
> suppose that is true.
>=20
> > +family of socket system calls.

Yes, this file descriptor is a socket so write(2) and read(2) work.

I said "family of socket system calls" to avoid listing all the
variations of send(2), sendmsg(2), sendfile(2), sendmmsg(2), etc but I
guess that doesn't include the read(2)/write(2) family of syscalls
(readv(2)/writev(2)).

Will send a follow-up patch to clarify this.

> > +.B EOPNOTSUPP
> > +Operation not supported.  This includes:
> > +the
> > +.B MSG_OOB
> > +flag that is not implemented for
> > +.BR sendmsg (2)
> > +and
> > +.B MSG_PEEK
> > +for
> > +.BR recvmsg (2).
>=20
> So these errors might also occur for send() and recv(), right?

Yes, I'll change this to "the send(2) family of syscalls" and "recv(2)
family of syscalls", respectively.

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaL5/+AAoJEJykq7OBq3PI3F4H/ibKA82QuqJnX9333umdki/i
TtD2at/nIXXN/id1jLQ0uuVzny7GfEJnNXfBXEhDPfrfjRRmfAZRJGhvTV5uoJGv
FQeXT+tKVuHtPXuqXbuSxB3ZP0V2/PNtJzLvPznPIdBSWJakz5Az6OnbvMH5rOdi
icc10L57YTnWoE0TEYLpPyaZbXLt8qn1eHTIxSbqflyCYAY0AGWFsdSmrC4h1Ttr
p1qA537h9YvQuyJzZo3gpsJ5vQ6LiwjrJhfr0/psf+lwhgdAXqq8xDwdkmJUKA6f
rkJf1sy3kv70Q8yxyL4oqHXGpLh778W59poOnW3FO0xpg/Ss9crXyrRQwvigRTU=
=outN
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
