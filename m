Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617796;
	b=HxlVy/A9iUbiJYLop7fHt26l5Itg4fkodaOluDS26TYqWfPyNCCcGAu1cKaLK1mVVsvf
	 I/ORZT3DvIQIlY3kfykxqGe+fkw68PIr+BeDpCLZFkgl1tIW3FXcNuYg46yzowuUrVjTT
	 zEUDm/ZIZo3qIxzDfFDWHcySDLYYYatvRYSbp5OXx8ItBQ/Ue7Tw6g7xFdhgosabceoQC
	 O9vQV/wZ7gfBKEe/jIw5+L1UzPYYwlbBC2gf0dflziFVEdLAsuC2sSpQ6w469cBd5lVgl
	 6AQXik/TTxdnDzjByRFC1NrM5+PorYghOZWYU9BLiw0nZ7syHr4SE6yifmmUVto+mLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=liI+YPjWiBjW45sorToezD7QJK3LTwR8vIGYiU2oWK0=;
	b=TlDgsABP+p4Zoc8CvlDRVVbFC1fHZmrNGvAeVMvg/up2o/Yf7LZI4XFfZXSb4YSWdgnS
	 yYxC27CopKc/3635UAsjBGBA9qabrVZtcuIPGfhsZCN08GCjfHbHoopPgMKtfChyjBkcS
	 cbS2z22TP/i3ygZVDdemiaYWo0PFwRwINDPKIgatfrVS0TG3X1ox58TzWaGi0XFxO7Sf3
	 KsgmEbQBLJVM86fnspSupb80i/geicYm/5eAAyCsJDEt+ZabtYzPbMmweTJoIe3Jt4y3I
	 iKlLR2HOpQbw+oNNj9L/jTCgnvcnm9kCfjd22UXBVYKsACoudmLXUh3M0EnkqctIqTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r9B5Np+t;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3FE606A319
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F3FE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r9B5Np+t
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1115615f8f.0
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617794; x=1793222594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=liI+YPjWiBjW45sorToezD7QJK3LTwR8vIGYiU2oWK0=;
        b=r9B5Np+tjF2rSP1hgG14JUq/LIouoNQvwKCVSrb0QkpYdaz5HB/ziVE0+KgYjVCW1a
         jw6u7zHoVbGVAiRkB1eH69IcDdtHp9qvBNQTMSGdunRUYJO47Sf2glSvm94qTSv8PoKj
         D8qaj2Vsi7O6Kvz+35/zAuqjQOJxbRcy/XEBO4ONNXTozBIJQAFvwuDh7jPHE8MB9+Nj
         I3EIPGESw8CqMxXP6gK21wB+N2q1Lm83yGzBqb75hSdrxsvSAzgkmOSg/CXXUXkUEESR
         qzs/vYybQBirhaSHZQUru0P1pnbZc/q2G9gcEXqwdrG1t5HdaosC3LuJ88XTVm4m7ffH
         7eQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617794; x=1793222594;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=liI+YPjWiBjW45sorToezD7QJK3LTwR8vIGYiU2oWK0=;
        b=N6/onGzhfDEirbiObBYdq/xrravp97UTR81cyvzhJ+EJuZCECyMPaNDdHGZr+T8zQ9
         1hpxZhqfLUHmYSSfrX7/Yhh0u2sj5LdhLIUeVh1cez4Sn7axvkW15O2y/5r+EelUw6BH
         BS8Zua096h7fRmFbWskqyrcWUMtqtaLYUpD5FYyp6sXC0eo5G9npYflvMKytyKR7KwlP
         a4KwiT1RpGTY669lPydauYLm6OZXOrcmRCLQwTKQJANvY/OwK4lc9zkYMFE7ZAfg9zAN
         Wot/vtsCuuwFlORaoU05b5qF6i+bAVr6D1Q5zjxV+uv195w+2CAqLji3sBO2YXUN2oCi
         Mckw==
X-Gm-Message-State: AFq9FYJa2jZCOjtrEM67TF5w20d2vt1MbLv+Kt1jRMWWSyHJAKVarCw8
	7b4EiIorRJ5pC3aKAcu2SxD/VYsRuX/eJQXj8x+v8uWHG4jveBQaAGfN
X-Gm-Gg: AYBFou3+dUyfzfjjqirJ/878BDMveZS7m6kTjaBQzd4uIGDSqvJEaMZuj8K+aqslWss
	XLSGNUYSEf/RXw65GAsKS0mjbp1whVtUbZuOorZCWUcAOzMnL8YlEgql31kSiX+zUKVDZFiCCwD
	ZNGiOj3HMp9AgjIRj6y6SM5/IAtKBSp/8IGLLAr6ZvsDtFdpKO9yrI+i9Xs0LwohQnNpov7QIz2
	Q1meajbM7PnYgKGZLcnnzYNLF0p2qiKVGKt3zAB+NsFPdlUmIOzYxQstmpTYZc3SNNUxld1Sgku
	68LLPKJlAv/wrozQq2GgDvO4axunVE25gyj11qkuaraFN99Q9bSm4rg6kZFX5IE0DBsOLcExQ5G
	Gi8WZ2aEvmDZ6WneOtgNpSpkILl7rbzJsPouNJ8cU4mNSli59Oz4e84O/T4MR3h69DsCD7tzgvB
	zZwb9cfldRtmTWsgNJ66BqvO5JItsMKDu9yuU0bzCPdRfocSom0WXLB8rL7YpBoCer7rixNZkek
	DPtqjErv2EpvWryBqlXxA8pB4HYx3Eg0OHM/ah0RgEykDU9hDS5SoMSRD1xOGDZqd7tHRPJPkLk
	K3vEyQ==
X-Received: by 2002:a05:6000:29d5:b0:48c:4658:602b with SMTP id ffacd0b85a97d-48e264a65cemr5087028f8f.10.1792617794420;
        Wed, 21 Oct 2026 14:23:14 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254eeef6sm8011822f8f.8.2026.10.21.14.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:23:14 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 3/7] man/man7/unix.7: Autobind: Clarify when it happens, and mention SO_PASSPIDFD
Date: Wed, 21 Oct 2026 23:22:52 +0200
Message-ID: <20261021212256.27961-4-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021212256.27961-1-gnoack3000@gmail.com>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Autobind happens if either one of SO_PASSCRED/SO_PASSPIDFD is set and
either connect() or sendmsg() happens.  Mention SO_PASSPIDFD and
clarify that autobind does not happen immediately when setting these
socket options.

In linux.git net/unix/af_unix.c, unix_autobind() is called by
unix_dgram_connect(), unix_stream_connect() and unix_dgram_sendmsg(),
if the socket has no address and unix_may_passcred() is true.

unix_may_passcred() is also true when SO_PASSPIDFD is set, which was
added in linux.git 5e2ff6704a27 (2023-06-12; "scm: add SO_PASSPIDFD and
SCM_PIDFD"), Linux 6.5.

Also, the old text said "not yet connected", but the condition is
about the socket not being bound.

Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
Fixes: 0cf2caa41ea6 (2010-10-10; "unix.7: Document the autobind feature")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Rephrased the LLM-generated text so that the canonical description is
    in the "Autobind feature" section and the other place just refers to
    it.
    
    SO_PASSPIDFD is unfortunately not documented yet at this point in
    time, but it's still correct to mention it here.

 man/man7/unix.7 | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index a1dce8c47246..ded82768322b 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -301,8 +301,14 @@ if the sender did not specify
 .B SCM_CREDENTIALS
 ancillary data.
 .IP
-When this option is set and the socket is not yet connected,
-a unique name in the abstract namespace will be generated automatically.
+When this option is set on a socket that is not bound to an address,
+the socket is autobound to a unique name in the abstract namespace
+when
+.BR connect (2)
+or
+.BR sendmsg (2)
+is called on it;
+see "Autobind feature", below.
 .IP
 The value given as an argument to
 .BR setsockopt (2)
@@ -370,10 +376,19 @@ call specifies
 as
 .IR sizeof(sa_family_t) ,
 .\" i.e., sizeof(short)
-or the
+or if
+.BR connect (2)
+or
+.BR sendmsg (2)
+is called on a socket that was
+not explicitly bound to an address
+and that has the
 .B SO_PASSCRED
-socket option was specified for a socket that was
-not explicitly bound to an address,
+or
+.\" commit 5e2ff6704a275be009be8979af17c52361b79b89
+.B SO_PASSPIDFD
+(since Linux 6.5)
+socket option enabled,
 then the socket is autobound to an abstract address.
 The address consists of a null byte
 followed by 5 bytes in the character set
-- 
2.56.0

