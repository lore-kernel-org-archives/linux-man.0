Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D5237105A
	for <linux-man@vger.kernel.org>; Mon, 18 May 2026 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779117473; cv=none; b=ZN+T2Euq0qtKLxgWMkGJN2aOSOoiQ2JVP4lr6kQTrioF2wz3NpQD/fMFszMLjkoAPPwGsC86cb2vBSUvIGg5Idfusg+8LakhF6t5UdNnAOue8lhqZCNCSn9a4xrDJe1sGjxUgdbi8X5y6DylRZH3tvfja9IQOjdtsdr13sL7Rcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779117473; c=relaxed/simple;
	bh=Yc7Ha+ht6G4QU2pJlLLsewVy5nlCN7FFfrlEwGMKW5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+Wv4s1MiEUNGz1uGi1MRbKuacmNGWfMX8VlJkZUg76ZnqzoVjRHwG/gGKxIiewiP8GR34lig5cCoGn0Q0Pf5JMjeG76OyX4ORZswxuN6FohT+fChnJAt/rSK8p8CJlyRnsW08wqjZAKSPsjhWkpVbUJVJQpQCqu8ajI+0g2Gek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zg/StF0i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zg/StF0i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6DDC2BCC6;
	Mon, 18 May 2026 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779117472;
	bh=Yc7Ha+ht6G4QU2pJlLLsewVy5nlCN7FFfrlEwGMKW5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zg/StF0iMHvmOdPoN72LXNY0DHbDdO6OhHbiDSd2/XKUw1oRgpit+Ly4KsRTC92u8
	 cE5vj3ly8D7OSRAGa7dx0zgQEtPaZkEFXr4XHqvfn0vKamZLfK4xyHb+NQSc6eBf9h
	 vN6woVTeHP3OdebDCyUoGSYoHWb37JP3XJNQAOBBBTYfZewJzn7xzC4gMA2KpC1yvy
	 zc/hdSD+Pn6+qoEAeOodxxYOclcGNza0PrHhjRdWwvpQD9euZIO6F32PCfS+rjlZp2
	 AQHSnXYJIchR96W4jPIPPGrGXE6t9IHwWwL7UfPPo4M2by9lj8agZDjHrOlEI7GiGz
	 7q+yBo4Jasgaw==
Date: Mon, 18 May 2026 17:17:49 +0200
From: Alejandro Colomar <alx@kernel.org>
To: libc-help@sourceware.org
Cc: Jan Kara <jack@suse.cz>, linux-man@vger.kernel.org, 
	Petr Gajdos <pgajdos@suse.cz>
Subject: Why is caddr_t used in quotactl(2)?
Message-ID: <agssqAsUt9aYBsHX@devuan>
References: <9d328eab7a632ac87f48bcfe88c0e5c3cca18d2a.1778951437.git.alx@kernel.org>
 <kf4k33gsaax2v2iwzfprvogsyfqxbjdldpkdefwraaea2ytijx@tm7g2gul3h53>
 <agsKOHLgfGkiyE1r@devuan>
 <b2kszapero3mb6q3763rrgjjfltkvt7aapm6s7oakpbpepfypk@mwybch7ayyqd>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="572tlykgh3k5orhw"
Content-Disposition: inline
In-Reply-To: <b2kszapero3mb6q3763rrgjjfltkvt7aapm6s7oakpbpepfypk@mwybch7ayyqd>


--572tlykgh3k5orhw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: libc-help@sourceware.org
Cc: Jan Kara <jack@suse.cz>, linux-man@vger.kernel.org, 
	Petr Gajdos <pgajdos@suse.cz>
Subject: Why is caddr_t used in quotactl(2)?
Message-ID: <agssqAsUt9aYBsHX@devuan>
References: <9d328eab7a632ac87f48bcfe88c0e5c3cca18d2a.1778951437.git.alx@kernel.org>
 <kf4k33gsaax2v2iwzfprvogsyfqxbjdldpkdefwraaea2ytijx@tm7g2gul3h53>
 <agsKOHLgfGkiyE1r@devuan>
 <b2kszapero3mb6q3763rrgjjfltkvt7aapm6s7oakpbpepfypk@mwybch7ayyqd>
MIME-Version: 1.0
In-Reply-To: <b2kszapero3mb6q3763rrgjjfltkvt7aapm6s7oakpbpepfypk@mwybch7ayyqd>

[looping libc-help@]

Hi all,

On 2026-05-18T17:05:59+0200, Jan Kara wrote:
> Hi Alejandro!
>=20
> On Mon 18-05-26 14:51:45, Alejandro Colomar wrote:
> > Also, I wonder why caddr_t was used at all, instead of void*.  It seems
> > to unnecessarily require a cast, which could have been avoided with
> > void*.  In quotactl_fd(), since we need to use syscall(2), which is
> > variadic, I'll document the correct pointer types, instead of caddr_t*.
>=20
> For this I don't have a good answer. It was like that for ages... I guess
> you can ask glibc guys - the kernel uses void * but glibc uses caddr_t.

Does anyone know why glibc uses caddr_t in quotactl(2)?  It seems to me
that void* would be obviously better, by not needing a cast.

-  Why was it added in the first place, given the kernel uses void*
   internally?

-  Can we change it now to be void*?


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--572tlykgh3k5orhw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmoLLZwACgkQ64mZXMKQ
wqkZ/A//Uqg+g8HPp0Ijz+3pzpfxjE0z9pX030CAJyHjXke+9qg27F5iiLjXu7sZ
6cJ+EDPqtIlKkFTO5ITvX6P2dKj0WaZ2XfMnD7/vCLEksHqyLEBJnF0a5ur7tPkD
TISLEk9UhiwPPcGj82n3LcE1wn9OIyOaIqcc3jyZgDhOav5560Uevmf7O1VxQn+S
FO5fYKSwEyfVZLVm+2uCghexauecf00D0jXA4zxYh5ljGDG7LZ0dLM4urHtmYnqJ
k0P+3nL/1JgrQ2Oyda0tXsCupWhoIhqtmzR3c60z8OyJD92KUeGrKslYvGA8Q7DM
qU9nafM+t1aKNds1trCCjnNA0oiN+uz2FMHdRYaSPI/4z7ltEDOBA5EzoS2SJDea
049EhGa+ji7ujrWB9yD+Q+0uuIkqkzySRl23qoRFv4CCny8Ww5z6khbv3lwURwM4
YQRAchZjT1NhWPemDs4vCeRKqy1UhBmaMWkd9QcUUKTrCFcoyOe3zRJAcvAzRWsh
vNotrfWQvYUctIPWC7VnJI8aYYZCzpq1ofv633je9vTJ8jHO1CDdsrxf+OcavWA5
WOJ3bIvoZgcuLTp/BhvWj5kWQch1H1WOUp+4IgXDZ40Cjoc/qn1vNThSl/bhJ8pb
HaRKJIwLtSi13QOo+qpQFgrbZVxgjbzr1VUfekctLFs9gJ3iXDw=
=Mjqt
-----END PGP SIGNATURE-----

--572tlykgh3k5orhw--
