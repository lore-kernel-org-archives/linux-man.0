Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.188.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501762;
	b=snvxFNyTN5ct++Pvkn1pPtMWIeE1UmMKbBd86EWLCISPnxmwHOtNKGyPRuV8cc3/20Df
	 m8TrrXjwLrLJv1awcqFcCXhyOADAkuQsk5EKGoO6IAgyvQdSn9bHV6B2TY/sF8LxYmmns
	 UNtH4RQaq3mkNi/muiC62iNb4HpYVvQGOTyOoceDyPSaUMCNT0TWiOv+rUA9Y2bawCroJ
	 zkBzC6qy0qAeQrzYxzzaQ6N8pvctXyFzGdDqotEgJDaj9csdeyNcuuoSntoePRVH46ZWU
	 uCIBGGn8pyAPPZTEKYaMM8baY/Tvts//g7Cwk4RKAngmbmwz1hwU2cWq8GK29PtXglA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501762;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:
	 Content-Language:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=naRwkKsr9+tt0P5Dw7TzKaNg6o5thMJ1ZKG/ABQrVDg=;
	b=zpjohyYf5/uotgMylOe2jOpFHp8uJyBgs2hHAdTci6bLjYyCr/MyUMmjK5tRN0tnWyrz
	 ZvUgbPX9m8CqnD/qJXdSAKJrc6dbuHK8zUOVu7cYji0WESENWinBy7tmsEIvTl21ooEwM
	 q0SERR/tblY5CkMbKCm8unBTqJlKdv8wrzYthAhCjheS/PQMpi/tmL1tT2JirloZp3UPR
	 4iqIFiTZfNfov3jj2zLOAa9VJt7oUNKi3giJBRhGu2P5k0+C15qcj1FRTzAgOa1Avez85
	 0y+wuU2Qad42ZSmRxFAzSEvSCRYRQ6e25a+tAwy59K4ZnJomxkJmKCVUfOXJNXjGJWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nh2.me;
	spf=pass smtp.mailfrom=nh2.me;
	dkim=pass header.d=nh2.me header.i=@nh2.me header.a=rsa-sha256 header.s=mail header.b=oCN8eq8p;
	arc=none smtp.remote-ip=116.202.188.98
Received: from mail.nh2.me (mail.nh2.me [116.202.188.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B687E606A31C
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 16:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B687E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nh2.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nh2.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nh2.me header.i=@nh2.me header.a=rsa-sha256 header.s=mail header.b=oCN8eq8p
Message-ID: <64fb02fd-0ffa-4311-bf21-a3211e9d599e@nh2.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nh2.me; s=mail;
	t=1794501754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=naRwkKsr9+tt0P5Dw7TzKaNg6o5thMJ1ZKG/ABQrVDg=;
	b=oCN8eq8p6OMPfTdXvCTRcJN4gBuSmwSHTovJD3kXDeUiXpWno0Qdf4qXeQ1WuGZeqgR/rw
	WnJtp/NBdCbOQIxM/XYBWrbIwTnR6aH6wdig2Zb7hqJX6/4CMPBbQ+TkO7txm+tJYwd0Ge
	LzFfV1jWFrhTRPuH/M2hjaY4sPFcu6DMFsOjH1l2umDuKw3Vjktf+XEZBovv8NF+DnvGtj
	MkM1mc1zVeaHxo+Vgl05bG/dsuqEELGUC7Ag+0ORAZZICuBcpFk2uLEibDk6YepbkNgLr+
	cg2TOFe7CS/ABJqZII4pqKUFquAoBETLrvxH+LGaASWJX/4IeVr+1F6vT7h0Zg==
Date: Thu, 12 Nov 2026 17:42:33 +0100
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Language: en-US
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: linux-man@vger.kernel.org
From: =?UTF-8?Q?Niklas_Hamb=C3=BCchen?= <mail@nh2.me>
Subject: man 2 unshare: UNSHARE_EMPTY_MNTNS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear man pages maintainers,

I just want to point out that unshare has a new flag in Linux >= 7.1:
UNSHARE_EMPTY_MNTNS

See e.g.
https://github.com/torvalds/linux/commit/9d4e752a24f740b31ca827bfab07010e4e7f34b0#diff-871f39f0834631ea368e8539ee88840ade11866cd6104e91543f9387dd1b8386R39-R52

"
This is useful for containers and sandboxes that want to
start with a minimal mount table and populate it from scratch rather
than inheriting and then tearing down the full mount tree.
"

Note a little quirk caused by this change:

This is the first `unshare` flag that isn't a `CLONE_*` one, so it breaks the existing invariant that all `unshare` flags are also valid `clone3` flags.
The commit remarks:

"
  * unshare flags share the bit space with clone flags but only apply to the
  * unshare syscall:
"

I guess that part isn't really relevant for the man page, but I thought to point it out on this list, for searchability of this fact.

Cheers,
Niklas
