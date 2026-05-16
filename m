Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5AE1F30A4
	for <linux-man@vger.kernel.org>; Sat, 16 May 2026 20:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778964806; cv=none; b=ZcJTs6k4XOIT5UnGDpxpj1H6iC3YUyiryfjpF4USM7G+czIqPW230NaXjrzycJUPTe5X+aUPfGVlpRzIhkYVeV+xNuv9uzXqy3CWNoQpZxp2fgdR1BsBgaWnvU0xp7LiKBtKwKEvyJcfxmzqY9CaYN0COFr7X3tI867vY+V5w0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778964806; c=relaxed/simple;
	bh=oblJWLg7hXLgv/MmEPhbcAFpxGpl68o6J2HgP+xoQjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qTfkJ8ITndb1LHQED7r6mwKyXxzTN7Rb0x79BMnBHgcWWB7DBUt4ioupCLTs/GpD2a684BpulVGkZN3ckb0VEgrwZURFq1hBvukEAycfb9BiyWnWw/Dy+/F838E0Ayh7MvIyf0yOc/18DANZCz3rkKxsPJdcUw2KrMoLsHgLCP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=disroot.org; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 243D126E34;
	Sat, 16 May 2026 22:53:22 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQISnYOL5SO5; Sat, 16 May 2026 22:53:21 +0200 (CEST)
Date: Sat, 16 May 2026 21:53:17 +0100
From: funsafemath <funsafemath@proton.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH 1/2] man/man2/seccomp.2: Document
 SECCOMP_FILTER_FLAG_TSYNC_ESRCH
Message-ID: <agjZM97qL3w4JZBX@nix-mail>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=funsafemath@proton.me; h=from:subject;
 bh=7GgxTCdFt+0Z7dGwB3PM7NS/hnT5r1/9LZJyrLRD0DE=;
 b=owGbwMvMwCV2QvA6L+scLT/G02pJDFkcp1exnZsya+MdqYWf7qxe4BQtObF600W3RzM19uka/
 Mv3aHzi11HKwiDGxSArpsgisfCOr5Su+mf7z6mqMHNYmUCGMHBxCsBEEnMYGaZcjb5pZB2edsrl
 ZWzzMT5vra334hfGHQl4XdTscYuhJpjhr8AFi1l3Y3tuLVwmYx7mE9w378xn7Tntzt8Tv4VYHN3
 3nw0A
X-Developer-Key: i=funsafemath@proton.me; a=openpgp;
 fpr=B07EE98D22F23DFB077429C0DF66F4774CE714D5
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w4bmnrggvpwmybba"
Content-Disposition: inline


--w4bmnrggvpwmybba
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH 1/2] man/man2/seccomp.2: Document
 SECCOMP_FILTER_FLAG_TSYNC_ESRCH
MIME-Version: 1.0

Document SECCOMP_FILTER_FLAG_TSYNC_ESRCH flag, which allows to
use SECCOMP_FILTER_FLAG_TSYNC and SECCOMP_FILTER_FLAG_NEW_LISTENER
flags together by returning ESRCH on synchronization error instead
of the thread ID.

<https://lore.kernel.org/r/20200304180517.23867-1-tycho@tycho.ws>
---
 man/man2/seccomp.2 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/man/man2/seccomp.2 b/man/man2/seccomp.2
index 75c7b2d58..0729a653c 100644
--- a/man/man2/seccomp.2
+++ b/man/man2/seccomp.2
@@ -241,6 +241,21 @@ .SH DESCRIPTION
 .B SECCOMP_MODE_STRICT
 or if it has attached new seccomp filters to itself,
 diverging from the calling thread's filter tree.
+.TP
+.BR SECCOMP_FILTER_FLAG_TSYNC_ESRCH " (since Linux 5.7)"
+.\" commit 51891498f2da78ee64dfad88fa53c9e85fb50abf
+Return
+.B ESRCH
+instead of the thread ID on synchronization failure if
+.B  SECCOMP_FILTER_FLAG_TSYNC
+was specified.
+.IP
+If this flag is not set, using
+.B SECCOMP_FILTER_FLAG_NEW_LISTENER
+and
+.B SECCOMP_FILTER_FLAG_TSYNC
+flags together results in
+.BR EINVAL .
 .RE
 .TP
 .BR SECCOMP_GET_ACTION_AVAIL " (since Linux 4.14)"
--=20
2.52.0


--w4bmnrggvpwmybba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQYodxNGi0n8z/zZSXIEdcNBZwqTgUCagjZOgAKCRDIEdcNBZwq
TiN0AP0bOh8rfbUT6FGycm6n2GWw3jiV+C1FG+lr6Y++s+dW+QD/au5CniepZ5EV
fqzaqq1mpqWhmmoqYY9L3rk4vTzqAAw=
=NV+F
-----END PGP SIGNATURE-----

--w4bmnrggvpwmybba--
