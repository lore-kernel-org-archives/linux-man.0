Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.156.224.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232619;
	b=a9YCUqHf9+YBbiH8nsK/qG/o5xEh3nnxgoHUpo1p/lp5ZfUPi+UVHu161Q3xWjrnw6mW
	 wS+R7dKdv/i8en5IXGvPCZPeqsRjARzkgsEEeclOFYNxxYR4PniA0Pn54u4NrBOl6Jqsu
	 MbpgPguYZybd/ZerbLa2AoxA5/0EU6c8ck+ck7Vvy9/KiFpA4/Q5rMbgcQyCOyu7lzljU
	 qk3xg6daDFPC9rgGl0pdFBg9B19wbjcboJcYi35/lXTgqR2WAEaLlO2eyboZMC5fmn+KY
	 BeJPeqzr6D5E8xjpDi/rOKp6J/RC5iaCv3if4L7aSeHWG4cMReE68pCiMcW16dCVzDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232619;
	h=DMARC-Filter:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=I2MeqqOA8WY6y0Pz5pWQ/3JQjsVozKCc6mRkbDbVIok=;
	b=afoxJa6nvCHFdKHG5jSMyCObs/x1yqnjJnKebxfJfGEtPBRJcmPwkH/+j1ndQWn5hhRl
	 WH9ei6U2Qv7ErlEhg7eyCx9WqV91Hygvi/4h0Y7ME8WwQd8xpZHgVXugtbIgHyVxQCZof
	 PbYS6NyfQIVo4XXrGnw7pEdUqbWFRT8MjUyFIwRqFeIWFEcaf+P/La4GAfIsCh8xumA9V
	 6oO6iFbeSC/yI8HIw4cavSkUgAQ7chdEzLraDSENMT+udtc5R/e27gMu16cD0XJwngqa5
	 g6MpTw2Lp2q0bAmgO4mm74xhxfVZqHrr6766wmvpZ1had4asMIof4U21yrAPyFUg+8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=libc.org;
	spf=pass smtp.mailfrom=aerifal.cx;
	arc=none smtp.remote-ip=104.156.224.86
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-ECDSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EA4606A31C
	for <linux-man@vger.kernel.org>; Mon,  9 Nov 2026 13:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9EA4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Mon, 9 Nov 2026 08:56:50 -0500
From: Rich Felker <dalias@libc.org>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Walter Harms <wharms@bfs.de>,
	"linux-man@vger.kernel.org" <linux-man@vger.kernel.org>,
	libc-alpha@sourceware.org, musl@lists.openwall.com,
	~hallyn/shadow@lists.sr.ht
Subject: Re: [musl] Re: RFC: how to document musl-crypt failure ?
Message-ID: <20261109131732.GM23438@brightrain.aerifal.cx>
References: <ad592d57700043c181886d95b2564e6b@bfs.de>
 <avGP3ZsVvX1mOirn@debian>
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
In-Reply-To: <avGP3ZsVvX1mOirn@debian>
User-Agent: Mutt/1.9.5 (2018-04-13)

On Mon, Nov 09, 2026 at 11:10:56AM +0100, Alejandro Colomar wrote:
> Hi Walter,
> 
> > Date: 2026-11-09 08:59:19+0000
> > From: Walter Harms <wharms@bfs.de>
> >
> > Hello list,
> > in case someone missed it: musl crypt() had an documented but
> > unexpected behavier that caused a lot of trouble.  See:
> > <https://news.ycombinator.com/item?id=50377221>   SSHHole.com  CVE-2026-123158
> 
> Indeed, I also wondered if we should change something in the
> documentation after it happened.  Unfortunately, the bug has been
> treated with some secrecy in the first days (reasonable), so I couldn't
> really understand what went wrong.
> 
> I've CCed Rich and also musl and glibc, since they probably want to
> comment.  I've also CCd shadow-utils.
> 
> > Normaly i would step over it but in this special case ... it would
> > like to start a discussion if we should mention that in a note to
> > crypt().
> 
> Thanks!
> 
> > Perhaps recommending an additional check for '*' ?  I am not sure but
> > this is a very special case ...
> 
> Rich, now that some time has passed and I guess everyone has a patched
> SSH, would you mind clarifying what happened, and what should be
> documented about it?

Have you seen my full analysis on the musl list?

https://www.openwall.com/lists/musl/2026/11/06/7

The correct usage of crypt for password authentication is asserting
that, if P is the candidate password and H is the account password
"hash", strcmp(crypt(P,H),H)==0. Allowing the user in without checking
that is potentially a password-authentication-bypass bug.

I put "hash" in quotation marks because it might not be an actual
hash; it can be a string chosen by the tooling or a user manually
editing the passwd/shadow files to produce something unmatchable. So
an application should not be making assumptions about its form.

Through at least 1.2.6, musl uses failure tokens "*" and "x" for cases
where the password should never match. These include unsupported
password length (for hash types that need to restrict it) and
unsupported or invalid setting/salt strings.

It isn't decided yet, but 1.2.7 will probably switch to using failure
tokens matching libxcrypt's ("*0" and "*1") which are slightly safer
against some forms of misuse by the caller. Future versions may drop
failure tokens entirely and switch to treating these conditions as
errors (returning null).

I would not document future behavior, and would document existing
behavior only as an implementation detail, not an application-facing
contract. The only contract with the application is that crypt(P,H)
will never return a string identical to H except on valid password (in
the absence of theoretical hash collisions) regardless of the validity
of P and H.

Rich
