Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4929A22A7E4
	for <linux-man@vger.kernel.org>; Thu, 22 Jan 2026 02:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769048715; cv=none; b=PwAHMJPPHZ9CzhfEB5M9tvUanJhFVNtUJCmHlJ6TIgJ/cl3LS0ItiPy3uaiBtJVLFK+ea+155K0ANISrXHWqygM3XCqRjIvYLHiAaiNiGxP7u2EEODGOwtYKBiWnzeuxlc2T3PGGV3C53Xg4w86q/nDH5sTPkp+2AJPOxqP1/yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769048715; c=relaxed/simple;
	bh=mt4LIAEtBa7pOIXb9bHL4yIwdZb9Iw5ODCi3ossdZOc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rJo7plg5Gcy+h0VGf2riZ687hu+sctxr9fIvoYY+LN9toT8O6Me+e3or7QuPuIpKhLJqrzWg2GPG7VFDtsn7D531enTtZx5WSMHj0aSTAPatfn/fLwf2NPDZi4moUZdb18mfrG60HLfto9iyOJkm4n0irzEKwOAzaxhWUKQWg+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=J/u48nm7; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="J/u48nm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1769048706; x=1769307906;
	bh=mt4LIAEtBa7pOIXb9bHL4yIwdZb9Iw5ODCi3ossdZOc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=J/u48nm7N7qhMCc273zp7rpyWRYQzpnfUdLy9ioB3ZKY60nByzL6S7LPgmlDtQiXM
	 BtgPSIFpHrOBXjN4H81lRRrhE/8zSRzYxXobyg+PDfOEWo/J2WKm4fWW6gHYGcPAqZ
	 qDdeGKija7XnXTjd3keppssL212Y7FbXETKOpB7zOM2uJ3djQUHdxTLElqR3GoThyN
	 JhXXqvYNOkfL5eMNsXMZQgLs/iRKcUlJ/SPKma60Q7uE2gA46H0q6Z7YG6WMSCjoXe
	 qgVvWS5NaT2aeF/AzhQkpO2GxC29PGd6pSIaeMxFiHJ/jTOJVZOkKKZWiRTjcXM6Y1
	 uWM+eIjUbSzGQ==
Date: Thu, 22 Jan 2026 02:25:04 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v2 09/23] man/man2/fsync.2: HISTORY: Split fsync(2) and fdatasync(2)
Message-ID: <7b237415d7b97d09966619de01d8542e4f6f4ba9.1769047228.git.sethmcmail@pm.me>
In-Reply-To: <cover.1769047228.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me> <cover.1769047228.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: cd3630bd8b82c54f8b29a108bb5c67a03d90c8cc
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------fcd658e528e3cbd6aca80d9f55d5e644b2ce91e5bc7115d40e26059c4798d013"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------fcd658e528e3cbd6aca80d9f55d5e644b2ce91e5bc7115d40e26059c4798d013
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v2 09/23] man/man2/fsync.2: HISTORY: Split fsync(2) and fdatasync(2)
Date: Thu, 22 Jan 2026 12:24:01 +1000
Message-ID: <7b237415d7b97d09966619de01d8542e4f6f4ba9.1769047228.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769047228.git.sethmcmail@pm.me>
References: <cover.1769047228.git.sethmcmail@pm.me>
MIME-Version: 1.0

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/fsync.2 | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/man/man2/fsync.2 b/man/man2/fsync.2
index d59e346ef165..53c485135d96 100644
--- a/man/man2/fsync.2
+++ b/man/man2/fsync.2
@@ -151,7 +151,13 @@ .SH VERSIONS
 .SH STANDARDS
 POSIX.1-2024.
 .SH HISTORY
-POSIX.1-2001, 4.2BSD.
+.TP
+.BR fsync ()
+4.2BSD,
+POSIX.1-2001.
+.TP
+.BR fdatasync ()
+POSIX.1-2001.
 .P
 In Linux 2.2 and earlier,
 .BR fdatasync ()
--=20
2.47.3


--------fcd658e528e3cbd6aca80d9f55d5e644b2ce91e5bc7115d40e26059c4798d013
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgmlxin8JkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdtAH8/f+BKdlxBWTXOQp6ZFiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAAKnsAQCQ0BMty7kuDZga2aoTkGb3Iudk0taTPb0UMrae
AFL92wD+OoWL18pKWxz+mPDXqgWC8FR4vwZsdaQLkHlN5yMJogw=
=4Ea+
-----END PGP SIGNATURE-----


--------fcd658e528e3cbd6aca80d9f55d5e644b2ce91e5bc7115d40e26059c4798d013--

