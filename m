Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792821415;
	b=mPYgBDCuJ2+OGPns+NJ3oDfqzr0zYPGPMACc+BBX7WIcHMYZBTVVyaS6anZJX9t3o/MS
	 QvurAgsdDuiE0icwrIOcbXW9XBa5t9rLJpKBH11W+CDfbHuNZJzfGKe2o3/ChvEbZVvSv
	 nD1GtH5zLydj6tqbvFv2qNnFzJaLSAvb0f041I7X1QGJLWbTt3x7XW6BrPrsVKNzFeQVl
	 SF45hZoCzzmhb0452a8MOQHuruPB8Ls4P4/11EcRet4RzYtvR43tP/pgGrNo1+8TS/ODE
	 1wOmV/uItNBcqGhtQCc7uVM6KVgHj27qIngGaW6TefHt5WUt5eIZKfJD0M+hWnyMEwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792821415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Tt/kFHHCW9UOKXIsMQrD9Kf6ma7uJnujW0WTWNOqX+8=;
	b=HWCSBeF3AtJM+kEnMZZ/QgPgJGMGBzCjtPFrkK6E3Z/GJKHdoIQ4+V2u2ZV/qI1jYkfl
	 R7nZ9OxBGhyEZOfp6tzzw24W6Nnpg/1cdbpjvJOQ3UYbfZnOFTLWOPaUznJ3pEUZd1mdx
	 VX+2qxQ10NRIRPhznuUMHs76vn8+2naB1wwB6imVSjtMWKE8T15KIn8OuTUbE016W+AwN
	 wG8/2gesG6IuYEfW8d2qOfwZjySchlO6Ya5H3GvSUXK7JMtJU6XytG15c1PZw2nP1iGNJ
	 ubVpBkmNHa68hxuAGIgI74qlzKnWJVyW8eMeJHc9PFpFT+cBI+bTiVM4aUNIcjfE1Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=G87ElefW;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EA6606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 05:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61EA6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=G87ElefW
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd68b8579f2so621699a12.3
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 22:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792821415; x=1793426215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tt/kFHHCW9UOKXIsMQrD9Kf6ma7uJnujW0WTWNOqX+8=;
        b=G87ElefWdO/7NFfskfKf96nCBL2U0Eqh1X+zuRmyza3Js9D4lA4YeTUsh8p0tzz1WB
         mO53Dcak8ypN/PkklSTAhH/jpo9lCpXszS3idUDsuinvDMNcep+vG5cMOHL18eMt4/Dh
         jQlJZBRiExG3f+50gEiVzmu1Aan8nY+b0GsjR3EMkPHu73mFQf0qSCmuzUQTv+Uuhq0i
         StQzpdaIespQCO+sP2ep51XAsDA87FnVOdqf/QNPOOlc0NPHupZBRTGavidbHg6QSUZW
         2Ij/yzpfeC95dGp+Izt51ScFFcVWAFPu+OxrzlAAtq9BMzvfk3UQKIOq2bvRVvJRe6UJ
         xSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792821415; x=1793426215;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tt/kFHHCW9UOKXIsMQrD9Kf6ma7uJnujW0WTWNOqX+8=;
        b=kpSYC175C3IMZ0s6h/X6oxptLv6fXjPe2fO4OXIcGa5tQOmFbnTtVeDHe5gsyclXgu
         igf79g+BGem/Xf/Tex6D5Ht+8WcN2UqmUHgsSut6ipevYaj0cOiiZGjctdHJtRqOJKk7
         dEoDSpjZkqVkiVxDvi+WKFIFMP9SzQTMu/QY/Bla0GqHqkzf27sW52J7J+uHPc3ANB0+
         niwmNOHMpExPIsnpBW6abAVvd95XX6vMtghpos/X8FVBt93u7jT/J0Gt2QXPga/zitn9
         bj8tsOJJwmdNSyZNKDF/vXz+XY4Qjnbac8gmcFAL2pfO24ta3gTpYbo9SP50gy/JDRYj
         UVwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvLXE1cDpo1d34bx5mzocrixVU4Q/oUp7teQr7QOkZS2psLf0k1OJU36HiTk5VQdkJUmtfhF459L0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKRDw+CDoecvKwoarYvOLUjBj8LVOvrHhaCWmM93zrR0ID+tly
	G/D4hsMj2Wz/J25Q0BAQbRYA820yCkngyN2UT4n8BeYv/x9r9yKm/GqkP0jLibgNLNPJIUxZBOy
	LX6QZNw==
X-Received: from pltk5.prod.google.com ([2002:a17:902:6945:b0:2e7:6b:bced])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2406:b0:2e8:1929:c8e4
 with SMTP id d9443c01a7336-2ea9c95679dmr9455855ad.60.1792821414363; Fri, 23
 Oct 2026 22:56:54 -0700 (PDT)
Date: Sat, 24 Oct 2026 05:56:53 +0000
In-Reply-To: <20261021210800.27338-9-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021210800.27338-2-gnoack3000@gmail.com> <20261021210800.27338-9-gnoack3000@gmail.com>
Message-ID: <atxIngnsKw1c7ngn@google.com>
Subject: Re: [PATCH 7/8] man/man2/bind.2: ERRORS: EACCES: Write permission on
 the directory is required
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 23:07:59 +0200, G=C3=BCnther Noack wrote:
> In addition to the search permission, binding a named UNIX domain
> socket requires write permission on the parent directory.  Bring the
> wording in line with similar documentation for EACCES on other
> syscalls such as mkdir(2), mknod(2), connect(2), link(2) and
> rename(2).
>=20
> Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
