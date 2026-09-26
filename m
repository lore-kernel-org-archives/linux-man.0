Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69B028DB55
	for <linux-man@vger.kernel.org>; Sat, 26 Sep 2026 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790417605; cv=none; b=h1VvcWjChfG4HyfBGn+VKD3GiMxVuKHRnDzdWX1Ah965aAPns+YglW/k737vSC/kmYhgqNbxK/QV0TQacB9ADRDJjgndbZ0DsP6NWsUppA0jaKnMsyXm5GQC+9yl/IKqg/LWT9BmcCGL3Kqedx1sRJ67yAYwbhbCegG12Ao+s4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790417605; c=relaxed/simple;
	bh=Q5+m4LYYc2JOBiy1W6cq2k1HvdSo0SJTV1ka9b/EqKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEqgssdF37p04njs11EOKI+g96+NQECOnsdqRgKv3XQSz/DcBnUMrmxd3sx0tTZUrO04492s2rkR/+i5Lg1FjCfPcDAICjH4INL/TTVK5XnFZGYk5rnDNToqZvbbjs4Zi3rFc5Akb5WnN/GZRS4uF4TFmf+rM8PVQMTjv/FYC7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZ1W2umE; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZ1W2umE"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso11590945e9.2
        for <linux-man@vger.kernel.org>; Sat, 26 Sep 2026 03:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790417602; x=1791022402; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K/ahq8lxhE/RFtgYl86FKRkJtKUZ+kM7YUnWXi3cjio=;
        b=rZ1W2umEs3yQkYuuJgapdENX8oetI5/xBVk+SsqzRmH8t8utcJ/5RKo4Pb97hAOf1J
         0aPws4/vHIy2D+60FotFz88htbEUCNd4jnkYzrvXgdDD7KtM7nD/3OtB6poEAQMg/wL8
         UcBY/FpWjJhClr38R58tmb57BtG6X9KyQCRg4W4L59iJtQjdVJUGfukJMhR2gw12+H42
         hO9mTPdS89xG2n/jxQjaEXULO09rjsGRUJvkw222PXbSfrlw+ItQ5WVYK+jP1mG64PTT
         l4I4FgAk+kE8uqfQRSuSxIlrULObahJcKmro2get8SUcgG4WkQzBJNCGyR8SsPHnmkfD
         RxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790417602; x=1791022402;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K/ahq8lxhE/RFtgYl86FKRkJtKUZ+kM7YUnWXi3cjio=;
        b=uaHLne/wZoO0eHsT8BT/WGnbfHx4060EiF97L+0E7yVDczfZK5NRCzEv6KbdrxeTDO
         hZJMEe34zLb4kjgADkwPVaw8xIvksFbt9T8DWYAo9jnRJkgrrHpq90ZQfhPOuQdMffNV
         GTywh+0Ef0623pYCmdDdhKSxvXGMxeU/A5YNzeYpwSp1D7IuMeMmAL6cYTTBhelzzevW
         Ra7glLSPxPyPr7jCbt38M2s7PADKIW9ujWmanvEKLZCBiw9G1oxI/a+YRsXSH1D3aq3f
         a+UDIAQ8A8jNydL//saTqEv72ZKCx+5GvrQ1Nrpo17TYwQbvJAR3H4K78KILs4XYmjLN
         OVGg==
X-Forwarded-Encrypted: i=1; AKwUvBzpF2kmGJHBsSLzSP/pIYKquQajMLgoq/NcaPYNaAK74C1G9F6S/4HlzVfB/uW0qIMWltfC4DsZRms=@vger.kernel.org
X-Gm-Message-State: AFuF++mMBKl0BSbLd99V+sr6Z4SDa8wDsO2nkwp2S/t7U0bUjFwHjfR/
	xhv5WjBg0CFAWQHajOeDP/518bdmH7gk7684mcmrCyh4gCa7LXMwejAk
X-Gm-Gg: AYBFou2cSTJrtjr/PsGIgXd0TNezzMGCgRgwsb7eJYJpmsEyKND4z8ik8SU2qtP+ruq
	Xq/f9DuHxQcsk7CXQY8EZHeqGf00gs/KEuFb4MkLdKTct7XNKq0PSU2/84ljJ0r8aDgD3Jq4gyU
	VqEs9mA79talNjkerfcABMvZdR7bnejDXHQUge+xEWkjFccLAzkj7Jjj1Wesc9/622lZ9QniOrA
	KJPuJHEm+ouYPwNw8PUnECpGNU26VShVMR5wrhsalOqbngaw5tD+WBlfXJJp6fuel4qTYv1aQ8M
	XpE7pHzqkrrd4mwln12ZUnD19qHmlhDoTuLBouGIw2/ZolqdyZhbnmsiWinigwrI/Q78ZR0jNH6
	RyfI6UC2qY03gy5+Inl8VoIQyJT021xizgOpG+FmlJ3Ri0lfJaSNdAQ2KzDAs/2+7eyziB/sbwQ
	g5q3qUy26aCd9pUwU8JgCBxqrK9R6O0FmSHQv3MBbEZQWgfyqrmVGijKpQleFxB5+hTWcj3lAvN
	lrvRVw27DoTkClO4Pt+zVU=
X-Received: by 2002:a05:600c:310b:b0:49d:34:420d with SMTP id 5b1f17b1804b1-49fe66f3e61mr145640835e9.20.1790417601839;
        Sat, 26 Sep 2026 03:13:21 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdd11sm123983765e9.9.2026.09.26.03.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:13:21 -0700 (PDT)
Date: Sat, 26 Sep 2026 12:13:20 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Matthieu Buffet <matthieu@buffet.re>
Cc: Alejandro Colomar <alx@kernel.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-man@vger.kernel.org
Subject: Re: [PATCH 2/3] man/man7/landlock.7: Document AF_UNSPEC behaviour
 and error codes
Message-ID: <20260926.a28e567365e5@gnoack.org>
References: <20260917075853.10231-1-matthieu@buffet.re>
 <20260917075853.10231-3-matthieu@buffet.re>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917075853.10231-3-matthieu@buffet.re>

Nit in patch subject: "behavior" (man pages use US English)

On Thu, Sep 17, 2026 at 09:58:51AM +0200, Matthieu Buffet wrote:
> Current TCP documentation is missing a description of how AF_UNSPEC is
> mapped (depending on operation and address contents) to AF_INET, and the
> error codes synthesized by Landlock.
> 
> Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
> ---
>  man/man7/landlock.7 | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> index 880dd50582f3..51e63f40052c 100644
> --- a/man/man7/landlock.7
> +++ b/man/man7/landlock.7
> @@ -276,6 +276,24 @@ Bind a TCP socket to a local port.
>  .TP
>  .BR LANDLOCK_ACCESS_NET_CONNECT_TCP "  (since Landlock ABI version 4)"
>  Connect an active TCP socket to a remote port.
> +.P
> +Note on
> +.BR AF_UNSPEC :
> +Calling
> +.BR connect (2)
> +with that address family

I realize this is technically correct, but to a reader who does not
remember the nomenclature of the socket() call in detail, it is
possible to misinterpret "that address family" as referring to TCP,
rather than to "AF_UNSPEC".

connect(AF_UNSPEC) also does not work universally on all socket
families and types (see connect(2)), so the socket that it's being
used with also has an address family that plays a role here.

Maybe simpler to just say "AF_UNSPEC" instead of "that address
family"?

> +can only dissolve existing associations,
> +and as such is always allowed.


> +Calling
> +.BR bind (2)
> +with that address family
> +is treated the same way the network stack treats it:
> +for IPv4 and
> +.B INADDR_ANY
> +it is treated as
> +.BR AF_INET .
> +All other uses of that address family result in the same error codes
> +as when Landlock is not in use.

It's unclear to me how bind() with an AF_UNSPEC family address is
relevant to Landlock sandboxing?  Is this relevant to include?

>  .\"
>  .SS Scope flags
>  These flags enable isolating a sandboxed process from a set of IPC actions.
> -- 
> 2.47.3
> 

I also could not find this change in the kernel documentation, I
assume you plan to copy it there as well?

–Günther
