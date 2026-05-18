Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A514337D10F
	for <linux-man@vger.kernel.org>; Mon, 18 May 2026 03:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779074104; cv=none; b=YmVSGQwqchgrW0iithaMtABtnm+mANp5HsI583YQH6yJdtXfmD3twLu6boQkXi+rlKxgWAQ1iw8YDPcJz/5b9BbgaMv7E4f51zv5HJOSjXhTvJzDBoMy7lEBs9GocJ8ojSsH5xc70xMCMhXIWtehJRoBkbUpD8/cIyuVnhVOfBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779074104; c=relaxed/simple;
	bh=nUy79T6QrEEKAat+vjbxenIIUfGg9BHhkFryWxRmN0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VuIQzA5ZkpeUQQgGxj+Euv1SaCFPtqO1o2G3wLYstxBzBYCu2MDRGGdkTxIrCnyAe9C1X0EcELNaKPKzblrcqzGZdtoV+O0e7UentinwH/RF4WAG0nSjaKzsC4YTDC7GPeZPiy/esX7iTiquGMHy2KdycxeaMkgf5+a9vQJl6dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=disroot.org; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 04C3E270FA;
	Mon, 18 May 2026 05:15:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGdj9L9_Ivb6; Mon, 18 May 2026 05:15:00 +0200 (CEST)
Date: Mon, 18 May 2026 04:14:57 +0100
From: funsafemath <funsafemath@proton.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v2 1/2] man/man2/seccomp.2: Document
 SECCOMP_FILTER_FLAG_TSYNC_ESRCH
Message-ID: <agqEJhEejusooE5s@nix-mail>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228;
 i=funsafemath@proton.me; h=from:subject;
 bh=+mnUvsm4vTmHRYIZJggr62Y5raHfCNnYZi0jC3y1jPA=;
 b=owGbwMvMwCV2QvA6L+scLT/G02pJDFlcFSeX9J512/hw6/SjO2fuPP7vs33VCtaLqzUtX22ZF
 8O9a+cfm45SFgYxLgZZMUUWiYV3fKV01T/bf05VhZnDygQyhIGLUwAm8sKI4X+O26mOqy/awoOK
 hFZELe21Zoy2WsykX5n969Heh7KyKrcY/kol3F253yVgyrWZ6drv7SYdCrjVfIknJFz9m96KZA/
 TAzwA
X-Developer-Key: i=funsafemath@proton.me; a=openpgp;
 fpr=B07EE98D22F23DFB077429C0DF66F4774CE714D5
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yuqccnzxtcaaoceo"
Content-Disposition: inline
In-Reply-To: <agjZM97qL3w4JZBX@nix-mail>


--yuqccnzxtcaaoceo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH v2 1/2] man/man2/seccomp.2: Document
 SECCOMP_FILTER_FLAG_TSYNC_ESRCH
MIME-Version: 1.0

Document SECCOMP_FILTER_FLAG_TSYNC_ESRCH flag, which allows to
use SECCOMP_FILTER_FLAG_TSYNC and SECCOMP_FILTER_FLAG_NEW_LISTENER
flags together by returning ESRCH on synchronization error instead
of the thread ID.

<https://lore.kernel.org/r/20200304180517.23867-1-tycho@tycho.ws>

Signed-off-by: funsafemath <funsafemath@proton.me>
---
 man/man2/seccomp.2 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/man/man2/seccomp.2 b/man/man2/seccomp.2
index 75c7b2d58..a2776aab7 100644
--- a/man/man2/seccomp.2
+++ b/man/man2/seccomp.2
@@ -241,6 +241,21 @@ .SH DESCRIPTION
 .B SECCOMP_MODE_STRICT
 or if it has attached new seccomp filters to itself,
 diverging from the calling thread's filter tree.
+.TP
+.BR SECCOMP_FILTER_FLAG_TSYNC_ESRCH " (since Linux 5.7)"
+.\" commit 51891498f2da78ee64dfad88fa53c9e85fb50abf
+Fail with
+.B ESRCH
+instead of returning the thread ID on synchronization failure if
+.B SECCOMP_FILTER_FLAG_TSYNC
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


--yuqccnzxtcaaoceo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQYodxNGi0n8z/zZSXIEdcNBZwqTgUCagqELwAKCRDIEdcNBZwq
Tl2SAQCC7yK0TMoK+8pGm4hCJXNKay1a6ptwGySPbf863KRPTAEAwJVaT08Bm/Hj
9NK/KcXqdai8jQusD0KglfydRVMggAM=
=1K5Y
-----END PGP SIGNATURE-----

--yuqccnzxtcaaoceo--
