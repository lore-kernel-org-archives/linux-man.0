Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.156.224.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506940;
	b=z2i7y3sAlwBjdn484crJIO6y5UXoksGib0uQE5d/C03QYC4RxZNnzBNTO0sERnMR2KfY
	 mtu6RUMQa8HOlTi/u97mA9/HmUJE0w+oQd1+gMc20deNtGupFyvkJtMmJ9hZ6zh/aBC8Q
	 zBkGSY6Zw31rHDkv1PfwM7CXmhsjkagb9k2whKfJSNYjg0zBYex4LaJ5kOpanY5mCReza
	 q+MvIEDIArWl+xkGb/d4q27R4fxiiDoGwmNXeo/7kbBAQf6MnhVDZ8gQysrbzwR/pE+h2
	 JRgOACXja9bmc5A5y+j772X+khid72uGEhSpKtcuJgTY9jBbevA+4xrv8yhZWZ607Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506940;
	h=DMARC-Filter:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=3Gb2DWMEb/7SNu75FVK23990iF1cIRo1PVVqtwwHxKg=;
	b=LF/+9AhGUKEYQ/Rg/8zxZ7BbQsfsCwcoc54PqMESeFVhxIrmwpss8Q0UVhj0ZKG+h144
	 aQGHaupra79f6j7l8EXGU9OatoZpCF6c3w8LChXpJwPhqUSEP7urnJyTiqQ0eBdEScES5
	 14b2Ic28hSulhdq+CmcQn6yR9/LWyLa39uY6caowZ4LTYzkrL6hkdh7Ad2DdmAT3mFPXo
	 m4ZKBFpdIKC5oidEyjLHFNlVCzJAelphYZUVMqWu4Me4nXuBl6VPowXOLLZ2u8AnEHaKN
	 CVKl52Z1nbZuwegDXGpLoWCNZSx3mTLSXrDju1MJtUQllqIGWY7KPSXjFJkIZss/BFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=libc.org;
	spf=pass smtp.mailfrom=aerifal.cx;
	arc=none smtp.remote-ip=104.156.224.86
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-ECDSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57C9606A321
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 18:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57C9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Thu, 12 Nov 2026 13:08:52 -0500
From: Rich Felker <dalias@libc.org>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Vincent Lefevre <vincent@vinc17.net>,
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <20261112180852.GO5716@brightrain.aerifal.cx>
References: <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112131737.GB1951@disset.lip.ens-lyon.fr>
 <avW9PMcZ6Hm26hl3@devuan>
 <20261112134516.GD1951@disset.lip.ens-lyon.fr>
 <20261112135501.GI5716@brightrain.aerifal.cx>
 <avXFw_RUi0C4Ta1V@devuan>
 <20261112144349.GO26138@brightrain.aerifal.cx>
 <avXSmj4FXqnwZTwK@devuan>
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
In-Reply-To: <avXSmj4FXqnwZTwK@devuan>
User-Agent: Mutt/1.9.5 (2018-04-13)

On Thu, Nov 12, 2026 at 03:58:30PM +0100, Alejandro Colomar wrote:
> Hi Rich,
> 
> > Date: 2026-11-12 09:43:49-0500
> > From: Rich Felker <dalias@libc.org>
> >
> [...]
> > > But is the POSIX specification really useful for applications?
> > 
> > Yes. It tells you enough to validate a password for authentication
> > purposes:
> > 
> > 	const char *result = crypt(password, hash);
> > 	if (result && strcmp(result, hash)==0) {
> > 		/* password validated */
> > 	}
> 
> Is this really specified by POSIX?
> 
> Unless I'm missing something, I only see something about it in EXAMPLES,
> which is non-normative, and it doesn't even explain that this is the
> only way to do it correctly, but rather as a possible example.

Indeed it's what I'd call "underspecified", but it's clear from the
example that this is the intended usage.

> Notably,
> I don't find any text that says that passing a different hash as salt
> could potentially result in a hash that matches the stored hash.

The lack of specifying anything about whether that's possible doesn't
mean you can assume it's not.

> That is, I don't see any text (normative or non-normative) in the POSIX
> specification that implies this:
> 
>             When comparing a password against an existing hash, that
>             hash (and no other) must be passed as salt.  If and only
>             if salt compares equal (see streq(3)) to the returned
>             string, the password matches the existing hash specified
>             by salt.
> 
> The example is useful, but I'd say it's not enough.  I think the example
> should contain wording like that one above (which we're discussing in
> the other thread for the manual page).

It says that the hash is a function of the password and the salt
characters. So obviously, if the password is correct,
strcmp(hash,crypt(pass,hash))==0. Whether it's nonzero for other
values of pass depends on the degree to which the hash is
collision-free, which is of course implementation-defined but needs to
be good in order to have any reasonable security properties.

Whether another hash can be passed to setting without risking
collisions is just not something that's specified, so you can't assume
it. It should be noted that the APPLICATION USAGE text mentions:

    "Several implementations offer extensions via characters outside
    of the set specified for the salt argument for specifying
    alternative algorithms; while not portable, these extensions may
    offer better security."

You do not need a specification to tell you that passing the wrong
hash as setting is unsafe. You only need to look at the scope of
implementation choices allowed and consider whether they would admit
anything that would make it unsafe. And they do.


As an aside, can we please remove the language using nonstandard
gnulib functions (streq) that are not part of any standard library?
This is not doing anyone a service. Experienced C programmers will
understand it as essentially pseudocode and write something correct
themselves, but novices will be confused why their code doesn't work.
I assume you have some sort of thing against strcmp, but that kind of
polemic treatment does not belong in descriptive documentation.

Rich
