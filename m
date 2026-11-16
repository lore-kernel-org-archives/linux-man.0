Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790947;
	b=I0zu4UhUjvxWq0m6ZvEdu1i9K3UJ1PCDPPQAn3t1LTA34FB/rcl4XtQyAGPpu+yLucRR
	 WqZoMgZPiP3stET0YVXpqRLqIHHsYJLT+6URMDdG/pTbAvY/4jmv7+OE+0RzZj0MH2IDG
	 QZIcX5qM37i/m6b+8+mZYIjWrNfjLeHwYnSPBEl73nuxSe2Rz2rSvNKLGEq0cjdd9Oz15
	 iDRBnBll0TUsSpsQxxw6eak2ivozERjBJ2CY94uNvnCHa8knSgNLYcpVI0HvZ9oesTkmz
	 okb4hFQvVGT14ipM6cq8mOmW8ZUCOLQrKhUkYrqpUQxBEGIsNf09aoSSi6YCuyUXcFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=/Idtm+3/JoO+bSLqYxvpRtHL/lhIqkLWg+toq6UsPEo=;
	b=hATNPZa96krxN5pEFTw4rc3cnUL6pJ+ifF+oei2KIEp1hyvS+uFsN28tZt9Gs6lvngUY
	 iqtupTQsCtv+cDFOzP+WnxJLvsLCcujj8zlt9bCmX6O2WoPb3VMqau7/N8Qm9bWqW/ygz
	 Nj+ViqNA89mkU/2t2qPDNFZC+TCh+qQ7M02qJqUl0vKHWMjSBvqNBv2mgP23q5dxlc1qE
	 FVNvEkWpgAkEyckFJT0dfSh9T8MD8NnvYPrnlBfKs9f1IQfR2gdkVu9Z6pSsrFS+knTsr
	 vSjrx1FIt4nG4MLUbFxwX2/6XDp3K8v3S+L8sa4wvlztncGwXN1PacO3lTUx+p6dRWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQ4zWB6b;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1FD606A31F
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 01:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB1FD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQ4zWB6b
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efa9aea3c0so13120405ad.1
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 17:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794790946; x=1795395746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Idtm+3/JoO+bSLqYxvpRtHL/lhIqkLWg+toq6UsPEo=;
        b=NQ4zWB6bHHTTWM/4Jvt1P+QLjGZZxSpTh61FIpi9QrncvM+ugzNCClnK94bd7hJP7D
         VtxJ7hagLPAsWM8nUyR3ctMa2Rgx+1z/yNaiuwG8obal/cSSybnVvBtlzwOcc9FQU/Ay
         ykOnxYH3SwVsr1rNF3tQSwwZhGXLKCExFvoD9W0VO6Hys2WjG48v8z7yLjvhuISS2yOI
         DuS9QyXIKb4iI3N1scnIqVYSk66LZJ7Ogq386lc5SpZUUcXNYgnzcvCswk/eJCLLazDX
         VJwNnRVkUAzmhKSwKb13OuhVO8St8+y2VKlBEgplW/FI5UPomQDWt33H55T/o5FZGczt
         A2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790946; x=1795395746;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Idtm+3/JoO+bSLqYxvpRtHL/lhIqkLWg+toq6UsPEo=;
        b=GpNBGCCc6Zg5axqDLyZwrmfNGmrYB7zPqw8Ed5EpOlOaWYA0xVPCJjcFeI5PlFuKaE
         jIBN1NVkKvgKDzsdshuq6h89HULYC1VH21J4n6ShCfAmDXwMG4XALPqg7zasMg3MmINf
         ZHXwxLQzYty8/FZ61hc7iPIRQBZ29VHg196oYcQSi3eaQ1fFUCN5J9dlhWtXRNw2zAaD
         zSH6rYXTvFGJqg9od+e1CvUglMW9/HXFVEztux7PjQEDTvADcRaT/A6nfmd7ObY8NJjD
         j1MkxDnSvPaWlAz/I2qgk+XpJrdZZ7QDN9O67YUvx5EhxfUMC+w/dzqkyoVYqfzSth38
         cvRA==
X-Forwarded-Encrypted: i=1; AL+hErGM355V36iAp3QGT5ShyT5Xde4az2drt3zPOr1ZdakR7YzS7feyzUViDsNAs51QoAx0B7hN68qeLz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mXvQ0FyazRnn/qyjMvivVOSAX8zV5nEZm0p05XK4LNauDTR4/
	w+QX+HaMrO1NCFJ6fRdS8PHLEOFpudiBqFQ/gSlhvBML8d0s0QSK8tV8mR5r4IIuvfZ9KvgGyVH
	i3I5hsg==
X-Received: from plai1.prod.google.com ([2002:a17:902:c941:b0:2ed:1906:483])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1446:b0:2ed:56ee:af8f
 with SMTP id d9443c01a7336-2ee0d65fb69mr90816215ad.2.1794790945942; Sun, 15
 Nov 2026 17:02:25 -0800 (PST)
Date: Mon, 16 Nov 2026 01:02:25 +0000
In-Reply-To: <20261103202211.13820-8-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103202211.13820-1-gnoack3000@gmail.com> <20261103202211.13820-8-gnoack3000@gmail.com>
Message-ID: <avpVmvkSH0DD_pPe@google.com>
Subject: Re: [PATCH v2 7/8] man/man7/unix.7: Document SO_PASSRIGHTS
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org, 
	Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Nov 2026 21:22:09 +0100, G=C3=BCnther Noack wrote:
> SO_PASSRIGHTS was added in linux.git 77cbe1a6d873 (2025-05-23;
> "af_unix: Introduce SO_PASSRIGHTS."), in Linux 6.16.  It lets a
> receiver refuse file descriptors passed with SCM_RIGHTS, so that an
> untrusted peer cannot leave it with file descriptors whose final
> close() blocks for a long time (for example, a file on a hung NFS
> mount or a FUSE-controlled file).
>=20
> The option is enabled by default (unix_create1()).  When the receiving
> socket has it disabled, unix_dgram_sendmsg(), unix_stream_sendmsg(),
> and queue_oob() fail with EPERM if the message carries file
> descriptors.  The check happens at send time, so messages that are
> already queued are unaffected.
>=20
> Also add the new EPERM case to ERRORS.
>=20
> Link: [1] <https://uapi-group.org/kernel-features/#disabling-reception-of=
-scm_rights-for-af_unix-sockets>
> Link: [2] <https://lore.kernel.org/all/20250519205820.66184-1-kuniyu@amaz=
on.com/>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Cc: Willem de Bruijn <willemb@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---
>  man/man7/unix.7 | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 140e77ea12ee..1b4cd242657d 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -337,6 +337,35 @@ .SS Socket options
>  .BR getsockopt (2)
>  is an integer boolean flag.
>  .TP
> +.BR SO_PASSRIGHTS " (since Linux 6.16)"
> +.\" commit 77cbe1a6d8730a07f99f9263c2d5f2304cf5e830

Wasn't the plan to move SHA1 to commit message ?

otherwise looks good.

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
