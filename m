Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CA275801
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 23:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785712263; cv=none; b=EVgkMTMj54beIxulFYlFveaQINKE78eflRIDfbfeUpqBUb2cRm/LBZ2JkT0DnxoulGtyxSI00KVS4FuGgi76lEOFIT9tQ/LJeMB1dmKDhHyYzkmdjK+KIFBA84sm4PJJJwyshv3gCWtNGF3uJ0poni3uhBMrG7qewCovxpV+5UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785712263; c=relaxed/simple;
	bh=w6K7cYHXDyH/a4olA0gQPp0bR0Kj0I9gVaibgCdDVNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmKK8R2IlCYiIcEHV0rRWwuGN8Rt4K9s8TXAwoGEqlNhyZMhmFaEyOzjvqM4MISnZKBCV6HDJwAEbPln/OoB/wKckqsVvkyvUqEA5cAwDz5iLMsmDC3UmYpdk8vkysWtK/cZha+XJivHqOS7QVPCJ1fVL2Pk0WIMlWee5mqbfR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KipYeTnz; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KipYeTnz"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81e9d8f3289so39415987b3.1
        for <linux-man@vger.kernel.org>; Sun, 02 Aug 2026 16:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785712261; x=1786317061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NbKMjlUhqnHGbovVvqnH+tcD3SCSPMnJT6kd+bHtwSg=;
        b=KipYeTnz9BP2+SqAoeLQXV9SHXoZCNmIInt9OrL/KN5jN2w1ebs7J0Urv9DxWKuBtV
         1093sXZpWEUHLMStP/uuCrpWwNp6lRAEspSPs5NImtL9PNIHcvK11oUGVkEAMg3IUOLJ
         qlc8yguttZGMwXnp/RKc6mQ27+Oi9hYxXqeOF3I99VeWRXzyq1lsxFK+7BLztcfWnS31
         JwyBGJVl3mBK5Y3dcz8gKftWet1kfXDVTJ8TJ70Umq8dsI326gL1sgbteL2G4MGDpgBV
         NBExyopyDLRwJhS6nbRMO9yVPoHXkX7+IqCUD1eaJWuh8OUVvGgQ0dD1KisRqyyFBWXn
         S84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785712261; x=1786317061;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbKMjlUhqnHGbovVvqnH+tcD3SCSPMnJT6kd+bHtwSg=;
        b=q+Trmr9tXjc6ULlSWL5MhLMS/evOsL2V5EPUdbR+5Egzu5DEvUMjLPmUcCfIfBdh7H
         GATRpraDy2EpQ8wtkJKTHTCKT+T5ipdqvUu1s7Dp6V7dmGsDN5av+IzUm9bRmEOWTuyD
         XCzVzj9NLPmPs/DxO4iF6XOqD5PZySNxG9AMtaITCYqvMBxy92L75dqxYUW2DFWPDKum
         jXgytRotUyP2r4HJrOdV0vKX9OMMGTOixmHfrKMWQknBbsC6RmelXnz0RalkAY+Lw69K
         ictS7Ol2jSnKRmbUVsnI3DiDbzbN8k3WuL2hWKNcqpo9Fb2mnB6cGHPjXoCZcVMWtq3r
         uoBQ==
X-Forwarded-Encrypted: i=1; AHgh+RobC/tfXOsBjswzuMPmJrf1Mu0Ib219Zl0nTXCl9hUrT/y683qhlNK//OTHt/v4+6gXqcwI+WKCAUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjki1qYm/871AHyF58kcbCZlwvINRqi/48ekXyRo47nWQgl2Ss
	f0eh2MFIG8K37EwEbwBOKqaf8wEONm1mWyEZUZH6ztV3ryV887rlGKN8
X-Gm-Gg: AR+sD12J/DG/aeJ/B1pA1Sc4wACHUw5Hdz/yLUCB56ndZ204/8XbgQQi9k3x9yFBY2X
	Wv/Xz32jlJ1FIDfabem22SgC22xtUPMq+ozBcm7vsFH6JgIbZ28ZWw4r1Yh1hoajVJKQN6wewGB
	AqIOjeLxOUgJpB7/SV5e6DajmEsYdAcj3wZIRfcRR24sK3t4c6MKFV49X2BtQBX868yoh2A8kLP
	H2CUR+q8cUXZBONnpOLbUYmAMj9cD3cflhH402UZrPrvMp6qLv9hoscY1h9Dgj0mFqa/CBFR6SL
	SzdCsogIIdh629hZnYLGruH12hhnk3agJE9Z2c2jQrnHuU5zd9RTITn55PM8ddyJyJWfktQxGfO
	YJ1vWOWCP4weVAZxMFsvPTsJYQoZx+UkoyM7pgxWcwFHhL4cCBJk6l6MwzFWjaDVqVoN1h1J97o
	BTqck/x6nuZ7rWBcEzXglE7jwTpxKOSVjr0HbzW4sqnTKCMaYqnw==
X-Received: by 2002:a05:690c:6701:b0:80b:de9c:8a2c with SMTP id 00721157ae682-81fd4aa31c9mr109217877b3.8.1785712261257;
        Sun, 02 Aug 2026 16:11:01 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd11d08esm45291107b3.37.2026.08.02.16.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 16:11:00 -0700 (PDT)
Date: Sun, 2 Aug 2026 18:10:58 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>
Cc: Alejandro Colomar <alx@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Collin Funk <collin.funk1@gmail.com>,
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <20260802231058.o7gud4bd7co2nbhv@illithid>
References: <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="se53xmoqsmdqqx5y"
Content-Disposition: inline
In-Reply-To: <87ik5sunm7.fsf@aarsen.me>


--se53xmoqsmdqqx5y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: the Linux man-pages as an educational tool
MIME-Version: 1.0

At 2026-08-03T01:08:32+0200, Arsen Arsenovi=C4=87 wrote:
> Alejandro Colomar <alx@kernel.org> writes:
> > Most programmers can live in the safe bubble of <string.h>: those
> > functions always require a string as input, and always provide a
> > string as output.  Plain and simple.  It's difficult to write bugs
> > when using those.
> >
> > That's the rationale.
>=20
> I do not follow.
>=20
> C has no namespaces, let alone qualified imports.

That's true.

> The name of a header providing some function is thus inconsequential.

Then why not have one official big header file for the whole standard?

#include <stdlibc.h>

When you answer that to your own satisfaction, I suspect you'll have
little trouble following Alex's argument.

=2E..which doesn't mean you'll agree with it.

Regards,
Branden

--se53xmoqsmdqqx5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpvzoIACgkQ0Z6cfXEm
bc7xaQ//SaMzmuJxTfg+9gbWaItNviaYZXgr+WE3N6lXeRPrwfHUSww7gSPnZurM
8YxjXBCNvY7CLTlqwq5eqNbdvDnJa12Db3VHLYMi9uPuu6sShKQyCNSD90gS5d/9
RuSN6yXEH4L1EHygBCIzMUrl5GeJe4V+F4IP1/4uwR0HBeLDz8AUd78KGA5vXoi6
6Rhg/Sc8/FbhwIWDxp8p3Lx+3Vhv8eE29/hFPoyLSsfZsPtD5jm67DqqRJhTBZrQ
03xeKruE2Z+OSJ4/sXFhkbLSsmyY5/fAI6t8a87iiBNHxzskvoOe9kUv3eMhhrMu
AGHwMXSWC3BSTNlixagzL6Tj0B02SdQM17EnknEUiwKS1Mq/FKaVdzwv1Nsge+kD
YbgY6p5pX9FFWAm2xKdBolqvEXaFmbcwvGJel0tkeiexTVXYVM9sKmll1q5op3Y9
RKmgSb5U07Ib7mpxKYx3GSJq9i/Beyxojj2GevWXfnPuUk3W+eWYgq5ME9KSsGo/
3O3DM5Ee1bYwjXG9qTCNK2XzAzUU2oIqzmu/4VX9ZgRAvhIo7QDh4v3a7+Ip3hog
ifBWbMFswWI8rP3+0XbXGotNEjy0OzWjwg3UfiJBqUu7w7TBU27K+joBVlCcSKTN
tvgszQhV1rNaP8DFxHIzdRfQ9scBCfmV+3u99BvJOMNKFyJsYHk=
=N3Ak
-----END PGP SIGNATURE-----

--se53xmoqsmdqqx5y--
