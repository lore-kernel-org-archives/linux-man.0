Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.156.224.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491705;
	b=ApkFbSvtVg574DQagPhnAl0u4CiLfNgnL+P4zkXwOJDJBdMMCsfqYLtz6vFvGhQjoCZ+
	 dinCm9z22yQK/ou6IWxDVIUG0Gx6B1o9FGMiDa0NCrEgUdnpXlv/RidwKTjCJr80om/cJ
	 al6Hi5KgqO7P6qs6K8PzQCLtE5XtZNakLKI6yUuA0awm6ELtEvi8C+Z20aEZ327C1+hgO
	 QnCO8H8IiuL0It+h3E/eFqdzoIOXDG1FtPEE5ksCYNCUUSPaIOdUHMcsttVvRKgRWf5bs
	 auiiHofUKUOb/A5bchm7vclhMwlyAT/wHVibVvRAj7eNbqUP23ANpIxsQ4tq+XTw8iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491705;
	h=DMARC-Filter:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=ZZdSWqmFUBOswlKKPOU06UIyTy6CmWOqROmf/AsqhyI=;
	b=PoylFVm5tTaocVdDzV56TXcRUBhQq4oQwV0r3wcBShtPtC0Tw0Yn5LHHk0P17vVDPEJL
	 JrZpCGReUVHiFdlEcqpt5/RdJqUot3XYPb9UHZH1vKP89C0BPNQXd80TYrVHDqP5xLTHS
	 QQSJsd0Q12Tq8302OMScg7rPzel+KIv73MP/pzU7VQoZ0xxQsBs1jnMCoI1WQe6Rgye43
	 OxuAV7hMsSwHYs/o054p6HrJvgbDh0avGYDYC+CdcKCagwuJ8iosSL8ZAPf6KyVmnuiLF
	 CbQh1nA04wnyfs0vQ0oeTcba2SqzvQ1PwWxNhGZm7a0uv6kQJLj18Ce6gAPqqBlT1uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=libc.org;
	spf=pass smtp.mailfrom=aerifal.cx;
	arc=none smtp.remote-ip=104.156.224.86
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-ECDSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726CB606A31C
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 13:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 726CB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Thu, 12 Nov 2026 08:55:01 -0500
From: Rich Felker <dalias@libc.org>
To: Vincent Lefevre <vincent@vinc17.net>,
	Alejandro Colomar <alx+linux-man@kernel.org>,
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <20261112135501.GI5716@brightrain.aerifal.cx>
References: <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112131737.GB1951@disset.lip.ens-lyon.fr>
 <avW9PMcZ6Hm26hl3@devuan>
 <20261112134516.GD1951@disset.lip.ens-lyon.fr>
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
In-Reply-To: <20261112134516.GD1951@disset.lip.ens-lyon.fr>
User-Agent: Mutt/1.9.5 (2018-04-13)

On Thu, Nov 12, 2026 at 02:45:16PM +0100, Vincent Lefevre wrote:
> On 2026-11-12 14:23:08 +0100, Alejandro Colomar wrote:
> > Hmm, yeah, I didn't intend to say POSIX is bad; I just wanted to let
> > people know that POSIX is irrelevant about crypt(3) these days (as Rich
> > said).  Perhaps:
> > 
> > 	The POSIX specification is significantly outdated,
> > 	and all systems extend it significantly.
> > 
> > What do you think?
> 
> OK for me.

It's not "outdated". It just does not mandate particular algorithms
but leaves these choices up to the implementation. As usual the scope
of POSIX is what applications need to know to interface with the
system, not administrative policy. This is why POSIX doesn't define
things like mount, how init works, etc. either. They are in the scope
of things that applications generally don't have to care about; only
system components do.

I do think there are changes to the POSIX crypt spec that could make
it better, like defining more errors and specifying explicitly that
salts beginning with '$' and '_' select additional
implementation-defined algorithms and settings, etc. But overall the
issue here is just a difference in expectation, not anything
inherently bad.

Rich
