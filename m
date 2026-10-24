Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792819731;
	b=Jk0wwX1EpFZ4GY927ZBivw5aoPIPN+Tt/GeIssRAMqcZNXyeq4NrXqRXyAio/+sTR7yY
	 mItMiS9QrQGZLMxQYMXomPuQXmoI+c9amZzS163kE+lbuiQ/YsdShk7DPRPa4AHo/mDzA
	 4jjfvG1dy60Gao0zafU8CsfXyYhEqP70JqPf6Y/b1rEw7u/HhzJTGzq1z4egjH1xRzPYg
	 7CDBIfmwaRVSVJBkCoobUq0TKsLUd0mlnX3YZuJA9mmYrBrOGStSAhUGlkgp8G/ZouJ0m
	 x5lD00cTBpRm7+8wNTwNI4oijWyo7d5vdyC73Ya+JhUJTzWuLO2rFs4I39VikjL+96Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792819731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=9rNjYZRwriod/w/siZch4hSKs6mgZgRRZ5HW0p7j+kY=;
	b=O50NQLwp30Wx063kSn5JFnFoWeIsjLS+8BAHJCSVO4BkrSgKC99l7u9f6/s9IZonSS3x
	 Rw2S6kuIqdmgjnFKXGTyxkltHCkBPAMJBqx4x6yjfelaJDpaE5/yKnSQ0++WoKgDueGAz
	 ol2uANKWUX628H9jW01PPDbhQrtl+Ia2uFoSEIkbTGC9tG7F5f/teGQImghIDzQKRWwEn
	 RM2aZm0o3D90wTXM3R3PbvaH+kNiMJEu6G/6GbLRSz9pWHdni8Fm2W+4gNvUOQyqjla8M
	 T+PCszcmereKr+5uIR4dqsehgduAfFQp6Yq20c/gxJCSogFZaLKWtulRLZB8bIvjO+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=l8fLj9GF;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95B8606A320
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 05:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C95B8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=l8fLj9GF
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e60770381cso14894185ad.0
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 22:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792819730; x=1793424530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9rNjYZRwriod/w/siZch4hSKs6mgZgRRZ5HW0p7j+kY=;
        b=l8fLj9GFsBx03E9RHwiEy5JGO+hFAfm2VPGG/G+dOM7GiygQhZ+TJfF5Y7d7GoOZrH
         St+RZNkzoFh10cJg2q5K0Isyi57aQ8R+GlO5VyD9vSpRatvwCcH6R4RuGq72+GaiS2MR
         KcnAXRnYAJF7v/VhE1pAmL3NYVMsnVHYwGieZMSZOSU2kHa7vQNcQehS0PpI2CJJyopB
         le0cjLzOP7SGDRU8h6IrcZLyCU8tu/Q/2E1B8F2USr2WBTH+Sjf4scyVHz/0lMnmMQFu
         KPLSn3oyTpe/yLMWu0+XkNASg0g22PueipyzKvtVHB+WDKQzHgA9xiEL3fq3fKoRQsE1
         6pKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792819730; x=1793424530;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rNjYZRwriod/w/siZch4hSKs6mgZgRRZ5HW0p7j+kY=;
        b=qcdhOdChwcNXDDCmy7nyxWLyy5d5V59iKPUutxl7hI++q7K6iHZ9vAj2lSJg9enwY8
         YJu457rdgfvlIjzf/yycsDb26Y1jShZ+/iwc40SEi/DGIpauWJShMrIOIs6pG+gCQnuj
         kspU3LS+wyDUWzA829HQbOLvmall1zwQ9H9uNHJG2mD0U/YhQBEni+MUCe4u/oiSifiz
         cIm2ZDsc1A44y5UZS77nApF9U5KYjYxn/y10M55RtEw1Qg7Hu3qCNqHKMyZ37yMzlCkD
         HVPEYpFBQ4LRZV2GIeMj3H9efan7+Gkug2VXHPJ+zCCY3H83D3p8aPudTBQHxy6ubhRT
         nHew==
X-Forwarded-Encrypted: i=1; AKwUvBzCR7F5/t30inbR6ruVrmd+EJU/wYYkIoXRHVGRIZRLtFH0fCFSYbuslkPzbmtIaeED0U+hnx2Agm8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJbTIC9Of+xKqFndi40wUTAB6cAeHu++W+9eViijmhqURsA4gW
	agqEt+1jXRkx/ciwsJJczjjkX7nAUzJ4SIqpLtNbZ3LyaPpBB8VDGUvYw8mQKLLPEew7KIBwW2X
	WeblmQQ==
X-Received: from pgeh10.prod.google.com ([2002:a05:6a02:53ca:b0:cd6:24a5:115])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4c2:b0:2dd:c100:4b77
 with SMTP id d9443c01a7336-2ea9c8c1ee6mr8923565ad.46.1792819729953; Fri, 23
 Oct 2026 22:28:49 -0700 (PDT)
Date: Sat, 24 Oct 2026 05:28:49 +0000
In-Reply-To: <20261021210800.27338-4-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021210800.27338-2-gnoack3000@gmail.com> <20261021210800.27338-4-gnoack3000@gmail.com>
Message-ID: <atxCBxYzwHYbrTG3@google.com>
Subject: Re: [PATCH 2/8] man/man7/unix.7: SO_PEERCRED: Also works for SOCK_SEQPACKET
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 23:07:54 +0200, G=C3=BCnther Noack wrote:
> SOCK_SEQPACKET sockets use unix_stream_connect() as their connect
> operation (as defined in the ops structure unix_seqpacket_ops in
> linux.git net/unix/af_unix.c).  That function records the peer
> credentials for both ends for later lookup.
>=20
> unix_socketpair() records them for socket pairs of every type.
>=20
> Connected SOCK_DGRAM sockets (unix_dgram_connect()) still don't record
> peer credentials, so those remain excluded.
>=20
> In the code, the function that initializes the peercred is
> init_peercred()/update_peercred().
>=20
> Fixes: 73b3a5686084 (2005-08-16; "Clarified details of use of SO_PEERCRED=
.")
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
