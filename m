Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107980;
	b=CZynjz6ti6dm3sV9/fa5G8Je1+zeOs6n+1JrMaLkEYH3dXYqweWH7QYVSmvdE8Tm0+MV
	 2wvLc1ea/921Ev9HTr+62f3Q7Q2Y0CsrXX7ngH2guRSQX/+wnDx/9E6ElvBhtBa21NYxL
	 AG9vl1APYBf7wXLnHrrOBZnfCZ9OSYqLC9niIMLUSMl88c5O3UnsQNOYwmLjhUvObiUXu
	 BxQQil9LdPuTFkxTPGHbi2OQdP+k8R+Dpg0lQTMSs+AbMWoH4Nhbr0BWYVKx+6FXgWd2w
	 x06rHsIR7HflnFZ6XV/VoHURhNxN7dGBaAyMM5RAIBfkILT4TbK4ULB1VaVqwpEtF+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107980;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=So7TZif3Af2OnokfZ+EejhgWtBpuQIZKbzG8ZslFxug=;
	b=vW+q5BVR+nC3quiFJf9cKeyrwnREZz2A1ttccll6CVSK4zvrjujiQVFa5Bs+kUj+jH4u
	 FijwKU/eZ1GkVrE7Qoj1X+vl+uLM6Mz9dX4pTDcFRyfHxLzK/2HZBoFhloMROfCtCQDnr
	 QaU80SD+XFODHgwDNlqw7ml13rygxAq61wM0gHKBBh1PQkTyTRtRNO/pqoanYsmbH509R
	 uVTgJV0CiIuHLMqsLPt7vZv7Yyxey876QX0ZFEnT4po3aSuUeM4zw5MyTBfrcJP8q8o+M
	 4mq0Ev4GyAb4ZkSCTem08VqJdIkC+ZzaCyXlHyupxrbnP27NT9ay72aIEnk/p00ceSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=maowtm.org;
	spf=pass smtp.mailfrom=maowtm.org;
	dkim=pass header.d=maowtm.org header.i=@maowtm.org header.a=rsa-sha256 header.s=fm3 header.b=nW4e5ybk;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=q9Q1HuBC;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D754C606A324
	for <linux-man@vger.kernel.org>; Thu, 19 Nov 2026 17:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D754C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maowtm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maowtm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=maowtm.org header.i=@maowtm.org header.a=rsa-sha256 header.s=fm3 header.b=nW4e5ybk;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=q9Q1HuBC
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 2B1101D002DE
	for <linux-man@vger.kernel.org>; Thu, 19 Nov 2026 12:06:19 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 19 Nov 2026 12:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maowtm.org; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1795107978; x=1795194378; bh=So7TZif3Af2OnokfZ+Eej
	hgWtBpuQIZKbzG8ZslFxug=; b=nW4e5ybkK7ViJP6k8ubkpO8vap7Xtmx7sVeGX
	SiPhO1GNYCfZqR1d3VmeEV50kEKZrOubYl0ZPdx6Cx/tnNAJTOE3bguQFOur/I9t
	G6HNt+9dGp1CL+1Y08JXUJTIaIPTm5F8t4JYul7kUQycVCfVhp67okR+dQNverna
	KHyIUjTEHssbueCoyaFMljk0O4pxpXQWrDnRztOqK+7VPHCa6hf94HaNOBB+BHny
	5SiC/31hLY2d3A4hnBSy+16pVkwl380aw2uqDa43SEYy+ZTflgr6Sd7ChCVYr8Yw
	bXO1jf+naSdREU4mGg09L8lugyaVq511WXPssTJ1VMkGAULVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795107978; x=1795194378; bh=So7TZif3Af2OnokfZ+EejhgWtBpuQIZKbzG
	8ZslFxug=; b=q9Q1HuBCaCZyFIyzUk8DipWC1lPYJ/sUc8roZAjdukuV1y/jYeB
	bai4kRsSc0LKqMnEQrJPEy9EXfFflDxffcnvHaz8NfFLOdPCj2HGqP3qv0MfG6wr
	n/SnrdlJYIdC59BF77WhYWIKjn10VsjG2d0M71YL/ekUzz7yhhBmgIfQVNE5Vx3F
	Xr9PbJhnN10oykhsy74XFTgQ6ZMtX9GQTiKZ9tdKKe5F/1l37dZ3DLvkJKUCXppn
	7zvudyhHpTi9sRGnVz5YsclINw5NJZqJ2XdBohAFtMqrCmvB85/lZfCqVdHTxsSl
	rrQ3MkiPUrsBF7dTaV4yWPKCCV24S97EnHw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=maowtm.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795107978; d=maowtm.org;
	mf=PG1AbWFvd3RtLm9yZz4=;
	rt=PGxpbnV4LW1hbkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:pGI8uS2iuMoNQQP/7SASSkqlT38vPWRYzzRN832c2qPAn39
	x+8dCxISnGczef47JRDjPxW1DaCbqkukhASpHE5eFcrmJ3pAWjiVevBoYrNS51T9
	cEgOREXUnB/A6vKJ5mqmOZ6idLkYNTNkazywqbaowAFAUngWpqjOHjEkRTbkKfAp
	YXH7S22J6lP2bYm8JhT5Y7oUB3FEkT8zHjNwlEHXBadKoR+86OyA3AkdLyFhJpGH
	kjH5HxNarZOaIb+h3KVRlZDzMeiHjf6iuWza2uJqIzo29WuOCeRcZMH/1b+MTfhC
	kExccYdldJdDS4hM+j59S/GbsrjB8D16Q8Lpwbg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:saRq3QSbahXZWGDdGgoLuJcTHLTp3D0+id88tac0w4Q=:o2nDvyIsDG0lUML+UPPuvzjfmaKT/oWdsb7QnY12LaU=;
X-ME-Sender: <xms:iiz_amk2PVj4YlO3cYc6DiXRgGid2ixzXiLO3_S1qFNjsMduIENIkA>
    <xme:iiz_aktn6-Ji0eW0p506aEI936Pnx5lXz0o4Vw28d9BwjoYqNFQXv2dt4ptlcRxS1
    aZ6Y5R2r29WN_tRSlO31PcoTKRPigZ2Jc8Blhqj96l2-tpoZQ2YiOAr>
X-ME-Received: <xmr:iiz_as_vPgNeBW_tR2SXulUABxjdqlE-I4BWp3nX94DfUa6ymizkmnGYFTpMvmmOrnCYtQ8E3JKgavX7wQGKSHpWTUNulwmT6jdxca4zr0bcf5X1apDv>
X-ME-Proxy-Cause: dmFkZTFjeEDJ/Ck/K/CikTazXNbHzjAYKFuDsqhlGwAbeWSKtv6zaqcNEkMB5R7iNzLjcc
    SUnj0xxuDVM4cs/B7cWjkdGD2jY/Hz9x6JzT1cbE/TYrrJNuTx+jboGGh8sUvYS0UDUTlH
    R3TLawbusj6DjsJmTmJa4k3b/5AI1kV9UX4rC3kTo2dDCqvA34VuCyRSlF5Y8C1rK7sArF
    dlbxaDlryDkdJZJIkSM6jACjKm2OXPYRPLtF48Fs8nfFsS8TKGTJcwtkthEKiWiIHdJn1C
    TQG1QVutoaeki0daKbdQVqVR+qtVd03+3s++Co+F6REMDGrDTDslKbDw+B+jCx/BZFc/lU
    syTQKowbbWVmS1P2ILfKrus8RwFSl5uWAbRXLKvoIbDve4FHSdNYldnjBuNwFMA3QOQAG5
    kxtx1XuqC+Gfvql5Gef1Oxc/jrR+L8KYFobWr7MVWmG+0hW2zTUj+E2xB/8phZgAFz3Q0l
    Pc9/1Cn9pijgWvlEOqphydNQUw4dM0vpfNF0Tjc9+SzLiHKljzcYsUXMLwtpYiZotTR2/y
    Py4VzSLrMh8ogx2CTWCiamNp7YPzDebk2xIugnrvDrQLjTbGQaCPEIbyHKoM5o7Vrw3qR0
    TllaKaCfRK6+0bkwmJ98NA4BkQnR7J3ktnd1t4WwRJL3J+THJRZywP9JbMlg
X-ME-Proxy: <xmx:iiz_amM_tQeGPfNr7vDNx3K7ubmTGuae12_3iZEMMWClxG5NkAHnCg>
    <xmx:iiz_aiGseJ0RTPSv_o6fO7P3laMImQivy7buL5-s9VgK6t4GKqmDuw>
    <xmx:iiz_asRJb8fFkfwvXDXGK9rsWINehmClroaXXHLFIlGPCKYzoO93YQ>
    <xmx:iiz_anvIkTWPDyGHwMPCD78ZuSBmhr88bMMMElX1VXj2oQZWRxwldA>
    <xmx:iiz_avodfLgOvBLlBjmnxPXFW-3q2Cv-006tBpGJnAkoNbNNFcGlFcah>
Feedback-ID: i580e4893:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 12:06:17 -0500 (EST)
From: Tingmao Wang <m@maowtm.org>
To: Alejandro Colomar <alx+linux-man@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Tingmao Wang <m@maowtm.org>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH] man/man2/landlock_add_rule.2: Add a missing EINVAL case
Date: Thu, 19 Nov 2026 17:05:53 +0000
Message-ID: <20261119170554.224641-1-m@maowtm.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is another way it can return EINVAL but is not documented.  Documenting
it is useful to help rule out errors.

This syncs this doc with the same change in the kernel [1].

Link: https://lore.kernel.org/linux-security-module/20261116233139.206924-1-m@maowtm.org/ [1]
Signed-off-by: Tingmao Wang <m@maowtm.org>
---
 man/man2/landlock_add_rule.2 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
index 253498bfa..f6a812c7f 100644
--- a/man/man2/landlock_add_rule.2
+++ b/man/man2/landlock_add_rule.2
@@ -206,6 +206,10 @@ .SH ERRORS
 is not valid.
 .TP
 .B EINVAL
+.I rule_type
+is not valid.
+.TP
+.B EINVAL
 The rule accesses are inconsistent (i.e.,
 .I rule_attr\->allowed_access
 is not a subset of the ruleset handled accesses).
-- 
2.56.1

