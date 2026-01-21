Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5953C00A0
	for <linux-man@vger.kernel.org>; Wed, 21 Jan 2026 12:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997299; cv=none; b=ZGCml8ioW+fEoB+9mT7jIdpbTZOXulHylZXNP4MXZCZBjUaApvvKcZPfNBr6SlOUWR6uribEnZBoeCuaUGiRBSmnYWY3ZqTBtvRJvgy+Px5CkIJtzYESDfwuhcTaeripMxAyCWbM8DXeZ2hGIQmw1MByIybNEqJ/gk9nXkn5fzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997299; c=relaxed/simple;
	bh=OLcL8OlPbSldxJK4sVZu3P8qACYpWyf5iYVhO6x5aG4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OzJpSpi4xPNHjQ5QNEDi3D4mAemWuQyutFjLL97ePhVDX+Ofmzpt3n/aPeTr4zf014HK5YNI2tDOizv4dUiWqqptb74UloLe5MGP+X+cRdKG8h5DutsZwCztMshLucIxwLYdzOgC9+ecIF7Gb+5JEADXo98NPmlUihaBUxGS57o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Yj62oHGl; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Yj62oHGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768997294; x=1769256494;
	bh=OLcL8OlPbSldxJK4sVZu3P8qACYpWyf5iYVhO6x5aG4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Yj62oHGlJv1XpFBy9pymrtW8DDhTm17+iWiXJdMr43Zz4TYN2xINHzOIVCxdMftWD
	 U5KIRLR1dU/LDjJ7kjaURNITiaS+S4Z3B8wVuJEyHS775uaFHkts7/h7NBnqC101q3
	 F3+JSIDVecGD9SMG9F0jFzCuB1AjkvfuknlKB6ninjTSE8ZJ6B2nQcdzO+YbPswz1i
	 joFX6aIFuRsRybdk+lllC4IcJ4WEXqd9w7hX9nXuOJUAWQhIb9h2FCtVOxqm2RYl3+
	 nb1z1Mmz0o2WRDWkaoZtq5RIwTtlbmoIL0JSSZHZsXWJjm9DgbYTXnl+A/hNChUZbO
	 Z+zsL6uKy2YOg==
Date: Wed, 21 Jan 2026 12:08:10 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 16/23] man/man2/getpagesize.2: HISTORY: Update first SUS appearance of getpagesize(2)
Message-ID: <f776e452e42723e119a0df01e556dbb1d0728f45.1768995315.git.sethmcmail@pm.me>
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: 5969ec59d96a6da1916fbbdea03829c7d37995af
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------73ef19a8ed50bd553a934e6cf32312d0095c45043a6508e6cdeda584652d9b85"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------73ef19a8ed50bd553a934e6cf32312d0095c45043a6508e6cdeda584652d9b85
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 16/23] man/man2/getpagesize.2: HISTORY: Update first SUS appearance of getpagesize(2)
Date: Wed, 21 Jan 2026 22:05:51 +1000
Message-ID: <f776e452e42723e119a0df01e556dbb1d0728f45.1768995315.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
MIME-Version: 1.0

getpagesize(2) first appeared in SUSv1.[1]

[1] X/Open CAE Specification, System Interfaces and Headers Issue 4,
Version 2, Chapter 3 "System Interfaces", p. 254.

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/getpagesize.2 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/man/man2/getpagesize.2 b/man/man2/getpagesize.2
index 3504f1c7b813..8b6ce2bc5b57 100644
--- a/man/man2/getpagesize.2
+++ b/man/man2/getpagesize.2
@@ -53,8 +53,9 @@ .SH VERSIONS
 .SH STANDARDS
 None.
 .SH HISTORY
-This call first appeared in 4.2BSD.
-SVr4, 4.4BSD, SUSv2.
+SVr4,
+4.4BSD (first appeared in 4.2BSD),
+SUSv1.
 In SUSv2 the
 .BR getpagesize ()
 call was labeled LEGACY,
--=20
2.47.3


--------73ef19a8ed50bd553a934e6cf32312d0095c45043a6508e6cdeda584652d9b85
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmlwwakJkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdY8+6AiWkjbSRZSaq3Dso+FiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAALyMAQCKRo86JE9fWS1Ki7IwL3qbYaxB1KHWgyqLa3k/
o9JknAD/dkdPt/hVB6swlrh/jZa0ol3U60FCEvVfs/Es7zU2kA0=
=nh0S
-----END PGP SIGNATURE-----


--------73ef19a8ed50bd553a934e6cf32312d0095c45043a6508e6cdeda584652d9b85--

