Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170B94218A0
	for <linux-man@vger.kernel.org>; Wed, 21 Jan 2026 12:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997254; cv=none; b=AL78F5ewL7awfetZEyXgM6BwprERBF+6hOXiDM1mQYz8MJMxR/9iOd6aW+4Qlya/WrBLZDfFcz8f71HkKIkt+tRsnkmFiaWC3TKjCstNInEJb4kSW3awYpjXO9jVUmUwrVdIaSXmpfkNTlNblfuk9g2FxURJMxscrKUyBNnoarA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997254; c=relaxed/simple;
	bh=IFOH5k7Z/pNUy1Xd/BCujvY3nCIWNdACssIUgMD7GZY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pBOPszqMJhCzLie0RvbWeVZWftWnEessHjTKWmL1iWQvfHu2FU29zvog1r5Y5RtMrdTpew06HCtAX9lgoV3UNxmDjKjdITA5arF7xH1s3SVeD75i7QQ/NIYmj+KHyn0+0O0mDy0jPimhZYxI0usFwvAG62vm7aH2k+8XCoAMbHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=dGUj52WM; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="dGUj52WM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768997250; x=1769256450;
	bh=IFOH5k7Z/pNUy1Xd/BCujvY3nCIWNdACssIUgMD7GZY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dGUj52WMsvCxHzDy271/9mFI5hRTRAKmNs2c+tDai5IHwKnRWDtULiUDo+5+Ipdbs
	 dkz6/TTcLhPJzMH7qw/X/Gmzg9qkMDvljxepcfgYqL6guRWSns/LhknFCHHAITCmBl
	 yvcUQKfVh845zrpRdPesiYjPoYtr/raHEmxw7xZnlW9VPp61vqP4VYjhJiUzw35AXW
	 JB4DztegoEP4wnhgRzafBCrtDVTNaYe8IwFVN04sHz/ovGAB3m4i6p1DmlwAV4k6oW
	 +i+33xPljOp8UG5V1Ii63ThTJBS7osIPMXt+iLaS6fSfT44r7kfQE2E5HCjfOLLDrO
	 fHTMME30H3tKA==
Date: Wed, 21 Jan 2026 12:07:25 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 07/23] man/man2/fcntl_locking.2: HISTORY: Update first POSIX appearance of locking constants
Message-ID: <a44c4965006373942afeb2f091c752b2dfbfbfd5.1768995315.git.sethmcmail@pm.me>
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: f42386bfebe2b855d4075a8c9e61aec8bf26ddb2
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------983762cd12256d0f3568082d5cba36ffb5269081f759d3a1a0cfb10717aef5ba"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------983762cd12256d0f3568082d5cba36ffb5269081f759d3a1a0cfb10717aef5ba
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 07/23] man/man2/fcntl_locking.2: HISTORY: Update first POSIX appearance of locking constants
Date: Wed, 21 Jan 2026 22:05:42 +1000
Message-ID: <a44c4965006373942afeb2f091c752b2dfbfbfd5.1768995315.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
MIME-Version: 1.0

The F_GETLK, F_SETLK, and F_SETLKW symbolic constants first appeared in
POSIX.1-1988.[1]

[1] IEEE Std 1003.1-1988, Table 6-1 "cmd Values for fcntl()".

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/fcntl_locking.2 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/man2/fcntl_locking.2 b/man/man2/fcntl_locking.2
index dc98735571fe..698386e1c5d6 100644
--- a/man/man2/fcntl_locking.2
+++ b/man/man2/fcntl_locking.2
@@ -571,7 +571,9 @@ .SH HISTORY
 .B F_SETLK
 .TQ
 .B F_SETLKW
-SVr4, 4.3BSD, POSIX.1-2001.
+4.3BSD,
+SVr4,
+POSIX.1-1988.
 .TP
 .B F_OFD_SETLK
 .TQ
--=20
2.47.3


--------983762cd12256d0f3568082d5cba36ffb5269081f759d3a1a0cfb10717aef5ba
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmlwwX0JkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmeDE78JPPGdql8rHEJ6kzu/FiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAAHmiAP9bUCzceO291H4OWUNjhDTsSo2UTXQ7pKFsLPHl
h9pYrAEAmHrbjhOILVsf/Tfv4E4/G/9pwO3lNULaeqcgJUZiZQU=
=cNMj
-----END PGP SIGNATURE-----


--------983762cd12256d0f3568082d5cba36ffb5269081f759d3a1a0cfb10717aef5ba--

