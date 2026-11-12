Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=140.77.12.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489355;
	b=G6rMaDUoETRjliHJihz5xeWz427IDQ+ztlvBCTrNHO/RMNvbuyLuLNO2CeEBMMNVNiqW
	 iF3ql22JEqiIpijUFxYCMq/8EIomZJrMCEEhY/pLLGLrL8a2h4LPKVEEFJSjujLqrK56P
	 7acIxJgyc3UMtlEGuc73xyC2y5zOqT1MJPi56PCxXmBTyPtL34awMncILDjsvzHkPQ2J+
	 Oz8YBxI7cblyfziWQ1OE6k+cwgKoZROB1Auo76MOWrpv5ULlHiDOyduTuDG2zH2Cboz2Y
	 2HVzcKnn5llSAC4UfW0FfM1B/wCQFa2t/UX0Nf/K/938aCMLhdPjbc/EhBYJBMCVu7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489355;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Mailer-Info:User-Agent;
	bh=XEeQC+itUECr69poXDF5NDNA/f93fOgmZIwGg8+VfCA=;
	b=V9gZczY/aJiq3EkRKaJKE0GjORKAKrDfGo6nG7sisRBSilEot7kD6au48eYNxkd8Mn0R
	 wXybZQEBlL8l1KLXm8IqJpeN4tSYt93P8jijtftw4nqlmbyDHhmMZw1AM1D1cfkaaD9jm
	 LbgudS/YRnL06ie3AOrPvbF6Yb69PuPISPEHCjYhzKLnetGQ1g2M+L3SUxRnSCGkOQkrv
	 gDtPuuPospM16HywC4b7TP96IB4Qgsp0uzdBMQB1vsXY4IiViYipm6CrnOAt8Wj37E2c/
	 c/tyS379JyySyMvSbaPTGeYFaN7hIIYT16IvH844C+JbSAv/O6jRkyk55gKvP7XKEsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=vinc17.net;
	spf=pass smtp.mailfrom=vinc17.net;
	arc=none smtp.remote-ip=140.77.12.53
Received: from disset.lip.ens-lyon.fr (disset.lip.ens-lyon.fr [140.77.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7BD606A330
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 13:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE7BD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinc17.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinc17.net
Received: by disset.lip.ens-lyon.fr (Postfix, from userid 1000)
	id 99A2B21200B9; Thu, 12 Nov 2026 14:15:47 +0100 (CET)
Date: Thu, 12 Nov 2026 14:15:47 +0100
From: Vincent Lefevre <vincent@vinc17.net>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Alejandro Colomar <alx@kernel.org>, Rich Felker <dalias@libc.org>,
	linux-man@vger.kernel.org, libc-alpha@sourceware.org,
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht,
	musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <20261112131547.GA1951@disset.lip.ens-lyon.fr>
Mail-Followup-To: Vincent Lefevre <vincent@vinc17.net>,
	Alejandro Colomar <alx+linux-man@kernel.org>,
	Alejandro Colomar <alx@kernel.org>, Rich Felker <dalias@libc.org>,
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
 <20261112114033.GA167321@cventin.lip.ens-lyon.fr>
 <avWo_yv5znRjCPvO@devuan>
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
In-Reply-To: <avWo_yv5znRjCPvO@devuan>
X-Mailer-Info: https://www.vinc17.net/mutt/
User-Agent: Mutt/2.4.3+67 (b2844dd7) vl-188789 (2026-11-11)

On 2026-11-12 13:08:12 +0100, Alejandro Colomar wrote:
> > This means that when "$" is supported by some implementation,
> > the interpretation of the return value may be different from
> > what POSIX specifies.
> 
> Kind of.  They better don't deviate from it in non-confirming ways;
> one could argue that musl's "x" return value is indeed such a
> non-conforming return value, and a NULL return value would be better
> (both more conforming and safer).

This is more complex. The issue is that in the past, crypt() seemed to
have been designed so that it could not fail (except in the case where
it wasn't providing any implementation, i.e. it was always failing),
so that applications did not expect a null pointer and some of them
still do not check this case. Hence the choice done my musl.

Problems could be avoided only by writing more robust applications:
  * They should have had a check for the null pointer.
  * When a hash is obtained, applications should also check
    whether the hash has the expected form (for instance,
    the "*" returned by musl does not).

-- 
Vincent Lefèvre <vincent@vinc17.net> - Web: <https://www.vinc17.net/>
100% accessible validated (X)HTML - Blog: <https://www.vinc17.net/blog/>
Work: CR INRIA - computer arithmetic / Pascaline project (LIP, ENS-Lyon)
