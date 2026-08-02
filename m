Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F710224F3
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 01:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785633345; cv=none; b=Serr3+MGb/eArpNRrFgZfwNIbCQVXMIbC0Z+JI8z8U1FPXxdA+Ng4OHafZUl1vk3pMQL+238cFLnHm2V5ejZubNN/iwb7EGrZjoE5QKs41viGhR6CYC1cX3DlfEGuOWvM/7xt3aGgdF4j/hPRO5TVDXoWqrdWhYW4S39jLzgAp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785633345; c=relaxed/simple;
	bh=0NMuvurA3BUG3RB4zFsgN/DDMoJkWK9ESRBbdHu2jd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZ8uHCwV6EVgeKXHmJP8MH0/11XpgLwtMjkH59BhwiU83fv5+Cw0fHIKPz549rq92HT0YQDUeUEcdaUGpFx4B6P+aBtaELDmg7AL4hjTsv82TRDu31XHUVA7j+oe4L77cPsSPs6hmCLNUn/AwkmK11SddXOUuw77btGBd398TGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3BmpULt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3BmpULt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D841F00AC4;
	Sun,  2 Aug 2026 01:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785633343;
	bh=JtXNua+Bflk9qKVR81FuFPVq56PlfhndYmBAsRJBQ9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l3BmpULt0pijacIuaqxeWFizUxGrLNN1OTvoBsDGJ1J7PlN1Dv+0gEEPxbypw+v8o
	 6FbgGMeMLhn4GiWkpoh2UsI4oepwUsXboKQrBtUXSksWVUuLckSxiI+bE8q7tbg9wW
	 lMQGZeZ5XMXUfePmapqVUYxuNQT+8RszRYHarqUtxb7tVc43PDTIGdXajb1YbFGOMb
	 qBIgpe4ME7xixbdvjXWzB3D3PzCctUQxUSqomVsEIGekoysEwzP03Ttiqu7RDznfKE
	 MMQZ2urLUR6uCLrn8oQcyY2ziyPatXRxkOHd/k/0S/5XStU4nGKHzAcst4CkrC88Zj
	 bGTeo6HgmL63g==
Date: Sun, 2 Aug 2026 03:15:40 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am6X32HkGdm2xTd7@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dc6t2tdjnufilo5h"
Content-Disposition: inline
In-Reply-To: <87cxw1s58a.fsf@gmail.com>


--dc6t2tdjnufilo5h
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am6X32HkGdm2xTd7@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <87cxw1s58a.fsf@gmail.com>

Hi Collin,

> Date: 2026-08-01 18:04:05-0700
> From: Collin Funk <collin.funk1@gmail.com>
>
> Alejandro Colomar <alx@kernel.org> writes:
>=20
> >> I'd like to underscore this point.  As I noted in my response to Doug,
> >> the flagship book on C, as we all know, is stuck in 1988.  The throne =
is
> >> vacant, with many pretenders, some with excellent cases for service as
> >> regent.
> >
> > In fact, the throne might currently fall in the Linux man-pages project.
> > While not being a blood heir of the Unix standards, it has become a
> > de-facto standard.
>=20
> I don't think anyone is arguing whether or not man-pages is an
> educational tool. The argument is whether it should educate based on
> current standards, or the maintainers preferences.

I'm not innovating if I say that the standards are mostly ignored.
Actually, I am more in the side of following the standards as much as
possible and appropriate (but not more) on average.

This is just a case where educating on the current standards is done by
1) documenting at the bottom of the manual what the standard says, and
2) recommending to ignore it because it's bad.  When the standards are
bad, this is appropriate course.

The manual pages should certainly educate about reality, and standards
are only secondary to that.

This reminds me of realloc(3).  That's a perfect example of educating
based on current (and withdrawn) standards.  And the education might
very well consist of saying "don't listen to the standards in this case;
they're bad for you".

I expect we'll be able to fix realloc(p,0) eventually, and Microsoft is
working with me on that.


STANDARDS
	...

   realloc(p, 0)
     The  behavior of realloc(p, 0) in glibc doesn=E2=80=99t conform to
     any of C99, C11, POSIX.1=E2=80=902001, POSIX.1=E2=80=902004, POSIX.1=
=E2=80=902008,
     POSIX.1=E2=80=902013,  POSIX.1=E2=80=902017,  or  POSIX.1=E2=80=902024=
=2E   The  C17
     specification  was changed to make it conforming, but that
     specification made it impossible to write code that  reli=E2=80=90
     ably  determines if the input pointer is freed after real=E2=80=90
     loc(p, 0), and C23 changed it again to make this undefined
     behavior, acknowledging that  the  C17  specification  was
     broad enough, so that undefined behavior wasn=E2=80=99t worse than
     that.

     reallocarray() suffers the same issues in glibc.

     musl  libc  and  the BSDs conform to all versions of ISO C
     and POSIX.1.

     gnulib provides the realloc=E2=80=90posix module,  which  provides
     wrappers  realloc() and reallocarray() that conform to all
     versions of ISO C and POSIX.1.

     There=E2=80=99s a proposal to standardize the BSD behavior: https:
     //www.open-std.org/jtc1/sc22/wg14/www/docs/n3621.txt.

HISTORY
	...

   realloc(p, 0)
     C89 was ambiguous in its specification of  realloc(p,  0).
     C99 partially fixed this.

     The  original implementation in glibc would have been con=E2=80=90
     forming to C99.  However, and ironically, trying to comply
     with C99 before the standard was released,  glibc  changed
     its  behavior  in glibc 2.1.1 into something that ended up
     not conforming to the final C99 specification (but this is
     debated, as the wording of the standard seems self=E2=80=90contra=E2=
=80=90
     dicting).

=2E..

BUGS
     Programmers  would  naturally  expect  by  induction  that
     realloc(p, size)  is  consistent  with  free(p)  and  mal=E2=80=90
     loc(size),  as  that  is the behavior in the general case.
     This is not explicitly required by  POSIX.1=E2=80=902024  or  C11,
     but  all  conforming  implementations  are consistent with
     that.

     The glibc implementation of realloc()  is  not  consistent
     with  that,  and as a consequence, it is dangerous to call
     realloc(p, 0) in glibc.

     A  trivial  workaround  for  glibc  is   calling   it   as
     realloc(p, size?size:1).

     The  workaround for reallocarray() in glibc =E2=80=94=E2=80=94which sh=
ares
     the         same          bug=E2=80=94=E2=80=94          would        =
  be
     reallocarray(p, n?n:1, size?size:1).


Have a lovely night!
Alex

>=20
> Collin

--=20
<https://www.alejandro-colomar.es>

--dc6t2tdjnufilo5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpumjYACgkQ64mZXMKQ
wql+9w//QkQoSjdTnpK8K2UETHKd53PBCshnQ92HhtWKg3nBXxigh8Mddegv1OaJ
ZyAPNsOdhnosEAa/IaPP/JDKE4gN2d0J04zsMQUdZwbTdMcbSRO+7ckmwpK0iQ5r
vhhI/iSmH3KYtQg2b+NDn847S+/ct0AwJiON+WZq5fNzjACnIQzAY9Cg0GCywN7A
DDG8ipvlHhdJf6XTl5fItpy4/+XC9nA9uoncnuqPVrc6Xmj7N/eX2mdBdoZayasV
zh042IH0i2gkdNiTbZXmSNmTLeIcgpqwzwRrniGPb7/Yr3xI6f0SbbWABQZroBib
PNzSq+ZroL2Vvpep9DZ7g7QZEDan7nGASTmHvFB0iKOPwnaqjCxxYIpCezEqHevo
eNS/9CForE9abhM0qoIe4p9NRGhHq4ruSMD1zy8nocPIhIoZh3U+ezmWXV7T32Uy
dz/A00O9rpcrNCOXCSpYnxadtmwmDLr3VVYu3N5u30utNNvdg9z869beT9BU+Kl2
niFx6vhYhO7benWDbY1XB/z9lO90Z5G0aSUEYxpLr5HzkbsgD9hHhSLLsLc7f9Tm
3O+PTWwe217/fNr5vBLMlYJVtyXTK4IMKI1kF2nyuK/TSjkf/9ZcsUR7OIpJsUiY
0dFaBhPfiDe9c8aaL4liBYvmrQxpkH7OIIhAHWrUEYDugxZysww=
=ImLf
-----END PGP SIGNATURE-----

--dc6t2tdjnufilo5h--
