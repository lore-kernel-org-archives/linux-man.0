Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410492147F9
	for <linux-man@vger.kernel.org>; Sun, 22 Feb 2026 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771755226; cv=none; b=TDxC9fMgyUBGGg/+MV/fCXkTIL9SiHNQ7dyPPCAU7Ud0CELeYuu83w3MNHtishd1tBqVEYgoFnZ9dwe/EqhVFNePCf/5+CdnligmuSrD8voc6wkZwi7mJlmWJVpRqNQ6f5bDRynwR1phjmFGLx7+zkkgV0rbqHom76IE+7QRAK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771755226; c=relaxed/simple;
	bh=643CZOrvN7zHOHNwYF8lEgwial83ZqSeWTP4zBMEH+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pmw/4hBmKwK82Ct5jjSp9syZMDvsibnBdhLTFSkzE9PXeRX2DlujS4/z47fLN5qRHjyVysvmJcv+NHVzAWr2bO9ylpBVz8gYdh1SkkerAO7rJHTsTAPILkiAdcUxtMvMkmN7XoAtcHCAEEWh1g4uUDoNiBU06SdlB4SDbSfWJkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sethm.id.au; spf=pass smtp.mailfrom=sethm.id.au; dkim=pass (2048-bit key) header.d=sethm.id.au header.i=@sethm.id.au header.b=qGxOOnbk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Nt3Xhdbn; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sethm.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sethm.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sethm.id.au header.i=@sethm.id.au header.b="qGxOOnbk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Nt3Xhdbn"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailflow.stl.internal (Postfix) with ESMTP id 8CE131300D3B;
	Sun, 22 Feb 2026 05:13:44 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 22 Feb 2026 05:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sethm.id.au; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1771755224; x=1771758824; bh=I2IuJhhG1c
	tKKP3EujivpMNZGSl8YMB8ly0zfVWo6xU=; b=qGxOOnbkCtod2mKgIR9H1kBIpV
	vdwgzM+wdbxipf6oezF0iH3BUS/Vdm2T5oDnrPjYJFldGoeO332z+kioz8V2XNKJ
	DKWdUNX+caLvQOXbgb4gnzEGRrlh/OOHpK97TGqmlhS4Bo/fr16sKXYwBnuESJF6
	ULWC6en28zAseRBs142Tvh3uQ059QMKX7+FEok5t+/IFJQAG+Q+5V0JwuPZXOhH0
	3yc3da3r9QjmiQ0Mk45Z6YJ7C/iMxE2eXUQegfeewfb5RSoUV+b+zoTp1TaSCrC5
	X0c21jmLXjSbLGySkTis/0lYQslpT4XmticMzDTcoh29s7qSdChRXrHnngJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771755224; x=1771758824; bh=I2IuJhhG1ctKKP3EujivpMNZGSl8YMB8ly0
	zfVWo6xU=; b=Nt3XhdbnZsfHZ3ElCE520YOQ/EFecMmjzba55cJwcquQ2lOcADm
	Fr2z6EnmjdoK2T9i94PHSWKAs/1AM9DUSML853tnl3pe7W/caB8oFBV855LTPzrq
	H0KOUCKR7Zoybb8BN29WTWurexEzkMVjjctKgwveOFxzWQl2m+A2yQ+Vd9XNL6wp
	cSnI62884jw9KI8ygov3sDYwwrhDoInJtOPmvtPo012HADqPQmKfoSDV2zBkx+cb
	q53xEYlaxWyXT7f+bBYtPbSVGWQBAvwZwt4/XyT9oORVOhlzey3DyyeuautuWyMu
	NvW53/QUMsKM/ofVTA8XjWiySQY0ur3oSmQ==
X-ME-Sender: <xms:2Naaafib-TC_K-jlitiDPj1a7nhwdLT9UE5SIP_HxO7zysFonB80zw>
    <xme:2NaaaTy80t0goIsL4esvEgZuye3Ceqcz_x7eyN3mzotMqtOZElMhXtl1BWJlfoXnH
    rvPMyvaxa3FIsPQfExG6LI_2Vm8nw27XCsRkSbD0czHFowtal-JwDVN>
X-ME-Received: <xmr:2NaaaSKJicExoqNUDl8BWq1g5WtKK1tm3-mA-gLa-lIVs5Yaw5T3yUCjgSu2TvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeegtdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkfgjfhggtgesghdtreertd
    dttdenucfhrhhomhepufgvthhhucfotgffohhnrghlugcuoeguvghvsehsvghthhhmrdhi
    ugdrrghuqeenucggtffrrghtthgvrhhnpeeiueffgfethedtvdetueefhfejveeggeetje
    ektdetieduiedvheejtefhueefveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpeguvghvsehsvghthhhmrdhiugdrrghupdhnsggprhgtphhtth
    hopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhigsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopeguvghvsehsvghthhhmrdhiugdrrghupdhrtghpthhtoheplh
    hinhhugidqmhgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:2NaaaaRwrepnStc0QyAG44mNAaaVrMEaWOoE7maGqt0kqOzSjSNZaQ>
    <xmx:2NaaaapXDzwCAFHUgpq8Y1Q0M6bPc7fsQdhUO7RKI-khMxHlS5LzLA>
    <xmx:2NaaafrPMftCtnXW2O6kRQfb5vCZDWDkCK6fV0R1uAzMyNMFhC8_ig>
    <xmx:2NaaaUM3cqlhSgSXYLwDBuDxJzhbvMIn7cqQ7NwbN8L_VG8bMmMewA>
    <xmx:2NaaaaKT7CALj8yFBZTUTJp5WfnDscGLX3bbBg8fT1OYLLcyzJkpNvNZ>
Feedback-ID: i35064beb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Feb 2026 05:13:41 -0500 (EST)
From: Seth McDonald <dev@sethm.id.au>
To: Alejandro Colomar <alx@kernel.org>
Cc: Seth McDonald <dev@sethm.id.au>,
	linux-man@vger.kernel.org
Subject: [PATCH 3/5] man/man2/process_madvise.2: HISTORY: ffix
Date: Sun, 22 Feb 2026 20:12:13 +1000
Message-ID: <e0ecd2307cf922ec0a7ad34d6524f0a62bfc67e0.1771750388.git.dev@sethm.id.au>
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
Subject: [PATCH 3/5] man/man2/process_madvise.2: HISTORY: ffix
Date: Sun, 22 Feb 2026 20:12:13 +1000
Message-ID: <e0ecd2307cf922ec0a7ad34d6524f0a62bfc67e0.1771750388.git.dev@sethm.id.au>
X-Mailer: git-send-email 2.53.0.1
In-Reply-To: <cover.1771750388.git.dev@sethm.id.au>
References: <cover.1771750388.git.dev@sethm.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Seth McDonald <dev@sethm.id.au>
---
 man/man2/process_madvise.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man2/process_madvise.2 b/man/man2/process_madvise.2
index 446617c4a4a5..7aa36b197487 100644
--- a/man/man2/process_madvise.2
+++ b/man/man2/process_madvise.2
@@ -184,7 +184,7 @@ .SH ERRORS
 .SH STANDARDS
 Linux.
 .SH HISTORY
-Linux 5.10.
+Linux 5.10,
 .\" Linux commit ecb8ac8b1f146915aa6b96449b66dd48984caacc
 glibc 2.36.
 .\" glibc commit d19ee3473d68ca0e794f3a8b7677a0983ae1342e
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

iHUEARYKAB0WIQTp0Sal8NSd93krwuK0v0Uw05stUQUCaZrWyQAKCRC0v0Uw05st
UQvuAP9WElL8bDDp47uifMUPlqpQ0wiZTv3Cwczc5QMAalHqkwD+M9msGvAImQ2q
QLhmt20eES6QwIPnNSbFPsaAXXaUZw8=
=VJdn
-----END PGP SIGNATURE-----

--thoushaltnotpass--
