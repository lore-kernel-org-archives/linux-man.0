Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793522168;
	b=WQgvFaisnCKy/UmGpdcI0WCxGyrUAhUeqPKxkFkP/b16W4almIjqf8MGUY2ZLyqGZYqm
	 6zaWMe+PXmPKZ/ZMpHmLR36MZ2qTfUqGPb2jZOorZESqwljgH80GDMxNgiAfhFqY12LDX
	 p2baT8hXZrVyjgi5Ir2hxbWzu6qe6y6F1EgwF+DNpL/kIbSd5QVVvbdynt5b1g4J5/kq6
	 ghVYG+TdYCmBlv7KAvuyEC68OK13SUAchoqvcxRlp2cXT2E3iyQlsvCF2CiH8BojWwGB0
	 Ey3t5Wh38zUSJGb/FCojeOTFg++JEoEUj8TwVdnscUv0PZenQIbmR89criSouV5CXBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793522168;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=LSYt28EaoJ2kZ5sy8FKuoRsAFKimQI4UCDc04Q5ENBw=;
	b=pVGEW4XhMYmQkxbb98/CQD1nrslkhI4qLwwmyzeQ/e0xfpZybfslbn9RxeLRe0mWbGGB
	 MaY2UUMcBi1q7ykIYpA3rijdgBID3+LaRjTlBGap80ZgDsrYiJItst/qM5fgsEDAAfLku
	 RCoOXZYECmKnq2lDIJowgF9lmKVxyEcG/sG08hhFRertCp7g+pFwZxxt4YQa4pRwAhWXV
	 528d9f8VYAd+rw9Ik726M+st+j211BFdyyB18q+Aj2OjlavIfz4QpBl/nbKT0vcl7es3E
	 XfZb6HjDxJ5OlEZ2b0LfgCNXPKoDbTK5eJ/7G0eMhXWA0MRXEGXUa2BUMD4foidINuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=InurntKE;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C97C606A324
	for <linux-man@vger.kernel.org>; Sun,  1 Nov 2026 08:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C97C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=InurntKE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793522164; x=1793781364;
	bh=LSYt28EaoJ2kZ5sy8FKuoRsAFKimQI4UCDc04Q5ENBw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=InurntKEhymFVd/aVP+mGn8TD7OuMdG3VJ01vWdU6EX2LfF4Q0fQJ84AKL2goeNpN
	 5bkqJP5iner321IaWAPMint7Ih6jCo6kyjllQltrcpT+0KvnmyWTPgX/srTHdg/Mhs
	 OYdhQGFm+Qn+QSbIMeNJAKpV2aVfdXVC5dxocDj2sSC9KyEV8ui7NNC7X98rL4Tt6w
	 qkfzbly372obQfYv9vIXs4iQFBEgOOWJeAurV/yDVnAniPVQAir9sYWfMj6ya9twGW
	 0DBnynTOIOlWsgkVdrSOAMzmlfvl/ZmZjdEm3IJbS8vR0WxbiSy8ljQB9jeyM5AtNf
	 bfp95mzzjT79A==
Date: Sun, 01 Nov 2026 08:35:59 +0000
To: Alejandro Colomar <alx@kernel.org>
From: Ben Kuo <ben.kuo.tw@proton.me>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/epoll.7: Note that an edge-triggered listener needs an accept loop
Message-ID: <GDzqYHzBVydogwdzEEe-qKdazsH5Lu-8EglcqDl81f9BpqBTlO5MsiDux3JQOSFDu1nNwkY7ow4X7XVamefRbJZ3sPrKYQHeDAtOUJZXo0I=@proton.me>
In-Reply-To: <20261015-epoll-et-listener-v1-1-2cc0027b658c@proton.me>
References: <20261015-epoll-et-listener-v1-1-2cc0027b658c@proton.me>
Feedback-ID: 218489215:user:proton
X-Pm-Message-ID: d84b366708279dc4727d7d82cfeef243bad414f8
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
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

Gentle ping on this patch.

Thanks,
Ben
