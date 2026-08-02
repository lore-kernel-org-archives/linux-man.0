Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEE948987C
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 01:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785632613; cv=none; b=aRnPya3gXJDH9ZxTrRYig3ZQhAkb+GLDB75yk58n8QtQdNvxnmDvXYKDS04spot44EMjbZGY3QC8tXIUIFdyyGQOY8V+jVVImyBTQl5cmKhsnGaSek5rc1zcYZ3s6QSFViRzIqlOnyv5OQm61ktapc697mU23mWMzmWcd+eVby8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785632613; c=relaxed/simple;
	bh=YHaRcCeQv6HW687oIRoT3Bkoaua7baU5aZKgnqHhld4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHLil9odlnlSlY9nqJ0zRL3bPRSyf3CMMnHyYRkt3E5mctiZ5N31EX9NlIT2v/MbHnpWwYtu+kB4nr3xFxdt5W9LLqSszEoahKcnJ2WZ2H62rjJhcxIqdU9E0Zn6ZKLzRMV7ErLECheBlkuvEoj9JXPWa++8D+opOTA1Ce1eSeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4fR7W4W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4fR7W4W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307C81F00AC4;
	Sun,  2 Aug 2026 01:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785632612;
	bh=jJDL4O9WsaMyoCgMsRn7cI8AwVjw4ozX2HBKmMvKHqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q4fR7W4WDf8fBGECvX8mj+qdEFJO0ldqbd1zRX4K5Td7R+qvh5wSWZIPocr2V2eW/
	 AmWQ7y5x4gPAklhICiOuQFuHClpsTxG1NUho+fRbAg+R+pAMNwLhbnoCYTkqdb0FWc
	 y423U/nsd7FfRpKtU/bv/LVsv9ADXRQ/RE1LRiEdaGEV/sfBMNODskptNyPTCY/Tat
	 yjA5hWCZ5UTVyOMjedNbznUXtMZS9bNKUg6z+2HsKX31VJ/ZsP5B0gMzeAckioz+iI
	 v3HPxXm8q1NKDy4EkMdYDuoD1toGOEY7RgDe6LO6X6UHskZua1DLphaGml9/FU06Hf
	 uTCJew4Eb/wGw==
Date: Sun, 2 Aug 2026 03:03:27 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Keith Bostic <keith@bostic.com>, Sam James <sam@gentoo.org>, 
	Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: proposed revision to memory.h(3head) (was: on the
 irresponsibility of pursuing C language reform)
Message-ID: <am6XC0SIJaA5BdQZ@devuan>
References: <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <20260801235332.vc443gozbqkqdqm5@illithid>
 <am6HTtAMkEEkWjfl@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n5n5t4j65mwc3v6f"
Content-Disposition: inline
In-Reply-To: <am6HTtAMkEEkWjfl@devuan>


--n5n5t4j65mwc3v6f
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Keith Bostic <keith@bostic.com>, Sam James <sam@gentoo.org>, 
	Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: proposed revision to memory.h(3head) (was: on the
 irresponsibility of pursuing C language reform)
Message-ID: <am6XC0SIJaA5BdQZ@devuan>
References: <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <20260801235332.vc443gozbqkqdqm5@illithid>
 <am6HTtAMkEEkWjfl@devuan>
MIME-Version: 1.0
In-Reply-To: <am6HTtAMkEEkWjfl@devuan>

> Date: 2026-08-02 02:27:44+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> > Date: 2026-08-01 18:53:32-0500
> > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> >
> > At 2026-08-02T01:24:28+0200, Alejandro Colomar wrote:
[...]
> > > 	 DESCRIPTION
> > > 	+     These functions are also provided in <string.h>, as speci=E2=
=80=90
> > > 	+     fied by ISO C.  This is a historic accident maintained for
> > > 	+     compatibility reasons.  Don=E2=80=99t let that fool you; these
> > > 	+     functions don=E2=80=99t necessarily operate on strings.
> > > 	+
> >=20
> > That's a heavy editorial slant.  I don't think it was a historical
> > accident; it was a historical "on purpose"[1], with which you disagree.
>=20
> [pasted [1] here]
> > [1] As one does with "all the glue", when one doesn't want a "major
> >     award" to be readily repaired...
>=20
> The C89 Rationale document doesn't document this as an intentional
> change (or even as a change at all).
> <https://www.open-std.org/jtc1/sc22/wg14/www/C89Rationale.pdf>
>=20
> I'd certainly be interested in hearing first-hand information,
> if anyone has it.  Maybe Keith would be the best candidate for that.

Actually, s/accident/mistake/ is more correct.  It was most likely done
on purpose, even if unaware of the consequences it would have.  That's
not an accident but a mistake.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--n5n5t4j65mwc3v6f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpul14ACgkQ64mZXMKQ
wqninBAAh7pwUVr1QnNaeeE1wdp0bosWjUfUCYKxhIAr0BBYMBpxXkjODUK01KrQ
d8bTIWGDvv/jN/z5Okt2xCYH5Shg9+u+7VEfkqtKBxhCQxkbu6EA1WkRFNwHJ4lj
fc7f1cM37eD2OzVCtf0B9rHnecoK1d5UHI1veBjl6YNSc9ja9nx+dMYn2wPDTMy9
PQfNEN3pDt4WJSg4dtDcgVUYnjO53nW2l5vr4Y7mXU29R1D5fXvJAYi4hKl+fcU4
7sW5Yk6Ta/qhtT/ArIHnhQWFf7iVKaDAFCDjY6j3cRzcvCJ7VwFidgvS8YkRcvLJ
gEDq9LTNPfx+SbFy8JccF+qaBP/By1pG3RYQSyZe14Pgmi6Dsr+84NQSgj4MyZK4
HNXvyj1j/FU2ebzS+WaHRf5/Us0opb8ZkTpc/u6QdDKHdByEQSUexnHZLaWtGjaj
jE3/XX887bTqNV+1FN+IA5H7StcFmMxpundd3TvLbvZmR+Phq+Q5OE/MGyUceFUY
8+Uipqsh8iQ1nwiaazhdFgIV4NyF4ubX1P5eT9tF+swqBIEIv4PZAlMaw1WFzvDV
gkSzC21IDH2ztJt1K5U51nkq2gjLVuvYEamFRqKDnBKgcpAyRjmv5T/9xjM2APCZ
R7zl08QMr9yDLz4X1cEih+7T1JhjDtJxwY2Z0i5RjYKLXlVQONo=
=eqng
-----END PGP SIGNATURE-----

--n5n5t4j65mwc3v6f--
