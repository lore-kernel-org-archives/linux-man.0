Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077512;
	b=ifcB8VU7fqC+lyhzH7AmyvIxdYhpy9/ClbWeyd4kWVmFkKGC+xNdXnD4bNvXC7g8KzpP
	 8bYK4CjXlq+YNjEUmrNIHVM3s0yngKB4HO9LSG6I/5sykROogd/uHJeLmiuAmZ/d8SJw+
	 m5SzmvW5+PFCS+t+QO82Mvvi9e7XEUik3hwePt57etHbp584aWA03E6EqLFHdpL/rJlxF
	 nb1P8lcz98ktLYja6dpkM0qrdab2nYK9ZL5ykF9PV3b0H5z5Ftk/8gXNDXLS8k69ZTrfk
	 yf5e+WDKBFWKjjMlv8CZHUMdWribpNrKXStzl5AlPin2iREOwD9RAPCuJLKjf1iKhog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=8+lzZ0gA/v1NjWWAE3Rzc84bY/lTSS7Lo8rgZ64slOY=;
	b=0QALqKjkpxWr858DnKchOAhpdyVLrXwVK7Y8GxMp7y9udcuPoElNi6digTR+yYIRkPYD
	 sWORkNJYSTBxoWjZaG/QUh7PXvLVTsgqmmtuWEuBg1/TWKGE3OfuSKaSWOjVlXcDW46Gu
	 JJ6vBXqiN9iAD2cVjEnQRYytChRFTmhvnDqLr9RYEm+ui+2vxUwgqPMLfegpjVSh7ARLM
	 aSuLz7nnv/hXTgTjAwpaX2U/xggsqlJhihLczWNzcnUfs+i4RzII8fVtrHOy5rnZLLdvV
	 6eV6CijCjUfTtxaGIe9duu5X8vnpsXJCQ553hoOgmKDdZ3oqfHhZtOp9I43Wagt35Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PiEZGt4D;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CA3606A31A
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 05:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8CA3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PiEZGt4D
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89f9fdbabe1so5236037b3a.1
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 22:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793077511; x=1793682311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8+lzZ0gA/v1NjWWAE3Rzc84bY/lTSS7Lo8rgZ64slOY=;
        b=PiEZGt4DZyR9aH9V0LXgSz9uIJ4pbADCPQ8T+G+4tCMzJy8+OcykRyuQbclIYyHkKU
         iLROk99JhxGx707a/VK0yKid4BbFGdiWLN9D/LTWbvNTPS811hZL/ryd99DoEHuk4r9c
         IE/ZQ8QoamtqjmPXxOMBCTUa7goQRKOHt7iHLdfZHdlGtSyIfdq5DZaMVKEGtAueznN5
         SR1tm+Q9bky0+/+m8R4tmiGk1NhIvtYWohfq4D70PdAZ5Iek9eO1VxY75nWzryntycVC
         Htb8li8YGNxXzCNfAKIO42dtvuP1yYR91kuJ4Hi58u/LkFJB6+oXKbdERJes4g4jHqYv
         2i4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793077511; x=1793682311;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+lzZ0gA/v1NjWWAE3Rzc84bY/lTSS7Lo8rgZ64slOY=;
        b=D5xJGk1FxxzwQGRmY01by4DOXWVC5hJQQNDojkplASwX92QeENLsq3zeWhzf6ipd9n
         CIGyThqelAqj1+zJebQxg+0Eh1uj+78vxAifbliroUXuz8hOdOT1PfON2gayR8PqcTUh
         eeTCxg3L5dIYCZi4dCDU9Ud20ADPh0kjoUEzVgN/1BAk4PREPB8pbz5RedGn5urDJFtp
         qO5wKSJfYvZYwmxxgNUHHPk7CqDj4imBYI3470fd0ajxecwaeXwgMz9rgwDo88vCyS9a
         4cQz1bhy7RkdnsSB6EnZhTA1/aV45paXIjArfp6hJE6FNKT136m3vR4mtgEKheskxWer
         v/OA==
X-Forwarded-Encrypted: i=1; AKwUvBwvJiPo9cyFid77iRPtbHvkGHLBYT1fabj+80tCTXcCRcGMHqhfFtYm9FvBkC1FzOvDX6P/JXqCQ/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtvbyw7/hY93tzCm5Hg9CVa07dtSahoO2ZMWuNdAvq//XQ0o7Z
	zpxQGix10g5lq9V1qw9axtqL9U3/SbFUxO++MojqaqpSxY3wEHqJ0v5O3uzPY5hz66o7cvTeAc+
	0Iex4Pg==
X-Received: from pfbbd16.prod.google.com ([2002:a05:6a00:2790:b0:8a5:863d:bb09])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d01:b0:882:fafe:9874
 with SMTP id d2e1a72fcca58-8a368aa1b6emr6844738b3a.31.1793077511012; Mon, 26
 Oct 2026 22:05:11 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:05:10 +0000
In-Reply-To: <20261026.df68852fedeb@gnoack.org>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021212256.27961-1-gnoack3000@gmail.com> <20261021212256.27961-6-gnoack3000@gmail.com>
 <atw7vbZdVk2RJWw6@google.com> <atxr50Vql9s6XW4F@debian> <20261026.df68852fedeb@gnoack.org>
Message-ID: <auAw9u1Ee6mzPZM8@google.com>
Subject: Re: [PATCH 5/7] man/man7/unix.7: SO_PASSSEC: wfix
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2026 23:42:09 +0100, G=C3=BCnther Noack wrote:
> On Sat, Oct 24, 2026 at 10:36:33AM +0200, Alejandro Colomar wrote:
> > > Date: 2026-10-24 05:02:06+0000
> > > From: Kuniyuki Iwashima <kuniyu@google.com>
> > > Patch 4 touches here, why not squash ?
> >=20
> > I prefer not squashing.  It makes the commit messages more specific,
> > which is easier to understand and review in the future.
>=20
> Ack, leaving it unsquashed.

Okay, then

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks
