Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924B825783C
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 02:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785722953; cv=none; b=tviDOpJ4NWXyDCzk96qjdixODZ4wJ8IPPAy1WEN1TK9gbLR+AxCwbziA0Ydgd9T7nwA26GvVqJXvovEfexDxG2uQS/0tivQlYfA4JRyaLn1K92DOQHw3gmJ84h2kmQq12chixj7Il8dTwa4sUoQMtSmldrhAwxIgBReitqKToRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785722953; c=relaxed/simple;
	bh=ahfCzPSKYEtmnC1WSdyfQJB+ZncXqd4i1YGmVZuHBB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMXBvOIbX+ajV8WYHrVGrVez9f0g95NB/gpHB1sIXYzdGE5WPL+a2ls48R7w1UxNBnmLVGlgLR9rr174bx7QPU6HY61WaItkoiW16j1SUfgexnwfI8aYOwvKTkrxOK8/rdaXT1LFuEgUy8J0U8ysadXIFTHlGjiyN4iCjjeBrXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlYm4Ohl; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlYm4Ohl"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81fc442789cso42020997b3.3
        for <linux-man@vger.kernel.org>; Sun, 02 Aug 2026 19:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785722951; x=1786327751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p1JtrnbhI9u7DzhYQAF/AtRfhsOX7TNvHinjRKtGRCE=;
        b=ZlYm4OhlqOODLs5f3FnXaPd2QhjJxTNcMbvjjg2KDctgbTrv8cbtztxZ6XLZDAhZID
         6v68YF1DcKTGYjU22wVuay5wMstsN2ALqZzX6L1xOcFzP3OhZHTbpLtNKqjkTuEskeRC
         WV/NUc6sEJVJOARamtEonRIj2G+OFJtsuNkptV1T2t3aCfZLN4+oHL45vSgY8F5llGGX
         K8jRZQamM2SCsLmWhJu+LelaCVaVwMlIiw/G5uYwxHQewbUugYxEk3GHY5HwIkMEGH8n
         UD0jA47WXaokqqzd5IEhSMfyGIDoDFPyjUY+2QJiO1pq+vYNOvbZrF+3cIKFZzBDvO+N
         ax2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785722951; x=1786327751;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1JtrnbhI9u7DzhYQAF/AtRfhsOX7TNvHinjRKtGRCE=;
        b=I8n8CDGqAursxSsYMK9LTFbGta6d+vXymT0mL3IAd2JSnPb+py+2KfJ+ElZ6pMmNMd
         xeSnpCINjpKxyHmsTiYGk7zqLsPSg5ArqRqnDPidIaTrn4zebBbBXfaY+hZ9U1yV2ISD
         yfOgAXGt9rMvYT5Yg6M4uiDi+k4v4CZxnV2nIIPcjm22qOyWOCNQZ5u1bt5qEO4mUrt0
         Xc7k2a+otwbXPEDG1JGwTXUDvkdi1nS8XIFb8uEz9HqKbo0XMR4mN4TeG0MwYGnTqCx9
         HWWDVmyb1Ah0oHqTy6lxnxE3jmZbi65+q0AdlLtzcxkPOxzv53pSnIYEGxPHQQFIA9/T
         ipzg==
X-Forwarded-Encrypted: i=1; AHgh+RqBmpDpRArmQkMBxazPc60XBrMfjXn6uNFO6mQU3vpSseu4uKkOv+HLkh+QAIgCiUDmEm4QGHkc3vU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwelGv4+hfRCfgpyoUuqMvF5+ZkvNKFoSWi40hldrAiV8X6qZbw
	iP4aYiVWimDaK0MlhwspBczr6twaC0rK67rmW1ZJldBwKvkvPWEfcLiN
X-Gm-Gg: AR+sD10lL+epvzmOxZ//UV2OFDCjLblY7ZPj9OfoiJTOKmhd4iFJFdffVUjKJWeJc9k
	6VjfIv8XMiUEngVuVTbegRnTWzCuGyHfbBP4I8E/ZT6jiQIL9ZCaG+Sz3DRe6TvtnbYaDzj0ncc
	cuQb/soQOxCz4b1xjZsbg+Gn0I7KT4I3M4V+4aNs8/Y83vPXg56G2pALOHAX+PEXlcvQEGFa+bo
	ei4eMECC5JxjbX7gjTEzL0AwETrKr0B4+XD37LvbCFmGNGiJRsO9uGIj6Kpm1yLNlUUhDU2A0tW
	1AT0imqN15O7Eo2YoQupl7ECj5wnSWXVvHr/Ilun7EgssWXxMOUzO+bIQRWiDZ67UvY0Z/EVfKZ
	0a1JuT0e/mskBbzXG32kIF/US6SYTWGfqc1rn6LozGCTVh42v1eGqxauOtj8jdlH/uTSDfZZX1m
	RrqXLZ6r/gqGPtNN3hNNx/3iOnEzah/XSOJZl5haHXI1C0Xdk1MApYv3LDaLvR
X-Received: by 2002:a05:690c:6990:b0:816:b469:ccec with SMTP id 00721157ae682-81fd4a60d3cmr117148207b3.15.1785722951337;
        Sun, 02 Aug 2026 19:09:11 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf994a4sm47204237b3.22.2026.08.02.19.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 19:09:10 -0700 (PDT)
Date: Sun, 2 Aug 2026 21:09:08 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Collin Funk <collin.funk1@gmail.com>,
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <20260803020908.efqt5ilkcjq4z3yz@illithid>
References: <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
 <am_V3bvOiH9TaJQW@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d6whia2zodmh77g2"
Content-Disposition: inline
In-Reply-To: <am_V3bvOiH9TaJQW@devuan>


--d6whia2zodmh77g2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: the Linux man-pages as an educational tool
MIME-Version: 1.0

Hi Alex,

At 2026-08-03T01:42:57+0200, Alejandro Colomar wrote:
> > > > Date: 2026-08-02 16:27:21-0700
> > > > From: Collin Funk <collin.funk1@gmail.com>
> > > > I can't help but wonder of what happens in WG 14 rejects this
> > > > controversial, as obvious by this thread, change. Will the
> > > > man-pages changes be reverted?
> >=20
> > > > Or will we slowly watch them document personal
> > > > preferences instead of existing standards?
> >=20
> > BTW, as I showed in another subthread, strncpy(3) did contain
> > opinionated comments well before I was involved.  If you're really
> > going to accuse me of that, better make sure you get the history
> > right.
>=20
> Oh, and while at it, please also read my review of glibc's own
> opinionated and bogus documentation about string truncation.

I don't think this rhetorical tactic is a sound one.  You are implying
that because Collin (and perhaps others) are not on record as having
already consistently opposed editorializing in the glibc manual, or in
the Linux man-pages prior to your stewardship, that they are hypocrites.

First, that's not necessarily true.  Who's read every word of either
work?  Who had already done so 5, 10, or 20 years ago?

A charge of hypocrisy can only stick well if you can establish that your
interlocutors _endorsed_ the editorializing contemporaneously when it
was done by someone else, but are refusing to endorse yours.

But there are more fundamental reasons to conduct this struggle on
different grounds, which are that (1) people get to change their minds;
and (2) people get to raise defects even if they are old ones.

Thus, if you feel justified in "relitigating", in Joseph's term, the
ANSI C Committee's decision in the late 1980s to scotch the memory.h
header file, then Collin gets to "relitigate" past editorializing by
(I guess?) Michael Kerrisk in the Linux man-pages, or by the glibc
authors in their Texinfo manual.

Thus, here you have handed Collin an easy annulment of your point: he
can simply say, "well I object to those, too".

Every generation of engineers bears a responsibility to remake the world
anew.  That which endures does so because its quality is re-tested and
re-proved by successive cohorts of humans growing up and running
straight at it with their freshly trained minds and novel phenomena of
recent invention.  When an artifact persists because it's protected from
the bratty young philistines by older people who, as William F. Buckley
put it, stand athwart history and yell "stop!", it fails to prove its
continued utility: it stops being an engineered product and becomes an
antiquarian one.

Regards,
Branden

--d6whia2zodmh77g2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpv+D0ACgkQ0Z6cfXEm
bc45Qw//dfYIsf8P3OnKZNIjbqMkohJ5eHqmis/CGyVwAFVNG3ncFrX+yIxVZkOm
tDjNzz8YFrdm12fcLpMKbEfkBotXcFqMj3QBZls5nUEPHzat00hPy5rJb1h2OQKS
xe/rNZYISTL8Rob4R8e7NvwES7VaO7Bc8aVXaEJm7o1zRmEUU6QJfowdR9vzumCk
E84jRKN70NqywOylhz7np8+rPi9uaV6pJdrK5hZXH3VMArn754ykIVX8J4Z4lwbE
PFDyhHeH7e1clVKutEZOMg+2/0w1TzM5zZJfXWssm+AMvT9TuHgFOT4Q+k3LpFfO
quzfsVgkbVJdkNsUg5MvPv4chIlAPtvaWeYminbTa9KT7mV3c/3X6GxUA1JSLnlN
yPk9qIA6qkwvCY5dXNaWIkdlm9HGa1QatrLTvpkQmgRyxS1nfzo27LbdtJUZLvyP
8kMUO4zJ8yWYHD2Gv5mpIV/S7FehMUlekHXqiXS+nTYHwvQMtIRo+zpke4vtQrbu
puLGEeX9Gw7rNlmCcTHh1DLFhZq1SCuX490Yki/2VQez6JicLElOhOeAJrWjtxD8
0XY4kXoU4b5zoWZ5UkBz4vCymwOyIbJX3XnkEiObgXstLfLwO+5VzB7Utgtl0xje
uWWIo6uMfUAEN6nNOt02N1frfZ16IR+6NpbMZ1gRiFmkclheSlY=
=YCv9
-----END PGP SIGNATURE-----

--d6whia2zodmh77g2--
