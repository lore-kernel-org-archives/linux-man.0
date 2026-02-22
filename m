Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44682147F9
	for <linux-man@vger.kernel.org>; Sun, 22 Feb 2026 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771755243; cv=none; b=UrDCtl2Ym1wgQlCXKl3pwKwgqFDCOw7+OqgyhivVahA2D0up+Lsqj9E6wKDv2D+B+Jj5jynLbqXxmdWyLUfMRSjQtJRUcpY3t4XbRWnxqEM3QPk22UjlRWBeU7Eqp7pvbZ0K1dyLkvSIx/O6tq9vWLWbo1dLAeVQRLlOFEitsSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771755243; c=relaxed/simple;
	bh=QsaCR/fYwSHfRnPbAdXcIchTkbUQJN2cMbCVoYz/kBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ye1rCMbkl7p2A+55K+SMpP493iyklfaiGL6jxMPBMDA8qfZ2pJN+FZdICwaumUQBx+1iebS6B7ctg47hrH2mF7Ld0PkHIgvyCyZputsRQuJhgI4LitZAp/AyXpNx2quuM7Xf0ffYiAise+27AtH83MXTNQMXeRW5Oi0WhHpgqUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sethm.id.au; spf=pass smtp.mailfrom=sethm.id.au; dkim=pass (2048-bit key) header.d=sethm.id.au header.i=@sethm.id.au header.b=QEOF1FuA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d8CqAUjx; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sethm.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sethm.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sethm.id.au header.i=@sethm.id.au header.b="QEOF1FuA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d8CqAUjx"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 3471F1300D41;
	Sun, 22 Feb 2026 05:14:01 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 22 Feb 2026 05:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sethm.id.au; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1771755241; x=1771758841; bh=aa0rjMX/Jx
	801fV4qg7WbOtRI5EechKZq72CSr83CsI=; b=QEOF1FuAbC6c4e7UGYbD6hH7lE
	L6JHVhs3eGy+mTs+69nxquYHNHHpaW9fHGzlm792okcLQEdaAmC32iUGg5K4mmVB
	HPK0cTYpvRhKcKmzLDyFmITKPkfy7TcVJkZzkKM8ofrBRsWtaUDoRVtrJhO3wMZG
	2km+U6f1Am5zx8p5+jLJnW56pKQibpu+22xkBwJKqztFNdAs/0rgUXlbWteft39w
	nOQQ3ql6ICk6hg2NPdBjV/tfFB1Ko7d0focg4p92eQS83xI/PFXmgFEHS/bY7n34
	3mrNFj8I4kNF3RtdyUgXz/zPuaENRd2F14JzUOc3hmWHUxXm42RXSPzxnElA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771755241; x=1771758841; bh=aa0rjMX/Jx801fV4qg7WbOtRI5EechKZq72
	CSr83CsI=; b=d8CqAUjxw4jZXvzgd/FBA0psgeXHYFKGxLUpG7TsXwerAmyqxk2
	ZYhWJrD4fMxNX0ekpTtS1kXz534kIMNONn7lmto3ZtkJpIfHCy6maxzgd0p3Ia0L
	Gp6CKeJMBD8m6al8FqA7GUZj4FHYBF9qmu5TvibCajWmXApQTyY6VMz1qGoEIi2t
	qSZ7Q/Mcxgwo5ltSnqVtYZvzf/RsFEtjdnBhziL4WY9EfJO0NVQOEe/bvMH+wUhg
	RAsw1FyTpO4CNROKKChZ5FslMFp7WYmEhB/8YtbXtvhNsfVRnXEl5qfP08fudnVA
	pf9pGquG1pu2O3bkHsULn9/sn5ja7LZmUMw==
X-ME-Sender: <xms:6NaaaYTZKyT5ZGbIMhChDE-DX8WYVA0MsrcMqW6lf5mhqerM8AEr3A>
    <xme:6Naaadi4krKVQe9C8zgE74eyAa7BNN9NY7-2bF4qDsRGQIn5C_ogm77HIaqBS-nke
    OD1yS6SDBFU2pXGZNG7ntL0ykIn3qEDdKJU4iKiiRJYADIS92dvcyE>
X-ME-Received: <xmr:6NaaaY4_DPzsr3bp0j5wYTboPT-yyB9pjDhM5OS0P2WjdOQZIeJ6k5UgdJ4dlfc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeegtdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkfgjfhggtgesghdtreertd
    dttdenucfhrhhomhepufgvthhhucfotgffohhnrghlugcuoeguvghvsehsvghthhhmrdhi
    ugdrrghuqeenucggtffrrghtthgvrhhnpeeiueffgfethedtvdetueefhfejveeggeetje
    ektdetieduiedvheejtefhueefveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpeguvghvsehsvghthhhmrdhiugdrrghupdhnsggprhgtphhtth
    hopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhigsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopeguvghvsehsvghthhhmrdhiugdrrghupdhrtghpthhtoheplh
    hinhhugidqmhgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:6NaaaaAkyhf63dud3b2OUYRVFzbdsW5KqR2VVLYeiWkI7YO0xjxeIg>
    <xmx:6NaaafZhTK8YqbtGZg1rvxRhsU9NrfLfDGIAlkNev3R-H6NDEIQGdQ>
    <xmx:6NaaaVZ6f0nXrux0zpgx-seES6I8SvZUUyH-7jYcyPIyl3-wqpPFoA>
    <xmx:6NaaaW9oYpx8U8K7Tc4OonKCAN41NI9HVv9uBT32qUNdTG2IhjN1Wg>
    <xmx:6NaaaQ7jRokCaO3XnR5KwybBX-aUGs5M2qFY5Dag5w9COm2qQhXaekFz>
Feedback-ID: i35064beb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Feb 2026 05:13:58 -0500 (EST)
From: Seth McDonald <dev@sethm.id.au>
To: Alejandro Colomar <alx@kernel.org>
Cc: Seth McDonald <dev@sethm.id.au>,
	linux-man@vger.kernel.org
Subject: [PATCH 4/5] man/man2/readv.2: HISTORY: ffix
Date: Sun, 22 Feb 2026 20:12:14 +1000
Message-ID: <f336517a9084b23f49da379a4d2a73f7a86c2e32.1771750388.git.dev@sethm.id.au>
In-Reply-To: <cover.1771750388.git.dev@sethm.id.au>
References: <cover.1771750388.git.dev@sethm.id.au>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed;
	micalg="pgp-sha512";
	protocol="application/pgp-signature";
	boundary="thoushaltnotpass"

--thoushaltnotpass
From: Seth McDonald <dev@sethm.id.au>
To: Alejandro Colomar <alx@kernel.org>
Cc: Seth McDonald <dev@sethm.id.au>,
	linux-man@vger.kernel.org
Subject: [PATCH 4/5] man/man2/readv.2: HISTORY: ffix
Date: Sun, 22 Feb 2026 20:12:14 +1000
Message-ID: <f336517a9084b23f49da379a4d2a73f7a86c2e32.1771750388.git.dev@sethm.id.au>
X-Mailer: git-send-email 2.53.0.1
In-Reply-To: <cover.1771750388.git.dev@sethm.id.au>
References: <cover.1771750388.git.dev@sethm.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Seth McDonald <dev@sethm.id.au>
---
 man/man2/readv.2 | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/man/man2/readv.2 b/man/man2/readv.2
index 765d487b9ff1..51549cf8214a 100644
--- a/man/man2/readv.2
+++ b/man/man2/readv.2
@@ -462,13 +462,17 @@ .SH HISTORY
 .\" The readv/writev system calls were buggy before Linux 1.3.40.
 .\" (Says release.libc.)
 .P
-.BR preadv (),
-.BR pwritev ():
+.TP
+.BR preadv ()
+.TQ
+.BR pwritev ()
 Linux 2.6.30,
 glibc 2.10.
 .P
-.BR preadv2 (),
-.BR pwritev2 ():
+.TP
+.BR preadv2 ()
+.TQ
+.BR pwritev2 ()
 Linux 4.6,
 glibc 2.26.
 .SS Historical C library/kernel differences
--=20
2.53.0.1

--thoushaltnotpass
Content-Type: application/pgp-signature;
	name="signature.asc"
Content-Description: *PGP Signature
Content-Disposition: attachment;
	filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.4.7

iHUEARYKAB0WIQTp0Sal8NSd93krwuK0v0Uw05stUQUCaZrW2QAKCRC0v0Uw05st
UXUKAQDfZFxvQetUDULNkgTyF/PpvWqCutDMLf54i5PWylonLgEArisY++q3MSeb
8/otf+dBSo4jznmxeiN8Y4ptcDaPygo=
=w60K
-----END PGP SIGNATURE-----

--thoushaltnotpass--
