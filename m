Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190535;
	b=Ef5u6V/nSXTECx3OLb7CuqMezSa2AOciOPVJurY1h9MMpNLv1twchuXhUs0/O0bAFHc5
	 bNMLVlW2vqReimqFCxcKOTVOvRayw13AirV30C305KZHD1GKdoX1MdsTQ9ty/cwsQDYEx
	 WQm514xnseySw6YD4trLHpezhVBdkZl9/fc5VkvgLmuxdj34/YM+ZZ68+TYADCc3TmBzL
	 JbU4It443NYfnk4fY4DcHC3D6m5SgCHrUKadi8Uo/n6IMQqM3WjxQqTSG25sP+4RP3k+H
	 hPj+nTWba4lI8nYV0B39o4R831e1j39Ep3t6X4Nz7bqkV0XQ1fTTCXwlMFs4edKpkmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=BoNGsT1gLBLJ4wIln8rqxMNsDmtJTJkfS+MF0YRthII=;
	b=Q8ZqoDf74FkQnEYg8C6Zkj52j+orQUlRDZ3rH5PU/NgtZn0BA2w7tIgk2pgMn6iI0jYu
	 yNvv5IhqUqfQP1328tciyQNtBa5RVyhe2aQUVzM+kY8HjauKNpDhuCPZaVxEOobEwWmtt
	 vaMPYhjGPMOlYPVpPEZ6c8HzQlNaQBJpOkUMdurLjGHXGL4Wbgmg18lGwaTktja9+tFG9
	 RCi3PTLGlg2HD/puCBBZCqNYHDiFBdILMFjSrMBd5Cgs8NCZdaymOmHVq3AiZRoH7MLC6
	 Ix0JH48wR/meI8tLIUUtEFe+8ZJYbuubx7+mn8PTiGjBmflHZgIeNruAqNzJG5vlyGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4TWOpZP;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25789606A339
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 16:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25789606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4TWOpZP
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50cc7540b7so153634266b.0
        for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 08:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190533; x=1795795333; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BoNGsT1gLBLJ4wIln8rqxMNsDmtJTJkfS+MF0YRthII=;
        b=z4TWOpZPAF+ATaDiKzxq5hXMxPjMaFXzHr7Fxpo7/tobT8LRQxK2THOYQ2hwpORpZm
         PaXs/pLIz9YDDTykR83Eb/wFFY5XUplJFCDNwcJDH3SSsWE93+g76aljIxHTgFYVHq5d
         sCD3pAoxcMIPtAmqEztHFKEm6gZuFTyPH12/mwh7LLC7RGmpESGsY8uATY5DDcDHq1g2
         CBhf/RiwuJaV04Xw+OksN8/MWdZgzo60QBDMq8HPxAn9+A4a8kjtFVmcX3S9Cb8TQXka
         gQRVw4Axl5VoQtkSqJsIS4mzXCvzSQhnUl8JCTyZSkNlQWa/3Vs3h1ce6Ebr1j16Prdl
         nymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190533; x=1795795333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BoNGsT1gLBLJ4wIln8rqxMNsDmtJTJkfS+MF0YRthII=;
        b=v5d4XTnKt+UrSj1n60NjuJEwZEXikfC1DXRPPZVTfpra51bLRl36BUTJfgEKQKjtaz
         2BIuENnlzDKsTU2OU7oobTFTLyw7jxtm3Le9y2Sw1/OOmpiSt8vGeddjbDrSx8czZZKt
         Fp7cLajY7vLs7W7yCYmjvfPWyPYXMZQ8cllCA9KfrP9rVlli39eGwraQXRksZ1LtYA4h
         l+JOjwKBznMOwnWi2XMLfFqhutusWjfVfkhsg7dtJEjc4xTG0iOlq/bXO3XydHU8n6aw
         ZCvZuxxjlaupKvynxnhjpJP/iQ1iuh0fdCyCgGE0AAUYGIiy03ZzxAQhsTb3FoiBP3P4
         Hktg==
X-Forwarded-Encrypted: i=1; AL+hErEqVU3gvLmjtr6rx3W0bFwelISruzmVNQCNzs4sYRd8vmi7vI8VPUu1xmilbO2jGJ2ubvvxYhUKuPw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8onMDLSHiUlEjbx2429rg8qJMfNmvI+aJg75FzHblPBG1UyljS
	4VPyqEybzMYgvhPFNBzwfT7XePfWlkaj2otib7hJ9AirLfx2Cu6oNLBM
X-Gm-Gg: AYBFou3rcrtduCRxdc7k2S14zZ7rW7pwbxUYuGWKRZTslcYtzaD+RcsVt5HtljrPt93
	PEjFyjxpLuFMP7CDq4wuZh6cIYcSb4O2vPapV80HR0wHOX/O9Saxo+2dMuUGDBc05QYbHtJAk/k
	h3lPWVwi+tKp8LPqHUcI9iKNKpEVoUhlShKGpim6j4uFadnYMOXobJ4sVKFPY1zPODGjopI/2xu
	1YQDANMb4AleZQe56Xw8fWMp4G5FKvT6/ziFruRicSq3vQ1PM5tsCiWgCKFsYCz9u+/LG7Bu9VT
	+56Ah6sJAfZYr60U4RrA7PD9nCbPZwIg0xu1ruaYHQQ+INp1WkVPg++H7r4Y/lTdoEU2yumnl9b
	G3JTweIMosmoVKvBmXm+nFbb0h0dtsc4STQyRFfYUNRULQQV6FaemPfbIkTGE2xsqd7rKdLq0BQ
	CF7W/vVrFmSiUpl4rw1U5pvf6MKTgiqSF0G1+FbArZKflOuEOp0k8vRYIrrX5CVo05wqNfgAoMQ
	lHmNMsTv7FyyP/LlGyfmbGMS/aAggYfVNT6ILMNSXmOfJRCV838Z3SYgFgurcXDDmF6CquHGq+I
	x8GJIu8F6Q5JQ8bX7MRu2VoWR4GzF1yTURiqQPYSWCCMjO1ToGokfQ==
X-Received: by 2002:a17:906:b04c:b0:c48:1977:e1c3 with SMTP id a640c23a62f3a-c513a818864mr293876966b.21.1795190533285;
        Fri, 20 Nov 2026 08:02:13 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm112007866b.63.2026.11.20.08.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:02:13 -0800 (PST)
Date: Fri, 20 Nov 2026 17:02:11 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 0/8] unix.7: Socket Options and SCM_* fixes
Message-ID: <20261120.7a54b14f6ad9@gnoack.org>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <av-HtwHXlZBTpzZc@devuan>
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
In-Reply-To: <av-HtwHXlZBTpzZc@devuan>

Hello!

On Fri, Nov 20, 2026 at 12:37:03AM +0100, Alejandro Colomar wrote:
> > Date: 2026-11-03 21:22:02+0100
> > From: Günther Noack <gnoack3000@gmail.com>
> >
> > Hello!
> > 
> > This is patch set (B) spun off from the "Documentation fixes in
> > unix(7)" patch set [1], which is now split into these three parts:
> > 
> >  (A) Miscellaneous fixes, mostly in unix.7, one in socket.7
> >  (B) Socket options and Socket-level Control Messages (SCM_*) <-- this one
> >  (C) sock_diag.7
> 
> Would you mind rebasing and sending a revised patch set?
> There are some patches which I'd like to apply, but they don't apply
> cleanly.
> 
> There's also some patches which I haven't applied yet (I commented on
> them).

Thanks for your reviews on these!

Yes, I am just on it :)

–Günther
