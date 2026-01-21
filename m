Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695733A9DA4
	for <linux-man@vger.kernel.org>; Wed, 21 Jan 2026 12:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997229; cv=none; b=NjLt4kHIE50QzYxMROvV1WIy2iRwARhe1dXR421Qm75hRBcdgxHPy9RUm14KbUgl+kCabqYp1rt3dlXmcCoO7UyLUJnWM4hs1nCsdyJRK/8ty3x/dzZYVFh0PiF9KjtU0eYUWQszRV3ItvBQ1McoM28F1oh7cfIH1QYcmw4Snrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997229; c=relaxed/simple;
	bh=oFpNsb3+EuAFN7rZVRUJ1MO7WLgbZyoXmngpagODZQw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AZG7STrUsbZkxizYjzTf9jxl/uYkPev+8V1d4HB7og4o4BTzgn+41Q8hcj0cdRhzLIWor8T+x++4NaxrQXckhrdpen4C7V/Gc3ieA2A5oqkp/jAhAtwT65Mv9Tk7wE7P+0v+AIpccD/FwHGKAj6gLqUElNP1yjuSr9FN1VOpIsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=TQ2hNum3; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TQ2hNum3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768997219; x=1769256419;
	bh=cnnmoH6p33g0pSu/EoFwXxOvNdAKa8NnkZhzmDoDjsc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TQ2hNum3gKkU+Q5F7Ct99mFNWvyq8NLXM8Nnwr/VaEVooLFTVLAIhvXZm+WWzlDSN
	 LuSAkX7ozFjLkTX3aBs9Crt0YEzZd44vizj68mseEMbhNG1IL8Td6xa9vxa5LIeI3i
	 nTMGASKxIgstjMFeQjZRwLJxcAwCTDXoBuLyky/PaCr5vG4xPIIDcdrk2iRO9GIu63
	 16zzsPMANfnV3bYnotMZp/hhzVUyDUEKRy+E6fe9OCnjGD0NB8wXGG3lHUjsvliWi0
	 qqi844tlnhL/eVQL1lQYLFW02FdgRqqa4KH5uHJlxQ8TwFRNX30pE6n28OinsEY5tn
	 uRjFWPIif1B+Q==
Date: Wed, 21 Jan 2026 12:06:57 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Seth McDonald <sethmcmail@pm.me>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 01/23] man/man2/clock_getres.2: HISTORY: Update first POSIX appearance of clock_* syscalls
Message-ID: <1a421b5ee130c1d5892791060b6fdf8d911d8362.1768995315.git.sethmcmail@pm.me>
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
Feedback-ID: 171233811:user:proton
X-Pm-Message-ID: d61b88c8b8f8aa2bc5c5c80af6d4635b9d7091e0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------2079fa4f87cb88070ce9053c68bee9cfee39da1f5a9f3b81fdd3e1738f492953"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------2079fa4f87cb88070ce9053c68bee9cfee39da1f5a9f3b81fdd3e1738f492953
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: Seth McDonald <sethmcmail@pm.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v1 01/23] man/man2/clock_getres.2: HISTORY: Update first POSIX appearance of clock_* syscalls
Date: Wed, 21 Jan 2026 22:05:36 +1000
Message-ID: <1a421b5ee130c1d5892791060b6fdf8d911d8362.1768995315.git.sethmcmail@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768995315.git.sethmcmail@pm.me>
References: <cover.1768995315.git.sethmcmail@pm.me>
MIME-Version: 1.0

clock_getres(2), clock_gettime(2), and clock_settime(2) first appeared
in POSIX.1-1996.[1]  SUSv2 incorporates POSIX.1-1996, so listing both is
redundant.

[1] ISO/IEC 9945-1:1996, Section 14.2.1 "Clocks".

Signed-off-by: Seth McDonald <sethmcmail@pm.me>
---
 man/man2/clock_getres.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man2/clock_getres.2 b/man/man2/clock_getres.2
index 5f8ed14f1555..1a486c886229 100644
--- a/man/man2/clock_getres.2
+++ b/man/man2/clock_getres.2
@@ -369,7 +369,7 @@ .SS C library/kernel differences
 .SH STANDARDS
 POSIX.1-2024.
 .SH HISTORY
-POSIX.1-2001, SUSv2.
+POSIX.1-1996,
 Linux 2.6.
 .P
 On POSIX systems on which these functions are available, the symbol
--=20
2.47.3


--------2079fa4f87cb88070ce9053c68bee9cfee39da1f5a9f3b81fdd3e1738f492953
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmlwwWAJkFg5atiSQ9NpNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmerggWf4+Rq2WzjCjrjckl1FiEEIzbo0v6xUwBp
LGKpWDlq2JJD02kAACIwAQDNhTDXoTLoIV3G4qO0y+Chnq99t0ODWtp5k5Ev
NHUleAEAh2U+jwzYWLHs7YpSQknA5vjrkiAnw2kMwr8iO55XwgM=
=eXNA
-----END PGP SIGNATURE-----


--------2079fa4f87cb88070ce9053c68bee9cfee39da1f5a9f3b81fdd3e1738f492953--

