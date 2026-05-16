Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27D6377010
	for <linux-man@vger.kernel.org>; Sat, 16 May 2026 20:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778964936; cv=none; b=RC69KZdmlE9amu9cO4OVaa/Y+nGDtfgfmfCbay0NhcfFIPmzpt+yJxEJNjz0XO4EnDl5ZHyjB5GIy+wlmUztjGOZIB6/r6yiYbTvX3X1APs7MEdML30n9XJrqnDrE/T6o+4muJ8H2O3ICW6CcEke8dgq02zkCeIc4uiJh/qXu38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778964936; c=relaxed/simple;
	bh=mFXTmb5j6rgVe6PoIpFJv9lBvVmHZpSMA/yA5mnISes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t8c2UTS1SNnFvO3VmUc1xK5YVgEryToUnLGoCRLOoi+mEYNQUylzwsziL4qq8hXUqINrwSxx8mmqT9I9pYUo34NxT0ImOm8P7zeQoNEgxgfOTwn9WkRxs4mMHYtDgx8VmGGT7xSgbTfEmPJbs4fYtZMN83AvPH7QqIAbKLrRBP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=disroot.org; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3DF8C2706E;
	Sat, 16 May 2026 22:55:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgbX9jlXGwpa; Sat, 16 May 2026 22:55:32 +0200 (CEST)
Date: Sat, 16 May 2026 21:55:29 +0100
From: funsafemath <funsafemath@proton.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH 2/2] man/man2/seccomp.2: Document
 SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV
Message-ID: <agjZR_2uzuZCeMPs@nix-mail>
Reply-To: agjZM97qL3w4JZBX@nix-mail
X-Developer-Signature: v=1; a=openpgp-sha256; l=892; i=funsafemath@proton.me;
 h=from:subject; bh=RASgTo7/cXfR/jupFdoVdrhw0pi8EUzrjMaZBwJrGFk=;
 b=owGbwMvMwCV2QvA6L+scLT/G02pJDFkcp9dHJX85flRk7+bim72BtbdmHNgWMudXiW3QshZ+a
 eUJNZvndZSyMIhxMciKKbJILLzjK6Wr/tn+c6oqzBxWJpAhDFycAjARv6uMDPO+ZXHtusDTtvR2
 +YXaDZuCNHLXzfJbp3PRrfLefcEd3YwM/0tuC98L6ntb8n3fMaVX28KanH2Ei/ba2DhNqFmf1Jq
 kwwoA
X-Developer-Key: i=funsafemath@proton.me; a=openpgp;
 fpr=B07EE98D22F23DFB077429C0DF66F4774CE714D5
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="egil7u46ift4cyhq"
Content-Disposition: inline


--egil7u46ift4cyhq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH 2/2] man/man2/seccomp.2: Document
 SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV
MIME-Version: 1.0

Document the SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV flag,
which makes the process ignore non-fatal signals until the supervisor sends=
 a response.

Relevant kernel documentation: <Documentation/userspace-api/seccomp_filter.=
rst>
---
 man/man2/seccomp.2 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man/man2/seccomp.2 b/man/man2/seccomp.2
index 0729a653c..5dd2675fc 100644
--- a/man/man2/seccomp.2
+++ b/man/man2/seccomp.2
@@ -256,6 +256,13 @@ .SH DESCRIPTION
 .B SECCOMP_FILTER_FLAG_TSYNC
 flags together results in
 .BR EINVAL .
+.TP
+.BR SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV " (since Linux 5.19)"
+.\" commit c2aa2dfef243efe213a480a1ee8566507a5152f4
+Ignore non-fatal signals until the supervisor sends a response.
+.IP
+.B SECCOMP_FILTER_FLAG_NEW_LISTENER
+flag must be set.
 .RE
 .TP
 .BR SECCOMP_GET_ACTION_AVAIL " (since Linux 4.14)"
--=20
2.52.0


--egil7u46ift4cyhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQYodxNGi0n8z/zZSXIEdcNBZwqTgUCagjZvQAKCRDIEdcNBZwq
TvRCAQDz1HH3Ma3gneix2GBOxcBKWghEJMee3hhjZOLgKBqB2gEAjaKtqzJcR912
ANKyXl8zuJbmdnTpwWdsI7Qz+Lf1tgQ=
=QVxp
-----END PGP SIGNATURE-----

--egil7u46ift4cyhq--
