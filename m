Received: from scc-mailout-kit-01.scc.kit.edu (scc-mailout-kit-01.scc.kit.edu [141.52.71.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1416F3C10A4
	for <linux-man@vger.kernel.org>; Mon, 10 Aug 2026 13:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.52.71.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367223; cv=none; b=U+HQ8yRxmDab+o0B1i6+/VIOB2tf1Bl9iP7mCaqpJazMMJSig3IKjizUF9NKv7nlARfW8HOEOn6bSLWz7X9qXYg9h/Yh7Pl/8QoDQ8owoOic7PIQF8nSqe7q37r1jj/mWHIox3Az+3evElVvEURWpk9t3FK+gBNOX3kr8/gpVJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367223; c=relaxed/simple;
	bh=+lnFKF3c/Qgbn034/p0kycSkG0yGa5rK33VNNjiP9dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNqpfWeZuLvIa/pcF5DHYf7RWzPNMIG/K5unAPJTo5eSqy5KvThD75srmuy6oQDuAxjN3fU+Avx24jHNnVYyeTSbYjQg1coS9STkINIvpKhQbT3WeQ2XRtXV5IT6qZyB32ds8Hi5H7VIEWgK9pM239TVGi6XulPqLF3jmcUA7pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=usta.de; spf=pass smtp.mailfrom=usta.de; dkim=pass (2048-bit key) header.d=usta.de header.i=@usta.de header.b=YFuDptXe; dkim=permerror (0-bit key) header.d=usta.de header.i=@usta.de header.b=A1aZXcDb; arc=none smtp.client-ip=141.52.71.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=usta.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usta.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usta.de header.i=@usta.de header.b="YFuDptXe";
	dkim=permerror (0-bit key) header.d=usta.de header.i=@usta.de header.b="A1aZXcDb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=usta.de;
	s=kit2; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
	:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GL4SXfNcra5dJH5OKiSRlHU0HRPltSH5ZDqUNQx9MxM=; b=YFuDptXevCBsbcqouxIUdQdGKP
	wWlxGLHxF+CJ9pCr+lzyoAgYAeByIP8YiQam1VN184MDBdNxpCJ+bk22H3GhndFwma/btkivmptVj
	BmwMjNIQPP0OAHvwm23r267G5x4kV1z3bNax3ZDvx38JsNEo5xrXB0CytwLG2iWHbcwraitSoBSmy
	u1inAAatDYOoHFQA6ORh9kc5grugDynJXL1QJOyJ/NNfNA2vaxS68u0o8uvumZXSE5K50tSLJWUw/
	kf/8tDmNCVY+BijPit4YjDxgOg1+2j77SO++kk30YxvFOc3778k5rHn9Csur207grWVqKv22LGCVW
	pBBK293Q==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed; d=usta.de
	; s=kit2ed25519; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GL4SXfNcra5dJH5OKiSRlHU0HRPltSH5ZDqUNQx9MxM=; b=A1aZXcDbHVVXG9rw5XdBKuxMS2
	5Z1iyLo6yanxQ1QBLVAiT3DVCgN8MShS4phuTV3f/szyWzvHSTGGuRHUWfAg==;
Received: from hekate.asta.kit.edu ([2a00:1398:5:f401::77])
	by scc-mailout-kit-01.scc.kit.edu with esmtps (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(envelope-from <schwarze@usta.de>)
	id 1wtPiR-00000008wiL-4Aw6;
	Mon, 10 Aug 2026 15:06:56 +0200
Received: from imap-2.asta.kit.edu ([2a00:1398:5:f400::36])
	by hekate.asta.kit.edu with esmtp (Exim 4.94.2)
	(envelope-from <schwarze@usta.de>)
	id 1wtPiO-000ZMc-5G; Mon, 10 Aug 2026 15:06:52 +0200
Received: from isnote.usta.de ([87.173.127.248])
	by imap-2.asta.kit.edu with ESMTPSA
	id QmwSJevMeWqm1RUA4A1LTA
	(envelope-from <schwarze@usta.de>); Mon, 10 Aug 2026 15:06:51 +0200
Date: Mon, 10 Aug 2026 15:06:50 +0200
From: Ingo Schwarze <schwarze@usta.de>
To: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, enh@google.com
Cc: enh <enh@google.com>,
	"G. Branden Robinson" <g.branden.robinson@gmail.com>,
	Alejandro Colomar <alx@kernel.org>,
	Collin Funk <collin.funk1@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
	bug-gnulib@gnu.org, libc-alpha@sourceware.org, groff@gnu.org
Subject: Re: on project management
Message-ID: <annM6oGYVgXByI5i@isnote.usta.de>
References: <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <20260803160902.5edjmpxaqr5uudbu@illithid>
 <CAJgzZorzA1f+KNAj0m56nXxoKywY_pCj2pX3Rg-CgP1P8TnZuA@mail.gmail.com>
 <86a4r2oqqz.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a4r2oqqz.fsf@aarsen.me>

Hello,

Arsen Arsenovic wrote on Mon, Aug 03, 2026 at 11:09:40PM +0200:
> enh <enh@google.com> writes:

>> the crazy part is that it was an _empty_ file until i made it just
>> #include <string.h>:
>> https://android-review.googlesource.com/c/platform/bionic/+/52171
>>
>> i can't explain that (it was originally checked in as an empty file,
>> so the history is no help).
>>
>> i _can_ explain why i made it match glibc rather than just deleting it
>> though: i didn't want to break existing code that was [harmlessly]
>> including an empty file, and i wanted to increase the amount of the
>> code from other libcs that would "just work". (and note that ios/macos
>> have a <memory.h> that's just a #include <string.h> too.)

> I think this partially confirms my suspicion earlier, that the only
> reason anyone ever included <memory.h> is because on some system stuff
> they wanted was not in <string.h> (but was only in the latter on some).
> So the former tends to be included only when the latter is also, to
> cover both cases.

I think i can improve this understanding by providing some historical
facts.  While <memory.h> almost certainly did not originate in BSD,
BSD history can still provide some hints how it came to be.

The earliest instance of <memory.h> i'm able to find in my private
archives of free historical source code archives is this
file include/memory.h from 4.3 BSD:

  /*
   * Copyright (c) 1985 Regents of the University of California.
   * All rights reserved.  The Berkeley software License Agreement
   * specifies the terms and conditions for redistribution.
   *
   *      @(#)memory.h    5.1 (Berkeley) 85/08/05
   */

  /*
   * Definitions of the Sys5 compat memory manipulation routines
   */

  extern char *memccpy();
  extern char *memchr();
  extern int memcmp();
  extern char *memcpy();
  extern char *memset();

[I must admit the Copyright & license header feels bogus to me.
 According to the SCCS logs, the person who originally checked
 in this file into version control was Robert Elz <kre@>.
 It seems highly unlikely that Robert - or any other UCB
 employee or associate - wrote these function prototypes.
 On top of that, function prototypes are not usually considered
 Copyrightable, and even if they were in principle, there is
 barely any copyrightable text here.
 Then again, none of this matters much, if you put a Copyright
 notice on an empty or almost empty file that contains nothing
 Copyrightable, the notice simply means nothing.]


This comment appears to claim that <memory.h> along with these five
functions came from AT&T System V UNIX, almost half a decade before
ANSI C 89 standardized them to live in <string.h>.

While, as others observed, many systems still contain <memory.h>
as a thin compatibility wrapper around <string.h>, having it doesn't
seem particularly important at this point.  Who wants to really
maintain compatibility with System V based systems that are about
35 to 40 years old and significantly predate ANSI C?

That said, i believe the reason most systems did not outright
delete <memory.h> is that i fail to see an easy argument what
benefit exactly that might provide, apart from general cleanliness.

> I'd confirm definitely by getting the list of files from Debian
> codesearch that include one and the other and comparing it, but I wasn't
> able to figure out how to do that.

I fear you may be looking at entirely the wrong era.
The Debian project can be considered way too newfangled to provide
any substantial insight here.  :-D

Yours,
  Ingo
