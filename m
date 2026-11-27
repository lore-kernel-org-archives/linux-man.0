Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783868;
	b=uLtpTKtwzerzqTiSCLi8Fe5oededmhYXlhODYR9DEoGIZVCupVkc2VuqeyqLg5cBphwu
	 o9GrVKdxN0aSbjDY8R5YXkZNGl4UGzrUSQed49FjEOLb8NkDh48cAiPS9GNb/bRLA2Tf7
	 eCGBu8Pxd25cZb8Vvu4u4vY/rP31cHO9lHAYN+U07ZJhNe9//ADveLw+FEY8smYDJzhss
	 /CnEG6ea8yrBUFpDUwPg6AdJ2n38woLZd1XWnAcxozmiQvBJlWDaQGDCKfQYFFhwDSCLI
	 dpj+qTiUgciuI6jQ+Dqa3iD6UlnVIBiSvrId2YvsLd/8DiMHt0d0qhBOcakJg1bvNbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783868;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/yMV+J0PCpC140aKnIvR/gsAstAn9r1XvTsNnxRp3Eg=;
	b=YB4Zgn1JFBVHymcHc4fqvija69b8zRknf3LGOYuFmfN8ZSDy7NzEZBWRZQVJ9Xb1Gqmd
	 /JLlOYdmOe2rOwY3Y2pL0btoVYe9TFys7B5HwwACpeBQvk8zgN7jjDD8DyuRTolZ1gQEc
	 hWyz0NbBTpcWufFR1mvmkrNyoXJlGR+q5vT77LhQcYsCwUh0oN6/cIcResIGNQGdr2PGp
	 GMgGEGK+88TgYpnsV8yP2kvgV6AbymEudtDuAxhOpKCeRcyuf8F7Y0sLbhj+IL77CuMmz
	 W0CBM0lztFG8R7c+cg1E8RJjWp1hJ3EU0QdCjA2i/T2GClwZ43aSAEAc9c7JETH702g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bsUhyIVX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F59606A321
	for <linux-man@vger.kernel.org>; Fri, 27 Nov 2026 12:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bsUhyIVX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2681F00897;
	Fri, 27 Nov 2026 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795783867;
	bh=/yMV+J0PCpC140aKnIvR/gsAstAn9r1XvTsNnxRp3Eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bsUhyIVX5CrM2tK9GiQdERDwoZTCTR0gTuzovPzjQJFEGhhtvkIGw5txhVhrAsMkh
	 9E2cjY4d5+YF7XO8SO3fEbpSsi9RYWJdmrlVv24PrCotV7ZtjyK248zqNcU/RTTlao
	 FSRDV2/dVA5yybG/4LiWVrMJRU6wYaHhgHA9uBsTE3d8a/hh7Mo/6BSfPfg+jMUxMi
	 YqrOvQnGEatIGoifeHl3isBG1M6i15F+BTtkBQYoBIaOHT8L5kWToA6ROWgC2sLLw1
	 UldPGC/6LB/ncGhJuD6klcIkF4FtZ+MJlCJ2SCgEnvY4VAXFzOt2xNyuPWsmwS70NF
	 KTMSySRLnIAEg==
Date: Fri, 27 Nov 2026 13:51:03 +0100
From: Christian Brauner <brauner@kernel.org>
To: Alejandro Colomar <alx+linux-man@kernel.org>, 
	Niklas =?utf-8?Q?Hamb=C3=BCchen?= <mail@nh2.me>
Cc: linux-man@vger.kernel.org
Subject: Re: man 2 unshare: UNSHARE_EMPTY_MNTNS
Message-ID: <20261127-rundlich-geldkassette-farbaufnahme-62856c08c80b@brauner>
References: <64fb02fd-0ffa-4311-bf21-a3211e9d599e@nh2.me>
 <av-DinDzrAeN_1mU@devuan>
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
In-Reply-To: <av-DinDzrAeN_1mU@devuan>

On Fri, Nov 20, 2026 at 12:22:52AM +0100, Alejandro Colomar wrote:
> That same commit also adds CLONE_EMPTY_MNTNS (according to the commit
> message, for clone3(2)).  Could you explain why there are two separate
> flags?

unshare() only takes 32 bits. All of them are taken by legacy CLONE_*
flags. New clone3() flags live above bit 31 so CLONE_EMPTY_MNTNS (1ULL
<< 37) can't be passed to unshare(). UNSHARE_EMPTY_MNTNS reuses the
CLONE_PARENT_SETTID bit which has no meaning for unshare(). Both imply
CLONE_NEWNS.
