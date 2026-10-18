Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC7E4D2EDB
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 15:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792337332; cv=none; b=olhapt8iLvs+mOoCf0zAdy5ugj3OlLNqysNQHlNJ6cnRrX9Jeb8mcB2HwJoqbxOdt01pOBaYWAgDtHmyHN6nDkGWfzf5VmgppVVdBDDYHUueZOuojd/4wvXXCAG1XyHlCFUM1Y49eGJTsnSQeLsRn53YBLa1UKm08pPs/ShftdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792337332; c=relaxed/simple;
	bh=YFj5pAKdG26k4QuzpkqPEtWcl44UC8AYNMRslIYRdrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqRwmXxDKgDJW6hDA2l8oQGzlwtqQeuVCJLd+m6HrL3boOa5mhVs5euUKzd18yZ4XoOdBIx4WAhER/mkjrUkFJNuqcWz3qonvBc/6CrHKdcUyoq+nDkBqbmMsRHJ7CGbipVYrGc88wajHHYp60Tnn68s+1fBTIfz71UC9adeG6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJirA9xm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJirA9xm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso14151375e9.0
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792337327; x=1792942127; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipMSvyrq2sQsHPpv27leY6Ntj8WMnGo9hVM53KiQ/FM=;
        b=rJirA9xmPLrS7h9UwshXL7l4w+KVVgm2hYg8bEjJDeDPVPFrE2tXfCGC5kZKAld5Yn
         vZ2w+H3zAbFsVN64eR40/efeABLmHrklzgJMS1dEm+cBnWdMSZXNR4ZOrmqbRXA1opJa
         9NU9b5Qt4QUIBz/ri1iJbYp+nHIadIX/lTNbdCjHTVHe9lD4UMKNvZGagcTE2aSuoWmO
         WgNvuSyYceYT8BXda4tFmCY3/35jaUFeC45eaaynXz3QroZE1UVWCobEhlgoPrQeolfD
         BRYhAkXuxUVtg1bJh+qVbiXI/N177QWaii2VQTqDoDX0IxZ7IVbJliVq+kOjAaPcInlR
         CPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792337327; x=1792942127;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ipMSvyrq2sQsHPpv27leY6Ntj8WMnGo9hVM53KiQ/FM=;
        b=YsIg+KqjLgtoaAtAuon8bnHzaU2NcCjtr9IaDWGDayeuPG8MKj/+hGub7ZD63WevNN
         tb0y23V9LOtE8VArzR2j/zrb5Lb2SEIScegp0iAFiOClkRifsWw5467ZLNiT5fXSE13+
         iLmLf8bHqZVcgV7/Jt8p2jNIDfPVgfOeUVuOP8GtxvuOO0MgQdpiaLXBybfd3ZAc7UgG
         8PFPNTjF34QtP80ef23xymP8opGXt/kc0vjdC17VuZ0SYqPsjp1UhMoLg3cJXPJycJJc
         w8FT1f2ZYtIBQE2OBzjNVfvPcsMF6bQEIDOd5yy8QjOtYmnrAQ4z9NrRlrHpZfSiWNWv
         WM/Q==
X-Gm-Message-State: AFq9FYJYDchYfXH4rbDRQdxQ+8PpnWwW07VDDrxVBPm1VuLNpYqijQ+a
	48ZzUNqN4ibE7vLBA4UCSgcTP5WhfZc9WYG9FYARpdeiuD19QVwcTzmHoECgel0a
X-Gm-Gg: AYBFou3WxmF83BsbiutyHapVM3kDNN13H3bCw72/N16u/Sxy078fvAEevph5zMwZoHI
	kcWfYRrCWjy3pgTjHmJj17wnjiADH+v8fdfYypWps4juCrdbpEyVQWHefR+oDQOZvqHxNuPq3xp
	siTQqwEc2aFKHSopjFcxoEs7nTo1oPlugiaQakoOodIWoteLjTIV/Gw9ej9FP+mixXWvpqSMSt+
	7xMyja42ljn6huCSO6C4AhXPUXp2Wi38OErMao2yvmZF2q9rghXe/n4izZCsWo30qYtNWj6JQ25
	vDJj1aOzq/k7xtKk6U9eXcfZy5eToSXP2utEAZv96uvVbwESb+yyKrYU9WKBYswiQE1vp+yBnGy
	RKitOJJY5MjwUjtZumq50h5Rjg2/nXl7a7u8593YGLttMu3WTEdIFaOtD0WCXeQweu3NrUqWUCo
	rHxzszq5o9JD7IzJ6TxSNUdwTJCRdtdiS/mLfBKRLMevpcLZvKOGk+Kqq7gVfWaavIdFupSOrg1
	WUdky934mft7dWPHBPdYdc=
X-Received: by 2002:a05:600c:c87:b0:4a1:bc6e:2f4 with SMTP id 5b1f17b1804b1-4a1d74659c7mr108099335e9.0.1792337327295;
        Sun, 18 Oct 2026 08:28:47 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfdc4eecasm17048652f8f.13.2026.10.18.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:28:46 -0700 (PDT)
Date: Sun, 18 Oct 2026 17:28:32 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 05/24] man/man7/sock_diag.7: udiag_wqueue: This is memory
 in use, not memory available
Message-ID: <20261018.d480454bf705@gnoack.org>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-6-gnoack3000@gmail.com>
 <atSpPVxVogMvzL2t@debian>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atSpPVxVogMvzL2t@debian>

Hello!

On Sun, Oct 18, 2026 at 01:13:26PM +0200, Alejandro Colomar wrote:
> > Date: 2026-10-16 19:31:20+0200
> > From: Günther Noack <gnoack3000@gmail.com>
> >
> > For non-listening sockets, sk_diag_show_rqlen() in linux.git
> > net/unix/diag.c sets udiag_wqueue to unix_outq_len(), which returns
> > sk_wmem_alloc_get(): the send-buffer memory currently charged to queued
> > outgoing data.  The value grows as data is queued; it is not the amount
> > of space remaining.
> > 
> > Fixes: 4f6a0a4a (2016-12-07; "sock_diag.7: New page documenting NETLINK_SOCK_DIAG interface")
> > Assisted-by: LLM
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> > 
> > Notes:
> >     Verified in kernel code; the udiag_wqueue field does indeed have these
> >     different semantics -- it's the data already sent, which is still
> >     stuck in the output queue, not the maximum size of the output queue.
> 
> Not trivial enough for me.  Please CC the original authors and also make
> it more obviously correct.  It might help showing snippets of the
> relevant kernel code.

Sounds good, I'll reword the commit message and try to clarify.

sk_wmem_alloc_get() returns refcount_read(sk->sk_wmem_alloc).  This
field of struct sock has the following documentation:

    @sk_wmem_alloc: transmit queue bytes committed

So in my reading, it's the bytes already committed to the transmit queue.

Both the function and the field documentation are in include/net/sock.h

–Günther
