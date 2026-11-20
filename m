Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190374;
	b=4LbrEZKe/w14O1dKJEODmWX74Fi78QpoxyML6rErUYjUp3WTmx7Zecp5eh+6oRq6BINQ
	 PkKiWSQwNml4Pl5tsbvyWBPvSk/ItYg4GewvXMyJ+iVsWw5N0hqkUjQspTDGWLEnK+1k3
	 YMobLCNDQXlDx99lsuVVNgePcAZVbe2GyIxGlIZf/AO/4Yfy8/cPzmylqkdEl8/4Gr3g0
	 NY+xMPTGhXZQCafakol290rtgvRxq2b/0x47kRiWxXebBNAU5ugIm9WonkouKyW23p0HH
	 pfnT/rRFNepe7wacqN55iG5AffalZC7g6ePtInIOJ5IG6QH7bP/dkz6fmUKW7dGKYKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=zfiKNJsSRAVR2o9XGgmFSGR9Gzj/9JFoUEQ6pGThfOQ=;
	b=HPBvhcnhbMrdWYmoWSTDI2jZqCG7QAccJx7vn1016FV2e4+ENCErQU/vmhhQh4UeK+QQ
	 EooUpFRw1CyZ2urwJAxxxz1ajyJza3NPQQpvuxPoeKkW2KQWH5sbbyajr10H+9gREd8rT
	 ETzP8E4A8RHWhswmaMGmOOxzWXAxiOGQCHUGeQucdEbHhYJKo/xE1X0oRFjjprZ6BVakg
	 OhXpNtuWidUBeA9rpueadfqEP44psjc0XzDY/K0QtIM8/woMpLDqBUA4XHRtrZHTdlMDt
	 Lyt02l+lai7pTTQ9uT3r3Y7PQY+lCFxUdl0uoZc1Kdmf98uGKBshGOF75HfMZceAfMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJPww47A;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0400606A325
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 15:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0400606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJPww47A
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso20155075e9.0
        for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 07:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190372; x=1795795172; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zfiKNJsSRAVR2o9XGgmFSGR9Gzj/9JFoUEQ6pGThfOQ=;
        b=ZJPww47AvwV/76TLj+dIhEZONVO6NmLZ6qAlEGZQoKu+h/J3w22kCFAZlHA448ICMw
         VtCsjpnGYyMoXjqfjJockweuduWo0AJCLmo0zlr0uvbtgE+dWIn0Z23L/TFYZwZrqFK9
         mbFIKqKiNjRBq9M4JzaAjzc5M1Edc07yuVnmCO+Jk6SGw+ZCxpUZEQoXRwePEOAQ1WRG
         wnWifAyTL5Lug797C6Ghda/IIT/YTsrB7x+GTFwUSLZigvABpNattuwEd1beR1mlrKBv
         ZLbZBT3ayaLdrwBt01A9vRrJUeisK4HRsB7pnHQOGdLQal6DVn+l4YOztIEcK4aEBvoI
         gi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190372; x=1795795172;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zfiKNJsSRAVR2o9XGgmFSGR9Gzj/9JFoUEQ6pGThfOQ=;
        b=duq3YcAMwgWToUcQB5Ho39auwyc5Aq5dQDd6xc+P7pLYvcO4p1tsHpn3UKdhZ1y4T3
         Uy6tfaRm1Y/nAP3yv/intH6TkRfYpaM8d8Ihx41SQ+5h9fnB9Z1bauqZekRzjzIxnHg3
         yBEDxlI7Q3eqWfFTSXKkZLUDjb0BJmiVeYbX2IAGWoINQ6i3FJBtBXleVRQs2vqSqMVH
         5K2VHvd6hnmXitpJlWyA061udQeydeja7Dcp28jjvhR+LJ3dU0hxfiHXwoevx5ujhqfO
         qJ6Q9WCQFOr8H/WeQEQDLzIV0JCSwhEDhndVR35uDfeyjHxGQ1SZltaZ6vKrrdbeh9y6
         aSIQ==
X-Forwarded-Encrypted: i=1; AL+hErFsatoZQ+vVYQkHkLzndEzuPuAZIBWv45Scw5LFwGgGklO0JbwpCWdrdsBvRQGevPsvZyW4YcckxcQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vYtkqLFwQ2YYdDFSFho4Z4Rri2zoD/dPexgV8rGg4l/O5lMD/
	1j6KWKZIHnzLXoV9noJeVFKgfjxTgDBtNAZZykWwiX2eLikIKZeiaFrUvcvbq7OI
X-Gm-Gg: AYBFou1HzkiJQN7ScsNKzbtzK66ph2yTDuvCApKAuC8Ecy83cuNbHhHobk0iYJEakRu
	ZQiie6BPYYkHUkq4bOewyJktKdnYJDiADtI/ouKo1JK1k4t+waHX9AkHX0iXcr8nPu8xILRDZo/
	OyxvgcyVpRj8NTfwiiEmuvEPNNPmE2/j5LpuJq8UlKT9+r7ChGRgBx6ly0sSktty0ExYw2VsR2P
	M3ItU/5fHNMCjqnUvugceJ/sNmqg8f8gD7Vms/dHhOS+ZCY9DF8HmHuF61T6PBz+9K/jON2L6IN
	Ip0wTsYBTknG7+g1ZpW3OEDNlGzTd6tFPDN4dvDDloy+7SvgEiUrM7XtQ+fallCqjhr2xKKXRnS
	21xuCPWVCf9JsL8VXGhfs0UC/wf/sdHv7AFyMAObgsPHXX+uwvmuqSeNeLmj1NdB2Itu3dHdptd
	Ls3FwxnlHyY0bu8obLcf8/gjmDnRmFzr077KWV+cHPcH8M2RhVcLhpua/Y/N5tBf23mCPAGUo8B
	gSSdh2CPmqZpSzFJZqHjF13Z6N22DNeF1KdxlXyXvBbjEcOzjVwucVv+1wfWIKx+osZ6KtgStT2
	JE1jd5h5yoBp7JbV6N1d2u6/J11BmigBYTVczYHn48AVMhFAJDX72g==
X-Received: by 2002:a05:600c:6dc9:b0:4b9:f90b:1c4d with SMTP id 5b1f17b1804b1-4bb8613950amr88853515e9.5.1795190372220;
        Fri, 20 Nov 2026 07:59:32 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9abf15sm6018975f8f.43.2026.11.20.07.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:59:31 -0800 (PST)
Date: Fri, 20 Nov 2026 16:59:26 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH v2 6/8] man/man7/unix.7: Document SO_PASSPIDFD,
 SO_PEERPIDFD, and SCM_PIDFD
Message-ID: <20261120.a284167287ae@gnoack.org>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-7-gnoack3000@gmail.com>
 <20261118-schnorren-apotheke-markant-b8178cac4a9b@brauner>
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
In-Reply-To: <20261118-schnorren-apotheke-markant-b8178cac4a9b@brauner>

On Wed, Nov 18, 2026 at 05:24:53PM +0100, Christian Brauner wrote:
> On Tue, Nov 03, 2026 at 09:22:08PM +0100, Günther Noack wrote:
> > These were added in linux.git 5e2ff6704a27 (2023-06-12; "scm: add
> > SO_PASSPIDFD and SCM_PIDFD") and 7b26952a91cf (2023-06-12; "net: core:
> > add getsockopt SO_PEERPIDFD"), both in Linux 6.5.
> 
> Looks good.
> 
> Since 7.4 there's also SO_PASSPIDFD_THREAD, SO_PEERPIDFD_THREAD and
> SCM_PIDFD_THREAD which hand out a thread pidfd (PIDFD_THREAD) instead
> of one for the thread-group leader. Would be nice to document those as
> well. Either here or in a follow-up.
> 
> Nit: if there's no sender pid no SCM_PIDFD message is generated at all.
> 
> Acked-by: Christian Brauner (Amutable) <brauner@kernel.org>

Thanks for the review!

Regarding the *_THREAD variants, they are intentionally left out here,
because 7.4 is not final yet and so that change can only go later.  I
would also like more complete documentation, but ultimately,
documentation needs to be written by the feature authors so that it
can stay up to date.


Regarding the potentially missing SCM_PIDFD message, in my
understanding, the scenarios where this can happen are:

* When the message was sent before SO_PASSPIDFD was enabled.
* When recvmsg() on a stream socket returns 0 (EOF).

Is that correct?  I am not sure whether these corner cases are in
scope for this documentation fix, and I am not sure I have the
complete picture here. (Are there missing other cases? Does it also
affect other process-identifying SCM_* rights?)

For now, I'd lean to soften the wording about "in each subsequently
received message" to "in subsequently received messages".

Thanks,
–Günther
