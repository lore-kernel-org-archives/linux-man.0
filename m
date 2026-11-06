Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000255;
	b=W5N9GPruonxQLbcOewWL+LEO0Nyxp4PC7YbZeTwVzwgh6Y4oEf0gei1MVOi/lB+kqO3T
	 1Jq8ykNfnpi4kxFUYEXlcHCqW0zseMNjkSyEb/vzX0jldC18EvGQHRO06uf7FSe/v0UJx
	 9tdEDdNEIHYv16tMM0Tx5XILzXr9TyXMR01mLU0D8yB7kmpQ3ax22EQpe51vSK66NZti9
	 4c6gBracpHwbAefrzCpbdUymCaRkVMN2x5FWsh4nCT+QFv7zAt6Ras58b56mFiqukAife
	 aQJjXHLTzZPCm4zLs9/y13DtJav+H3eF/x4ZpJxP5B31jo0ScUd9aEFa1hQROAq9UnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=n9Z0Gxqb5ZIiY9UGUQsEQdOTuIyi0yWtoVdexEWC7vg=;
	b=OVezKZpbsz0u/Dfz3s8GlMEmbtapK8KI+5EtsCzQjSetIfyNE33bg1d96LSArN8TB8Hx
	 BKrw5T8jmIS1xp4S84cllCWtOnmxGj9OzU1HJjnwLR11fMnHVdfVKLNCheoRsS/aGIy9N
	 nHBnu+4QDVh8NV8iK5w7roU5AQmatK1wSWoHlZPsPdSxZB9Ni9Ja6r5SikNZnjPSqGh3p
	 uNsEqPZonqPsAFOZPVGaPuDepO/4IzkhaOcbJ7nzIeQUFWXhCsuK/Jl8fBHbj9/1DbWFT
	 Vw4y8RYrTS+t2gbtqWD/iTUzOGe+kpNAzrLkAx4J1h/6HyHWzvrFxoDs26aIeNC4gHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i33vHVWV;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10135606A326
	for <linux-man@vger.kernel.org>; Fri,  6 Nov 2026 21:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10135606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i33vHVWV
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so8842525e9.2
        for <linux-man@vger.kernel.org>; Fri, 06 Nov 2026 13:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794000253; x=1794605053; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n9Z0Gxqb5ZIiY9UGUQsEQdOTuIyi0yWtoVdexEWC7vg=;
        b=i33vHVWVeVDzIqJq2aHCv8bNGBQ9lduuPM+z1diZXgNpNQn7CNgvFOe7YRQc3iC+kV
         BT1iFEA2MGcUTs5z4oBVkphC4vdp6G4mCG4JenC+2hdqzMrYzou0K34G3EiizyP0XEic
         WIVPmIMXW3RcKhKNmZfhTKc3H6F3E7bnsoVnvP8fcCdtCnBVVm03SRyUDEcUcijGasqv
         dCMGEN9Y08MGAhzkTKeWQXYx8Khn4tPY+nMr7UsvAdLHXbQj51QP62GoG9az+Hoc1JN/
         fpoY/ZZ4vuREl2sXs/ICeisZ4smnXAdBePnclw/bi6i5CwVHhlx++PaKDH3dl0H0kmkq
         S1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000253; x=1794605053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n9Z0Gxqb5ZIiY9UGUQsEQdOTuIyi0yWtoVdexEWC7vg=;
        b=PQiDi/ma+RV6J8HXaLrh0EuCgAYlYuQ9LpTsMrKTnGKYw4JFYrWJ4QZBubek30KLcY
         BXADErFcjsQI+iiKxsRuTsUiIdXwSVlfnOwyHmwHvfNizO1ZfX6u/fu6McVxh+dhkV2g
         QO5mZUP6ikaezI92sMF6x5Yz7CaR3j6KSRdWeCnCEtIBYCZGsmDhb6tfuowuEapc0ICT
         p7ZLjogRwiPL6JuZHWrv/VjpVPaOHhXUS7uv+adfnO615Or3MnjfuCTEKR7Co5t/u5xP
         shcrxVQLv0CSeIlE5ELKjMujNcumMJsHubJgIMJo6xMKaT+P3UAz/Igq0eAI4KH0OH2p
         sAGA==
X-Forwarded-Encrypted: i=1; AKwUvBzzYtBRkVDa9QnuG9v8M8TS4U378yPZbaVzi/Q4v8DTU12JvM0+G36sPd50uHE6KZFMG0Mrt4ip1U8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Thf3xHWXD2u5jOPYRgK3w5RUXhzw/4VUmvI31w5bEviL7wcaM
	auux20otKk+r3hxHQSx46CHHBI4/jWmgWHzcveqy/IHMhcAKFgw6bkY+yjDqNUP5
X-Gm-Gg: AYBFou0Np9Fork4us/odLNAbl9sLSh5Njt9pcVIrnSc+dztg48gfqyZAh2uO/GzKqa5
	FPFAZO7AxowKvyvPIBpmWBFHY8joXP3B0jmCh8CUroBmz/XPehZ0g4Ola9WomofbfCf9TdCNEAj
	lW6jR8xuH1jSPKkymyRFCDJY06i6e9Ei0kCwNIhC1KhYedeIPyg6TAs9esL+BShlra6VEYyG1EX
	8ulO/aayJRfvlvhnvkrKE/y3XIz4+idNty1oFzra9pAytv/P22RPy86kXLMoEzhqxMuHr2BtFcD
	bckSLWCNuedpi4O8u2LoGZcOpcACjvoNNInh6WvacFyfB/tFLMoi3dzCAobr6hWdUbkgMCnBcnY
	69tGnwjq+I8qnhvwJJrK92wzuRpUwMSlSsUYzBk3g4EY08XLixLtUCUWywiNmWikKizoMOmr/a9
	vApH8cOBGctxWuMI4Xf83Rgi5WfD6MExlbyE4ACqcItWQkXAjDbpIYRCOD4dnSm/DFArWh8STFP
	uSdiqJS06H1ylTH+zi47BZMprxl0NJfbtO4Nm3O2RiAgm+gKmRF087O3AJ8nLN50VkvSqnOXnbI
	k0a3PxXeFB/BzPl4h/86YGs68vXF9pfdR87eD8X1ft6XLErCl0RP
X-Received: by 2002:a05:600c:34d5:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4b6db1c5e0emr72220475e9.2.1794000253372;
        Fri, 06 Nov 2026 13:24:13 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e326b7afsm9359475e9.2.2026.11.06.13.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:24:12 -0800 (PST)
Date: Fri, 6 Nov 2026 22:24:11 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Matthieu Buffet <matthieu@buffet.re>
Cc: Alejandro Colomar <alx@kernel.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-man@vger.kernel.org
Subject: Re: [PATCH v2 1/2] man/man2/landlock_add_rule.2: Clarify ephemeral
 port range
Message-ID: <20261106.4250707004c3@gnoack.org>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102233932.29912-1-matthieu@buffet.re>

On Tue, Nov 03, 2026 at 12:39:31AM +0100, Matthieu Buffet wrote:
> Clarify that ephemeral port range can differ from system to system, and
> that an application can choose exactly which ephemeral port will be
> chosen next (as long as it is within the kernel-wide
> ip_local_port_range).
> 
> Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
> ---
>  man/man2/landlock_add_rule.2 | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
> index 94bc63068935..253498bfa2cf 100644
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
> +and can be further restricted per socket using
> +.BR setsockopt (2)
> +with
> +.BR IP_LOCAL_PORT_RANGE (2const).
>  .IP
>  A Landlock rule with port 0
>  and the
> 
> base-commit: c189a6b2e4dd2e74f3b360b24e489e27f4e45bad
> -- 
> 2.47.3
> 

Reviewed-by: Günther Noack <gnoack3000@gmail.com>

I think Mickaël's Reviewed-by from [1] should also count since you
addressed the grammar nit from [2].

The high level remark from [2] still stands, please don't forget to
ideally update the kernel documentation in line with these changes, so
that it uses the same wording on both sides.

Thanks,
–Günther

[1] https://lore.kernel.org/all/20260929.hooQuaaf9An5@digikod.net/
[2] https://lore.kernel.org/all/20260926.6c13f561a21f@gnoack.org/
