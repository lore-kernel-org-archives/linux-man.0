Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE997318146
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792334463; cv=none; b=RSymsfWymMdTcUybopmfW4cRLwMt2Y4oZKRCu9HPigl3QBmE5VV5Hr6PIsOfWx+5JQ4q3jBEs38jdU9RTRogx5/e3yMgZP/XQCm/ezEJJ+NgQLIwLdjHsk775jxygbqZAvg0YELPG87IFsXdSThUy+GLIP12bzQV6XOkO35S908=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792334463; c=relaxed/simple;
	bh=RkK7FefDaczfaKkIzUaO3j0/+SktyUXVJiD4MFuFbnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyhEnfb4C+4Fnt1nJ4KEaGuTZrmfO7d4zz5l6o2tbB7m8dv2LIjG7/dzW4hlP2+97tJ0ihy0yQKA7sulPwBf5C0MouShoG85FOzdrPBIlNwpcfNaOv6g1bdIxRZBw7EjoBwdMajOBiwmZBKgBLcpfkp0HHcQf9kS9rHAA/Bdiuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGVB0dw2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGVB0dw2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso14644165e9.0
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 07:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792334460; x=1792939260; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+4HE2x8SbXf/wvBG2j9ORc9A7Ltzq6esL8xqJFjdg0=;
        b=PGVB0dw2JnjmJ1sXgF+WnfSsddZgXdpLpJFnczIcYKTJvpGnFKrBKLg1xwv9IRRURH
         VoFRqsWay+g9VuBZIJGQw8Hszh8XsEWwBBq2XayT4JUed8o5CmQ81kCaiuuYR7AI3D5Z
         9Qi4cd75edKg/WmaIftCtraZsq1EsKRWIPYUNJc11JEgiLS77pfoUNgTgzKg1+pYQxuA
         psi5z1liw0WnkTXSev1p9NPzP625vx20z9hMXgJ0+Z6M0eoiGXnbR+aJmztvREEAxAFv
         UvWnVjKWMvBXPeiyftUioR+n85EU97muSM2nTpoBJ7t1PpTG8oiC7I6xTxHK/Slte4rW
         nEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792334460; x=1792939260;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U+4HE2x8SbXf/wvBG2j9ORc9A7Ltzq6esL8xqJFjdg0=;
        b=hjOcG7NWlUv13jQQZEyvuy5W7rYomOYftbRo9oTzucLs3HEREJmlnRqKrPKcRY0VHa
         UV3KlwoguGbXTDrkgUsKPci1vOi01K4UUtAQJxfT8HGqxr0DVNdXqDpSH0YrD1SoiEE6
         CjpUGhrQBayZyvbqVUfpLpfrZ5fWH1YisWmQtEnEvBQicRlM9pqD/i3nQBHmKcdPxVyu
         8eGxZntqqQnJsmtPkHXhE9zs02HBjcVK01mseWxp89nnMcFsZZRfvP34v+Un65QRsUjm
         RQhJDfU/jaW7p3wXJCL7zXCDnO/wOhfH1HvJnleUZd0Wd/lvjmnqvtpEJaeyxsfEUJI4
         fKKw==
X-Gm-Message-State: AFq9FYLIxWDrYGXqN8K2XuNCuywK9sPlEiWeBEPoo+qce6TuCcyLrskB
	Kl8FauwG6CSt6yLK7MnBPz/H4QKbN2ai1Ejiq438k0f+zd5uvWjn22mM
X-Gm-Gg: AYBFou3CF+iiEcLHFM3P1XY+9bV9gkvuYWQEYcLLTfxMmHrBs9YL2jb7Y5bRL8u30O9
	OjDAFo+v62jvSqvPbNDL2cyUBrzSaZCPGQ310tf7M8riag0Wqrn3tip9uEvzi+F0hOQiG8YeZeZ
	cXk2I+p4GXpM0AbSqMBkkPf0p1y+Dnr1JsQJC3gQPcADqSjKJRVGTzgAHVvbcn6EgbZuKk03LKh
	NAIKKkNlDBHeGT1tLGZ3B6A0xNrXs3whjZ5u6ndT3VmtZSNag988UADjIgh1C9Ec5iBDvIuhStd
	fZxfYAvgLL/GSKYqjUWPUxz7Gy9lEW0hlGU6hHIsZHEAxW8yQi/Q+ruonynReOQs04VVq1H6psr
	kZIgNeOXmSGReaTtKgeDxR+llvTObvsj8eJp+E0vYqyOnd1EQlF5VQoZURIj5sIqYO9lTxRTntL
	ssrU17w91Cx0sJZ6XBDLO70feelU+LfDdNOvvPyAt+XHDvtX7kRwmFz3Jj5H2SvM/P06QvuZNAl
	5cfgD2Gdxm4dHjMJLaPHdM=
X-Received: by 2002:a05:600c:a102:b0:4a1:bc14:224b with SMTP id 5b1f17b1804b1-4a1c66b37cfmr162621915e9.10.1792334459890;
        Sun, 18 Oct 2026 07:40:59 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5035bbsm17060325f8f.44.2026.10.18.07.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:40:59 -0700 (PDT)
Date: Sun, 18 Oct 2026 16:40:53 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 06/24] man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol
 0 is also accepted
Message-ID: <20261018.fddfdfcb83bf@gnoack.org>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-7-gnoack3000@gmail.com>
 <atSqLSOUOfSB8lFn@debian>
 <20261018.221f6e5361f0@gnoack.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261018.221f6e5361f0@gnoack.org>

On Sun, Oct 18, 2026 at 02:37:49PM +0200, Günther Noack wrote:
> On Sun, Oct 18, 2026 at 01:19:34PM +0200, Alejandro Colomar wrote:
> > Hi,
> > 
> > > Date: 2026-10-16 19:31:21+0200
> > > From: Günther Noack <gnoack3000@gmail.com>
> > >
> > > unix_create() in linux.git net/unix/af_unix.c only fails if
> > > 'protocol && protocol != PF_UNIX'.  0 is the usual value, and the one
> > > used in the SYNOPSIS.
> > 
> > The commit message seems bogus.  What does that 'only' intend to mean?
> > The actual diff seems better than the commit message, but I'm not taking
> > it.  This is an example of the nonsense produced by LLMs.  I'm NAKing
> > the remainders of the patch set; that is, for patches 06..24/24:
> > 
> > 	Nacked-by: Alejandro Colomar <alx@kernel.org>
> > 
> > The exception for LLM use is explicitly terminated.
> 
> The commit message may be short, but it is factually correct: The
> referenced unix_create() function starts with this guard at the
> beginning:
> 
>   if (protocol && protocol != PF_UNIX)
>   	return -EPROTONOSUPPORT;
> 
> It rejects the creation with EPROTONOSUPPORT (only) if the condition
> "protocol && protocol != PF_UNIX) is met.  That is, protocol must be
> either 0, or it must be PF_UNIX (a.k.a. AF_UNIX) to pass the check.

To answer your question about "only" more directly:

The existing man page makes it sound as if the error was returned in
the case where protocol != AF_UNIX.

But in the implementation, the error does get returned when

  protocol != 0  *and*  protocol != AF_UNIX.

That is a more restrictive condition under which the error is
returned, thus the commit message says that it is "only".

–Günther
