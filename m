Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C2E363C4F
	for <linux-man@vger.kernel.org>; Wed, 21 Jan 2026 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997307; cv=none; b=d43IBEVTE9OHWk8UEVHmJR5NG1uRa2QpCs8AMHPM6RmyJ3M6zne+ErOMql4mJwWbXhB4bwcxMf6nodDyGxlb86VlCZEx/49hqKghMse9Y8qq+u0lLJADfkMHWa06unPwlqOo3MKoIu3vqq8sr2XV0n4OIjAYiAMroZ4r/p6Lp0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997307; c=relaxed/simple;
	bh=rHOEeyDG4RCi/EAWs+ISuZdNgEKO/BNCDCswEHFCmRg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MYuUuZV+3qUTbl7OKDKonPnnYrot4ca3mbgv6XN0V2Wc9+fy5eaVXXoLu1Nc8jspvwVjBxwlcckFIF+XHeNqOb595PiW13hXKtITbCtsPbrACO9exUoADrTpWlU9wbr5WCHt5BgEzOxTMDjIcPgAuh3mApUxfqkrmRibhIoNLWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=l0d4MrSc; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="l0d4MrSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768997304; x=1769256504;
	bh=O9beHd9Qd+3Wu0BuyTgPKrmkmFYAEfcW+p280AD0TwQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=l0d4MrScLzz+94Fwr0duZGbvWL8/e/01o6c8e8b/qtnyy5pB4VwtW1pOj8ib6tPFY
	 qPPCkjgcMeW+zR/apkZrCk+jQhqxljyRzVCaC9R+mnzi8xqw+AIwYnJ3rbxVpTQFE7
	 MrgXKegBe3nlpGixPgRhafRSlSsAWA+w0J268ugzvU1wgEclQMMz6z1OOsa7tCkhQZ
	 EsDWEN1vx/Cteuwnob57++kEEhe5cemaB29YeSGDiD0iPTheLPZDRFPcUHvmm7pKYZ
	 HCNjtHDvh9iEpm99gKFtpQmQCtxbZHt9JkT5FmbyDh9h4WFaCn5XrDid09BxpMMSW/
	 F3fFw65d+VjaA==
Date: Wed, 21 Jan 2026 12:08:19 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 18/23] man/man2/getpriority.2: HISTORY: Update first POSIX appearance of [gs]etpriority(2)
Message-ID: <d5e7adf0a8040b165906b50ee93edbd43a7c24ab.1768995315.git.sethmcmail@pm.me>
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: f77cc367ab6e180cc50151005dec7b9ac052779a
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------88ae65da73605cfafcd01affb6da5ad0368c827a65c503b1ecb576e767b7ebce"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------88ae65da73605cfafcd01affb6da5ad0368c827a65c503b1ecb576e767b7ebce
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 18/23] man/man2/getpriority.2: HISTORY: Update first POSIX appearance of [gs]etpriority(2)
Date: Wed, 21 Jan 2026 22:05:53 +1000
Message-ID: <d5e7adf0a8040b165906b50ee93edbd43a7c24ab.1768995315.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
MIME-Version: 1.0

getpriority(2) and setpriority(2) first appeared in SUSv1.[1]  The
functions were added to POSIX.1-2001 when POSIX and SUS merged, but as
an XSI extension (still SUS-only).[2]

[1] X/Open CAE Specification, System Interfaces and Headers Issue 4,
Version 2, Chapter 3 "System Interfaces", pp. 262-263.
[2] IEEE Std 1003.1-2001, Volume 2, Chapter 3 "System Interfaces", pp.
540-542.
<https://pubs.opengroup.org/onlinepubs/009604499/functions/getpriority.html=
>

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/getpriority.2 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/man/man2/getpriority.2 b/man/man2/getpriority.2
index 63509ee35216..aa76c1dad8fb 100644
--- a/man/man2/getpriority.2
+++ b/man/man2/getpriority.2
@@ -139,8 +139,10 @@ .SH ERRORS
 .SH STANDARDS
 POSIX.1-2024.
 .SH HISTORY
-POSIX.1-2001,
-SVr4, 4.4BSD (these interfaces first appeared in 4.2BSD).
+SVr4,
+4.4BSD (first appeared in 4.2BSD),
+SUSv1,
+POSIX.1-2001 XSI.
 .P
 The details on the condition for
 .B EPERM
--=20
2.47.3


--------88ae65da73605cfafcd01affb6da5ad0368c827a65c503b1ecb576e767b7ebce
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmlwwbIJkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcme9wzOTthiYuJ6NLlzL35a1FiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAAIt8AP9pDxw1HzpFeq1kle2rW4ppMRI/A1e/+83sDnbI
8GtmfAEAqDRMOoqW0EjLQRSz2IiFlrIfpAGJ0hcN9lUmyt+6pA4=
=Yjnw
-----END PGP SIGNATURE-----


--------88ae65da73605cfafcd01affb6da5ad0368c827a65c503b1ecb576e767b7ebce--

