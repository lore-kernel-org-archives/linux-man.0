Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBB83C00A0
	for <linux-man@vger.kernel.org>; Wed, 21 Jan 2026 12:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997235; cv=none; b=XbnugnWXryfo8a7AXjniUQNlBYaSpgoDpXLP3iACrSG0IDLMmQYmyBz7vGWksx9qohIoinNJQlZspLp0aWs8WgKFkWZivooADidANZp/AsxQjB6r7LdEwCZftBR29+AK5b+2VptGbSbQrHizIin3Sw1t53OXueyZAAX17XRLneY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997235; c=relaxed/simple;
	bh=Xpc/TMqlzBzJyCsqHFyPfij5qHi79RQtn5ZnBAqiXEE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oLqPNySmNv7wgQldFv0HAWMSTqpvbHoQ2dhhPbDHsqJuAXHdGt6FsvgGXgqHy5t3lAVphjMPq1nAnKPAaWhF8WgOBXwrtUYxn7N/TFBuSHKRMeUhYNGohqL7pBxrgg2VbLTkOeq9Q/FPQQ1TaT1B6SK2tEbRM+6Y17p0zvN6Mhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=J/lEa+9c; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="J/lEa+9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768997226; x=1769256426;
	bh=Xpc/TMqlzBzJyCsqHFyPfij5qHi79RQtn5ZnBAqiXEE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=J/lEa+9cYlTxLwpor7WkVCJE5cceoEw5B/YccAl5L5zgZ5OSapakvoiHd1IBmWiTA
	 hIljygvnby3ocbhLjhcTCcRhK82fDolhoQjryh9f4rYkNXVsfVpQftYDKH6IfoIwRv
	 IMcnmkwGOPTKAwpNHIjzZCmbt3asw0sEXJD23Vq3g5A7O2DqJQMbQRKtq3E7qU4ImP
	 kaweBUIMqWc2cy7kOyA/U9PlDCd4LU2DFImmYW72x0uSG9l0TMltmtfIujN6yK+qp0
	 fToeL0dcFyAld1VFsWjTZg/tZ9Cs+628DBRQgRFFwOS8slNqv516gbVqHG3pzFwFrm
	 W8HrdmxxG/EdQ==
Date: Wed, 21 Jan 2026 12:07:01 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 02/23] man/man2/close.2: HISTORY: Update first POSIX appearance of close(2)
Message-ID: <5327747ac3c39457d3cf527ff19afa1c49150d89.1768995315.git.sethmcmail@pm.me>
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: 5fe25a2cd09b59a4ee7f3bd4746befe8bd8cf9a6
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------65e87f2bee5881a0e68ae079b297753a1a5b84be7819a446816bd28696acf1c9"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------65e87f2bee5881a0e68ae079b297753a1a5b84be7819a446816bd28696acf1c9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 02/23] man/man2/close.2: HISTORY: Update first POSIX appearance of close(2)
Date: Wed, 21 Jan 2026 22:05:37 +1000
Message-ID: <5327747ac3c39457d3cf527ff19afa1c49150d89.1768995315.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
MIME-Version: 1.0

close(2) first appeared in POSIX.1-1988.[1]

[1] IEEE Std 1003.1-1988, Section 6.3.1 "Close a File".

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/close.2 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/man2/close.2 b/man/man2/close.2
index 56a3caaafd41..60f1f5fb1a92 100644
--- a/man/man2/close.2
+++ b/man/man2/close.2
@@ -81,7 +81,9 @@ .SH ERRORS
 .SH STANDARDS
 POSIX.1-2008.
 .SH HISTORY
-POSIX.1-2001, SVr4, 4.3BSD.
+4.3BSD,
+SVr4,
+POSIX.1-1988.
 .\" SVr4 documents an additional ENOLINK error condition.
 .SH NOTES
 The close-on-exec file descriptor flag can be used to ensure
--=20
2.47.3


--------65e87f2bee5881a0e68ae079b297753a1a5b84be7819a446816bd28696acf1c9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmlwwWUJkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmd/nRmtP4zwz1v+V/pGueuSFiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAADC4AQDD0BJ1HRfm0tawHMcLmp9YsrrynaBR+jQItymr
mpgA4gD5ATCxAjHWpqhHLSTL4pyhiY6MoGi3tjR2yzaQy55DVgc=
=NMWZ
-----END PGP SIGNATURE-----


--------65e87f2bee5881a0e68ae079b297753a1a5b84be7819a446816bd28696acf1c9--

