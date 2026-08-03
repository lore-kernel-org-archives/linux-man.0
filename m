Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDF33932E3
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 11:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754834; cv=none; b=J7sYmH+HcrAgdEuS2o8nnulW0EZmPcMFkUtaJbV9RauhT+u9BcyINRnGodjH7YLBVF37kuc695BpycRp92iPY9Ipf2IQGKR1Rx+ABnNwXKfUFG42W4fxUE8OwoLD7f5EsjN3fPprDEZxbOpNMjh+vHiHSaZOEmx9eNiNW/e6vEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754834; c=relaxed/simple;
	bh=+eH7Cfu8PdnWfqXZHKsp0QQHxEABltZf7jjLaxremFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U/8kBAauX0jQjtZY5WTAP8n6EWFmsb3Boqef4bNc/2KpWNDtLM6d2aufm/HVBhtrfeLjpwRH5PhH5XISpCDdJIpJiWlmmZ48HjPgrVVQbw6uX+1MFy2lLMrQEQojB2UdDyReuXUtxSdr24b/+l60DRnjRrYn5bmTdviDoDmfdKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me; spf=pass smtp.mailfrom=aarsen.me; dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b=VyiGMiwa; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aarsen.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b="VyiGMiwa"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hDDH063d4zKmBF;
	Mon, 03 Aug 2026 13:00:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aarsen.me; s=MBO0001;
	t=1785754828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oYdvcQxWTe0rQwtG/SFm8ZDWgr0so5GHWvHOv9y+h+c=;
	b=VyiGMiwa48bJPKWGphBY+MGm9ruRSWlbjB82I/nwrlGn1ttTF8wEd687hWGcKOKZ7PFM+y
	1bYvl509Txcy+PrjJCO9hPrd5iRNa6RxiZQIdOdJ5Gyr2GO7qygRTwT7CfFaDUYzy8DLsE
	rw2ln7rqFSYyG9KHrqyf1JhTbLlmavWb0SXqT24eowmLkstBnihOcSXeYklGdnNiGbBDgo
	f05qIqZfcKhkvC/kMoEmiLcmR/Juc3n78+NzggxE4uIPqYqcvPjiiRnx3qyjE2jlWRggmd
	EYKmTq/kI960pOeG/TuuW2BALwtlMvIOzk/Z/RV0Eo8sgxluEz/P5u5M2r8xPw==
From: =?utf-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>,  "Maciej W. Rozycki"
 <macro@orcam.me.uk>,  Collin Funk <collin.funk1@gmail.com>,  Paul Eggert
 <eggert@cs.ucla.edu>,  linux-man@vger.kernel.org,  bug-gnulib@gnu.org,
  libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <20260802231058.o7gud4bd7co2nbhv@illithid>
References: <am56ZBzNM5J07AUa@devuan>
	<f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
	<am6CnOddgaM10pry@devuan> <20260802000833.zpu27l7ibvrbouna@illithid>
	<am6PkypxYg-Fq4Iz@devuan> <87cxw1s58a.fsf@gmail.com>
	<am6X32HkGdm2xTd7@devuan>
	<alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
	<am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me>
	<20260802231058.o7gud4bd7co2nbhv@illithid>
Date: Mon, 03 Aug 2026 13:00:19 +0200
Message-ID: <86zez3o4e4.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"G. Branden Robinson" <g.branden.robinson@gmail.com> writes:

>> The name of a header providing some function is thus inconsequential.
>
> Then why not have one official big header file for the whole standard?
>
> #include <stdlibc.h>
>
> When you answer that to your own satisfaction, I suspect you'll have
> little trouble following Alex's argument.
>
> ...which doesn't mean you'll agree with it.

The only reason I can imagine for not having One Big Header in 2026 is
the same reason why I wouldn't make the change Alex is proposing:
because someone already chose to create many headers and changing it
would mean shuffling lots of code around for no gain.

I imagine that, at some point, the amount of time that it would take to
read and parse such a header would've been a problem also.  Perhaps that
inspired the fragmentation.  Perhaps not.

I do not know, I didn't do the historiography.

I do know that splitting an extremely widely used header (291,660
matches on Debian codesearch) to replace it with one used far less
widely (11,459 matches on that same codesearch, some of which mention
portability concerns as the motivation for including memory.h, and I
suspect most of which also have an include of string.h in the same file,
but I did not verify this) only means that people include both, perhaps
conditionally, while seeing no changes outside of the preamble of their
source files.
=2D-=20
Arsen Arsenovi=C4=87

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQECBAEWCgCqFiEE/uKz0RP8AKMWLWBhUsKUMB6ixJMFAmpwdMMbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRGRUUyQjNEMTEzRkMwMEEzMTYyRDYw
NjE1MkMyOTQzMDFFQTJDNDkzEBxhcnNlbkBhYXJzZW4ubWUACgkQUsKUMB6ixJNZ
pQEAp/uFW2lA3o+LdFIYsGomKtxzsWcECzecs1KGPvOB9dkA/3N/Jo/nO+RiNy43
104fvvKQ0NCqH2V40F7cd8TMXL8K
=DQnl
-----END PGP SIGNATURE-----
--=-=-=--
