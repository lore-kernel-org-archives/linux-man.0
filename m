Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB7E39CD0B
	for <linux-man@vger.kernel.org>; Tue, 29 Sep 2026 19:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708576; cv=none; b=RHbgAPKz73bTE0F7gorNeRcUPZvIdxdrBLADuye9O1cvc1cL6rCp3lbhjp0KmyrRQxRDMm7CXLDm3cEAFuxFVwFH51TdiICT+hNKXeuk1s+J5C4R0gqzsBsWHhDHKJdnI/L+dtI5cgYWIG6fip4YJcwLuEtSfJoDYONQrGxBJi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708576; c=relaxed/simple;
	bh=wg05ml2QG+m/wpZkh2dAMAetIHLjRapPA7cwLzw/dXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiP7UFuakzL+xSZX2QZta0ipVkMLuCt3v3nTbgx3Np94uL3blLrFaNg70xYjITf6RSnmmr0BKkMbdTHn9DxtDEZCWx+UzEgiDvpqvhO/SzAGQ6IbZAlDdv0zccA6PwP0xr3Onxw5ShjeC6+VC7F0GqoLdYkPuaqXTjKu//wJHQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=RUot3Qba; arc=none smtp.client-ip=45.157.188.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="RUot3Qba"
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hvSHG6xGwzBWj;
	Tue, 29 Sep 2026 21:02:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1790708570;
	bh=WPa/ufPWrvEyWW6mLZur60biyAEHDRrt2vscxDhD9Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUot3Qba7rvN3Q29ARNDc+6T49/1qgLCwqhdYEJ0KpmVkKOG17KMmtpi0YStZlUAX
	 xmyQg35s8qtpF1cX7IvLbzJnq36kILc5MVPoeBUml9I8SkeX91fF5Jmp9bji9dNGiG
	 XAxr9zLl5lx2WC0D08x8SEM3bbA0aSHkwgkcB/Fk=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hvSHG2tqJz3yq;
	Tue, 29 Sep 2026 21:02:50 +0200 (CEST)
Date: Tue, 29 Sep 2026 21:02:49 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Matthieu Buffet <matthieu@buffet.re>
Cc: Alejandro Colomar <alx@kernel.org>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH 1/3] man/man2/landlock_add_rule.2: Clarify ephemeral port
 range
Message-ID: <20260929.hooQuaaf9An5@digikod.net>
References: <20260917075853.10231-1-matthieu@buffet.re>
 <20260917075853.10231-2-matthieu@buffet.re>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917075853.10231-2-matthieu@buffet.re>
X-Infomaniak-Routing: alpha

On Thu, Sep 17, 2026 at 09:58:50AM +0200, Matthieu Buffet wrote:
> Clarify that ephemeral port range can differ from system to system, and
> that a compromised application can choose (without any randomness)
> exactly which ephemeral port will be chosen next (as long as it is
> within the kernel-wide ip_local_port_range)
> 
> Signed-off-by: Matthieu Buffet <matthieu@buffet.re>

With Günther's nits:

Reviewed-by: Mickaël Salaün <mic@digikod.net>

> ---
>  man/man2/landlock_add_rule.2 | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
> index fe01a98d99ea..633d89824373 100644
> --- a/man/man2/landlock_add_rule.2
> +++ b/man/man2/landlock_add_rule.2
> @@ -109,9 +109,13 @@ is the network port in host endianness.
>  It should be noted that port 0 passed to
>  .BR bind (2)
>  will bind to an available port from the ephemeral port range.
> -This can be configured in the
> +The range is configured globally in the
>  .I /proc/sys/net/ipv4/ip_local_port_range
> -sysctl (also used for IPv6).
> +sysctl (also used for IPv6),
> +and can be further restricted per-socket using
> +.BR setsockopt (2)
> +with
> +.BR IP_LOCAL_PORT_RANGE (2const).
>  .IP
>  A Landlock rule with port 0
>  and the
> -- 
> 2.47.3
> 
