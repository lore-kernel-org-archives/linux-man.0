Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.156.224.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794454665;
	b=zPGDjSNNrsybRfsz+uBnB3L6FbS2GNzeAFXHMoriqhFas6cZp4cmw/lNpM4APIx5sIAa
	 0ojhRf/cgf6q5GckJ169xfb9OVbBwWLNlVz9dubDSGDBQEH1kYqd5j3UPcTGkey7rynHs
	 fXs5Rt+vdzmCkdfwtL728jLAq2X7EF0QsHA4bZ1zBZBnWRGp7K8oAnJcBvnarpKXeApsY
	 4HBDZPN7nsaRS2UpPjH46N2RtTAyQ88pb55jdxD2d1ph2AG4vrE5mPXv/yg+fW59r8uFM
	 gcT+JJ2LFO7Xou3XZZ0NqyfSv/L+bXEJ9apAkaSIAlqYsIAbgwb/4z0GGIeg6t0vSnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454665;
	h=DMARC-Filter:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=T0oXi7fMQ3fiWpJUw2/U/VK2NYay3Dg4j4MEiM4XP4I=;
	b=nkr9B/46t5bSD0tc8O4lsZExZqiJ5xUrPAA0eK9GBFrgH2VmDQZTwJF12/Xrg7f67Brk
	 BrPxVGRMcRQWSWbmZAR/sCmOffwxu1SGJwAoQgT2cBQFyZu5wIRCyi9UvL7Z4Clpfm4hF
	 vrorx0SsdMOoRUyFSkav85oL9yEocimRdNl13J3PT9FWmOeweQtNia+PJbligKX/WsVRO
	 /GZJzIbbbH1S41Jss6/i5ACH/pak+z7mwbsklS1Ijz3wjouzu6mkBJ6+U2OrtgAAzNq7m
	 jvJkh1NsRV8avKAb10fZ4GDI4GTCScq584YRd/1r0IVkhwWR4FyrHg/D0JTlcbxK3KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=libc.org;
	spf=pass smtp.mailfrom=aerifal.cx;
	arc=none smtp.remote-ip=104.156.224.86
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-ECDSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6415E606A32E
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 03:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6415E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Wed, 11 Nov 2026 22:37:42 -0500
From: Rich Felker <dalias@libc.org>
To: Vincent Lefevre <vincent@vinc17.net>,
	Alejandro Colomar <alx+linux-man@kernel.org>,
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <20261112033742.GG5716@brightrain.aerifal.cx>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
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
In-Reply-To: <20261112032929.GB160897@qaa.vinc17.org>
User-Agent: Mutt/1.9.5 (2018-04-13)

On Thu, Nov 12, 2026 at 04:29:29AM +0100, Vincent Lefevre wrote:
> On 2026-11-11 21:53:39 -0500, Rich Felker wrote:
> > That's the whole reason '$' was chosen: POSIX doesn't define the
> > behavior (since a "shall" is violated) so the implementation is free
> > to define a behavior here. The behaviors for the portable base64
> > character set documented in POSIX uses only 2 characters as salt
> > (insufficient) and the common agreed-upon definition for how they are
> > used is as salt for the classic DES-based password hash.
> 
> But the behavior is completely out of scope of POSIX.

Yes. And that's allowed because POSIX does not define the behavior but
leaves it undefined. I'm not sure if you're objecting to something
here or questioning how it should be documented or something else..?

Rich
