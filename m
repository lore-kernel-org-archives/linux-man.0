Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7CF368276
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 17:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406367; cv=pass; b=cwW5EyvCZV9sZsF02ySkeUjpdvS3G6FlXf1JPy7F+f9sKp4ekj+tMo/SRoy7noJuW/pe8eTdz4ewSc970yrv62B2COcodQ2QfQl3CsT5wMLxXWO5Et6JwDODGtuEf3qemL7PDxdtqiHKzJhz39tPAmXJ6HJ/COYgLrNzuU8cPMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406367; c=relaxed/simple;
	bh=Xalm8Yt67eaoH2EtlU7KLreE+HqZHlXaLyzGvT68nQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LAEbIpX2OCow1vBf02BbdOLEfGDbGJ8YMPFNAUZGph7s5ZQVI98Wdi8cu8rYqplbyWBXJCvJLkjt3QjrPe2Hdb7/OrORyMe+dWo7vOim0MbxTM9I27JQPJ9hn+tlmpuvJoH1p0RdpciGmuHW93V9lUad47eILJzIIouoWBCRS+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmRwIpZw; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmRwIpZw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6d28aa26cso26248625ad.2
        for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 10:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789406365; cv=none;
        d=google.com; s=arc-20260327;
        b=OeiPNTFULp8NzO4+gMo8a5Hxfebsw7hNybhdZJzfkzN1g7dN5DgKFpZuDCM/gjAw5Q
         jDRsEzO1+TlzQUYw11Ko/cqTGVVZfZQV/3tCUXSshGMqbBO7y8g9VYZrefex8F8jWJEn
         t6LNWQZGgwNEvGVmuwXKhuGECikAVivrczZ1metQ8+ZWA3WqxQuWM/Q9Hbf1f0eaoEmj
         xLE8H+8sYdJ4slkgeXMow86wGIFO7kmik5D/TPW/CUnFc3+5zcwpS4UR4LmQaEmIOe1Q
         hLgYORhwb8Gg1htFRDmQPDlE47EkWqqGj8qkXy+PDToF3ls+TcjPBMDlqhl6gJxoF1KM
         l1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HyPcWCxdEhAf4obuZETVIeWcLSoC4Tdyccr/Q4U6X5Q=;
        fh=2P6qKHUPCivEZWPIXsRV032qD3UYAvQEIt2vzx2o/7k=;
        b=PSPaVmcCialobFcgRHTO+Mx8QR4NLcGpholU8um3u5P7NugMdXQuccT7yfChnc0/Pq
         ti6jRNHH/EdWYKn4deuf8fEwIEp7wTmnpKJS6V+EKEi3EaWAlw7A1ZmyUJO7t1HPWTe9
         LE0AvQkLUO+lI7rSiEpcmG53/3IJwY0Dg+o9eAiLHATU7x8wussjqplYnhOGn8ttJUmk
         EkphqxGsYxOsmxT/DXwPSuPxQWdPsXa9AclmPX7YBrjo6BAzwqWtSZY73ivee6VvecRN
         dQ0AtHvFXXumCvCMnlsXJyJM+1KYmoxMKYVNhkec+1XP6A4Kh66LguJbVTixgzjv5nNT
         HtzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789406365; x=1790011165; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HyPcWCxdEhAf4obuZETVIeWcLSoC4Tdyccr/Q4U6X5Q=;
        b=UmRwIpZwF4SsTcWuEhIIZJ+ey8ShBmZattoSENwkcHiyGck2rdlLSDtCL0Ew5YKpbT
         3OIDKVzv+jEz14TYzwTy9SFefCMR2G2GZzaeyBi+XExLqCcor84DOroi0QNCsUwhvUqU
         tanzIAzEo/UrdgsjWaRtEavQNJwBvRVKLdDdVxdYQ2tDs3jnEXgAXhFlShRxh3sLpSc3
         IbonAdkBJTEZu8zX5GC5r21PVphiOnYIvzgcJbEZaETuCPLtFAuPN5VCCoynrBnGlbqS
         ptdKex6Kg/bqgy4pXb95IIjnZ7woeBIIDQtclIMutxNg/PScO3io0TTI0V4hl5dNETIH
         a4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789406365; x=1790011165;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HyPcWCxdEhAf4obuZETVIeWcLSoC4Tdyccr/Q4U6X5Q=;
        b=j3H15Zub1zOR6fsj7D8Rhu3f6HPYA6P6R5vzU7ug4rh9I2iCvsrNWH34Z9etCBUa+Y
         EsFQ3fr8ROkhy++dcO/88lyHenRpa2zRZbqDjkjy5CXTYoBZI4n0qkakFNmuYnnKYshw
         QFT3mxFrU2dbfNSJnT1oq71sLl6o55+paZ6xTA0p47ONRddAVByda8T1G3eHCyIecbVO
         bxEpZgOVMw5YMQmcjPUxXSN2S+Q9yUpb7XBxzh+4BDkgz17ytE/w1gt2aGkXBjf1KH/4
         qAkmYSzzyT4gu+NdaKOmbn4YJnDuuci6yy+iN1zqE1OQcRwg76gRShidzySCoJUbwdW6
         XPTg==
X-Forwarded-Encrypted: i=1; AKwUvByoKCJrY/pYQgCjRyZd4bmMTIVz0Zl66nvVGzMxpUrT2vPao52rD2c2odkVXmh5N+mROAXYefhDS2c=@vger.kernel.org
X-Gm-Message-State: AFuF++lHXINEJzkJ0a/Oo4ekDxYfSCHxOr7VlRJ6WzZL7zEMv2MXhlvt
	PlmC4IXsvBNOGNPy0diWlHeBK0Wzw0QUbzq3J67+aekcJX+sSskhSIDygSbmNYmjq++/ttSRpev
	1Md144KmNw+0DC8ny7+Iu5WWiXs+Kj45TTGbh
X-Gm-Gg: AYBFou1tK9hot91gaMXPc2PsB8WnG4LnE2CJvVok5Iga2LoUDcs5MQUHI951mRNEama
	wsRV6hhFyvFGZpfZXLuhnVzPjBUjyIPfk3GICFO+KwF67CODq7gJPKoZ1d1CZzSXtxOEr4Vl/v+
	W50jtHBIth4yh7Tt7OdUeHgHiutBfdn+CnEEe9kamvvEuxSuNdLHxdJwaHK/KB7a/fLdvBGNJI5
	Ip+bWRV/yzw78O712MVZuluoCKBLfsUcLUCfSwWhqMgX4SaOh9Y1bKwGgyDUrM+1WzC+BhXkB+N
	HcKYDA2F4aZ3Cruuh9xUG/YVeYRx17/zOmmDkPfYgnTWdcvFYe2Zora4VVVzhwbMsLjG5T7TTJJ
	U7xPOQV77Eg==
X-Received: by 2002:a17:903:1b0b:b0:2db:31d5:1448 with SMTP id
 d9443c01a7336-2dd6c763101mr26940615ad.22.1789406365095; Mon, 14 Sep 2026
 10:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914111511.1610878-1-pvorel@suse.cz> <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik> <aqf1jJ1qxsTdw6kE@devuan>
In-Reply-To: <aqf1jJ1qxsTdw6kE@devuan>
From: Mark Harris <mark.hsj@gmail.com>
Date: Mon, 14 Sep 2026 10:19:13 -0700
X-Gm-Features: AcwNN1UIthyRcwA4YwIaANuRfRqbTd6piUBI2VcFVClxfiux6Y7YANPIkIX5tdI
Message-ID: <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size forward-declarations
To: Alejandro Colomar <alx@kernel.org>
Cc: Petr Vorel <pvorel@suse.cz>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Alejandro Colomar wrote:
> > Anyway N3207 (spec mentioned in d2c2db883) is something I'll need to get used to :).
>
> There's a more recent paper with a slightly better spec (also compatible
> with GCC): N3681.
> <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3681.pdf>

There is an even more recent paper addressing this subject, N3923
<https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3923.pdf>, and the
outcome from the last WG14 meeting was strong direction to proceed
along these lines.  Hopefully this much more human-readable approach
will prevail and we can do away with these confusing forward
declarations in parameter lists.

 - Mark
