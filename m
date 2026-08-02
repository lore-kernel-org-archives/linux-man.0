Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8A72EC09F
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 23:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785712131; cv=none; b=fWZ/svvmGEs1iqB+79fo4uGarUU648+AA8tVheKjTK4B/flel9rYhaHZlWQ5w44nNQNwUHq8NQc6NtWGNbH8R4BjNBSZZqNdSh9ovAvmsbJ4u6modVESuQWgTckhV8n4sqSzEV+fBlHtZF+vEhXN+juarnSZTlEHLJQoYCcBJ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785712131; c=relaxed/simple;
	bh=OEmqIPCm65Sly4XRMv+iowzL+l8avBrkr2nQMkG0yiI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sOnVcZjZdgW2WJ4V3uD+47UMzCnq0hIeXA30qB2hvWX8cRwtKC6ATofGxKsp2wQSpsYHkuoY2lukMo0KBCfx/7AG8CYimI+85aL/+P+UyK33AXf4j+V0vqXZ3RyREZdJcfuxxBCUf0f9pg6K7yGBAwtUci+xDx4vUCK/RZiBpEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me; spf=pass smtp.mailfrom=aarsen.me; dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b=xYxpxgsM; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aarsen.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b="xYxpxgsM"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hCwTf4fLKzKvtl;
	Mon, 03 Aug 2026 01:08:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aarsen.me; s=MBO0001;
	t=1785712118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dPo9lCR0dxj5CPPmrsrJ3An5B9KzxzjfVRrG2JlWwrg=;
	b=xYxpxgsMxw+DPHnNU26CUyK5VdetXTkwx+f+MUZhfrFcQdkybxJPS1BNoUoTkJz0uchLWZ
	25BFiD7IQcrtSYKgwYxayy3Yx4PhuA2gnjEbVrgwn1ixTHOJRluh719a807QOgmFFM2W9V
	g1e+2/yTB70u4mWZFx0Ef9nv/Z8yKA4RHGmp0g71UYeEqkTguR+2EAwamGx1lc6JNvxX1j
	rTKAAHU9zTjFKG0FuhhdymNnuckILqMGgSWOiXKxds70pDGNeLdHDPcCAwg2dn1+c6nRlU
	QHYnHAVtt2gBG/aQBya+ZAtdjJwIwjEfSLYraTNNPkD1TS+BWFvQdfZRfGcr+g==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of arsen@aarsen.me designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=arsen@aarsen.me
From: =?utf-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,  Collin Funk
 <collin.funk1@gmail.com>,  "G. Branden Robinson"
 <g.branden.robinson@gmail.com>,  Paul Eggert <eggert@cs.ucla.edu>,
  linux-man@vger.kernel.org,  bug-gnulib@gnu.org,
  libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <am-2d02e1qq78Asv@devuan>
References: <am50AM0bdufHa9W3@devuan> <15288158.RDIVbhacDa@cagnes>
	<am56ZBzNM5J07AUa@devuan>
	<f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
	<am6CnOddgaM10pry@devuan> <20260802000833.zpu27l7ibvrbouna@illithid>
	<am6PkypxYg-Fq4Iz@devuan> <87cxw1s58a.fsf@gmail.com>
	<am6X32HkGdm2xTd7@devuan>
	<alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
	<am-2d02e1qq78Asv@devuan>
Date: Mon, 03 Aug 2026 01:08:32 +0200
Message-ID: <87ik5sunm7.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-Rspamd-Queue-Id: 4hCwTf4fLKzKvtl

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alejandro Colomar <alx@kernel.org> writes:

> [[PGP Signed Part:No public key for EB89995CC290C2A9 created at 2026-08-0=
2T23:34:34+0200 using RSA]]
> Hi Maciej,
>
>> Date: 2026-08-02 22:23:36+0100
>> From: "Maciej W. Rozycki" <macro@orcam.me.uk>
>>
>> What problem are you trying to fix anyway, what's wrong with=20
>> using <string.h> for the APIs in question?
>
> Programmers misunderstand these functions (some more than others), and
> think they are appropriate for handling strings in ways that they are
> inappropriate.
>
> If <string.h> was described as providing functions that exclusively
> handle strings, then programmers that only need to handle strings
> would naturally self-limit to functions from this header file.
>
> Those programmers that need more niche memory functions --maybe
> because they need to handle a substring, or maybe because they need to
> handle a utmp(5) fixed-width null-padded character array-- can resort
> to <memory.h>, but that comes with the implied warning that those
> functions are not the simple interfaces that <string.h> probides; they
> are sharper: you can do more with them, but you need to be more
> careful.
>
> Most programmers can live in the safe bubble of <string.h>: those
> functions always require a string as input, and always provide a string
> as output.  Plain and simple.  It's difficult to write bugs when using
> those.
>
> That's the rationale.

I do not follow.

C has no namespaces, let alone qualified imports.

The name of a header providing some function is thus inconsequential.

Indeed, these functions are provided by many headers outside of these
two (by accident most often, but sometimes intentionally).

No programmer is able to safely use any C function until they read its
documentation.

This goes doubly so for functions operating on bit soup, like mem* and
str*.
=2D-=20
Arsen Arsenovi=C4=87

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKIEARYKAEoWIQT+4rPRE/wAoxYtYGFSwpQwHqLEkwUCam/N8BsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIQHGFyc2VuQGFhcnNlbi5tZQAKCRBSwpQwHqLEk5/9
AP9u6q5WybawRufoUOrU62K4Mk6UGkqB/tWw02AO1VDKcQEArevxIyRiqYM3UmSE
qvuR3/46jGVuJlploGKfCtG48AY=
=nrtI
-----END PGP SIGNATURE-----
--=-=-=--
