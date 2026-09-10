Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C3E356A38
	for <linux-man@vger.kernel.org>; Thu, 10 Sep 2026 23:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082235; cv=none; b=Ot172U7YC1S+UFbzKTe/arZtx4jfY3AsSD6qb+SqlJk4Bk0g8xEK9ViDy94WOI7LjSAw/MA5+xt5PuED/6ZMrND5p98Ou6TB8IkoP8mmLKrN1CfAQ3TCDpvMYIwxwl8j2mTs6MoOHu61ljoNbpIAM9G1cokCOQLONbVWNphs5eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082235; c=relaxed/simple;
	bh=tSyEqlhMT2p/PZNWf1ydXX5Y/YOYAABZcnjQnrHVLPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZeWLAGwSPqYMC4bCxoIJXdrI0ZVg/rTZ1U2oPlVUdQxLdVGsVumTr5qaDMDnfcJmctwtRvsLcGV+taaGo5Pm6HZ5mHHAggWPrYGMjCtazOtVOgaNpxwSIHprnTtEYdn4vZFyK3mUaKQR1J2Iq0hJBQvRq5oMDdaXhH6ltUVtZxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZVXo8bD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZVXo8bD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA0A1F0089C;
	Thu, 10 Sep 2026 23:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789082234;
	bh=aX3N4oPgQoIINV+EsdvBML+HYdwkZBEY+tmx4p5RmMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YZVXo8bD+/czot2bqwcaFoOJzjYu3M3pdDy18LJRlgvh3r3uKPBAwd7FG8GT7MMEs
	 tJO4CyI0zksD4rMeW8ESFIEk1BdJ1RahKrulIl2s0lAecl+8EL/6qm6zBmqIh8Y0x8
	 zIkXGiDca9khp+iR/A7sHcMbbmA/odXhqQ/toYTevwZbwbCR/PIcbaGzR9T7Y2MHKJ
	 ALFS8jBYzO65QL330qHXydvgkYI6UIYbm9lB6jqME2R6OLLta3rIi5TqLXlRQEE0rQ
	 GHS80XTXfD7Sag5mtWc1zb51Kgt6C2PcO+gwkcMa6ZjHf7QBBMgjnyD5WCLy2x4+uf
	 EdXU1x79g6smA==
Date: Fri, 11 Sep 2026 01:17:11 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Maxim Inozemtsev <milnadar@gmail.com>, 
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v2] man/man7/inotify.7: Fix typo in struct size calculation
Message-ID: <9a02836a5be6c1505a2cff8bc9a5a8f749a160c4.1789082120.git.alx@kernel.org>
X-Mailer: git-send-email 2.55.0
References: <CAE8uRQ0-xyboJ3gy5wu-EaoQ2UEj4bL74hnrosaMpNkqJ9vYnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6cr527pf2plng7ol"
Content-Disposition: inline
In-Reply-To: <CAE8uRQ0-xyboJ3gy5wu-EaoQ2UEj4bL74hnrosaMpNkqJ9vYnA@mail.gmail.com>


--6cr527pf2plng7ol
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Maxim Inozemtsev <milnadar@gmail.com>, 
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v2] man/man7/inotify.7: Fix typo in struct size calculation
Message-ID: <9a02836a5be6c1505a2cff8bc9a5a8f749a160c4.1789082120.git.alx@kernel.org>
References: <CAE8uRQ0-xyboJ3gy5wu-EaoQ2UEj4bL74hnrosaMpNkqJ9vYnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE8uRQ0-xyboJ3gy5wu-EaoQ2UEj4bL74hnrosaMpNkqJ9vYnA@mail.gmail.com>

=46rom: Maxim Inozemtsev <milnadar@gmail.com>

Fixes: 18e7c4597c4e (2024-11-17; "man/: Terminology consistency reforms (n,=
 size, length)")
Co-authored-by: Maxim Inozemtsev <milnadar@gmail.com>
Message-ID: <CAE8uRQ1WhW=3D5X-zCCi4g9y4s-rEYdmY_=3D2o4Re1thKyijV3RXw@mail.g=
mail.com>
Signed-off-by: Alejandro Colomar <alx@kernel.org>
---

Hi Maxim,

I've slightly modified your patch, to be more correct, and show that
'len' isn't just a variable, but a structure member.

Do you like this patch?  If so, would you mind signing it?
<https://www.kernel.org/doc/html/latest/process/submitting-patches.html#whe=
n-to-use-acked-by-cc-and-co-developed-by>


Have a lovely night!
Alex

 man/man7/inotify.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man7/inotify.7 b/man/man7/inotify.7
index 9575b82e7ffb..dcdf95d0665c 100644
--- a/man/man7/inotify.7
+++ b/man/man7/inotify.7
@@ -137,7 +137,7 @@ .SS Reading events from an inotify file descriptor
 the size of each
 .I inotify_event
 structure is thus
-.IR "sizeof(struct inotify_event)+size" .
+.IR sizeof(struct\~inotify_event)\~+\~event.len .
 .P
 The behavior when the buffer given to
 .BR read (2)

base-commit: 93337ae940c227db2b4a6141268a41b222df4283
--=20
2.55.0


--6cr527pf2plng7ol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqjOnYACgkQ64mZXMKQ
wqmVvhAAhJtE04w6emfPzUu3nuSlKXzEILA6miZ0/O4XlNVxq6U728xAXy9JxH7N
bKD1Fllsk+48uoelYAtujjaXF2Hsh1xVEV/hOocG/8ptHrXfYvB1IlamfYfgIDjN
uNSoL2UaqB7UyC2mOsmvd5kKdSIcZIc4kxnd/m93nygv6H2CuOkulWEyZUq3EFTd
CeHD52kpmPPK3mLGYgjH6GQxrVgWJvMfqNiRLvYnQ0kx2Xryop/dNa0PO1MNnaWa
42hQ2/oFBVrFe0dbO3VLyDp+sbPYk/+bMcetr4dy4TxxudXgbR9zFY99k+BA5ufO
MeglbhYbvf7VYBE39ZEch3dY1bOy4RLUbu7craRbFZtiF1FJj8SWlh5/kpN+t13q
i3S7lIMo+tUOlffjk2Bn0TVEMJwybqr9Q07xDdsCQ1R/zYxLOS8ez11M1oN9PZPn
477bSWMxUCXmInEhE9v4/h6XFRGHfgEHsslt5mQjUqwrn4NoaG/QviBtv2BSsqYZ
MydFaI1Gz3yRlZx9SjewTYcowoYSjzJ+60Y0Tm32pfoELPD2HwjYqjwvWbswl2UA
XQ3e6gKPLXEpnaA7scRsTN5VUMvjyKcwajCnjEAHLkY3gGRqcGM58bLwqwDzmv1c
UcuhgABz4jOaSeFhr31PbrZmbDsV8ArW5sWGeJVmcA+aqNKrO+o=
=IU4s
-----END PGP SIGNATURE-----

--6cr527pf2plng7ol--
