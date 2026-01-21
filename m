Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E693E3E95A9
	for <linux-man@vger.kernel.org>; Wed, 21 Jan 2026 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997301; cv=none; b=DDbFxYSeYNZswooLbimr/gELWUbKxajIDoAzEJRcbJIhos0qlQlie/PDveKqy6qW/n2OUND0gYGXOlpFTiFGduExMr5Jz//creDhnkWxX43jYH4327ov+QBsfDYSTKJE7TKI2QtZRDLHyGi1AaWwVFByfNPdbKjsMkyB6eFdCL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997301; c=relaxed/simple;
	bh=UqHOxDaU8giMREvn+WwU4UR7WwOqZZ3zZjvxPJc6seE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nbXlj+cJqcaLjK8LrqZ9ZQGCFE7zWvY76PGlROmvI8Oc0sIJGveKJ0ioUsbBKzOdFNGPBAuMfhDvfMGrg7aNM7+VTeuUfceL0r4x4oN2+uamE3VAH3YGtK9vgQUQKRtnr4FuzZhRVBypE9Po1PsbXTx0mCtazCYvnCasf5AmAmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=lVNoO7EV; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="lVNoO7EV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768997297; x=1769256497;
	bh=UqHOxDaU8giMREvn+WwU4UR7WwOqZZ3zZjvxPJc6seE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lVNoO7EVXC+9oilkRthYxqy03NMJo3PDEwW8J5KGp5Rx6L3jSX3BCGp5C7Ugb06jO
	 GYXDQhoRRPD6cPTN4g7BJYzHFS+yK5rAibZ4fsXFAs8NMCY0RPrxO+A8DXHp7INdXI
	 NXt/Q+c2HBneFDJBwvVjmMD3GDBnrA5F/58pHIhNR88N/zax03GJ7xQ9DFH6Ps2G/4
	 TH0evOlnb15zOouoMMFjdXTpVRUSlacVt2cDubfY2120pZYKLgrKMBMYSI4Tn80P1V
	 IqQ4hVvCuumEJWBmRq2TwrNAPHT9xktPmQI//UDWYDdz62zj6BIWasV6EeUG+NbmbX
	 a87m28eyE5MTA==
Date: Wed, 21 Jan 2026 12:08:15 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 17/23] man/man2/getpid.2: HISTORY: Update first POSIX appearance of get[p]pid(2)
Message-ID: <c2b9d37b620894c4f2755d8316e36884e444a32d.1768995315.git.sethmcmail@pm.me>
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: 28ec2243e1ed2b106a5c55c55d766e4835bca0f0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------522361135f536a508438515a2786d5c938bde819c8b80d473f50c8d9e8807b39"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------522361135f536a508438515a2786d5c938bde819c8b80d473f50c8d9e8807b39
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 17/23] man/man2/getpid.2: HISTORY: Update first POSIX appearance of get[p]pid(2)
Date: Wed, 21 Jan 2026 22:05:52 +1000
Message-ID: <c2b9d37b620894c4f2755d8316e36884e444a32d.1768995315.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
MIME-Version: 1.0

getpid(2) and getppid(2) first appeared in POSIX.1-1988.[1]

[1] IEEE Std 1003.1-1988, Section 4.1.1 "Get Process and Parent Process
IDs".

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/getpid.2 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/man2/getpid.2 b/man/man2/getpid.2
index 2ae00557c346..e775ff67e9b7 100644
--- a/man/man2/getpid.2
+++ b/man/man2/getpid.2
@@ -53,7 +53,9 @@ .SH VERSIONS
 .SH STANDARDS
 POSIX.1-2024.
 .SH HISTORY
-POSIX.1-2001, 4.3BSD, SVr4.
+4.3BSD,
+SVr4,
+POSIX.1-1988.
 .SS C library/kernel differences
 From glibc 2.3.4 up to and including glibc 2.24,
 the glibc wrapper function for
--=20
2.47.3


--------522361135f536a508438515a2786d5c938bde819c8b80d473f50c8d9e8807b39
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgmlwwa4JkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmepqGouA5d4N51LVK3bJlGvFiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAAKkVAP9kshuNz1/RZeBNZ0etIbylO9DK6GYdiw3+wFof
NjOObAD+P+TyN9YVquB3yShJlX35sM3VP+SAeh4Bh550cecWwQ4=
=6vuI
-----END PGP SIGNATURE-----


--------522361135f536a508438515a2786d5c938bde819c8b80d473f50c8d9e8807b39--

