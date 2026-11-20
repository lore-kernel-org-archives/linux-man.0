Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176626;
	b=cqi4Zw4eGq/7wosGuFpyesSbSai4Vblw0esmrRR4EOqRfIv+pJl/8eIEQlnGNYvyTnr1
	 yNjGZ5KxbsQbGqN0gvKWTzELiGLl8SJP64uTXmZmv1ReTe502ZY9EVJ9hD9jPHAOWcRv7
	 EGBS0bY3gUy9b+ol3PG0nObwg2ENXDLDssSB8JpHCzeFg1/BQEdvcF3j4Bv6U25Sm4rvu
	 J4KssuyuFLiaPudIZoQltr41FV4vi4bOEqZgc8VWil0+EuNmO0IRI/GtJI/OO7mxRg0Dg
	 Y7PdoU8Bfy2QHaR5g3T3Z9Wkc74BGxfH4FRnH6LAxvI80yf2UYyqHUT/7xD+iGWmehw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=C//PGazQ7IiAi3Peq3bqXD9nSabF7yFx9oGkc7dBoVc=;
	b=VgIyiqVeEAQXM7i3k3vVlzEx/Tbq48iPHSOMstyTWGlDWJmYFdrXJcCecH1kQMtymfur
	 A2WQQnS+sonWTutrlD6oHUdFcfHnV1Ca3z4mJ3mXY5Zb7cp+ao18udR6xRCoVZURlMd3H
	 iT/uHcGIxs+gcWgC6IQlZ+Jm2ewzjs2v9nELCEOgct3P208UtRd63uQybbVELOY04fmUe
	 kCqGW/QeNCjJw8QhJRuY6J7RHYnKEpmJ2MAsg3nUd8Fi4cyuPdbUEk+XGt5n7t40DKpnT
	 4em5R1HrTT8ke0ZfcYUSOL2e7xf0nLGWMECivTUykGbIAg4AeaXDwtOHb+UUpQIzRzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGyNwEfU;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8769606A320
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 12:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8769606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGyNwEfU
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so6899745e9.0
        for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 04:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795176624; x=1795781424; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C//PGazQ7IiAi3Peq3bqXD9nSabF7yFx9oGkc7dBoVc=;
        b=DGyNwEfU55Bpi0ey5JVIFxV9yT80MW3XzfydlGIIEp95ojiVKDwkraO61y6O642XRc
         nCPdiNS3mRBeqJXZUgaZTBJQhhE8UZAwXRxhOOWE0rddOPRux1r3qcygEkiAlTafldyF
         VznF+Jpwg4Lxk6nuARUe5xKGQVSFJDSYMnKpzNox3hQlTmheKh0eHg3L+u2V6oKKucN4
         k+FPb5uSjOrNA5LyjVHdZRsdGrT9WxpjkkOFwUp0XDEU/Ly4QF+HrxBZ90iSbDFX2alK
         cue3x9qfgLyh8nJLsGgCuLe5NIwhizsNA919MNZsuiOWB/lfw9kfikReFJISTYuNHMDT
         vm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176624; x=1795781424;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C//PGazQ7IiAi3Peq3bqXD9nSabF7yFx9oGkc7dBoVc=;
        b=1O2T6BUBe73EXT5wykStP0bi+ib3NCBHviVXHTIDPLavklH1lpbMHfWgsuoTRK0il+
         QGFyRz3Ok3wXjowtPNmyCetO4txFPv7GdPTCzhjF5xMN0OH3cGIFwPihYqwXv+zXyfei
         /yOoOjdQADluD2n+XitxTG4KdtLuGeLh4UNYW9RJzAyueeFlXvg4CQoSgQpRnnLCarKe
         quPNyDX0fasrIvaV4rsBUczwxiIMWYnj0IceYm8ourjSMi4kktleOTI1j/JisSboWZfb
         lsZr9ihQ0/mfl+bezBatAqOyw87KfEXbAi7Tx6JmJFJ2WFB7cHW2NEHFlTlKjzjESlEq
         gbIw==
X-Forwarded-Encrypted: i=1; AL+hErGBvlXd/mxfQvxFQN7DggOH+AWRKMHjM8ngaT4eQNup2yo6PvDqFWBxrR4aNN6+p2R3WlpaDua8nqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JGBnqn7lh8guLVKoGvU4hUiv3YdDnPHFrxricii0ctiDEUxoG
	ps2CAgD57t83z6HieZZSp2XUmxVNFUp0rpfkpR30oAMvyb6IdIUFLI0X
X-Gm-Gg: AYBFou0G3iyN9Ble19dfb8TJtvy+f3eYu2mgjeJmRsG5LViN+DSwtxV/JzrGXw9QYbC
	gPP6iEqBv3/6zrXztHni5FzQl3QudpmN8MyLEmWvxp04NhmMLV3ep9a3WJ3YfO0VxNwyI5F1Wot
	+VRS6M9spILlvaNwKWlCLqGkzgYAmb6m5cHxeEzU+S6y/mDaY8rX3PZ3mx6xVgacs9doyoy354a
	vgb+PLy/71hdehjsg0H9umThbDYEKmC4CDddKJ5CPjW3Rw83EGMsBtFwU8g7v26c01Lt9aOj4NG
	zR/tL9m2RDfIqf94gvBZ6pczlUWDh1x3gk46SodZZDn72MPBWldfnnSMswpY0IzOdSw+xyojeys
	kgbvbxlyhpZwBNKIGg2ASu0c0U9m1I+hOb1jyvisqqaygHA1gwM9KIA/i19qFuV37zgC/a9FXMA
	FEdCz9NAL3VKgIC78Yjps/NocbRK70NBxNRoAibVVYQJku3vN1gPfCqyz3KmgR4UvzJ1n5iq73a
	8TrHRCOUWG6qx9HIoRLErq/M0vGrL9NZv9DwwWzh6GEQMAr7VZs50n43CXUo1HKxYeFR+BfjRn5
	+e9Ec+ptRdo4N1tXLgByN15Ds+eeigqtXmhEe1kIF2v8iJECwBtI0g==
X-Received: by 2002:a05:600c:3b88:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4bb888078a8mr68834865e9.11.1795176623968;
        Fri, 20 Nov 2026 04:10:23 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b205443sm5303137f8f.39.2026.11.20.04.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:10:23 -0800 (PST)
Date: Fri, 20 Nov 2026 13:10:18 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 6/6] man/man7/unix.7: ERRORS: Document EACCES, EAGAIN,
 EMSGSIZE, ENOSPC, and EPERM
Message-ID: <20261120.a29b1072f2f6@gnoack.org>
References: <20261103202136.13574-1-gnoack3000@gmail.com>
 <20261103202136.13574-7-gnoack3000@gmail.com>
 <avuXcN72JjJ7n23S@devuan>
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
In-Reply-To: <avuXcN72JjJ7n23S@devuan>

On Tue, Nov 17, 2026 at 12:53:49AM +0100, Alejandro Colomar wrote:
> > Date: 2026-11-03 21:21:36+0100
> > From: Günther Noack <gnoack3000@gmail.com>
> > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > index 762bf0d1fe08..2163a91514b9 100644
> > --- a/man/man7/unix.7
> > +++ b/man/man7/unix.7
> > @@ -645,9 +645,24 @@ .SS Ioctls
> >  .\" and it may well change, probably best not to document this now.
> >  .SH ERRORS
> >  .TP
> > +.B EACCES
> > +Write permission is denied on the socket file
> > +specified as the remote address to
> > +.BR connect (2)
> > +or
> > +.BR sendto (2)
> > +(see "Pathname socket ownership and permissions", above).
> > +.TP
> >  .B EADDRINUSE
> 
> Changes to EADDRINUSE are not documented in the commit message.

Thanks, I'll add these.

–Günther
