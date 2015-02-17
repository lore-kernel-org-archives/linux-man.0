From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] syscall.2: add arm64 and mips
Date: Mon, 16 Feb 2015 23:02:47 -0500
Message-ID: <20150217040247.GA4400@vapier>
References: <20150118072204.GA12237@www.outflux.net>
 <20150215104609.GF32251@vapier>
 <54E0B77E.5090306@gmail.com>
 <20150215175107.GC3910@vapier>
 <CAGXu5jKyt2ZsFLhYrQpWfTWdipHYyCy1En3FObxYqxHuiLGgGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGXu5jKyt2ZsFLhYrQpWfTWdipHYyCy1En3FObxYqxHuiLGgGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16 Feb 2015 11:30, Kees Cook wrote:
> On Sun, Feb 15, 2015 at 9:51 AM, Mike Frysinger wrote:
> > On 15 Feb 2015 16:13, Michael Kerrisk (man-pages) wrote:
> >> On 02/15/2015 11:46 AM, Mike Frysinger wrote:
> >> > On 17 Jan 2015 23:22, Kees Cook wrote:
> >> >> --- a/man2/syscall.2
> >> >> +++ b/man2/syscall.2
> >> >> @@ -36,6 +36,8 @@
> >> >>  .\"
> >> >>  .\" 2002-03-20  Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> >> >>  .\"       - adopted for Linux
> >> >> +.\" 2015-01-17, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> >> +.\"       Added mips and arm64.
> >> >>  .\"
> >> >
> >> > can we scrub changelogs from the man pages in general ?  they're usu=
ally
> >> > incomplete and rarely provide more than `git log -p`.
> >>
> >> Yes, I tend to discourage them these days, but don't always worry too =
much if
> >> someone adds them to  patch.
> >
> > in this case, i think Kees was following apparent convention rather than
> > thinking he always add one.  so i'm suggesting we help out at least the
> > people who are just trying to DTRT by scrubbing the tree of existing on=
es
> > that aren't useful.
>=20
> Yeah, I tend to try to follow the convention in the file. It's wasn't
> clear what to do. I'm happy to send a patch to wipe my entries, if
> that's desired.

i don't think we need to make you do that one off :).  if Michael is happy =
with=20
scrubbing the code base, lets go that route.
-mike

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJU4r1nAAoJEEFjO5/oN/WBaq0QAILUWwdiEuh/YLVjXL1ZAx4V
l0OAkFRg4ASUtcs7zghzapwNiuLjhFU+fe7PE5tAPujEeyxKgd7bonqDYfuC5Aai
usU6+asbaxZsR2Sb+NcI+u7jaEfvJHTGPTf//sFj1sNwwfNAK6g8fh3Epj/8EA4g
LCcn8EDpT82UzHGdn7QZXnFZ53qefHCX9qvAXSZl0Gl86vbqel0XAinDuVg6fT+u
1JPggWDhFUgkG6olMvqKN9EcAPPziI2ahcufXytEfv3t8Kx7WlK60ZnMDAXB5QE0
proq7Od+CNny4XVMoNzNxpSbkISRi54Wj4e3B1Pvvf9+2r8cVHaRYCG3FVpG0GZP
q/GP7O0f3X0lQjCg0ZRYrc1orjF1ylGdQ7JAUmoQ4ueVbFqckNYWPqNpSHZVEEG2
wpklZYivbB/Vt0dBet263XR2ovBZ9mFjoZcEVEmfZZoeLJ4giQzzh1ZNYtuFRp4g
M7HlWv3szvVRfjwFJgKux3Q43mG6ZSU+ynIH5yAhTV9jWxtOn++sA3MxmOq7FbEq
L69jOGLIqqnRmj81RZOvtegFwVJa4tdWaCJhIPRMhnDQzu+lI3O3BX5Yyce5VcTt
NwYNZRkNuPAf+AGDsaA8IhVntEibR06BHqnv16HaQq55NYLSeC/twI9RUMpeAbdR
4JVaGBVePl2bi2SfFiyh
=k46Q
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
