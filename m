Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792817115;
	b=LR0aki8VYMCqLZ3tnoQx9TzohZ65+gUso10ovZ7/BaN3EjIqvUzT722MiKeJ1VBaBdex
	 zDSXvfAJYXHcbqFr4LaeM9hPfkHXNs5cUl46ysdqWZPdgi80bOrdcgLo7G9QgF8V2eGba
	 UyYn/bI+PnC++VTk22psgZEFGdUUVw52Oki0FhHRtupozdrtPMbgKD2k2iIlb+LQzK54d
	 RdiKVJfXR4Bat6ckaVFCNpJozOUsflldCbZBbVtRMh0Ugp6QL2D7+AokY1WxTNuYiy9qh
	 Rd6MWzZNf2Fire/+y+4ppNG71k4tXBthgOoWuxwjjmdaT/QDQjOIzsFbpHLQ2hoP+ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792817115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=QfshYDMQoizh1O7jRcNfey2s8RMt/HBX3LBaJW1ANWU=;
	b=IwMKJCou+YEdrK9Jw+HTK4n0/3aXD4boshy6VCSfBQq8X+RQie7yju3784ZtLezeb7Js
	 /ziSDcNNvv/e/aHjuIzZSzzqJ1gVE+cb05r1h+4SMSJsUCK/ij75ZecAC8jFzIs7a+pMz
	 lMEVoHN6CzJFz2bfEIHJ6fw9ITKkPOINA33pk7aMLpBT+XBaNZJLyldPQNNzZU6HGss8V
	 d3bDUXqQI3gxSFS992nPi3B0g0RHMqA4jHcQC1E0IHZ7di9izXeYLEfe1b94qPLVWBbFd
	 GQSHyqsW2WIBKpP/YNIKpRtamqArljxbgsuAhEvWlhEI10vUdzu9q0XCV1/Uf/8oqxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OMeDj9uS;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335F4606A31E
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 04:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 335F4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OMeDj9uS
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9572e892dso11542705ad.1
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 21:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792817114; x=1793421914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QfshYDMQoizh1O7jRcNfey2s8RMt/HBX3LBaJW1ANWU=;
        b=OMeDj9uSk34xqyyjDQ1a4u0v0VOpz8/w3WamZ8FP3g8yAp50v9MLddcf/Siy7kOWSG
         DdSqrrYco7yOh/0ZK/AjB2SDE5ofeeqHFlvcRYCWASVZAYynmW1HaqJ4EnpXh1idONjB
         yklC4DrPKhNanzTiMYsF58c7v7D7g15ZN09RNZUC7HjkdviWaxIKvsQznm1eIBaROhKS
         g9LSq/nlqLVSQ+Kg+AbwFRAONdsZl2LP5iArmQcoAlkTlpoueR3zES7jmEd0j4mjUc4X
         WNuosanms37kK9FMgmHM80cqhewzkQ7Zq/gSUTXTSWxMS6h79rz1rplRBfVJT6lsh0R4
         PG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792817114; x=1793421914;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QfshYDMQoizh1O7jRcNfey2s8RMt/HBX3LBaJW1ANWU=;
        b=g3FAAnyrBvD0JbIX/3iSKo5g92ItErSqU4q4bwwqEpjBp4N/5mjqlqcsPU53z9y0fr
         UPQReQ64xiZ3+PRs0lqjzSN04M7jxYpuwoLnlyPowwztsqqXosHqnnNPdWbbCEgTksMm
         z3Z3I/d1TEh+MXomIC73BzMUC8hE1+xdihGUT1ncKp3LxnY206t9dA9WgxN9HlMe0Ss2
         VewXSE3ctrSmvOvwLX4gyjDcTMYGk+RD5cn6d9MzEL7lEFwPLTsjaULxBUmrLfGe/2iO
         c697K8DouzvUYZWSJEnUx1Guk1ZDUDPK71JSlKFWVyLgAByUflpmVpxEC4TGMepMsmh3
         Ay1Q==
X-Forwarded-Encrypted: i=1; AKwUvByCU4sY677eIr1uBrIl9YpFAZPmnHLoRH2P3Xxwpt61UQbMljbdURXoFUgz04UtTgeCdMc75eucJ+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKP4Sg3mPAKHLBPBlY8WnrO1ivvITCWUgLPQ/xRVwkVqm28B8V
	GoaAJXhEZ1AQBg9N45UHHBMBpCNNB6KfKQP2Cfn6+yFBwjLYVr9Tv9ozk+QKX/+ed+i1ODUqp+p
	ireptmA==
X-Received: from plblv16.prod.google.com ([2002:a17:903:2a90:b0:2e8:5201:ef23])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1450:b0:2e9:4175:3065
 with SMTP id d9443c01a7336-2ea9c0c8aaemr8793465ad.4.1792817114072; Fri, 23
 Oct 2026 21:45:14 -0700 (PDT)
Date: Sat, 24 Oct 2026 04:45:13 +0000
In-Reply-To: <20261021212256.27961-2-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021212256.27961-1-gnoack3000@gmail.com> <20261021212256.27961-2-gnoack3000@gmail.com>
Message-ID: <atw3zyK_GFcgWEVt@google.com>
Subject: Re: [PATCH 1/7] man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the conditions
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 23:22:50 +0200, G=C3=BCnther Noack wrote:
> The ETOOMANYREFS error is detected in too_many_unix_fds() in
> net/unix/af_unix.c when the user's (not the processes') in-flight FDs
> exceed RLIMIT_NOFILE, and the process has neither CAP_SYS_RESOURCE nor
> CAP_SYS_ADMIN.  The error is raised when all of the following
> (simplified) conditions are true:
>=20
> * user->unix_inflight > task_rlimit(p, RLIMIT_NOFILE)
> * !capable(CAP_SYS_RESOURCE)
> * !capable(CAP_SYS_ADMIN)
>=20
> The check was introduced in linux.git 712f4aad406b (2016-01-11; "unix:
> properly account for FDs passed over unix sockets").
>=20
> Fixes: dc4eea68b565 (2016-12-17; "unix.7: Document ETOOMANYREFS for SCM_R=
IGHTS send exceeding RLIMIT_NOFILE limit")
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Willy Tarreau <w@1wt.eu>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
