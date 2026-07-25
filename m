Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BB23176EF
	for <linux-man@vger.kernel.org>; Sat, 25 Jul 2026 22:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785017364; cv=none; b=P/4LKsgtT3O5jP2MDNf2kDB9Qsp1s4N2tuMoCW/RmdMXRdUAyQk+RE/X19CiAa5QiraN/AoIW3k0TiYF+hC0LM/mG4bg2F0eyTvUYIvcU2hBjRtRMIGAecCvVUbsIl6my422Y0I1glETua9+Nj27sL8+CUvrCN0Gl0TeMyC3NQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785017364; c=relaxed/simple;
	bh=spj/N0nbAhs9b/kFZ586vQZFSXRgCotO6srjTF/Zsvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKT+9zCqZwq4+HK7IbDV+UqZ22ViUsodLsnaFKpGl7fYXGP17F1jvQsEkj2JkuzTxB8UDgNnRZk+uHSynW7EB/TOM+2RMzeOGRsIdioFK9Qe57XzdyI7fca3xryO1j1QhFxZBKz+rW9lcGe15DtLNHG2WMXKDvcZOB0yItxcPYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aexEkQOs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aexEkQOs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9061F000E9;
	Sat, 25 Jul 2026 22:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785017362;
	bh=NncVJ2bjcdbQiGphBrJmDGk4v+1m0HMR60kAjG7M6b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aexEkQOsy9ll2SMGVapyzcZHsySNPddot+KMLUMNa7hTfoolkIBs0ciGAd2BwVnDl
	 /LOwRfUOWDeqC7RKTQAfepGL6m0l6htBAZ1kZv2TkjZyc0Beim6LnJ4yC1Szr5DQB7
	 CodUu7xV3EuG3puPvQxPRY3r3wp6xIv6D0wc3BqARbeT/fKfyDytxWPyr1WeiE7SE8
	 wWwnaYIyrGSbtRCPu7ryMoteZtZqp+mvIuGBt/SzGR6eJXmep/WJ+6k41Zg55F1cgC
	 ORqkK0GDDpTDSEqEpAeVQZR86VkUF5uJ09VNdY26+rK3+oBnE5By2b6GcdqCvzfSW7
	 gYvqrEaXgI5Ww==
Date: Sun, 26 Jul 2026 00:09:19 +0200
From: Alejandro Colomar <alx@kernel.org>
To: sergeh@kernel.org
Cc: linux-man@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>, 
	Mark Harris <mark.hsj@gmail.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: [PATCH v2 1/4] man/man3/str*.3: NAME: Explain the names
Message-ID: <amUw8ArFwmnsIKl1@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5wt5ok3jpzvi3d5"
Content-Disposition: inline
In-Reply-To: <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>


--z5wt5ok3jpzvi3d5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: sergeh@kernel.org
Cc: linux-man@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>, 
	Mark Harris <mark.hsj@gmail.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: [PATCH v2 1/4] man/man3/str*.3: NAME: Explain the names
Message-ID: <amUw8ArFwmnsIKl1@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
MIME-Version: 1.0
In-Reply-To: <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>

Hi Serge,

On 2026-07-24T13:52:10-0500, sergeh@kernel.org wrote:
> On Wed, Jul 08, 2026 at 05:09:10PM +0200, Alejandro Colomar wrote:
> > Reported-by: "Serge E. Hallyn" <serge@hallyn.com>
> > Cc: Mark Harris <mark.hsj@gmail.com>
> > Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
> > Signed-off-by: Alejandro Colomar <alx@kernel.org>
>=20
> Most of these look good to me, just a few notes:

Thanks!

[...]
> > @@ -6,7 +6,7 @@
> >  .\"
> >  .TH strdup 3 (date) "Linux man-pages (unreleased)"
> >  .SH NAME
> > -strdup, strndup \- duplicate a string
> > +strdup, strndup \- string duplicate
>=20
> string [bounded] duplicate
> maybe?

I think for consistency with the other strn*() functions, the following
would be better:

	string [nonstring] duplicate

[...]
> > @@ -6,7 +6,7 @@
> >  .\"
> >  .TH strfry 3 (date) "Linux man-pages (unreleased)"
> >  .SH NAME
> > -strfry \- randomize a string
> > +strfry \- string fry
>=20
> Maybe at least 'string fry (randomize)' ?  Because while stirfry
> is amusing, it's confusing if you haven't heard it before.

Hmmm, randomize seems to generous, and one may think it is kind of
a shred(1), while it isn't.  Maybe 'string fry (reorder)'?

[...]
> > @@ -5,10 +5,7 @@
> >  .\"
> >  .TH strncat 3 (date) "Linux man-pages (unreleased)"
> >  .SH NAME
> > -strncat
> > -\-
> > -append non-null bytes from a source array to a string,
> > -and null-terminate the result
> > +strncat \- nonstring catenate
>=20
> why nonstring?  The source string doesn't *have* to be a string,
> but can be, right?

Yup, it can be a string, although it would be useless (if you want
a string, you can use strcat(3)).

>  (IIRC, you define a nonstring as an array
> of given length that doesn't necessarily end in \0?  I could be
> mis-remembering)

Yes, a nonstring is a character array that doesn't necessarily end in
\0.  That's why a string is a valid nonstring, but not the other way
around.

> string bounded concatente maybe?

Nope; that's what makes people misunderstand these functions, and
confuse them with safe truncating functions (e.g., strscpy(9)).

I'll send you a copy of a paper I'm writing for the C Committee.

> I think it helps the quick association in the mind if the start
> of the string matches more closely (str).

In this specific case, it's not a good idea.  strn*() are NOT string
functions.

[...]
> > @@ -6,7 +6,7 @@
> >  .\"
> >  .TH strnlen 3 (date) "Linux man-pages (unreleased)"
> >  .SH NAME
> > -strnlen \- determine the length of a fixed-size string
> > +strnlen \- nonstring length
>=20
> string bounded length?

Nope.  It doesn't handle strings.

[...]
> > @@ -6,7 +6,7 @@
> >  .\"
> >  .TH strpbrk 3 (date) "Linux man-pages (unreleased)"
> >  .SH NAME
> > -strpbrk \- search a string for any of a set of bytes
> > +strpbrk \- string search characters
>=20
> does the p stand for returning pointer?

<https://stackoverflow.com/a/501005/6872717>

People say it was "string pointer break".  It was a weird name, and
I ignore why they called it like that.  It seems to come from 4.3BSD;
blame them.  :)

I expanded it as if it were called strchrs(), which is what it should
have been called.  It's also the name used in Plan9 internally (in some
cases).


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--z5wt5ok3jpzvi3d5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmplNAkACgkQ64mZXMKQ
wqkODBAAsTuT0ERd/Ui9lkerfkkXTYneVe2/I5zQXQD6LZ+NhN+bzJE+lmi/9vBI
PacVWy7nWnD63fUI4VNBSekQZtMnL9HpGxETdwDnzsDHK+4b8zjXH0usglDtUkPl
WxaHMd74ZB60NfZp6B2zdolq4rMy0/xPT+31fBPGiC3OvZMGQ0aRj6Pr/uABj7AX
Fdyc/8gBA+gTYQv7TZ5AwhDm6bWBCYyWgpcZWCGIaWxCOo1CmfNpW/Il71GEqIgr
G9qfYN4NvDhA0pTvIrjM9pxU7zZPyeG4V2ko/6dIOR9E16x/RBtrX89sqXtRQY9I
Havd4A6OU3h1aG2YLisMMFFo/8WK8KntgmPmuz8Rb0Ui6gOo/fcgx5+y4OAFnTGu
95bbsB2uxeGpc67nj0zI1459LGRbY+JLALvi02cjev5NZP4sWpURG4vijuMfYm8U
jy9J8W1Q9tC6VemKpSklULDb3pE29AFgBgeT8q6CUaiOlOlLIcy4BXWWHyWI9xcp
5yagaSUY//MMp/4W2oZycG1jpRoGNvFbe+ZFUprLP7bZEtUgPxYWKWMkG/bZTfdX
PlcnGR9jAU/wbVFMIB1S5TZlUvJUztKA6wq8gG8jlhZbvNls6awM1fO6nRzZfCYd
3I0FqMPpBoeRh6dxKTz7TSQk4AOwGix8KtSOeTwpSD3qSjXrWCI=
=/e8/
-----END PGP SIGNATURE-----

--z5wt5ok3jpzvi3d5--
