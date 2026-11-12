Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.156.224.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494755;
	b=2Bw+dDbVUOzhFgmNEhLdfPcSQ1/MB+YMH3oBhckGHhTtkkhUQilyPWlamATJB9xlXATd
	 rO9qhgsbPIUNSzCVgyxuYue3p71XbOA1O5Yb/4tJ9FFxyAqlGdfVf4IpywyUeNDAe//x1
	 8ll6PFXiu6c79A0TzL/pNumkztFrf90EnnJVbR+ShQ++1qvYGihPSANHJNg1xknDnqDFM
	 6DHApwwiw7XhOxJVZrrp/+UQhFCFqZIiZkVjBMQlEWIajKeb+/BI70MwvgWZLq5tNszdX
	 wnDotd3dcfN6ofjvHG4bsVUCeyG5LZSlC0dU+8BhdmWLDLj8gUFFuIflGnDiR4pJKCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494755;
	h=DMARC-Filter:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=UUMXjddw9kgEgqzyM65B7PKgeni2Lydz3caNAj9nA28=;
	b=IPxmc6o2Z6Kgk3Ggl6gY/no61SL8YCSPDHGi3MMYjr+Eac/DC6RPx1/5j55OCkluXP9B
	 kLwym4Iyllmmu/S0wcFmqnTYqjYj1tDE80Bdy41LSaaK5QiWzPIdhXPxoqdNnjooL6/Ma
	 V4el1o4n+AFMP+OHyD6KPJVxSRxQEYUeoaa4BBZGg9p2K3lycg7XXaVEqw3SS2+kEoLUt
	 Vj5GRjxZBP2ajN95ZNkmFPRqIsPNypJjb34+Pd7xaFxpXEa7YAdJF9NBDodFZGJB8tB40
	 6gpdnLrTRGO6YZjk9nfyCeGaacodWuiW7ew8KUbkBCgcGssIzBFzxMVA02pwHgh5Acw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=libc.org;
	spf=pass smtp.mailfrom=aerifal.cx;
	arc=none smtp.remote-ip=104.156.224.86
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-ECDSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F17606A31C
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 14:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F17606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Thu, 12 Nov 2026 09:45:53 -0500
From: Rich Felker <dalias@libc.org>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Walter Harms <wharms@bfs.de>,
	"linux-man@vger.kernel.org" <linux-man@vger.kernel.org>,
	libc-alpha@sourceware.org, musl@lists.openwall.com,
	~hallyn/shadow@lists.sr.ht
Subject: Re: [musl] Re: RFC: how to document musl-crypt failure ?
Message-ID: <20261112144550.GJ5716@brightrain.aerifal.cx>
References: <ad592d57700043c181886d95b2564e6b@bfs.de>
 <avGP3ZsVvX1mOirn@debian>
 <20261109131732.GM23438@brightrain.aerifal.cx>
 <avHqKtsxQQDkZX90@devuan>
 <avXOTLv8xJqyy5qh@devuan>
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
In-Reply-To: <avXOTLv8xJqyy5qh@devuan>
User-Agent: Mutt/1.9.5 (2018-04-13)

On Thu, Nov 12, 2026 at 03:37:11PM +0100, Alejandro Colomar wrote:
> Hi Rich,
> 
> > Date: 2026-11-09 16:51:02+0100
> > From: Alejandro Colomar <alx+linux-man@kernel.org>
> >
> [...]
> > > I would not document future behavior, and would document existing
> > > behavior only as an implementation detail, not an application-facing
> > > contract. The only contract with the application is that crypt(P,H)
> > > will never return a string identical to H except on valid password (in
> > > the absence of theoretical hash collisions) regardless of the validity
> > > of P and H.
> > 
> > Okay.  Thank you very much!  I'll work on a patch, and CC you when it's
> > ready.
> 
> What do you think of this?
> 
> 	diff --git i/man/man3/crypt.3 w/man/man3/crypt.3
> 	index e0a74b955b3e..4a75fac2f627 100644
> 	--- i/man/man3/crypt.3
> 	+++ w/man/man3/crypt.3
> 	@@ -259,6 +259,28 @@ .SS salt
> 	 is equal to
> 	 .I xxx
> 	 otherwise.
> 	+.SH EXAMPLES
> 	+When comparing a password against an existing hash,
> 	+that hash (and no other) must be passed as
> 	+.IR salt .
> 	+If and only if
> 	+.I salt
> 	+compares equal
> 	+(see
> 	+.BR streq (3))
> 	+to the returned string,
> 	+the password matches the existing hash specified by
> 	+.IR salt .
> 	+.P
> 	+.in +4n
> 	+.EX
> 	+if (streq(H, crypt(P, H))) {
> 	+       // good password
> 	+} else {
> 	+       // bad password
> 	+}
> 	+.EE
> 	+.in
> 	 .SH SEE ALSO
> 	 .BR login (1),
> 	 .BR passwd (1),
> 
> which reads as:
> 
> 	--- HEAD:man/man3/crypt.3
> 	+++ ./man/man3/crypt.3
> 	@@ -152,6 +152,19 @@ NOTES
> 	      than 1000, 999999999 if xxx is greater than 999999999, and
> 	      is equal to xxx otherwise.
> 	 
> 	+EXAMPLES
> 	+     When comparing a password against an existing hash, that
> 	+     hash (and no other) must be passed as salt.  If and only
> 	+     if salt compares equal (see streq(3)) to the returned
> 	+     string, the password matches the existing hash specified
> 	+     by salt.
> 	+
> 	+         if (streq(H, crypt(P, H))) {
> 	+              // good password
> 	+         } else {
> 	+              // bad password
> 	+         }
> 	+
> 	 SEE ALSO
> 	      login(1), passwd(1), encrypt(3), getpass(3), passwd(5)

Missing null return check.

Rich
