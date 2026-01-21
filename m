Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1D53A8FF3
	for <linux-man@vger.kernel.org>; Wed, 21 Jan 2026 12:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997334; cv=none; b=O9uVXgdZVZoatrsg2561mdC2+d8I3IJ3TdYQbUkAeH/dkTDYoKQK62Rtafns6YRnUzN5kr12MkF/HaLjV1AjVYdXzMckA6FTS5bjECF0ph07XIzELSsSMaPLZFT7OrkwuNQ75vCLBkU/LzsChnrwGyNJ+NhIKQiXvm38icsIn6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997334; c=relaxed/simple;
	bh=J9bNJq/YZS635Gi433b78N5Bc+PlODzY+IyodeZ3e80=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hrwpR184+amj8afBHE7pEUfNhh0V/zOaBsJbwgfiVcync3VvMIU9LxMeLbA1ou4uSJfCjR9G2XwC++UpFw4R550s3JZ5VuPe61/TUfeYFhwDbd1qlsZaAtewCj0Uq0UHXCPmhwbFFf4HugNOgTGJhJRcoNhzBgUYMLqW/WN+adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=FYa5cGXO; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="FYa5cGXO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768997331; x=1769256531;
	bh=RdfU1BS/ZpsJ9nXm2WPwdj8O9fKCg8yD133ORASNk3Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FYa5cGXOx/N9+pUUQ9Coz5pVZSmdc1x7b+e8qEdJLvBmDzfw/7LUXFjnKx1ADme5b
	 hxgERytfziBxM89sAUdaJqc5VUSSCMwyMvn6d24THQbf+fDgZzSUWZnR56pFAt1E8A
	 q9DD1BLH4Sj/87T/NdN+5zbvtwLGdapx241nG62J2eI+SZhqGYE/Ldmc8ciaigDHAe
	 V0E5UQrvqURAbX0qjYF+ZXVINvPTmPWwgQbZA5ccQyKyU/jm/vAF3BISRlrY6QdPM8
	 5nx3KAdbog7DJC3wkUSUIXsJGKuhxZZXoXHP/GYFf6CSB3XthD+IAbto+0ekjReht1
	 h42Ogf1DuLZ9w==
Date: Wed, 21 Jan 2026 12:08:47 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 23/23] man/man2/gettimeofday.2: HISTORY: Update first POSIX appearance of gettimeofday(2)
Message-ID: <00b72e77042889e0d5ed967c5e57f1a07986d44a.1768995315.git.sethmcmail@pm.me>
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: beaad55eb564f40cbbaac9a0d5f12d22a9e7f49e
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------1395671daaea130757fca0bbb14fe4fecebaab450751f61820d7f574e5a127be"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------1395671daaea130757fca0bbb14fe4fecebaab450751f61820d7f574e5a127be
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 23/23] man/man2/gettimeofday.2: HISTORY: Update first POSIX appearance of gettimeofday(2)
Date: Wed, 21 Jan 2026 22:05:58 +1000
Message-ID: <00b72e77042889e0d5ed967c5e57f1a07986d44a.1768995315.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
MIME-Version: 1.0

gettimeofday(2) first appeared in SUSv1.[1]  The function was added to
POSIX.1-2001 when POSIX and SUS merged, but as an XSI extension (still
SUS-only).[2]

[1] X/Open CAE Specification, System Interfaces and Headers Issue 4,
Version 2, Chapter 3 "System Interfaces", p. 275.
[2] IEEE Std 1003.1-2001, Volume 2, Chapter 3 "System Interfaces", p.
567.
<https://pubs.opengroup.org/onlinepubs/009604499/functions/gettimeofday.htm=
l>

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/gettimeofday.2 | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/man/man2/gettimeofday.2 b/man/man2/gettimeofday.2
index 8310f9c784bf..7dbd25a2666f 100644
--- a/man/man2/gettimeofday.2
+++ b/man/man2/gettimeofday.2
@@ -177,12 +177,13 @@ .SS C library/kernel differences
 .SH STANDARDS
 None.
 .SH HISTORY
-SVr4, 4.3BSD.
-POSIX.1-2001 described
+4.3BSD,
+SVr4.
+SUSv1 and POSIX.1-2001 XSI described
 .BR gettimeofday ()
 but not
 .BR settimeofday ().
-POSIX.1-2008 marked
+POSIX.1-2008 XSI marked
 .BR gettimeofday ()
 as obsolete, recommending the use of
 .BR clock_gettime (2)
--=20
2.47.3


--------1395671daaea130757fca0bbb14fe4fecebaab450751f61820d7f574e5a127be
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgmlwwc4JkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmcdFEllvr9tPuZIs8OG83KHFiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAAL9PAP9FMHefdIxT89mTE+5/vaJVpat8lrj160fWYGEE
AT+APAEA79j4osmoy+hLiaXCJZkbePTg6Aj120Ywt4f2lF2IowA=
=+uCL
-----END PGP SIGNATURE-----


--------1395671daaea130757fca0bbb14fe4fecebaab450751f61820d7f574e5a127be--

