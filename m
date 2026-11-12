Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=140.77.12.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490024;
	b=MqZSCzIWXPBY3olRH+nkOrSzhoNAIomxQDV0isMsTs+MnpbGFSZcs8c2WiejPXQQxX27
	 GYLzxkbRpuuWDJTDfIgfQMCYDBE5jbM5otyDwT8xFrv7AsXrpr6SPpP9RLc2y9qWqqeIZ
	 HEpKxxwoRfq2fGGnPVp1QuXVipGohgTXGnlfDGdDHwamKJODndFrY2cYC+wuae1f0ji4w
	 egSZWw3fn8CTo9ax+tRO9YclKVNh7abs2n0wQa81r56oHQNj8g8Zy3ERf+htlhqdZ26n2
	 yn5ZDl0JfjaJgK1Rv9s2rsMVKoIFEpFJ/jfo/cCdQcmL6ndukJ/AZ4cj+0YtVQnriDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490024;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Mailer-Info:User-Agent;
	bh=kN2ASRlJPLc4vC8NNFQ0XwRLeoiqb2Ap1IYftmK36/I=;
	b=QeWGCO5YcDC6UEH1/L8Cqp/rNjWBM85b6ns1cJJQ4hLi7Gw3DofjY7TGfFHvWatkvMLC
	 lQmWKVn+whjuF42XcH2YbSN1v1LY3zhdTiCjNkUbCEfapI/2BteLBSIk2TXb9OMKsqklv
	 FR/dJt0oYrtHQ25a7upLPAc5striA8FUfrorST+k8MG70sdk8rtqImqZsSRgJSsWRntdv
	 PHdBMWspqhNYLBTFTVY1u3IUANjR31jEK7t5GSh6IMY5iecXiV7yTdTyt/82IEHcGPNPR
	 tM7te4EjWv2Ox+YinAzcr3ikJtFR2Z1Ur2YIP1WwZnoXaPNvhvtjSNA3Awhs0hxOnNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=vinc17.net;
	spf=pass smtp.mailfrom=vinc17.net;
	arc=none smtp.remote-ip=140.77.12.53
Received: from disset.lip.ens-lyon.fr (disset.lip.ens-lyon.fr [140.77.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313B606A31C
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 13:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D313B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinc17.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinc17.net
Received: by disset.lip.ens-lyon.fr (Postfix, from userid 1000)
	id E722C21200B9; Thu, 12 Nov 2026 14:27:01 +0100 (CET)
Date: Thu, 12 Nov 2026 14:27:01 +0100
From: Vincent Lefevre <vincent@vinc17.net>
To: Alejandro Colomar <alx@kernel.org>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>,
	Rich Felker <dalias@libc.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <20261112132701.GC1951@disset.lip.ens-lyon.fr>
Mail-Followup-To: Vincent Lefevre <vincent@vinc17.net>,
	Alejandro Colomar <alx@kernel.org>,
	Alejandro Colomar <alx+linux-man@kernel.org>,
	Rich Felker <dalias@libc.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
References: <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112124114.GB3542221@port70.net>
 <avW2G8eKE5w0Xy9O@devuan>
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
In-Reply-To: <avW2G8eKE5w0Xy9O@devuan>
X-Mailer-Info: https://www.vinc17.net/mutt/
User-Agent: Mutt/2.4.3+67 (b2844dd7) vl-188789 (2026-11-11)

FYI, Debian uses the man page from Openwall Project October 11, 2017,
which has sections about portability.

It is available online there:

  https://man.cx/CRYPT(3)

-- 
Vincent Lefèvre <vincent@vinc17.net> - Web: <https://www.vinc17.net/>
100% accessible validated (X)HTML - Blog: <https://www.vinc17.net/blog/>
Work: CR INRIA - computer arithmetic / Pascaline project (LIP, ENS-Lyon)
