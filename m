Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075555;
	b=vsbM6eSA4qwLHXwLHcfmxbTKhHCgIeUrgfecyXyAucNBHvHBoK0stgjIu2GpbVTjld/h
	 UdOTA7lV/ZbQfgWNS0h8vd0534H6PN6oWIg8ngkaO0WwsXGh2k9qp5DSIaGGB+HoJnSkS
	 MT7CYPgtvHAw+MHQsdPRdfbtpO3SEMaVcPcYntXZ8ewS86oZQoWCBSzrGbB3kyg5J44Qj
	 R/KcZTZJJfVS36jcHQNkX+wGmtvFLLCXH0URsx7skFnsMcPpwLeKFTTMXovUIvZa8+Euw
	 z1GWUwtw4JjrgHucnnPqN5+YQdBc0QpV8LRDvad9KFwo5PLUO4Xg74FKbRSDsviY/rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:X-Mailer:MIME-Version:Content-Type;
	bh=QPHaTw9FILBk94qeKK+uSOhwQ6dqFLKuV5Dg5s6k5ug=;
	b=IW2UTLM21h5KEdn7koNIw0ChbOX0HLRWJU7s9iRfAdSR3Oo/AJECAkJqk1apYhxz+MBS
	 cTb+KohkYMNPSZg6xbos5o7i9coQ6gNURiQRYnhF4vk4nFjIyyoGPrD/ChPKgGwKpjrUD
	 Sl4rdGkGfB0Z+rRZjs8SofJ0sKCItRRmrca6Zyf5K/Tcc3ESCdFf10eFW8bUsns2pSqur
	 HgeWfIxLzqjigl+/S+xIkBepkc4zTUzY0yz+T/B9wddOuj4h7SKLipg43MY3uOqhRIUAS
	 BDTay8sC8BDLnNuNnHZIxE7EyqTsCUahbUULI/nmP9fgrpqjIvS4TY0tPu5ljOQk8oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bNZ5NzNN;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A8B606A31E
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 04:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7A8B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bNZ5NzNN
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-820ad3183baso1019465a34.1
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 21:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793075554; x=1793680354; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPHaTw9FILBk94qeKK+uSOhwQ6dqFLKuV5Dg5s6k5ug=;
        b=bNZ5NzNNybK1vsjrQbk8yTxESZPB/Ei9dG5Z1KcWpaLCnaVJYFu9MhfocMniyC0iov
         73Mb+MDqeEmh4oh32kDNJD0YjigDV21JwyEhzojR7SAEj+jENcCFC69olL6iIhgcuT8w
         2dTYJhLbWgPvygrejVV/KiUk9vGCceHQcFuyT7QcAVLdIVzLbWrQ6LkGmDpFzsClvKxp
         tiB91UnTW+hrN5GjC/+oePY1RrLrieh7fB/p/HETJTpg29hWtP2VzaQ8n3wcsv/l7Mvz
         vIPhi93O9WVanOClyReYoMMQW+kH/jiy68Tfp5Uzobtbezf1rNpzOyEJWnMI8bIuqyyP
         1O/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075554; x=1793680354;
        h=content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QPHaTw9FILBk94qeKK+uSOhwQ6dqFLKuV5Dg5s6k5ug=;
        b=OrlP2iw26I0fNiYuOc+MwXKLrY/xcSiH3hdVD/HRMkt71oHsin2f9hYGeTFLDVxkjA
         vODxXc7wtLWtePLs1icYNrCiG0K6QYlmpBac8xZ/iVlsovipR9soBbcfF225bUJJwpqP
         ruGrZAWPkkjfdHYLGhoXLVQsh0vDpdSRybzOj1YhAvNmblErOnPF2AiveenUezhTaZDy
         v7wzk0XfkvAQDXJqipEvqcOMdlJ7jefnxt/tyW9N0QjC9q0Dr/5N/jnPVLnmHCjS6CT8
         CiZG9u5M7mYxbWdOVDZVSpm+wtcHY4/4UMCp8D1eX+KaHzAVNdfCH/4m/eqQU/K+frqt
         ELQQ==
X-Gm-Message-State: AFq9FYKbOBsA9WrseKZrAiQpG70fUv6VK8tDAJrMR2Mo5/PFx78GYg5z
	xX0PcHtiGLwJZc7IGCiHe4ScJ3FxlSAxZIOpMSo/BQ2r4NcVkFUX8CRF7ay4gw==
X-Gm-Gg: AYBFou1DWuNs/BmT6P3b6JfRdZ9sJeUiprQrw3/JV7ZoqRfzmMgXOxxJhZb4cpoabs4
	r+az2Zv6jM9VC8Iov/e/WvKOV7DPUp7j4iA7ah7X+0yEmWBwts6uJ7JcePucRgOTx3RLP89T8fa
	nvE8WefdkIxWGANWk2yaHHusBDRA1RzePTEHl3WEpT9vCGcsgYtMrwm+cQhEyLp20B6drfvACqv
	d2A/21aqb9wSOUb8NlzCQYX3h5L6blk2+gDe66dgh4I8oWiuFj4YsxROoWehUZ4vkpny+VGLl51
	GVmKS+xG3g/zv/FdxIeWbs1QnAEv0/IDb/zZ9Zd8poHZMvPnCliP6JA03y895b3f8oENR7TNr8G
	Kt7xFbgGR7zPE/sI75LIR8pyUUvy0UUG2AEihfyhj3C66wzEWPIFEXhcS4+DToBC0oNMiE383kr
	B9Dfk7aQ+FtjsaE5rWROTqqIdxwRlZlEBekEVePcFr/fMsfL4habW6B1CBgzK+mUm+yI1L46xEk
	AVZRe0ne4cOulnZuRvgdXKaO1/bah9fHezCSftyBcvWUnY2xRZ+Nev3YSjBCUZsJJvlQK8gA/kI
	lkMRb5ao
X-Received: by 2002:a05:6808:11c9:b0:4f4:d7:b168 with SMTP id 5614622812f47-55c00227865mr9160146b6e.3.1793075553655;
        Mon, 26 Oct 2026 21:32:33 -0700 (PDT)
Received: from localhost ([172.59.75.126])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0429c56asm7024030b6e.9.2026.10.26.21.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:32:33 -0700 (PDT)
Date: Tue, 27 Oct 2026 00:32:29 -0400
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: alx+linux-man@kernel.org
Cc: linux-man@vger.kernel.org
Subject: PR_SET_NO_NEW_PRIVS still in need of three trailing 0L arguments?
Message-ID: <20261027003229.158e4f7b@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QrVRvQ+Hp9LnZb_LkrC0z97";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/QrVRvQ+Hp9LnZb_LkrC0z97
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

At one point, prctl always required five arguments. At some point
thereafter, it became a variadic function. Some of the PR_*(2const) man
pages recognize it as a variadic function, such as
PR_SET_DUMPABLE(2const), which states that you can use something like
`prctl(PR_SET_DUMPABLE, 1L);` without problems. On the other hand,
PR_SET_NO_NEW_PRIVS(2const) documents the only allowable method of use
as `prctl(PR_SET_NO_NEW_PRIVS, 1L, 0L, 0L, 0L);`, which looks like the
non-variadic form is still being assumed.

Is there some historical reason that three trailing 0L arguments must
or at least should be passed? Or is the manpage simply out of date? I'd
be happy to send patches for this and other prctl functions that are
mistakenly non-variadic if there is a need to. If there is a historical
reason to pass three trailing 0L arguments, maybe that reason could be
documented.

Thanks for your time,

--
Aaron

--Sig_/QrVRvQ+Hp9LnZb_LkrC0z97
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQS8QsiCjFi4DcDBX+Q5rdye4jrrCAUCauApXQAKCRA5rdye4jrr
CB2nAP94GgGvTX/8BoOSG4mnbC9s9fSeHIUHiVhhI1KNa/X7QQEA/Vve6PO1rPvJ
rwLYaKe2mnFKGdp07+wxIcFkaM5CBQE=
=drrY
-----END PGP SIGNATURE-----

--Sig_/QrVRvQ+Hp9LnZb_LkrC0z97--
