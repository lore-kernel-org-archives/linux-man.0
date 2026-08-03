Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43B42ED84A
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766961; cv=none; b=eCLFLjuKHy2GKfHN9spbv5Q3b/i5Cl2B1i6UxuY27EJtehHzAe5WWO/AqnH/d3lMAO9RlC23Y4YEJnFM4sTL2cY0HfGyApoEaZKA20IKSz/iO8x9me+0jjOGQkFjQ+3WW/OigxnmSAIrX8HPipAmJ7XgGt6I6yIn+B2W8+ZzJBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766961; c=relaxed/simple;
	bh=nrQTTAOqVVyagK1F6mSFmJMB98UgFkwELHjiFrysjK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6I31ufkxgjlf76n6Yc5zbXe/KUXh+r3rCHm92I/dn63hV/K1geDKbctqTRLCHtVD98iHp4VU9Nl46+h/jBkD774iK9Wk8mDWm+s3cleWTWubtVSSJCJMLx8zNpU0jOXu3nMB/3hff334efx4TsTwpqFHeRqGRpY99PIqSVXiBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQ7g9YF0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQ7g9YF0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1EC1F000E9;
	Mon,  3 Aug 2026 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785766959;
	bh=kXGfXN9gkyJo40ZvZduZP4HeHaZNJ+cqWXybh39Rz7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RQ7g9YF0IG0I3Y3uI46XmBSYgaN+C5hfbWMb7otll5WgqRbBj0kcGlk6wOkvBP4qx
	 XN/2bRdVCwIqMn/OC87HRetfWcHPHQ7emrNglC+d0RrMV7xkv/Df6SD7fLorKdKCSX
	 nRMjLpESsx8L9tiVobbE6gdqngAArjD4rNWsvp6qC7Q1Yb+NC1tot+3ENm8xK9dswQ
	 ImUazJc0sDbOIcHRuqwpqFPVzsHCzPbxDEIr1Ju2n/vu2+q7U/8n2zRWgMl/tQy6sR
	 k1hcvhLCYnqCqJxQ1m9I3U8JsNbWuiBEv5zIqpChbRea59MHO8+NsSAeKNYrM/AUFG
	 +Tr0aP3i+yC1g==
Date: Mon, 3 Aug 2026 16:22:34 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Sam James <sam@gentoo.org>, linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <anCdgqR5omQWuVwU@devuan>
References: <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <20260801213421.7e3wvyjwmlwxzd55@illithid>
 <am5oWn8dYoP0r2dw@devuan>
 <82eff373-3460-3cff-4ed5-0a04b4fe4fad@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="snpoonxk3fr4u3c4"
Content-Disposition: inline
In-Reply-To: <82eff373-3460-3cff-4ed5-0a04b4fe4fad@redhat.com>


--snpoonxk3fr4u3c4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Sam James <sam@gentoo.org>, linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <anCdgqR5omQWuVwU@devuan>
References: <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <20260801213421.7e3wvyjwmlwxzd55@illithid>
 <am5oWn8dYoP0r2dw@devuan>
 <82eff373-3460-3cff-4ed5-0a04b4fe4fad@redhat.com>
MIME-Version: 1.0
In-Reply-To: <82eff373-3460-3cff-4ed5-0a04b4fe4fad@redhat.com>

Hi Joseph,

> Date: 2026-08-03 13:42:31+0000
> From: Joseph Myers <josmyers@redhat.com>
>
> On Sun, 2 Aug 2026, Alejandro Colomar wrote:
>=20
> > Joseph was concerned that this documentation would conflict with many
> > documents saying that <memory.h> is deprecated.  Luckily, I've never
> > seen such a document, so we can assume they don't exist (unless people
> > show evidence).  I'll dismiss his negative vote, since his technical
> > reasons are incorrect.  Also, <memory.h> is undoubtedly more portable=
=20
> > than a new <stdmem.h>.
>=20
> The glibc manual nowhere mentions <memory.h>.  That's pretty clear=20
> evidence the header is a relic of the days when glibc just took any=20
> interface some 1980s Unix had rather than trying to have a cleaner API of=
=20
> more current relevance.

I don't refute that.  But relics are sometimes useful and reusable.

> My main concern, in any case, is that man-pages should describe the world=
=20
> as it is, not as you'd like it to be; they should follow, not lead, on an=
y=20
> proposed changes;

This has never been true.  I believe Michael did a great job maintaining
them, and that included promoting some APIs over others, even when that
goes against the standards.  See below.

> they should promote portable coding practices and using=20
> existing standard interfaces in the absence of broad consensus (not just=
=20
> your opinion; not just an opinion based on dismissing all the views=20
> against) of a clear technical deficiency in those interfaces; that anyone=
=20
> advocating for an interface change should avoid using man-pages as part o=
f=20
> that advocacy,

I'm not using the manual pages as part of advocating for an interface
change.  I'm advocating for an interface change as a consequence of the
research work I've done to improve the manual pages.

> only eventually updating it after the debate has concluded=20
> once there is consensus on what the conclusion of the debate was but=20
> ensuring the man-pages don't take any one side of the debate before then.

Would you mind expressing your feedback about the fact that str[n]cpy(3)
documented the non-standard strlcpy(3), and suggested that it'd be used
instead?  This is way before POSIX.1-2024 standardized it.  In fact,
POSIX.1-2008 had explicitly rejected these functions.

	commit bb96fc35a3b664ef3959eaefb095608846f89df7
	Author: Michael Kerrisk <mtk.manpages@gmail.com>
	Date:   2012-07-19 11:29:15 +0200

	    strcpy.3: NOTES: Add a discussion of strlcpy()
	   =20
	    Inspired by https://lwn.net/Articles/506530/
	   =20
	    Signed-off-by: Michael Kerrisk <mtk.manpages@gmail.com>

which introduced this text:

	$ MANWIDTH=3D64 diffman-git bb96fc35a3b664ef3959eaefb095608846f89df7
	--- bb96fc35a3b664ef3959eaefb095608846f89df7^:man3/strcpy.3
	+++ bb96fc35a3b664ef3959eaefb095608846f89df7:man3/strcpy.3
	@@ -54,6 +54,14 @@ NOTES
	      to test!)  that the size of dest is greater than the
	      length of src, then strcpy() can be used.
	=20
	+     One valid (and intended) use of strncpy() is to copy a C
	+     string to a fixed=E2=80=90length buffer while ensuring both that
	+     the buffer is not overflowed and that unused bytes in the
	+     target buffer are zeroed out (perhaps to prevent informa=E2=80=90
	+     tion leaks if the buffer is to written to media or trans=E2=80=90
	+     mitted to another process via an interprocess communica=E2=80=90
	+     tion technique).
	+
	      If there is no terminating null byte in the first n bytes
	      of src, strncpy() produces an unterminated string in dest.
	      Programmers often prevent this mistake by forcing termina=E2=80=90
	@@ -67,6 +75,27 @@ NOTES
	      formation contained in src is lost in the copying to
	      dest.)
	=20
	+     Some systems (the BSDs, Solaris, and others) provide the
	+     following function:
	+
	+         size_t strlcpy(char *dest, const char *src, size_t
	+     size);
	+
	+     This function is similar to strncpy(), but it copies at
	+     most size-1 bytes to dest, always adds a terminating null
	+     byte, and does not pad the target with (further) null
	+     bytes.  This function fixes some of the problems of str=E2=80=90
	+     cpy() and strncpy(), but the caller must still handle the
	+     possibility of data loss if size is too small.  The return
	+     value of the function is the length of src, which allows
	+     truncation to be easily detected: if the return value is
	+     greater than or equal to size, truncation occurred.  If
	+     loss of data matters, the caller must either check the ar=E2=80=90
	+     guments before the call, or test the function return
	+     value.  strlcpy() is not present in glibc and is not stan=E2=80=90
	+     dardized by POSIX, but is available on Linux via the
	+     libbsd library.
	+
	 BUGS
	      If the destination string of a strcpy() is not large
	      enough, then anything might happen.  Overflowing fixed=E2=80=90
	@@ -82,4 +111,4 @@ SEE ALSO
	      bcopy(3), memccpy(3), memcpy(3), memmove(3), stpcpy(3),
	      stpncpy(3), strdup(3), string(3), wcscpy(3), wcsncpy(3)
	=20
	-GNU                        2012=E2=80=9007=E2=80=9018                 STR=
CPY(3)
	+GNU                        2012=E2=80=9007=E2=80=9019                 STR=
CPY(3)

That commit was itself based on the LWN article it metions in the commit
message, and it contained a number of comments
<https://lwn.net/Articles/507319/#Comments> that cautioned that
strlcpy/cat(3) might not be the best interface, and I'd say there wasn't
consensus either back then.  There will never be consensus on this
topic, I believe.

Yet, some things have to be done.  Mistakes may be made when doing this,
and they should be eventually addressed.  But manual pages should not be
a copy of the standards.

If we go back further in time, man-pages-1.0 --the very first release,
in 1993-- already documented that gets(3) should never be used.  This
was certainly to the contrary of the existing standards, and indeed was
leading the removal that came later.  That page was written by
Thomas Koenig.  I don't think Thomas was wrong doing that.

Past times often feel better, but that's nostalgia, and often not based
on facts.

> I suggest we need to figure out how to generate man pages from the glibc=
=20
> manual so that people who prefer documentation in that format can have=20
> documentation of glibc interfaces that's maintained by a proper consensua=
l=20
> process rather than following one person's opinion.

The Linux manual pages are not strictly the glibc manual.  They also
document musl, for example.  Also, I believe it's good that it's
independent of glibc and GNU.  That puts a degree of criticism that is
necessary for avoiding endogamy.  Let's say it's a separation of powers.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--snpoonxk3fr4u3c4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpwpCQACgkQ64mZXMKQ
wqnF4A/+PzbyDQoPWCA0ulewRSeoSTA41CvR2xpJ8x3dARdStkcu5/64TybdxQ0b
Uc+l4hXjiGyrH3v08ZlSYhb3g8ja6Y1UlfCEN2o7/v9HEQXGbBaCpTReCGwPQ14O
R25V5VfeyhFtMvzYI2Ig18mdCv7B1+dBOfRoXMXYqrPhsGYi7MWfB9d5Ac4wv72P
j2SEbqAgWdKow9Ni+ppbx3JXrfBYteAdAgH2jUwtBU9PDbm8IuJJPJe8b1Sa1VxP
vttCzjYGr8poY2YoZCWcBGBP9oHrFEB42fRhN7od8gCDE2GJV2gkHxWf9xtFRxBm
mBbZ8UcgtEV/JjUw969fxGiVWQ22bJoyMtGgGdmXvr3jmGEr3ueXmCp4xZDoFKsK
fFkBpvDATh/VsstE7Ishkpddm8COK6gRCp/Wz3kukMgvVKZMCa7662xGtoeRDMX7
aTEIJkMwfS4r1dYxQDZnyv4HOo1WPNQt/g5ua0RS2l0tlPYPvc6FF0ojxZxK7vEu
OMuR9cWC8fQChco2h/RBVF0DEQfgBCqX1+Eb22DT+geFbH/ltF8np57df0A4f89/
/6FVZm/8nLoe/FImvd9/oZtWtdpdlU2zcJp7znktjyaSYpPbF45kh209xSsIATZf
8DUFOIf0gEvlYayaPho6/cldib3FDIVEnI84B6CA36Cs5YonWOw=
=ypni
-----END PGP SIGNATURE-----

--snpoonxk3fr4u3c4--
