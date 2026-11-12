Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=155.133.131.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794454173;
	b=lGmGDdOSlFi4IZjRMNrawDLsf/WYoaGSAvn/IJGaMSrEHiDwMQiY3pulGQCQGpO2gSev
	 rhgB225weQq+jnITh8j3J9VPwXOJnykR1qNhgPC8cziFRzO6P+1WQflTWwfpgntEaiJPE
	 djXrNJpFkHOF93n7xJx8/odyvip8BjaApSH+YF/9uQx4eo9zxfBkVZ6Dns8ybDo8byls4
	 E4nMEI3oIqB9O8iPZj6Tun5brduOhDvftrMdiU0qjZ0kQDr1IzUxv69tjfIpTwRd81a2W
	 FeeJ7vmUdeXnpgeU724MrJASvf94votIn0SBdWalCkiqaAo9qmJ77ltjMsnOlKEMMJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454173;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Mailer-Info:User-Agent;
	bh=bXsJa+AU5QKDigpqvLRLFHemFoDoXU6tvWEJWzR6rj8=;
	b=Ty/N9LCW9jvUA9qEeKsrhi3k9m+Kv74rN8iyxVpat6VTQzcKj1LA0e1J4Vn3in6r33tJ
	 mWKFagsGGl7ws6CT6qAssovKoByTeTK6gknY7ivnpnLIkWMEhGR3kxwmIBH9jHYcaq+JR
	 abJIAc1SnSA1s6vU67VgQvqt6Vri+EQlI9xbgDRXjjmaa3h2MQxMTIUaeGyh5g7PnCqht
	 mMzUa42hU2oDb4+v7tBEh14Sntuo8mtzGELMT0/Tc5H37BJoomqxDfUlL5PdbCcdJ3uvV
	 2sLT6Ln1V0gw6EH6+XmNXahhX87eTQ2i37ow1N0OTfT41ygUr5RfIxNdJmtkt6VjA9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=vinc17.net;
	spf=pass smtp.mailfrom=vinc17.net;
	arc=none smtp.remote-ip=155.133.131.76
Received: from joooj.vinc17.net (joooj.vinc17.net [155.133.131.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB632606A31C
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 03:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB632606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinc17.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinc17.net
Received: from smtp-qaa.vinc17.net (2a02-8424-9d96-6301-26d0-0c32-b954-99b1.rev.sfr.net [IPv6:2a02:8424:9d96:6301:26d0:c32:b954:99b1])
	by joooj.vinc17.net (Postfix) with ESMTPSA id CD5B4460;
	Thu, 12 Nov 2026 04:29:30 +0100 (CET)
Received: by qaa.vinc17.org (Postfix, from userid 1000)
	id 80FD1CA0432; Thu, 12 Nov 2026 04:29:29 +0100 (CET)
Date: Thu, 12 Nov 2026 04:29:29 +0100
From: Vincent Lefevre <vincent@vinc17.net>
To: Rich Felker <dalias@libc.org>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>,
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [PATCH v1] man/man3/crypt.3: These functions accept many
 algorithms, not only DES
Message-ID: <20261112032929.GB160897@qaa.vinc17.org>
Mail-Followup-To: Vincent Lefevre <vincent@vinc17.net>,
	Rich Felker <dalias@libc.org>,
	Alejandro Colomar <alx+linux-man@kernel.org>,
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112025339.GM26138@brightrain.aerifal.cx>
X-Mailer-Info: https://www.vinc17.net/mutt/
User-Agent: Mutt/2.4.3+67 (b2844dd7) vl-188789 (2026-11-11)

On 2026-11-11 21:53:39 -0500, Rich Felker wrote:
> That's the whole reason '$' was chosen: POSIX doesn't define the
> behavior (since a "shall" is violated) so the implementation is free
> to define a behavior here. The behaviors for the portable base64
> character set documented in POSIX uses only 2 characters as salt
> (insufficient) and the common agreed-upon definition for how they are
> used is as salt for the classic DES-based password hash.

But the behavior is completely out of scope of POSIX.

-- 
Vincent Lefèvre <vincent@vinc17.net> - Web: <https://www.vinc17.net/>
100% accessible validated (X)HTML - Blog: <https://www.vinc17.net/blog/>
Work: CR INRIA - computer arithmetic / Pascaline project (LIP, ENS-Lyon)
