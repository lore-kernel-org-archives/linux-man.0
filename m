Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC8D32E698
	for <linux-man@vger.kernel.org>; Wed, 21 Jan 2026 12:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997245; cv=none; b=f+h4Vi3tUEM5YH6UNLZ8/szmQFhGOZZ/8y4E3+4FswCzfTajKfudqb/DMhgl8fAgsK3Nwy8z9C5CtsJBrW7gKezpEqT1eSr9W1jL1/y0IK/eqfnFQ+4R9hV3xSRYJovVSifDJb2iqpFnZUjIwkKOW9Gfh0I5L+bKiVsxQMdfiPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997245; c=relaxed/simple;
	bh=oAN1JspGkVYqGlPYJFmyJpblRkGLQJr3XiOCPSgLwc4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h3neRSS4eUeXJybSoxrwVbQyWKtZ8nOou7QYvjY8IdnMJJVSTx+/OJSei2qRYI5xPoZ7GS2aFMlxhof2yqO51vaovEBEkxSWTCV/ps2DT8kK4NV+JO7hUYbsheX+do4vfNnkJCVyg42o9dVWHScpFCEpJK9tdCp6jMGoaGsTlus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=VtWXRa4A; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="VtWXRa4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768997238; x=1769256438;
	bh=oAN1JspGkVYqGlPYJFmyJpblRkGLQJr3XiOCPSgLwc4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VtWXRa4Arbk1btWPwQc5kko5PmK/dv+fvcrDWL3+tGMoKQVu68vHmmOp6brHUYykH
	 vydcptwhkNwQFgqaNete345ZFWiz0k+yVtKARSzfi6u6qvaAAibT5vWuWp7xsR3FEE
	 iz/xhWR+yyG/wxTy9EGBSnBnq/GqBwikXr2AmwMvlmvjmojcctkfZWfFquaFsiAeRF
	 Fv2SHtEWtKJimhPOGxtOn8F0lvLU672EW5IkM6vZTCOwc2JrPRJB3ICcywpAcdCxBx
	 Tf+f2LNR76qAZiZQoL1g5MPKFu0WNEL1eL3zu6zUUE8R10Pe5kjTQ+yAuqGnBvSJof
	 1XbI2SmJ2LdWQ==
Date: Wed, 21 Jan 2026 12:07:17 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 05/23] man/man2/_exit.2: HISTORY: Update first POSIX appearance of _exit(2)
Message-ID: <eb5b310ab4dd16207afcdc5e8b9f8d80cd356b8d.1768995315.git.sethmcmail@pm.me>
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: 171588a7ed6753484aa1630c09f6a7b727dee284
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------2ed192b485633db3ed829dfa33f771dfb6eaf6be4b4dd0a6f0c7ce0b8b628af0"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------2ed192b485633db3ed829dfa33f771dfb6eaf6be4b4dd0a6f0c7ce0b8b628af0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 05/23] man/man2/_exit.2: HISTORY: Update first POSIX appearance of _exit(2)
Date: Wed, 21 Jan 2026 22:05:40 +1000
Message-ID: <eb5b310ab4dd16207afcdc5e8b9f8d80cd356b8d.1768995315.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
MIME-Version: 1.0

_exit(2) first appeared in POSIX.1-1988.[1]

[1] IEEE Std 1003.1-1988, Section 3.2.2 "Terminate a Process".

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/_exit.2 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/man2/_exit.2 b/man/man2/_exit.2
index e1f264c95df2..940b1d408fa7 100644
--- a/man/man2/_exit.2
+++ b/man/man2/_exit.2
@@ -65,7 +65,9 @@ .SH STANDARDS
 .SH HISTORY
 .TP
 .BR _exit ()
-POSIX.1-2001, SVr4, 4.3BSD.
+4.3BSD,
+SVr4,
+POSIX.1-1988.
 .TP
 .BR _Exit ()
 C99, POSIX.1-2001.
--=20
2.47.3


--------2ed192b485633db3ed829dfa33f771dfb6eaf6be4b4dd0a6f0c7ce0b8b628af0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmlwwXQJkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmfNyBce5bD2xdai6bPk4YriFiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAAMymAP9gndjhQOqhK5rWtpQy9WVkP6DIERti/OU81V96
kIBZAAEAxAWGSgRM7uIV7Uekvt9XGvkknGrZK0YbrXdxV1HlzQU=
=ysMy
-----END PGP SIGNATURE-----


--------2ed192b485633db3ed829dfa33f771dfb6eaf6be4b4dd0a6f0c7ce0b8b628af0--

