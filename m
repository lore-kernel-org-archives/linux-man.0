Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387EB395266
	for <linux-man@vger.kernel.org>; Tue, 20 Jan 2026 22:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946842; cv=none; b=DrOj5dZvBYVlU5haaYX9DNvGhyD9xCFK+J38hSDct1pAimchZnJdvHD4XDf5inCpGLOAZ/y1V7w8FxkbEcM6vdZ91YH1fFF9FSlsDqWevfBLk6c0RCyFZYKHIQC3RSWD/HQD1GqXKuhQNU1Ddqiz3TvDWBGO0x/4eoe1B1LTDWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946842; c=relaxed/simple;
	bh=C9Y97Hzy9ITK6EGH+m5pjIO7RqCVQuVtThE6MymVwxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=niqeolTCHKfEdjHgdbsiS9yBqmqIFXPDywYbQMFgFx0kHItHuipn7yXrHZJdvaJxkzGdpLbdwNNb9mZ1XRGB0RTUz7KaoIRXpfybJaadIE8tTVnHUHooGP43cR6dRjVDajOef+PsfI8al4EE+G07vpWbtLN2/d9sOSmZw7Q05Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alejandro-colomar.es; spf=pass smtp.mailfrom=alejandro-colomar.es; dkim=pass (2048-bit key) header.d=alejandro-colomar.es header.i=@alejandro-colomar.es header.b=adZswXhC; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alejandro-colomar.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alejandro-colomar.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alejandro-colomar.es header.i=@alejandro-colomar.es header.b="adZswXhC"
Date: Tue, 20 Jan 2026 23:07:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alejandro-colomar.es;
	s=key1; t=1768946836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=4hwpgAEchkaDM71nzjd5bkTP4car8Phd6NnLVZLEvrs=;
	b=adZswXhCkdj4Z+tSD3kIHU/SIf5qk2lbEgSZsXbtMJ3uiyS9+f7n+tOJi0dYlwvdbJeEYN
	mwnWJ/3V9xEaK5sbGs2Dq4pn+Jj/xjoeqIIFBc4/2JyFuLRaImn/97WESWG/g8uasLNhzM
	h8176aGGqAEck4GtfGDa9O6KMjm6c+kwZs53rRiFtYJ91DsIhAZznxNRbQ/vYpXyOLsYDE
	TpqTc4CEuTEClAluebnRxjQupje3vqkwqpQWHWUOnuitxu6iyJ2VnViiuiUJ+2EsZ6Bt1R
	BD3xi6CS02v9AIvwDq3MTtn04Y927J6O4DBwW9j++HWRMXMDv1x73mgki1sKLQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alejandro Colomar <une+c@alejandro-colomar.es>
To: Robert Seacord <rcseacord@gmail.com>, 
	C Committee <sc22wg14@open-std.org>
Cc: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, 
	musl@lists.openwall.com, Florian Weimer <fweimer@redhat.com>, 
	David Svoboda <svoboda@cert.org>, Robert Seacord <rcseacord@gmail.com>, 
	"sc22wg14@open-std. org" <sc22wg14@open-std.org>, Carlos O'Donell <carlos@redhat.com>, 
	Aaron Ballman <aaron@aaronballman.com>, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, 
	"linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Paul Eggert <eggert@cs.ucla.edu>
Subject: Updates on n3752, alx-0029r8 - Restore the traditional realloc(3)
 specification
Message-ID: <aW_51O7XVxxAMXby@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t2vwkf7i5ioed7wn"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT


--t2vwkf7i5ioed7wn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <une+c@alejandro-colomar.es>
To: Robert Seacord <rcseacord@gmail.com>, 
	C Committee <sc22wg14@open-std.org>
Cc: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, 
	musl@lists.openwall.com, Florian Weimer <fweimer@redhat.com>, 
	David Svoboda <svoboda@cert.org>, Robert Seacord <rcseacord@gmail.com>, 
	"sc22wg14@open-std. org" <sc22wg14@open-std.org>, Carlos O'Donell <carlos@redhat.com>, 
	Aaron Ballman <aaron@aaronballman.com>, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, 
	"linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Paul Eggert <eggert@cs.ucla.edu>
Subject: Updates on n3752, alx-0029r8 - Restore the traditional realloc(3)
 specification
Message-ID: <aW_51O7XVxxAMXby@devuan>
MIME-Version: 1.0

Hi Robert, and all,

I've been talking with the team at Microsoft that is responsible for
realloc(3).

They are "definitely interested in incorporating the change".  They are
also going to "coordinate [with the OS group] to perform thorough
testing to understand the impact of the change".

This may take some time, and will come back to me with the feedback of
that.  The communication with them is quite fluent, BTW.

I think this is great news for fixing and unifying realloc(3).  Also,
it's also great to see a big company like Microsoft will put their
resources into testing this, as they have resources that we voluntary
maintainers of open source projects don't have (or would have to take
=66rom some other changes).

Robert, I'd like to withdraw the paper from the next meeting.  I'll
write a new paper once Microsoft tells me their testing results and
feedback, incorporating them.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--t2vwkf7i5ioed7wn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmlv/IkACgkQ64mZXMKQ
wqnuYw//YuKXSokIS81zxUx1xQQBR+Xi7o3e7nhNBl2sZBjwp7dPioXxOG0h3weU
fwkoHx68b1dfNtl/lmH/jV0nMlG+XNFbLyR/wlr42YXy6I/5tZ0iU+LDy+QRHrw4
fmnbxBMO7j4p3UEOtp+d3oAdV/6uUSOaUVlpTTiQ6RkMPs/I/RjSD+V8qQESUL70
Na0mB7F8motQ4TAUA+iFbXNF37xUfz3v9i6xgx1ebz2YvIsQl0oZy4LGjKDDQIVt
wm1cedOPY4rZEqElLBCgz2BMelnzJNcYmj+ODnBFXcSl8b6WAIE9VQKsr/FQeb0p
+wKTxm86Czo5G2rQgF9ohOxcSA+CqwwDDS0fz3GsXoog7xKk9IBdnaKFnuAXmuV8
Z9eECr68hms/2BJQ5StMQnFFKy3FVEaxorfcNCyZOh4U7OXduYlr1ksIA7W+oFww
xP0eH3rMu8YxYCmoyEa1ZLUsLwhDKpxNiyQbocZiqg1oC76OOyKUze3TLVqY0zbJ
2Uzp0I5sX9ZRKzylIwzxMCAJ6Ax5oBhKRsTG8hnkqlf30su0BEgBeewFAfUZzscV
rvnYAWnUWVIsIjexvHHMy5FvuPLIZiGZrVDInhPQS8DY19ZsxMUAX0yO2pwbpFay
yju3rSs2x/rgWyyzIHZqDhRrro6euFe3wgBL8buaMMy6vG9+8I4=
=toyR
-----END PGP SIGNATURE-----

--t2vwkf7i5ioed7wn--
