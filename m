Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD2356777
	for <linux-man@vger.kernel.org>; Tue,  4 Aug 2026 12:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845569; cv=none; b=r+fBwcJmjnkB1MjCSZ3wn3vnZPwT0aXwVZXRM/4n9X8EZguOI+gQMRx0iAD7F6PnCKOcLT+95bBBAM7l0WOsTC5tQ0ZBaUYr0kwdv+Gj1wVpnDfSfOlZG08RSb9ag1AddWVVYuN8vhyrZgY7IM/mxcxrruUWmKe82EEKBQPltKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845569; c=relaxed/simple;
	bh=pDEXhwXsrMKByIUnjmwebTxA61P29A9qPjClZmFkuws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikGw91gvJlcqWhvEFKdJcaN8k0X/7a1Ut7HCUkNW6AolAWA0yszrHpyDPjZDFC8UwbxOSKDEGeKb2cTDnu9npwHnVJ4/XjB87bL9TXrAoE5uQ4S6E488UavziWO1exKC5csZx+Wz+3xj7Fpb2Ghzf2qMAP/brRCh6eWQBgd3x8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+IjzON3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+IjzON3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E3F1F000E9;
	Tue,  4 Aug 2026 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785845567;
	bh=IOhlA0rmRWJeLFQ7AnT13VlGVOUNxSluCyVytURlZNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e+IjzON3Sg4eyqGKnaWxiEPZCikjT+9JmZ/+AvVMvcRoDPizg7kpPtG9N1gdzUYwu
	 OUsyPQrmhyw6yBQUURRWJnl3BiMG3nSVp0Qx4FjXPXxn+kp1EFRkr6i+lpVRDY2WcH
	 WELSSvIS/YtO29XgCrBLsUJg1SQGmK7DaELC8fBWrnIhLHRZSqfFEaG0YkvPYo4MzR
	 950v6Q8olOyelbSvmyjGU1lMFPfYgr4N9q8/L0dxmiSSOzX5KHr7HNGWoyXCSvO7yL
	 c+GFtXmuqqFPJY8hY0FB1i4LOnrPBOtgi7PxRhIsEOdfhBUfUnI+3yUao9NxkyOSdk
	 T6sX+ICdDI8dA==
Date: Tue, 4 Aug 2026 14:12:42 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anHVx-xWLmL7SPyM@devuan>
References: <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <87h5lb9u8d.fsf@gentoo.org>
 <8733wusj68.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5sektlshxedjgsgn"
Content-Disposition: inline
In-Reply-To: <8733wusj68.fsf@gmail.com>


--5sektlshxedjgsgn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anHVx-xWLmL7SPyM@devuan>
References: <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <87h5lb9u8d.fsf@gentoo.org>
 <8733wusj68.fsf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8733wusj68.fsf@gmail.com>

Hi Collin,

> Date: 2026-08-03 19:39:43-0700
> From: Collin Funk <collin.funk1@gmail.com>
>
> Sam James <sam@gentoo.org> writes:
>=20
> > Alejandro Colomar <alx@kernel.org> writes:
> >
> >> Hi Collin,
> >>
> >>> Date: 2026-08-02 16:27:21-0700
> >>> From: Collin Funk <collin.funk1@gmail.com>
> >>>
> >> [...]
> >>>=20
> >>> I can't help but wonder of what happens in WG 14 rejects this
> >>> controversial, as obvious by this thread, change. Will the man-pages
> >>> changes be reverted? Or will we slowly watch them document personal
> >>> preferences instead of existing standards?
> >>
> >> This patch set is quite independent of the standard.  It documents a
> >> header file that has been provided since forever in glibc and most oth=
er
> >> POSIX-ish systems, so changes to the standard are unlikely to have any
> >> effects.  I've clarified this extensively.  If you want to discourage =
me
> >> from applying the change, you should rather bring up technical reasons.
> >>
> >> This passive-aggressive message is not something that will have the
> >> desired effects you could possibly reach with technical arguments.
> >
> > I didn't read it as passive-aggressive, but I will say that I think
> > you've gone a bit hard in the responses to Collin in this subthread, and
> > I think the fact you sent several followup emails to yourself indicates
> > perhaps things got heated in the moment.
>=20
> The last sentence was probably a bit rude, sorry about that.

No problem; thanks!

> However, I
> think a reasonable third party can understand my frustration.

I hope you can understand mine too.

[...]


> I am happy enough to fix the SYNOPSIS of my
> man pages locally like this:
>=20
>     $ git grep -lF '<memory.h>' \
>         | xargs -n 1 sed -i 's|<memory.h>.*|<string.h>|g'
>=20
> Hopefully distributions consider doing the same.

I've thought a bit more about it, and had an idea that might be
a reasonable compromise.

Here's a sample:

	 SYNOPSIS
	-     #include <memory.h>  // See STANDARDS
	+     #include <string.h>  // or <memory.h>; see memory.h(3head)
	=20
	      void *memccpy(size_t n;
			    void dest[restrict n], const void src[restrict n],
	@@ -34,8 +34,6 @@ ATTRIBUTES
	 STANDARDS
	      POSIX.1=E2=80=902008.
	=20
	-     ISO C and POSIX declare this function in <string.h>; see memory.h(3h=
ead).
	-

Here's the commit message, which explains why I believe this is
a reasonable compromise:

    man/man3/: Put first <string.h> in SYNOPSIS, then comment about <memory=
=2Eh>
   =20
    This is a compromise between the fact that <string.h> is the standard
    header and (only slightly) most portable header file for these
    functions, while hinting at the fact that it might be more appropriate
    to use <memory.h> where possible.
   =20
    Remove the STANDARDS and NOTES about this, since now the SYNOPSIS
    contains all the necessary information.  The extra info is in
    memory.h(3head), which is linked to in the SYNOPSIS.

What do you think?


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--5sektlshxedjgsgn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpx1zoACgkQ64mZXMKQ
wqmeeA/9FuzXkgsexYVWoAKBOqTTrrDKEE6qhsvESqRkTOZv24jynbQJllB3xA5v
/2m+pZ/INktkch4Tfo3SVFWE1wyK2NjMyQ+zh7l+E8Q+m7WvpuDmOQ6Ws9sPTPrM
XsWI2HFfOQ+lFIg/WERDzTZY4TJ0lW+ymnol66Kcd49JSAFm5D/ZMvmR96Y3Uqys
0asQH42X6A4oluG2RwgG8zP4TrPnQV5gSnzI+QPz03iffL+VHzZ4se4VHuf9UVI8
Z6XKV+qnpAsNHL3Y9ALZPZ5t77mO+m4UzCM6c2YIO3/nf186oTo8fiPr7Mw9w556
JAgIlfVC1/ntOQ6ZE81WH18y6ydp+20GyDcSSmrsjits9ViSOz8fedLN9B8mvRnU
iXVcz1yXEsE8KK7MsaSqxo1rsE0AR+vhaYoAEAw3iWIAdD9yvPJn7GtXS03ZtHQE
aSmxkrcUx9HJ/7DAoPGzMcwl0HITfdtIdQSf4isYhKsF1LaQ0f/zK0ob9yfsJIAc
ovLh7FR39lRUds9Coq1X3gVHZrB21vvtunzfMuuJqmFLl7MlmUT71X3f0cBa7vnb
LZm15tjPRx4tMANPx6LSRseg7k+ahiQWAVBE1FcOhH4SsaFkzhIFziJnrW2bvaWl
ghKAGvcfqH/iENwjcg+XUrGBt0OA3P1sGYF5EaMJILhLRb6oLdQ=
=83fK
-----END PGP SIGNATURE-----

--5sektlshxedjgsgn--
