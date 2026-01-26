Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFABD26299
	for <linux-man@vger.kernel.org>; Mon, 26 Jan 2026 12:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430626; cv=none; b=uxFXo0OfV4hDC4qTdis1A8ZAB/E1d2xYrk+TXm2PMz74Btsq74ab6Kg6eu/AhTE60AuIu/fkU0Fa252oP31iZx85VK2Jy9rK91FhOKxGFwVO/43pJDALnkJRwqyAOFORat965vgEwjZhNjyQrzKsdrKny5QBRIxjB65/uWRVT3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430626; c=relaxed/simple;
	bh=/kgBSHUmxdrtur9+OO6qDwV2vlej6shoTMbykoLjIRE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fimzryk1dvRziUQLe31ePI4TaOadyFBEHyd1+reWvoPYlYCoKmnl1yp8lry6aauHiLEWXBWwiCOhmBAHRTFgA3WL/ww1ksQA+bqObXGESqF1QLMb8VfK69chenYWUd0SCdv57fFdq1CEpgtNGj+34tbJTrZVwp+QVmIbD2OPjqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=fail smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=aVl5cZkL; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="aVl5cZkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1769430609; x=1769689809;
	bh=Lo/CRm/A9zbGW0dkeMQcJ881hAJiTtO4kmEdU27KXjA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aVl5cZkLfC/oj7OoVJZZI8X+j4zVodUHdpKr94QVpi3c9XT8kfEQ0ND3/uMOyc6/t
	 UK0dcHCphvcjfcUjxC8J3IdHga9hvN0UoSh7QXNxxf7oc3ttA6iqfsam4OMakLIjHU
	 x4k2eAyx4M97jNq7N4zoD7dDKDblQ4bOUy3qMETVas+Bl+xRw/N57InayM1CsUBuQc
	 BSO+T7/hSDkDUK62Cl+wwf3P0De/pzASA6hoRdXl8zfRgo5EYCHnS334WNUpvCIFDq
	 rE/lcrenrO6GIBkauXV2WUd6dCdmgo/z4Y5ZZd/JT3slEuIG9wengWVSi/8/3us33O
	 Ckggss4FtQgUw==
Date: Mon, 26 Jan 2026 12:30:07 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 17/21] man/man2/mprotect.2: HISTORY: Update POSIX appearances of mprotect(2)
Message-ID: <4e1acc0f5e001c3b51af8750f61d25387154e750.1769429341.git.sethmcmail@pm.me>
In-Reply-To: <cover.1769429341.git.sethmcmail@pm.me>
References: <cover.1769429341.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: 6afb3b19f003e573dc9fab00164eb9fa83611e71
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------f63204f75075d14e2521ac0bbcc87cbb00677dc619eec59216765a2d2880dcb7"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------f63204f75075d14e2521ac0bbcc87cbb00677dc619eec59216765a2d2880dcb7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 17/21] man/man2/mprotect.2: HISTORY: Update POSIX appearances of mprotect(2)
Date: Mon, 26 Jan 2026 22:27:58 +1000
Message-ID: <4e1acc0f5e001c3b51af8750f61d25387154e750.1769429341.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769429341.git.sethmcmail@pm.me>
References: <cover.1769429341.git.sethmcmail@pm.me>
MIME-Version: 1.0

mprotect(2) appeared in SUSv1.[1]  The function was then added to
POSIX.1-1996.[2]

[1] X/Open CAE Specification, System Interfaces and Headers Issue 4,
Version 2, Chapter 3 "System Interfaces", p. 402.
[2] ISO/IEC 9945-1:1996, Section 12.2.3 "Change Memory Protection".

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/mprotect.2 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/man2/mprotect.2 b/man/man2/mprotect.2
index 09cec72b76c5..a83971d2f174 100644
--- a/man/man2/mprotect.2
+++ b/man/man2/mprotect.2
@@ -265,7 +265,9 @@ .SH STANDARDS
 .SH HISTORY
 .TP
 .BR mprotect ()
-POSIX.1-2001, SVr4.
+SVr4,
+SUSv1,
+POSIX.1-1996.
 .TP
 .BR pkey_mprotect ()
 Linux 4.9,
--=20
2.47.3


--------f63204f75075d14e2521ac0bbcc87cbb00677dc619eec59216765a2d2880dcb7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgml3Xk4JkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmei/Cq2PW6gDLTmCGa+bCMqFiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAAFG1AP4wBk/mIg180p/dNCNCl0aBuJdsQUISMk+wU6h4
2ID0pwEAuOOvsIwtDtLFcJJ7pevP9z/0qqoeTmvUM068EKFIXAI=
=v2Py
-----END PGP SIGNATURE-----


--------f63204f75075d14e2521ac0bbcc87cbb00677dc619eec59216765a2d2880dcb7--

