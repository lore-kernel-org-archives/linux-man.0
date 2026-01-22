Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A257195811
	for <linux-man@vger.kernel.org>; Thu, 22 Jan 2026 02:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769048713; cv=none; b=ObP2tJ9zq49U6zf5j2Z0LAAWFJdJzm6upFqtFZ/hGSjN23YjkGCDU7gwkgusNHRkG893mMk0iurTvNQjHM1AV8KGY58hGCxUBxT/XGSWPoEYp7lu6j6m1LPm6iin5PkcgEhFYhLm7Qc7TmgGlpDvfJi91ZI588PzHzXpf876ijY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769048713; c=relaxed/simple;
	bh=wzmEbRiliW+9jF5HqN6aIfZCaNG1ADgVjToP5MbDlog=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXpdbq3WjhHlznebfm5LzJMYVyJ5K+05USt6BJGIV8Vc4HqWuKqi0CFywaq/MydCIck/cfbsSKjiC6JgXSzIJz74m+ttiShFyMfkGlii4JLd99haz/Yagm+FdiD2+wRYtxPlJvrqwRlqtzGV9xWzgviqqLrbgM43dQ8Mgl3TSBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=JrD/aVBN; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="JrD/aVBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1769048702; x=1769307902;
	bh=wzmEbRiliW+9jF5HqN6aIfZCaNG1ADgVjToP5MbDlog=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JrD/aVBNRQ7GqB/qX8uVzSMypZkrpoGrOIE11HGsrZm+CX32t0p8mMPbjXA4/uIkl
	 a+RXRvgPl86P//X7Wm5dhtZpWxuSGGtwKxdK6diiVPR6e1SiJFmTqVGf3VkK2zL3gt
	 FWl7s5wtCArOOEG6JM6hWtxNTbO1TEXcq3Kmaa+JEQLmaqlIMtp5ta6peXqAsUjHrH
	 UkUpL2CzeXnmKocHTq8DBzbZPcNN3Hj9Zpb3t5wAzDJn1g9VNdJDwbKOcxoWXNAHBW
	 J+7k4hVpQbQz2iOX1/JKjnYb3WB4bCdemsdxP0J1HnWI7hzyAC6jfOgp5njUCJcpAy
	 eVKVI9HNato9Q==
Date: Thu, 22 Jan 2026 02:24:59 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v2 08/23] man/man2/fork.2: HISTORY: Update first POSIX appearance of fork(2)
Message-ID: <7404e99ec6900a598552b310b152c325000163ff.1769047228.git.sethmcmail@pm.me>
In-Reply-To: <cover.1769047228.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me> <cover.1769047228.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: edc629b42a839d94beac1b4beea96d4844aef6d8
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------4ce58c17805ce57133488bd46524263c906d373a63b447eca91c9ed8418c720e"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------4ce58c17805ce57133488bd46524263c906d373a63b447eca91c9ed8418c720e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v2 08/23] man/man2/fork.2: HISTORY: Update first POSIX appearance of fork(2)
Date: Thu, 22 Jan 2026 12:24:00 +1000
Message-ID: <7404e99ec6900a598552b310b152c325000163ff.1769047228.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769047228.git.sethmcmail@pm.me>
References: <cover.1769047228.git.sethmcmail@pm.me>
MIME-Version: 1.0

fork(2) first appeared in POSIX.1-1988.[1]

[1] IEEE Std 1003.1-1988, Section 3.1.1 "Process Creation".

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/fork.2 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/man2/fork.2 b/man/man2/fork.2
index 995b7dd22639..9a8ea99e5b21 100644
--- a/man/man2/fork.2
+++ b/man/man2/fork.2
@@ -278,7 +278,9 @@ .SS Async-signal safety
 .SH STANDARDS
 POSIX.1-2024.
 .SH HISTORY
-POSIX.1-2001, SVr4, 4.3BSD.
+4.3BSD,
+SVr4,
+POSIX.1-1988.
 .SH NOTES
 Under Linux,
 .BR fork ()
--=20
2.47.3


--------4ce58c17805ce57133488bd46524263c906d373a63b447eca91c9ed8418c720e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmlxinsJkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdmgkrOdyidmAPoUzBtDs/QFiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAAPadAQDKGHnotiRlGUAsMirDlAhwrJU4Lc/PW76UNRB7
/iBj6gEAhfcWq0MTmV2CqV0u9zl6Y5g7ZftKiv9FfGIm6vYG4AA=
=zSVN
-----END PGP SIGNATURE-----


--------4ce58c17805ce57133488bd46524263c906d373a63b447eca91c9ed8418c720e--

