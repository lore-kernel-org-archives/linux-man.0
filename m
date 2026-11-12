Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=81.7.13.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487283;
	b=Ra9zr+ti06l8SV/DETqpZVGdu0i1nQHHOAv+H8bpafM1dhDFZjVBeJEAnaoyLJPBL/XV
	 yz0UyOE8FtbG6+We0FpAIEtQYQf7OJrjR93xnsoD9P5q1wvtLGIL/7XGc45aoJX0dwTrB
	 FUFLt9+nQwaJ7C1HlR0ecb9kactcUptK72D2OmP3k0pZWKOPn3Z7+ble8AzniJ7n4I0Q8
	 uW59FzFjUGwOPaXG3npBntzS7H5InADoDawob+0QY0iCQIMUTzUcTscQ4hWZlZw8MBn1x
	 rVDUKYzVwewn/zFWUcyQvcnaS4kTbWLSXKPh1SuPFEuHEcGHDEkP8ivoTzf3fTvNVIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487283;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=mBpmoB7AU7yGuuioex7i00dpDi1Zev65uhIp295+27o=;
	b=0TQSTY5qZ9I46hacGI0zmRjK9SYLvhuOZC68ayj08teEjtR/VKWAz0hI+LqUb5OkKBDB
	 px3CjbzPILz4lp6Wdb6GVVqAQKCSa0c6sSSOnIEC8uQVlKQ5l3KrNI38NwvVZ33yzNchn
	 hXr4x7BmsnB8xOzcXSWDTdV2IqZFqBaZoNvWtoSmD0vKD8Dr2KpuWW8D1rSM6Kx2iUViA
	 ySiI2lxPZR3kCcrN8qlObQ8v8DKRnTeM7ka3neJ2/53FrEUYZjJ1y/KYMvWeVpjK7Y+uU
	 L+p6q1Y5Uvilup3EbaEciLRFsrR5EFtaMvKzL8rShqqUwDRANPFz9+goymg6MN/5PEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=port70.net;
	spf=pass smtp.mailfrom=port70.net;
	arc=none smtp.remote-ip=81.7.13.123
Received: from port70.net (port70.net [81.7.13.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D12606A321
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 12:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D12606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=port70.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=port70.net
Received: by port70.net (Postfix, from userid 1002)
	id 1F8F1ABEC0CC; Thu, 12 Nov 2026 13:41:14 +0100 (CET)
Date: Thu, 12 Nov 2026 13:41:14 +0100
From: Szabolcs Nagy <nsz@port70.net>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Rich Felker <dalias@libc.org>, Alejandro Colomar <alx@kernel.org>,
	Vincent Lefevre <vincent@vinc17.net>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <20261112124114.GB3542221@port70.net>
Mail-Followup-To: Alejandro Colomar <alx+linux-man@kernel.org>,
	Rich Felker <dalias@libc.org>, Alejandro Colomar <alx@kernel.org>,
	Vincent Lefevre <vincent@vinc17.net>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
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
In-Reply-To: <avWwXGpq1OLtNDSV@devuan>

* Alejandro Colomar <alx+linux-man@kernel.org> [2026-11-12 13:27:13 +0100]:
> How about something this (we can improve the wording)?
> 
> 	diff --git i/man/man3/crypt.3 w/man/man3/crypt.3
> 	index 524781d3c2a0..d579bc5394fb 100644
> 	--- i/man/man3/crypt.3
> 	+++ w/man/man3/crypt.3
> 	@@ -111,6 +111,9 @@ .SH ATTRIBUTES
> 	 .BR crypt_r ()
> 	 T}     Thread safety   MT-Safe
> 	 .TE
> 	+.SH VERSIONS
> 	+POSIX specifies a quite useless API,
> 	+and all systems extend it significantly.

please don't put nonsense into the official man pages.

your job is to document the interface contract including
implementation defined behaviour, not to judge the spec
and other systems.
