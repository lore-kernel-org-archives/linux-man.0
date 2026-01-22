Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AD1350A20
	for <linux-man@vger.kernel.org>; Thu, 22 Jan 2026 02:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769048736; cv=none; b=L0fSX3l6+fQjJ4PAjzG4Skzmfr+U04/PdHpp1OkRaWNHxJ47K1SxL9Gdj6ff6x2a9Bl6S+S3lI8/lPf7I3Kz9D94BdZiiKYwyN1CgswVjGJdZoAhCgVMQhiVaytsMYSv1ol6rbStUg3JmB6TiitjLKJff06W5bNNZdxCe9Toh8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769048736; c=relaxed/simple;
	bh=xv9Jdz/f1MWWOEceGkdwiFlKNiGyGKLQWS20IARUwVI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EtfKI1/qGB25lJ/taVE+GztfrykzqetqOk6o7AdwayKTnX/2Nls9VsPQ0MK/Zm2TVD038b+ikrDgi+vkhWFlWj1LXeeMawy626flZ3U0MQSn7BhMVyPZ7A5cmFlhDPjDsDG+33WlY/e1wK4iuulRBqIJEjfbAxb1bdHUP3Wy10w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Gl3jRxTc; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Gl3jRxTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1769048732; x=1769307932;
	bh=xv9Jdz/f1MWWOEceGkdwiFlKNiGyGKLQWS20IARUwVI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Gl3jRxTcfLzWNYPbo1mfDYSaR+2iDvB5Brto4R2F06kh0/R/4o2cu/qq44+1v+aAB
	 HLWPl9MCRJTd4Ss97B2dTg4jKEsqKNlnjK/kpUOm+BRopEVDRySpf+6HadtZo563y6
	 19RYm+mJbsB2g0+kNVQkJ9Yks2VnHfUr4SqWKEJJjUm0VhCfjb3YXo7DkkYG3GlLLg
	 06LgVaQpUpq73A6rtxadOm5kK2k8JCd8AEIvyf5o8FhRjcazh6Do50mRMPNjgoixE7
	 CGY2vFUDfv3gwaEQpenljri9txm0DLml4u/G+JbSXlEIL1gODczAAu7KK5KVRvc0bu
	 jf2hGDtvmlSHQ==
Date: Thu, 22 Jan 2026 02:25:29 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v2 15/23] man/man2/getitimer.2: HISTORY: Update first SUS appearance of [gs]etitimer(2)
Message-ID: <9c780e0e0176bd677be89eedc07be1e66d2365f1.1769047228.git.sethmcmail@pm.me>
In-Reply-To: <cover.1769047228.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me> <cover.1769047228.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: 41541416cb1fdca4abefba8b848252ad19e4ac4d
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------918d49047aabae334b0d79baad5e2c20f3a9417fa581358de08a6386b3bb8914"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------918d49047aabae334b0d79baad5e2c20f3a9417fa581358de08a6386b3bb8914
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v2 15/23] man/man2/getitimer.2: HISTORY: Update first SUS appearance of [gs]etitimer(2)
Date: Thu, 22 Jan 2026 12:24:07 +1000
Message-ID: <9c780e0e0176bd677be89eedc07be1e66d2365f1.1769047228.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769047228.git.sethmcmail@pm.me>
References: <cover.1769047228.git.sethmcmail@pm.me>
MIME-Version: 1.0

getitimer(2) and setitimer(2) first appeared in SUSv1.[1]

[1] X/Open CAE Specification, System Interfaces and Headers Issue 4,
Version 2, Chapter 3 "System Interfaces", pp. 244-245.

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/getitimer.2 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man/man2/getitimer.2 b/man/man2/getitimer.2
index 6f35fa130492..d411c348a1b1 100644
--- a/man/man2/getitimer.2
+++ b/man/man2/getitimer.2
@@ -181,7 +181,10 @@ .SH VERSIONS
 .SH STANDARDS
 None.
 .SH HISTORY
-POSIX.1-2001, SVr4, 4.4BSD (this call first appeared in 4.2BSD).
+4.2BSD,
+SVr4,
+SUSv1,
+POSIX.1-2001.
 POSIX.1-2008 marked
 .BR getitimer ()
 and
--=20
2.47.3


--------918d49047aabae334b0d79baad5e2c20f3a9417fa581358de08a6386b3bb8914
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmlxipgJkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmcUYvqVHwk2i9kQ7zxh0HqbFiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAAAizAP0QSKqqLV/57GEZ8z4FXB692s36qv97SIcEprbf
cgsz/QD+KyPNK/NWcmE0kb3gWliDxZJn9qfY2nxZcflxcQRdLQ4=
=vREb
-----END PGP SIGNATURE-----


--------918d49047aabae334b0d79baad5e2c20f3a9417fa581358de08a6386b3bb8914--

