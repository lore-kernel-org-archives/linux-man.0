Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.104.147.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792964223;
	b=wW9Yi9oQK5/dri8ridSjTr1DL9Pspap7GKbL2zBaXmHKuR8Lf6ajl2G2hWOcYhsg16mp
	 EIZXpt4wxBO/STZVLABp98l2RauF1fpas/fkwW4PMFL7a6MkhTUz3sceNRr4Qn+ViLtiN
	 4Jod1hjG9y5WimyhZ84wwPr7Ccvrpf5ijaYGK0l7OfMU0KtcheOsZ2QXslUYcebW/Mggk
	 j6y/xSz13TdUYV7Q/Wr8d2J0tyHYI+jVLRxDkyPmeg987n0v8nDHJK+gNyG2VMEbkSrKs
	 jhvsbOhCLCQjNm8POxcbpdHe6rXTuhrGitqCndiB+oOmMk0LafIHUHB60CxNh+kFtXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792964223;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=z3/75i7/+c9zcsLH20UGUag4cn44qzRxQJHqUKSZKbw=;
	b=vTVc4Kzg6XO7U9f6ghGaUcajElEeY18A1k33uWqNUBdRxeduG/H5Z7XXKQMX9tkjZuGz
	 DAx1xrzQxhakRB6U+5Mxk/2wbvasenrr41f7lBYuD9ivVDchIxVC1UXUxj8hdzGR40zJ8
	 BD2DqQ7naJEGfDW3KxZBKRrgiF2QKgmTWnXN4gkc588juCBTPcXspIIVF0Q7LpHop82sS
	 8U5iBWC+/AHfGfSQ2s2SVgR2OwWMlMaU/GlvEpdUmyIZaRTBtSq8Gjt5Chr5bT073zsLr
	 8qdUf990DLCo82+LLuEReY8fZsxsT78wJRk14/UpKFOkgzSgF5uhJYSNtrxRXdeqbLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gms.tf;
	spf=pass smtp.mailfrom=gms.tf;
	dkim=pass header.d=gms.tf header.i=@gms.tf header.a=rsa-sha256 header.s=2023100216 header.b=kiON1nQY;
	arc=none smtp.remote-ip=172.104.147.125
Received: from goedel.lru.li (goedel.lru.li [172.104.147.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA77C606A31A
	for <linux-man@vger.kernel.org>; Sun, 25 Oct 2026 21:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA77C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gms.tf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gms.tf
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gms.tf header.i=@gms.tf header.a=rsa-sha256 header.s=2023100216 header.b=kiON1nQY
Received: from framework.lru.li (unknown [IPv6:2001:1a80:303a:0:d79e:ed35:3024:7b6b])
	(Authenticated sender: georg)
	by goedel.lru.li (Postfix) with ESMTPSA id EAE386338ECA;
	Sun, 25 Oct 2026 21:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 goedel.lru.li EAE386338ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gms.tf;
	s=2023100216; t=1792964221;
	bh=z3/75i7/+c9zcsLH20UGUag4cn44qzRxQJHqUKSZKbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiON1nQYN1U2a0bHtPCFC/9tByvZhamFoyb0XkYqfHB0hUPbuOXlR+RGJlHwnv93W
	 rmcC9X+u/jLxBy2cqgrNzr77deAv3UJ9Y84jHJbvcZzmC376z0xRobKvmZfu/BuVWx
	 mozzNVq/GIsNGP3PL3PmcHqNTNbEuZscx/+4jXPs=
Received: by framework.lru.li (Postfix, from userid 1000)
	id 459ABBABDFF; Sun, 25 Oct 2026 22:37:00 +0100 (CET)
Date: Sun, 25 Oct 2026 22:37:00 +0100
From: Georg Sauthoff <mail@gms.tf>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Nikola =?iso-8859-1?Q?Forr=F3?= <nforro@redhat.com>,
	Laurent Georget <laurent.georget@supelec.fr>,
	Jeff Epler <jepler@unpythonic.net>, libc-alpha@sourceware.org
Subject: Re: [PATCH v1] man/man2/adjtimex.2: Add include, macro and error for
 clock_adjtime
Message-ID: <at52fBkoAmohUnC7@framework.lru.li>
References: <20261025125656.877530-1-mail@gms.tf>
 <at5M0n93b8Nqjop-@debian>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at5M0n93b8Nqjop-@debian>

Hello,

On Sun, Oct 25, 2026 at 07:49:32PM +0100, Alejandro Colomar wrote:
> Hi Georg,
> 
> > Date: 2026-10-25 13:56:56+0100
> > From: Georg Sauthoff <mail@gms.tf>
> > Subject: [PATCH v1] man/man2/adjtimex.2: Add include, macro and error for clock_adjtime
> 
> Please separate this into two patches, each of which does only one
> thing.  The error seems unrelated to the include.

Ok. Yes, it's unrelated. It wasn't my intention to imply that both hunks
are related.

I'll split it and send both as version 2.


> > diff --git a/man/man2/adjtimex.2 b/man/man2/adjtimex.2
> > index f12d9413e..528fd3a6f 100644
> > --- a/man/man2/adjtimex.2
> > +++ b/man/man2/adjtimex.2
> > @@ -17,9 +17,21 @@ .SH SYNOPSIS
> >  .P
> >  .BI "int adjtimex(struct timex *" "buf" );
> >  .P
> > -.BI "int clock_adjtime(clockid_t " clk_id, " struct timex *" "buf" );
> > -.P
> >  .BI "int ntp_adjtime(struct timex *" buf );
> > +.P
> > +.BR #include <time.h>
> 
> BR is for alternating bold and roman, so this seems wrong.  You probably
> want just B (see the include above).

FWIW, I copy and pasted the BR from another man page I picked as
template which already references _GNU_SOURCE, cf.

    $ grep '^\.BR #include' . -r | wc -l
    23

Ok, I change it to B. Also for consistency.


> BTW, I would use
> 
> 	.B #define _GNU_SOURCE
> 	.B #include <time.h>
> 
> and then remove the Feature Test Macro text below.

Ok, no problem. Again, I just copied that style from another man page:

    $ grep '^\.BR feature_test_macros' . -r -A50 | grep '\<_GNU' | wc -l
    62

The define style seems to be more popular, though:

    $ grep '#define _GNU_SOURCE' . -r | wc -l
    153

Plus special space variant:

    $ grep '#define\\~_GNU_SOURCE' . -r | wc -l
    2

I don't really have a preference between these styles and thus follow
your suggestion.

Best regards,
Georg
