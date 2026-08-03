Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCD842BC46
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 21:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791407; cv=none; b=Q9K6G99bJ07nveoCq1kPb0FuDLWtqZC42b6VfZU5vbNKKJMgj+MpH5vN+0AZZekgysfrVYcwW8+VoIIYKsJ5ADd7LGTiBPcZs9l07P9NL2XAUv0rHUtBnjTLys4FCX/Cg6s2SKHZloxAHDd7fNxzHYhuavHDdvcNZOJBzTb1wWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791407; c=relaxed/simple;
	bh=mQ7LxTwzp9sgw5OOA19cmUYyLB8UiXHEMveyl3oIQAc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cpDhTz1qWticRlAWnCJQ0kZlcUyb6qh8quRzKJ9iGB03dui/fvs3DmhRkKTbUxztB7y8RSt+u9tI83iDJSKyXCZ3mxW/FNTldaT6LF3RPUWAl4QaJfFVNs5/g9zUIUjeZNdC8essdGCSxmCyVvnV0R34tGhlwYaC5jJAeq+Fo5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me; spf=pass smtp.mailfrom=aarsen.me; dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b=CgLQa4K+; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aarsen.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b="CgLQa4K+"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hDTp23nQTzMlG1;
	Mon, 03 Aug 2026 23:09:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aarsen.me; s=MBO0001;
	t=1785791386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mQ7LxTwzp9sgw5OOA19cmUYyLB8UiXHEMveyl3oIQAc=;
	b=CgLQa4K+X0s4CctiLs9wUWX4CZf7hg+lMeBIj3MgYa6h5YMk58PRaoAkIWCrhWajII60hG
	v0Tg9/mWMjuVKJRDTrSVPb5fkzCL6mFkpmFaQaovpwJqD1qZbbgP3mku9OPgdG3Psq6hAg
	LGkJapQ4yBkLzyWIWp8N1cSj/imcJ/AphqSKXpeZ/oZGkLU+u71DfO55DN/k9s+VSBkqp0
	JTR7ZHfJNkXXtfoJBLZ0+i1bSt3D3y1A99M0NG1CR1Y5PxeXtAQX0ve9sZbzLZgbwQvrVv
	fxKHdMQnUC5tV0zieSHIs63cTcpcArQrIDe6VNTJNDsDTfmL/q4pT/2cxI3FCw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of arsen@aarsen.me designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=arsen@aarsen.me
From: =?utf-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>
To: enh <enh@google.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>,  Alejandro Colomar
 <alx@kernel.org>,  Collin Funk <collin.funk1@gmail.com>,  "Maciej W.
 Rozycki" <macro@orcam.me.uk>,  Paul Eggert <eggert@cs.ucla.edu>,
  linux-man@vger.kernel.org,  bug-gnulib@gnu.org,
  libc-alpha@sourceware.org,  groff@gnu.org
Subject: Re: on project management
In-Reply-To: <CAJgzZorzA1f+KNAj0m56nXxoKywY_pCj2pX3Rg-CgP1P8TnZuA@mail.gmail.com>
References: <20260802000833.zpu27l7ibvrbouna@illithid>
	<am6PkypxYg-Fq4Iz@devuan> <87cxw1s58a.fsf@gmail.com>
	<am6X32HkGdm2xTd7@devuan>
	<alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
	<am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me>
	<20260802231058.o7gud4bd7co2nbhv@illithid> <875x1sp0h2.fsf@gmail.com>
	<am_TTjDLlAI68zkp@devuan> <20260803160902.5edjmpxaqr5uudbu@illithid>
	<CAJgzZorzA1f+KNAj0m56nXxoKywY_pCj2pX3Rg-CgP1P8TnZuA@mail.gmail.com>
Date: Mon, 03 Aug 2026 23:09:40 +0200
Message-ID: <86a4r2oqqz.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-Rspamd-Queue-Id: 4hDTp23nQTzMlG1

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

enh <enh@google.com> writes:

> the crazy part is that it was an _empty_ file until i made it just
> #include <string.h>:
> https://android-review.googlesource.com/c/platform/bionic/+/52171
>
> i can't explain that (it was originally checked in as an empty file,
> so the history is no help).
>
> i _can_ explain why i made it match glibc rather than just deleting it
> though: i didn't want to break existing code that was [harmlessly]
> including an empty file, and i wanted to increase the amount of the
> code from other libcs that would "just work". (and note that ios/macos
> have a <memory.h> that's just a #include <string.h> too.)

I think this partially confirms my suspicion earlier, that the only
reason anyone ever included <memory.h> is because on some system stuff
they wanted was not in <string.h> (but was only in the latter on some).
So the former tends to be included only when the latter is also, to
cover both cases.

I'd confirm definitely by getting the list of files from Debian
codesearch that include one and the other and comparing it, but I wasn't
able to figure out how to do that.
=2D-=20
Arsen Arsenovi=C4=87

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQECBAEWCgCqFiEE/uKz0RP8AKMWLWBhUsKUMB6ixJMFAmpxA5QbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRGRUUyQjNEMTEzRkMwMEEzMTYyRDYw
NjE1MkMyOTQzMDFFQTJDNDkzEBxhcnNlbkBhYXJzZW4ubWUACgkQUsKUMB6ixJON
YgD7BWB/Fwwb8cXyHLnK6ez2+BvM5SLUjmqpjuSlsrVLeyMA/iHgvCDBJs2+3nGb
L5WlNVMbgsnfCO6DR/Xqkozbej0A
=UJhF
-----END PGP SIGNATURE-----
--=-=-=--
