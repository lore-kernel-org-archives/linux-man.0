Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=140.77.12.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491119;
	b=ApZCU/ApXrhD4Y1NseyLBAYw1LCTAFrw2Rg6sJ+jXAmMYZ2oxI/KXUXEmUjilg+YAq1w
	 AGCiBqNRpRZNQJoAcvKZ/b3B+py51JnZOQb6rZWk/mW6z0oGmZm9rVdJ+0lSc0vyCis7z
	 n087r+KsDClNwclTOdCkpTU8hANIrbQejjNDwEa/oFW17AR3iRFBypsSNgwf2FHapKQ2a
	 N/tbXPut0cvjq/zBmxRmtwP+yxZuJX2ySqj+MtWh3ZgyHA8rNAIlVhpUY067lRDFU9lzZ
	 08Ag3V5NHKqBpuTHxAMLxoS9s8c45mORlTFL5mAgmTxXOwOP6AsdKnZX1eA4H7mYnJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491119;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Mailer-Info:User-Agent;
	bh=FRXXutuu9fd23a/+a9GpdI4J3PsyaWf88V0evenYV4A=;
	b=B7Esvyl8t4WRAqSe//5LGzHUK3OsMwPtsak6YrdjmZmidyQWAb2+9O6ae47dWOkJvVZO
	 GTP66sFlx1KOaOT9/GVEgalHjTc7O9UNrSELpo4KpQ6viQVOc0awq5hFZVUnbxwwQn9/q
	 mi+IZbyPxKK2CFQtynMdYFMVvMscE/qqb6kpR62bZgNjTmwUylgecHB7fk6TLtsgzbAqc
	 P05dfdgiuyAeKNlNlaopdt33YkbBBcfiTSaSX7g4xhJh5bGyRIIsnYWdqo9sMvgKAL4On
	 Z9PkZe2b4zoh//gP1hOIWIe1D1W/LXI/7ECwgPmCrZ2/mtfAy2yqla1JmZZqxTsCnUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=vinc17.net;
	spf=pass smtp.mailfrom=vinc17.net;
	arc=none smtp.remote-ip=140.77.12.53
Received: from disset.lip.ens-lyon.fr (disset.lip.ens-lyon.fr [140.77.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB84606A32D
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 13:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB84606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinc17.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinc17.net
Received: by disset.lip.ens-lyon.fr (Postfix, from userid 1000)
	id DC99F21200B9; Thu, 12 Nov 2026 14:45:16 +0100 (CET)
Date: Thu, 12 Nov 2026 14:45:16 +0100
From: Vincent Lefevre <vincent@vinc17.net>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Rich Felker <dalias@libc.org>, Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org, libc-alpha@sourceware.org,
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht,
	musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <20261112134516.GD1951@disset.lip.ens-lyon.fr>
Mail-Followup-To: Vincent Lefevre <vincent@vinc17.net>,
	Alejandro Colomar <alx+linux-man@kernel.org>,
	Rich Felker <dalias@libc.org>, Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org, libc-alpha@sourceware.org,
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht,
	musl@lists.openwall.com
References: <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112131737.GB1951@disset.lip.ens-lyon.fr>
 <avW9PMcZ6Hm26hl3@devuan>
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
In-Reply-To: <avW9PMcZ6Hm26hl3@devuan>
X-Mailer-Info: https://www.vinc17.net/mutt/
User-Agent: Mutt/2.4.3+67 (b2844dd7) vl-188789 (2026-11-11)

On 2026-11-12 14:23:08 +0100, Alejandro Colomar wrote:
> Hmm, yeah, I didn't intend to say POSIX is bad; I just wanted to let
> people know that POSIX is irrelevant about crypt(3) these days (as Rich
> said).  Perhaps:
> 
> 	The POSIX specification is significantly outdated,
> 	and all systems extend it significantly.
> 
> What do you think?

OK for me.

-- 
Vincent Lefèvre <vincent@vinc17.net> - Web: <https://www.vinc17.net/>
100% accessible validated (X)HTML - Blog: <https://www.vinc17.net/blog/>
Work: CR INRIA - computer arithmetic / Pascaline project (LIP, ENS-Lyon)
