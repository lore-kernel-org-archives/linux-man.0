Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792821491;
	b=cZg5nFHzctzBOmoJrwmutBshPpfiTRv36P8zN2yvl2vwSNoqT35ScOvldeRpl+7ohPGv
	 chGVchlvJUJi30V/NwuE8m/A+T0nheYyN7/L7GA6y47GUJOky25Sbcbj2oN6xqx3bBO1C
	 E9mQR5EVB/4X8rrKJB40Crw5AzgqiyTD0xAf1gc3EugYlKKz1mIpvEUn/nJS9DMimKdx2
	 7BO3YPehWsTm4Pr4QYRZUTLdQNh/uEJwm3EmPsgoJ/f4dlzvcrvhDLfCgd2UhZ3Tx1K6k
	 SeCk5Wd66K5BHVNQm33ECrPxRzOUREf4FpBCruO53g46JydnZk1CnKHVQP3dKvY9p4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792821491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=UO7PgwfU49f9ZRPhbucVPaTqv2L9+1a8EfKDAkuwkgk=;
	b=Vv55OGumH1g/oTnd5QWUcbI0acHHUROFwp/9rJpfqcnH+S4HiDd3gZ45hnrLqMzLVhGa
	 6vy9euEuRWFjbBQnL+Cy8thklXe/R3V4mO7sabiJfrM+X65+bzuzo9KOVLzLJpynOOl5l
	 HXrBeubCQoXII7QwVqa30VrIe2Q7P/fAE5jkemTsRwtOxXf1fDm1YXwnpOuWE/AUL/B87
	 tpg4qvOi1PCHRx142NlL52/UlJn4Hiwy28nbQiTuNSNvFmvNWyQyPh4iuuLVY0WTG8c1+
	 8/nt5O2hqQvaOymysTitIVY/aLdqvW3vy864eZsHxQ19946N4Hd4jZ9zwLZ18tcdqlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DWRs5BTM;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDE7606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 05:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CDE7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DWRs5BTM
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso1901837a12.1
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 22:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792821491; x=1793426291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UO7PgwfU49f9ZRPhbucVPaTqv2L9+1a8EfKDAkuwkgk=;
        b=DWRs5BTM6KkVfsMxQ0P+VKJy33NrXBCsXnawiFYxGu1ZrVtEjL2Ag4b+lhNF/bmTIz
         WB45GlBqkLQiQXyk0lWDa2LEWzF5ThZ+4PrEyFljObfa/CB6Uc+JS+PakWnTyJg7icEp
         mloRQQ52jeggHZSvVFNU2tLFi2JB6B3rygHtqTk3gfH3ttXF7qvN0EvtzFbXulUlvn+V
         S2d/S4Jyf4ZmP2fwQjdKrreDVtHtxROQeNeeXMWZT3jhkBlbNAyRMhv7LZqotNKxKTIk
         yc+hQrm7QbsV/xQcjv7wH3aP4YF3PuxChPPaO+wfPlcj48GjMhlTlunfzcTOqUTeRKrB
         cIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792821491; x=1793426291;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UO7PgwfU49f9ZRPhbucVPaTqv2L9+1a8EfKDAkuwkgk=;
        b=sJ5JtFNgg2p3NOqGOlVHdZCZzNxnmRQh3r+vrsyiwzYUCrlIL/W3mPc3DhTgbg2to7
         wN/cUiPxBGDfYBQQ7kXtxd+Jk/eXac6pYiJ1l32nO+jRgE59EmgEQHfVuSJDxLKdn2O8
         tI9mFVf2pDW8mn7khNVNR34dUZ9HBOwsWlRotTtXOMrZa3Iw+N9zM2Lldy3Jzz4nUJHB
         mCkwvWTgJgi0XRYenQRL+GEBnNXGibiy372wjnyiKSu0nkmPSIYMZIVEDonXVK5kgMjl
         s20kGhQPQfMBIOS+9B5Zdqx+Ph/Gj6tzFrgs+LxwS/YwWzFItl7Kq5OUZP6meFYss8Uu
         D8jw==
X-Forwarded-Encrypted: i=1; AKwUvBzoSuDOnAm2fojA17BjQY9p9egi+pcMOQcnPgpoXRsUJrWvvH3c0qHFz8ud7MUOUWxCLUiXs9FRE24=@vger.kernel.org
X-Gm-Message-State: AFq9FYKawTz2fEjpcZ8C1ulNskPxWEdw7K0izsmRs7FgsVcNidtUNAhy
	TjIBJCXdruaNeMTkjKb6Y1wcvkbcU8uaDcy8BeGQ4/vb+0eHZUK0m2Zd1ewPzGLet5XkePCULn8
	JVxKTOQ==
X-Received: from plblg15.prod.google.com ([2002:a17:902:fb8f:b0:2e5:712c:5c7])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec86:b0:2e9:322e:1f94
 with SMTP id d9443c01a7336-2ea9c62041dmr9635255ad.20.1792821490736; Fri, 23
 Oct 2026 22:58:10 -0700 (PDT)
Date: Sat, 24 Oct 2026 05:58:10 +0000
In-Reply-To: <atxIngnsKw1c7ngn@google.com>
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
 <atxIngnsKw1c7ngn@google.com>
Message-ID: <atxI3quJcWK4dYXE@google.com>
Subject: Re: [PATCH 7/8] man/man2/bind.2: ERRORS: EACCES: Write permission on
 the directory is required
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 24 Oct 2026 05:56:53 +0000, Kuniyuki Iwashima wrote:
> On Wed, 21 Oct 2026 23:07:59 +0200, G=C3=BCnther Noack wrote:
> > In addition to the search permission, binding a named UNIX domain

nit: s/named/pathname/

> > socket requires write permission on the parent directory.  Bring the
> > wording in line with similar documentation for EACCES on other
> > syscalls such as mkdir(2), mknod(2), connect(2), link(2) and
> > rename(2).
> >=20
> > Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Assisted-by: LLM
> > Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
>=20
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
