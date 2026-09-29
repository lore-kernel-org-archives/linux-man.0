Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0809D46EC9B
	for <linux-man@vger.kernel.org>; Tue, 29 Sep 2026 19:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708921; cv=none; b=sybPZUbx0+uFrRsB6r/KE4UUo5/CvkN9bLNFXH6HP+C2ijgIlUzFzxJCU05bE6jv0eqAiN4iDTF3j0elcpTaX0YYgaJBxIg4Th9kHx57wXPAtw5G0J0P2pmUogdeV9Xdv0566CEcJKFF1LGKxvVRZ73G+4efoLK9NJX8fx97eD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708921; c=relaxed/simple;
	bh=0n0uyICspv/ygv8IdgnvDiR8WZOqxFUCpC7Ae/waoOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D17bXt92EhkdvoUuy62l4XD5zmbf5pDxhnLejt8CR+umkCAN+SkOnTQ3Ovas3h30EL6Qv2OfrR/ZKQ18OjG7gLxpCEqTmP9Eb1RYJwcS1vWS2frbxBuhWjO33TqpJs3wOR9CEpPQ4rnAk3XNechsK9fYjW64sRcANKA3qGNhrhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=M2FGBvbP; arc=none smtp.client-ip=84.16.66.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="M2FGBvbP"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hvSH273YczrXS;
	Tue, 29 Sep 2026 21:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1790708558;
	bh=XpW8uEEfWfDU7qotW1NKZgINIufGYcNMMJx/aI6JJF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2FGBvbPO7bMrhTo9yYRw81L7eH1zNMKLTKtSqrgihWRHYT/D9k+NBTMzQ+6A9nf1
	 CUDLNcrOrPM50EsGVKVYrNoPhuJ7mMcYAkZmLLytZsAUVomoaXvOKg4ISKusSTn3rd
	 qaqe/dvtC53/Lrpf9xrT7i4+y1trdblNDwQX1Dak=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hvSH01YYTz1PB;
	Tue, 29 Sep 2026 21:02:35 +0200 (CEST)
Date: Tue, 29 Sep 2026 21:02:34 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Matthieu Buffet <matthieu@buffet.re>
Cc: Alejandro Colomar <alx@kernel.org>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH 0/3] Add Landlock UDP support documentation
Message-ID: <20260929.phoohohs5Hoo@digikod.net>
References: <20260917075853.10231-1-matthieu@buffet.re>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917075853.10231-1-matthieu@buffet.re>
X-Infomaniak-Routing: alpha

On Thu, Sep 17, 2026 at 09:58:49AM +0200, Matthieu Buffet wrote:
> Hi Alejandro, Mickaël, Günther,
> 
> Here is a small update to landlock.7 and landlock_add_rule.2 to add
> missing TCP info, and add UDP specifics introduced in kernels 7.2+.
> With the benefit of hindsight, re-reading UAPI header changes, I
> actually did a bit more than copy-pasting from them (see patch 3/3):
> - explicitly state in the access right description that sending
>   datagrams without a destination does not require any access right
> - more importantly: clarify the description of the most non-trivial
>   behaviour (auto-bind denials when emitting, which can occur even if
>   CONNECT_SEND_UDP is not handled)

Thanks for the patches!

> Mickaël, if you are okay with these additions, would you like them in a
> UAPI header patch to sync the two?

Yes please.

> 
> Have a nice day!
> 
> Link: <https://github.com/landlock-lsm/linux/issues/66>
> 
> Matthieu Buffet (3):
>   man/man2/landlock_add_rule.2: Clarify ephemeral port range
>   man/man7/landlock.7: Document AF_UNSPEC behaviour and error codes
>   man/man7/landlock.7, man/man2/landlock_add_rule.2: Document UDP
>     support
> 
>  man/man2/landlock_add_rule.2 | 23 +++++++---
>  man/man7/landlock.7          | 88 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 102 insertions(+), 9 deletions(-)
> 
> 
> base-commit: dbc7211e1e52dcd485bd3e081cfa761506edc4e9
> -- 
> 2.47.3
> 
