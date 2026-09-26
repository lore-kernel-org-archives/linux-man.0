Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C6F547059
	for <linux-man@vger.kernel.org>; Sat, 26 Sep 2026 10:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790416878; cv=none; b=WIww5mkWEWiiGZHecOmdJhyXRRF9UyewhKHnlihRXPW6QLezr/5oyuDVyBxXNgC8MT5kghf69gNZE0PjHTL/+iwHzSq32S+9q42pS6ykn4hBvBwD4miIl+HDFKZei63zvn98LoNZ5sefAafy80aWrgwwRmgQhECG5QvcUlswvLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790416878; c=relaxed/simple;
	bh=2tCOh/8tRfVYut6/w76lPZ1FWc4Woow/IPCFd0Vmd4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQze1LNKK2Cjs1zf/Uhdfw3H0vDTdYHYW+scIWOWFeJW10s+AaAxXdogrMHyTYmVM/fDevRQ3Yz1TzrtWRGxOKCLkemAta/78G8vNQatFVv4bSqiCxHR5hGbSsib/iR8Ry+FNGG4A4Sw9I3JHqcanS3zZ4ax6UTGRdsjOmwOpuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZ9Hmfw+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZ9Hmfw+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so12049975e9.1
        for <linux-man@vger.kernel.org>; Sat, 26 Sep 2026 03:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790416875; x=1791021675; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuY7s3PZKhkdU+KHQ9H69RLkSvM95QBEw6xuNnntf7U=;
        b=RZ9Hmfw+UYyqzAJuWmhddCBxfdDZ0PDqo3V0We1Sq6xxe+ur0fcOoNmI8yGupn/AUF
         yTqbLHULnxnuuHJi2UE9rDT0n/zBnd1yT1NEWOc/DIDQf/w8rC5cAhmoGVEHf/vhrLFR
         Xq94FPDtrq4kFEg5y2sdfOmxrr3HpuM/cu/J2KBqZjSAsSGKzKrJg2IPFeYbA0/Df693
         K+BZ/Bqc8e3pfhKmzTpbzHalEPfvh4qtZoRUDjrak7Fjq395w88RrXui/wrYkXuuzMrG
         78z2cYRf0W60iBZHrxXHwjNqSzlFq2fPaQtJhQFVyHnqmIBHp2KSdLHQ3GxLTDSK+whl
         L1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790416875; x=1791021675;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UuY7s3PZKhkdU+KHQ9H69RLkSvM95QBEw6xuNnntf7U=;
        b=Vi3s2C433d8xRpBfP/GRtLXlUSVdbG+5+4q6XmDfPhjUZfkbRh2TdivlOlEmDjWgmT
         xcMVklRgJocrLNp1544t6m/W6vz63S0x0ggZ4bN4GBHZ4xEBPJ1tEqCYcb9alEFzwZkT
         HAza/s7oUFqONJe6Stvk0tZXEzan96Nfg2i9Iv99yGbbsfcylKvjfXjuGOOT7I0Fc1s8
         /lh8IoJDeK6Q/47FU7hheAaB4d2n5D/kRUAD81n59v7iy89hG3VrSZ91cLANKa65qp4i
         q93F0YLtztgmzJDg//ogdNTz7ec85kyo7VKC59nh7ACbHA+tyCk7M4Cto/gwu4mRnHLw
         sCiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUQeo3zGiuRw0TDGBqg9uHTmBj/QBcvMzsPithj8Js/Mo0XgupvTG13fg+6DDdBlJTHWcZUA7T4IA=@vger.kernel.org
X-Gm-Message-State: AFuF++nflvMDpPrmZebFe3L6E4YPBVez6duF9Dc5wnCzlFZLdRXsQxfY
	Oa7FHW6VBU6SeohAltHwoCwk7vpJXAAAy0GVjOvI2fsfzNoT/xtTxDZC
X-Gm-Gg: AYBFou0ClkFKReG9GCguJsDwq6IQiibefZTbcqu8IFLeypNh9GRVYuOcPQNs9vVIdxr
	z0bjCFg7JDzlizuYzig/UeIrTDRUIiFtGsIh2lBIghgxpHhVOsOWlcdsMRY+omHUg5qry8DOy3I
	Vg0qRiP/nxPdjWjT/1Qd9ZT1V0Lk5tKxTLEEwEBmAI8lkHpLVl9Yo4KKDkGR/7fEM/Hf4AasuXJ
	EpWBcu1hPuDA69+BEhDaJBTqxZyVQ/TnlZvam6KK9BcDPRxYdFcOgZ58ER54BgADnNZ4oTbBT63
	62SSiilMPkp2Semz1Q3OPwKtmf4wtp3mul56yE4V0aM7BIArEmcrdq/gMZxamsg+hGyNUgq05o3
	e/O5AZwkNU3tgNR/ZPqNisNc9KVW7j+XCAAPZAe0MSm547t0bkzS9pq5Nuqi/69FqIYys3P/L9f
	xprm6X+JW1ZsEQ6ay13bpJJYrkXUDRUP8J/XEZwus5tUWCP36ca+nCxxkm2s86ZbeXMuWPTTLX4
	5y7f/b6HLiP24f4Otb8Ec0=
X-Received: by 2002:a05:600c:5489:b0:49f:d71f:9a39 with SMTP id 5b1f17b1804b1-49fe66c9ad8mr145158445e9.1.1790416874738;
        Sat, 26 Sep 2026 03:01:14 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ffabc3f33sm25403925e9.4.2026.09.26.03.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:01:14 -0700 (PDT)
Date: Sat, 26 Sep 2026 12:00:11 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Matthieu Buffet <matthieu@buffet.re>
Cc: Alejandro Colomar <alx@kernel.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-man@vger.kernel.org
Subject: Re: [PATCH 1/3] man/man2/landlock_add_rule.2: Clarify ephemeral port
 range
Message-ID: <20260926.6c13f561a21f@gnoack.org>
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

On Thu, Sep 17, 2026 at 09:58:50AM +0200, Matthieu Buffet wrote:
> Clarify that ephemeral port range can differ from system to system, and
> that a compromised application can choose (without any randomness)
> exactly which ephemeral port will be chosen next (as long as it is
> within the kernel-wide ip_local_port_range)
> 
> Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
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

Grammar nit: I believe this should be "per socket".

> +.BR setsockopt (2)
> +with
> +.BR IP_LOCAL_PORT_RANGE (2const).
>  .IP
>  A Landlock rule with port 0
>  and the
> -- 
> 2.47.3
> 

High level remark: The kernel-side documentation has slightly
different phrasing, saying:

  It should be noted that port 0 passed to bind(2) will bind to an
  available port from the ephemeral port range. This can be configured
  with the /proc/sys/net/ipv4/ip_local_port_range sysctl (also used
  for IPv6), and within that range, on a per-socket basis with
  setsockopt(IP_LOCAL_PORT_RANGE).

But I think your variant is slightly clearer.  Do you plan to update
the kernel-side documentation as well?

Thanks,
–Günther
