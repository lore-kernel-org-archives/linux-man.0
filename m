Received: from evolvis.org (evolvis.org [217.144.135.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DC9369D40
	for <linux-man@vger.kernel.org>; Tue,  4 Aug 2026 02:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.135.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785811301; cv=none; b=Rtbvp6TBMCIltNvAkQViFhlNCyhU+x1jTD5p7t0bEKt3edjJnKf7W3+/mkGVkuLQZxdeHblGjXCFntfXo83ckqU4GpIl4DehSjrKP4+TUaJZbYcleo1O7mTusfe0YWckp5HmfYFjTW8gpHUfj3T8Mln9CtSGvzxRTg10gBB2Caw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785811301; c=relaxed/simple;
	bh=+ng6d8R2DGUW1N8odQcsY8lZ7UWn9+y85phdbGJq6to=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dIm23isIWm1pSROUwQnePxQoR62IiEHeWlvSa8Q0wmtrr+eeaVlvrx4kyuPjuNmNJPOa1bcd8lPmKeNsWc+JiHO4UixLsebL0lqf4K+TgJJgF+qz+8pniggFSAxiqbEZW8CPfszTfWd7qurgpOmI3K6f9oxdLx6giWV3QPoMXXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirbsd.de; spf=pass smtp.mailfrom=mirbsd.de; arc=none smtp.client-ip=217.144.135.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirbsd.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mirbsd.de
Received: from x61p.mirbsd.org (p5b2babb5.dip0.t-ipconnect.de [91.43.171.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X448 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: x61p@relay.evolvis.org)
	by evolvis.org (Postfix) with ESMTPSA id CA7941002BD;
	Tue,  4 Aug 2026 02:35:42 +0000 (UTC)
Received: by x61p.mirbsd.org (Postfix, from userid 1000)
	id 8BC6914215E; Tue,  4 Aug 2026 04:35:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by x61p.mirbsd.org (Postfix) with ESMTP id 85E3A141D36;
	Tue,  4 Aug 2026 04:35:41 +0200 (CEST)
Date: Tue, 4 Aug 2026 04:35:41 +0200 (CEST)
From: Thorsten Glaser <tg@mirbsd.de>
To: Alejandro Colomar <alx@kernel.org>
cc: Collin Funk <collin.funk1@gmail.com>, Joseph Myers <josmyers@redhat.com>, 
    linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
    Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
    JeanHeyd Meneide <phdofthehouse@gmail.com>, 
    Christopher Bazley <chris.bazley.wg14@gmail.com>, 
    "Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
    "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
    Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
    libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem, strn}*(): SYNOPSIS, STANDARDS: Document
 these as provided by <memory.h>
In-Reply-To: <am01KjWKubOohd5r@devuan>
Message-ID: <7fa4b4b7-fd13-86cf-986c-17c49011efa1@mirbsd.de>
References: <cover.1785532392.git.alx@kernel.org> <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org> <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com> <m15x1u7max.fsf@gmail.com> <am01KjWKubOohd5r@devuan>
x-ms-reactions: disallow
Content-Language: ksh-Latn-DE-u-ca-iso8601-co-POSIX-kk-false-em-text-rg-denw-tz-utc-va-posix, de-DE-1901-u-ca-iso8601-co-POSIX-kk-false-em-text-rg-denw-tz-utc-va-posix, de-Latf-DE-1901-u-ca-iso8601-co-POSIX-kk-false-em-text-rg-denw-tz-utc-va-posix, en-GB-u-ca-iso8601-fw-mon-hc-h23-co-POSIX-kk-false-cu-eur-em-text-rg-denw-ms-metric-mu-celsius-tz-utc-va-posix, und-Zsym-u-ca-iso8601-fw-mon-hc-h23-co-POSIX-kk-false-cu-eur-em-text-rg-denw-ms-metric-mu-celsius-tz-utc-va-posix
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 1 Aug 2026, Alejandro Colomar wrote:
> From: Collin Funk <collin.funk1@gmail.com>
>> Joseph Myers <josmyers@redhat.com> writes:
>>
>> > I'd rather we add a mandatory deprecation warning to memory.h in glibc=
=2E
>>
>> I would be for this change, and am surprised it has not already been
>> done, to honest. The use of memory.h is a good indicator code hasn't
>> been touched since the 80s.

I agree. <memory.h> is a legacy header, and it has only
redirected to <string.h> for ages, for even-older-code
compatibility. Many environments do not have it at all,
and let=E2=80=99s leave it at that.

It=E2=80=99s so obscure I haven=E2=80=99t needed to use it on *any* of
the platforms mksh got ported to, and those are extensive.

>Or that it has been touched in 2026.  :)

Please don=E2=80=99t try to unilaterally introduce even more
splintering of portable C programming. This will hurt
and make standards into competing instead of compatible
again.

Thanks.

(Please do not add me to the Cc list, I don=E2=80=99t have
enough tuits for this.)

bye,
//mirabilos
--=20
FWIW, I'm quite impressed with mksh interactively. I thought it was much
*much* more bare bones. But it turns out it beats the living hell out of
ksh93 in that respect. I'd even consider it for my daily use if I hadn't
wasted half my life on my zsh setup. :-) -- Frank Terbeck in #!/bin/mksh
