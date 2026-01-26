Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F64C2F83A2
	for <linux-man@vger.kernel.org>; Mon, 26 Jan 2026 12:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430523; cv=none; b=AsGo/Tp8EwPA334DrjqhHB3USmrc8St1tA4YQf/an6KsY3qtLlJo1vvzbFAF9l4eEjyg9YgnbuGAh7Oe6r9bBjPwGiV3AMd3i7fzTfszBFp58KGEblpmpqCdmq/44JJBy0cjIVvM04z0Pj+WTIZ7Dsxk5iryAzzg12Dx2WZvs/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430523; c=relaxed/simple;
	bh=rzWUtDT1y+PPNr3M5hQ6eUN96Hc3OT43kJl+fboWKik=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ci48iMUu0t4Ookwj8hsewYUhVDgkJr/35nxyI3DhSknRhcqsht+eo72cX4ITkekVVcbKOXS38lQXPsmstmeVmr2LGJgG4huEMiueIYeAM9UnOf9aDApfWcdC/nGs27Q2HPj98+WOIaQ74qNJEz8aU2cmKS96/1lUbacULvFTRRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=DXXJcX4Y; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="DXXJcX4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1769430512; x=1769689712;
	bh=rzWUtDT1y+PPNr3M5hQ6eUN96Hc3OT43kJl+fboWKik=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DXXJcX4YL4mNFxcPnaV9XRcFcJolaIIeO/RE/WMKyqgj7yAyV+VI5zET4Gjuh0Skb
	 3gNaSIGBiNm8S4i0u+KZDHweLqeJZriAxHFueFFqp/1gEfW72Ur4LkxIwKDvW/Jryi
	 5d6Df42IhropBRKd2PH5H6R6jfWP3oGV9lVlb5nMVdtRoYtQTgDlUlvlwPKSKlefF4
	 Y4TVLxDAVDsEnTwAeNZ5z6IcAZme1CWCD8pZoz2YflK8gzZGlECgCOV5E1x0YsUvu8
	 zueTc5jrfJWGAMwcZdu7dEyk+3soI9dvgKKUcWnlzP2pEAzKCtuXfV/ss7L3Bz63by
	 40kfUoOCcr/Cw==
Date: Mon, 26 Jan 2026 12:28:26 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 02/21] man/man2/kill.2: HISTORY: Update POSIX appearances of kill(2)
Message-ID: <55de16b213bf725f1365203b361d73cdb2dd0b6e.1769429341.git.sethmcmail@pm.me>
In-Reply-To: <cover.1769429341.git.sethmcmail@pm.me>
References: <cover.1769429341.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: ccd688ecd5be944fd625bcf26f346e88b594931d
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------533d4dd7cf06f09e2382187b507369f6cc6b5d7e1fca24c2e468a77313d05ad5"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------533d4dd7cf06f09e2382187b507369f6cc6b5d7e1fca24c2e468a77313d05ad5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 02/21] man/man2/kill.2: HISTORY: Update POSIX appearances of kill(2)
Date: Mon, 26 Jan 2026 22:27:43 +1000
Message-ID: <55de16b213bf725f1365203b361d73cdb2dd0b6e.1769429341.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769429341.git.sethmcmail@pm.me>
References: <cover.1769429341.git.sethmcmail@pm.me>
MIME-Version: 1.0

kill(2) appeared in POSIX.1-1988.[1]

[1] IEEE Std 1003.1-1988, Section 3.3.2 "Send a Signal to a Process".

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/kill.2 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/man2/kill.2 b/man/man2/kill.2
index 7ec979c07646..13222f135a06 100644
--- a/man/man2/kill.2
+++ b/man/man2/kill.2
@@ -118,7 +118,9 @@ .SH ERRORS
 .SH STANDARDS
 POSIX.1-2024.
 .SH HISTORY
-POSIX.1-2001, SVr4, 4.3BSD.
+4.3BSD,
+SVr4,
+POSIX.1-1988.
 .SS Linux notes
 Across different kernel versions, Linux has enforced different rules
 for the permissions required for an unprivileged process
--=20
2.47.3


--------533d4dd7cf06f09e2382187b507369f6cc6b5d7e1fca24c2e468a77313d05ad5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0Fgml3XegJkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdnHoB7zHOkMujVPKsjDp09FiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAAM2QAQDgVv4HUcwt08Fatmv6Jch5/fI7k4OrneIiDIjL
9925RwD/Rf9/SqlIyU31WS9BeBYuX3bRznsmVdiXAxtNEMQAkwo=
=OCoG
-----END PGP SIGNATURE-----


--------533d4dd7cf06f09e2382187b507369f6cc6b5d7e1fca24c2e468a77313d05ad5--

