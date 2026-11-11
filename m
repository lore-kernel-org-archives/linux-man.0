Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.156.224.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794431602;
	b=CRr3dFGQD+XI3fNRUb752JP+lV/wwUIfBjoIAUrmI7im7NBc15uSQvCgI7F236VZAs1E
	 CCVLbvluNs86EXExQxivnb9efFmApxD8UquKgvDVsLNYrOD5FHX2mqtPam8gkR72en+iY
	 sCNGPKLSUlFR4BOg2PePRu03LXOhxmJtXcds3shs0R+Dy6NyNNMiB2Ri9aT+8SaLxg4/3
	 BoxTB1Gs/k5NRkB9EYMcLo71dyOeTiy5xI02qtUjR2u/cwHXkQNyWdffv/VAs8T0iog4Y
	 n1qdv9e3rduQvj1Up/U3OZ2TaC+nnUX1yVyXGSUle1onEIybEpPkStZ/EbBgxEZJQHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794431602;
	h=DMARC-Filter:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=WGTo3D493Db89ZSfkLKPParpQafkOfDYlVJ/8Ed9XMk=;
	b=q55KiPTxBDSvQ/MIj5DbjTyL1aC0impCNVBl/pKmUZJLqLWVm9Ds5muvxccXWUjx7yM+
	 eCgkOv1uZrvGmjpb5MMTLuA5XbtSqD6oSHoEyMV6Ki4kTQZdpcCHe+eFNucUU9K1hyVIA
	 XJ8AE80XqmCObx6wu5lgW/gZtWRNhLX3w9O/2JACfzpI48uWWURGsYW7lrQzyKzUu3E/x
	 R2e9QliJ1+0cKX2wifXZlg69ajFFev/FBHZz0iJPNPukFuaSTF80uqm9PQBkO/D6AnP7Y
	 lbz6RTQwWtYay48u5qJdw2+Apkivh/QFA3WwpzFfPApTEaJsw8CXdL8ITtKILQsFnYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=libc.org;
	spf=pass smtp.mailfrom=aerifal.cx;
	arc=none smtp.remote-ip=104.156.224.86
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-ECDSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8BF606A326
	for <linux-man@vger.kernel.org>; Wed, 11 Nov 2026 21:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C8BF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Wed, 11 Nov 2026 16:13:13 -0500
From: Rich Felker <dalias@libc.org>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>,
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <20261111211313.GF5716@brightrain.aerifal.cx>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <avSERDjw/CeqN60U@hallyn.com>
 <avS4ybx_EfRvGsw1@devuan>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avS4ybx_EfRvGsw1@devuan>
User-Agent: Mutt/1.9.5 (2018-04-13)

On Wed, Nov 11, 2026 at 07:55:01PM +0100, Alejandro Colomar wrote:
> Hi Serge,
> 
> > Date: 2026-11-11 09:05:40-0600
> > From: "Serge E. Hallyn" <serge@hallyn.com>
> >
> [...]
> > > -     salt is a two‐character string chosen from the set
> > > -     [a-zA-Z0-9./].  This string is used to perturb the algo‐
> > > -     rithm in one of 4096 different ways.
> > > -
> > > -     By taking the lowest 7 bits of each of the first eight
> > > -     characters of the key, a 56‐bit key is obtained.  This
> > > -     56‐bit key is used to encrypt repeatedly a constant string
> > > -     (usually a string consisting of all zeros).  The returned
> > > -     value points to the hashed password, a series of 13 print‐
> > > -     able ASCII characters (the first two characters represent
> > > -     the salt itself).  The return value points to static data
> > > -     whose content is overwritten by each call.
> > > -
> > > -     Warning: the key space consists of 2**56 equal 7.2e16 pos‐
> > > -     sible values.  Exhaustive searches of this key space are
> > > -     possible using massively parallel computers.  Software,
> > > -     such as crack(1), is available which will search the por‐
> > > -     tion of this key space that is generally used by humans
> > > -     for passwords.  Hence, password selection should, at mini‐
> > > -     mum, avoid common words and names.  The use of a passwd(1)
> > > -     program that checks for crackable passwords during the se‐
> > > -     lection process is recommended.
> > > -
> > > -     The DES algorithm itself has a few quirks which make the
> > > -     use of the crypt() interface a very poor choice for any‐
> > > -     thing other than password authentication.  If you are
> > > -     planning on using the crypt() interface for a cryptography
> > > -     project, don’t do it: get a good book on encryption and
> > > -     one of the widely available DES libraries.
> > > +     salt is a string used for determining the hasing algorithm
> > 
> > typo: hashing
> 
> Thanks!  Fixed.
> 
> > > +     (possibly including parameters).  It is also used to per‐
> > > +     turb the algorithm.
> 
> BTW, I suspect the salt is not used for perturbing the algorithm
> anymore.  From musl's source code, at least for SHA-512, I _think_ it's
> not reading past the third '$', and thus it's not reading any random-ish
> bytes.
> 
> Should I drop the second sentence?

I'm not sure where you're getting this from. All implementations of
the same password hash function need to produce the same result, or
user credentials would not be portable between different ones. And a
password hash that does not use any salt would not be fit for purpose.

In musl's crypt_sha512.c, the salt is isolated from the setting string
in lines 262-266 and used in the sha512_update operations that follow.

Rich
