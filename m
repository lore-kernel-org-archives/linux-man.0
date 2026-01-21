Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2242513957E
	for <linux-man@vger.kernel.org>; Wed, 21 Jan 2026 12:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997267; cv=none; b=s30jWSo78C1PDAaabO1lTLPcwTiUJTtUxUtaw9TOLhJp8+jOqPoVt2PtY+/zQynGqImkxuIhUwQV2Juoh/VKefCnEXlR2bEHwkcEo8tkTBADF1Han73atTogcgnv/AevYGhBq3HLXnXxSy9dFbBSQGMft+NvbtTYNnKj64d9XXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997267; c=relaxed/simple;
	bh=d4gdvo+/Jpcz86W8VVbR2Y9Z/L4Sii6tmhsPtDYXuhk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HZVEmuhmckPQRISF3VsNcXZhX886Trhz2gDXa9tOTDvvtztl5RyZ8YIOniEEP/le5c1/zF6VzvlePzN/tk6VXmGdno+oo2zUYbh1cCTiJ8WlRQakb8Vi5arOfHv/U/IP8S+YNkyC8tsVE5lN3fYO08Ndt05wtma3JL3tTW8LHys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=LgSSjqTV; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="LgSSjqTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768997264; x=1769256464;
	bh=8d/lboQ5y5cDfHodHvwX8xfYDe/lVnghDRxaVqXM8/8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LgSSjqTV919MGrDKrYKy1vmVORIhX2SwUj8GOpMM1ISX0rIc5l8gntPXfm/isEfnk
	 /tlZHGF8OR5JTsWnL5x0Rs6IZYf4D13bsz9QHNzMTZMgmuIS2FebgGOpoZOsEtPKUR
	 iHv3IXrPYtx3XWd/rtByRsznKGjgqMhQGRVIdtrzLr7qHhihB56IoJd06bFhb5mRKZ
	 iiRs+93eFbppRQRxVL0FzRYFcqyLo+4akgoJYPjA1cmGc9SSx0Lz/cLNlH6t4/xoE3
	 U+s//yCMV4ksmPK2QHfAIuKkoDf5zAZ5hf86Sef8Aj44WGbJcgRAfNTuO8WyvXyl6Y
	 Nnio1e00Y+lFQ==
Date: Wed, 21 Jan 2026 12:07:39 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 10/23] man/man2/fsync.2: HISTORY: Update first POSIX appearance of fsync(2)
Message-ID: <0dfa064b051b30ec576889bf90016bc015f3e838.1768995315.git.sethmcmail@pm.me>
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: 90db23511f9eac0f15c59e0dbb3116c028313eb8
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------de57a2fe0160be87faf9c864b60313f4be1c17cfd352c9556c3d4f484eac5ee8"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------de57a2fe0160be87faf9c864b60313f4be1c17cfd352c9556c3d4f484eac5ee8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 10/23] man/man2/fsync.2: HISTORY: Update first POSIX appearance of fsync(2)
Date: Wed, 21 Jan 2026 22:05:45 +1000
Message-ID: <0dfa064b051b30ec576889bf90016bc015f3e838.1768995315.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
MIME-Version: 1.0

fsync(2) first appeared in SUSv1.[1]  The function was then added to
POSIX.1-1996.[2]

[1] X/Open CAE Specification, System Interfaces and Headers Issue 4,
Version 2, Chapter 3 "System Interfaces", p. 214.
[2] ISO/IEC 9945-1:1996, Section 6.6.1 "Synchronize the State of a
File".

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/fsync.2 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man/man2/fsync.2 b/man/man2/fsync.2
index e4f8b9b9456d..b7787ac17aeb 100644
--- a/man/man2/fsync.2
+++ b/man/man2/fsync.2
@@ -154,7 +154,8 @@ .SH HISTORY
 .TP
 .BR fsync ()
 4.2BSD,
-POSIX.1-2001.
+SUSv1,
+POSIX.1-1996.
 .TP
 .BR fdatasync ()
 4.2BSD,
--=20
2.47.3


--------de57a2fe0160be87faf9c864b60313f4be1c17cfd352c9556c3d4f484eac5ee8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmlwwYsJkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmd76bDYtoFuVgyiLk7SZN5aFiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAAHnpAQDUxd9BMPK+ioOQuesGdehbFBILe/7RnPGIaQ/M
pcCzJwEAyxPxx5yHN0ygeRFFuvxL1nsQ1KbC4od1HuuI8HRJHwE=
=tVUf
-----END PGP SIGNATURE-----


--------de57a2fe0160be87faf9c864b60313f4be1c17cfd352c9556c3d4f484eac5ee8--

