Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=140.77.12.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489459;
	b=2s/m2N8xk3Q+CngZdtgAKUZsZlrFWxodE2NiA/htIbiEY5l72omqJORSb+aCNU5wZT4j
	 Y2KpXiIRrKnbTffJ/HBnB0TvEQC8iiRK9h56mhTbjHkgaKNHFcBpT4LFIFaRRirx2juaW
	 KD6NLzS592XCwBzl+Re9T9HEaJDIM2ij+EQX81PpPiCW2KLxYqSg2HZHPLCNWJY0RW/mx
	 Y1uicsiIZeQU7a8xrjIebVfAtZlQFK88M9zNXYzcPZyYHLI3qRyE6CrfLHemHfxLvpaMx
	 cQBKUPqhiMPngt3MIVZ7QlOG0ZtxIT3VjvID80RVuZ72eTrARABFWg4pBqQeaLmCV6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489459;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Mailer-Info:User-Agent;
	bh=D//aUl2EL7s0PsndH4knWSQKrowGtaCb6Fv/YXJBj08=;
	b=NZKM2/gEb1x8CtgHp91Glt1Zm/CMEBUY7Kg6VStYUCu012bt4i+JGW4bBTKin+XeDvZr
	 Znhz8nQeAGOgoR/Vyh0Gs3zynvi3NwL6AJcv5iLYDQ/RqxKqqUdeHnsuBRCSLpgzsEsL9
	 zaoxeHDSBkySuydGjvJDHShUbBdzHFXRZkZi8g5ym9OPt584qWd8wmXFSNQZhE2PbRq3D
	 +0VNmEf5Qu/eBuJNR/kVNmp3Bw+lfXSbfNoobsTd/o1abLI61c3Vs3zN5jtacXN1gMN2P
	 rGI9EnhKjSwNUEnP3dHy7YWo4TEamb8SlMgmNGPW8NahAFHa0AWFv7oy+jn6JYQO11w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=vinc17.net;
	spf=pass smtp.mailfrom=vinc17.net;
	arc=none smtp.remote-ip=140.77.12.53
Received: from disset.lip.ens-lyon.fr (disset.lip.ens-lyon.fr [140.77.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D3F606A321
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 13:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85D3F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinc17.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinc17.net
Received: by disset.lip.ens-lyon.fr (Postfix, from userid 1000)
	id 0BD1B2120126; Thu, 12 Nov 2026 14:17:37 +0100 (CET)
Date: Thu, 12 Nov 2026 14:17:37 +0100
From: Vincent Lefevre <vincent@vinc17.net>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Rich Felker <dalias@libc.org>, Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org, libc-alpha@sourceware.org,
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht,
	musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <20261112131737.GB1951@disset.lip.ens-lyon.fr>
Mail-Followup-To: Vincent Lefevre <vincent@vinc17.net>,
	Alejandro Colomar <alx+linux-man@kernel.org>,
	Rich Felker <dalias@libc.org>, Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org, libc-alpha@sourceware.org,
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht,
	musl@lists.openwall.com
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avWwXGpq1OLtNDSV@devuan>
X-Mailer-Info: https://www.vinc17.net/mutt/
User-Agent: Mutt/2.4.3+67 (b2844dd7) vl-188789 (2026-11-11)

On 2026-11-12 13:27:13 +0100, Alejandro Colomar wrote:
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
> 	 .SH STANDARDS
> 	 .TP
> 	 .BR crypt ()

The API was useful in the past, but things have evolved.
Just say that all systems extend the POSIX specification
significantly.

-- 
Vincent Lefèvre <vincent@vinc17.net> - Web: <https://www.vinc17.net/>
100% accessible validated (X)HTML - Blog: <https://www.vinc17.net/blog/>
Work: CR INRIA - computer arithmetic / Pascaline project (LIP, ENS-Lyon)
