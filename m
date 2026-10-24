Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792845943;
	b=wVD4UjIIFfJh/KpAMUtOF2IepGRTubwUhfvDbgrsOmgeXDBK5X8nbRpq9FolPCY8zY+g
	 CaAoB3xpKIJZxWed+ddTzEj3FYIUnkifU5SUHaWIKxMFxZ9rTa5yUl7I4H6rDvFa/ICzi
	 6U8YIlQ5KUZLyafvyixMHkDTrkQ0y+VD2PmuW6yREoYBODomYpgDBD9avZxjZgqD0gl/r
	 WCfyWo6hNbIa4bYBSZkAvaGUA5iwUgkNVumx20CHi9fTM9hqesJCTFK4NUMNxz47NOy1B
	 VsRg9ZZN3t5c09ZqDMlnXTuN/LtQnIui9ZJhYpEUPq80+7pJEUvEHnaEyjVnClChtDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792845943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V8NBBg4BrhAyHa8LCJtMhQxIYNCYOhHa3RY3qQdBIHw=;
	b=tPd10VcrdVFCiRFyRQnAdaCvuOtrR+LnJA/hcZO59zSMLcCa2phHEieUEqbE92nr3/WH
	 QhOKZwIai41KWoHRWWnFUO+hd64KkLv+xs6Bw9OY0i2zn3iiHS8J7MkeVP/8pjNNTUcJU
	 0+BtRHPSotNJy3jBwY26twz+qxVP9DjwzupxNTLb+SFJiYHa28BW2wDajYUBgeD+C7v9D
	 fm+zmMQ9VzxxdeISH5r7wp0aTyY1dXiys9xLrqXTW3ti4wCPY0KjfJzcMgOo6e8dRxFE3
	 IoMhAVzSHp543tj9Zz2OCIwkKpEKigZ7cJkXDnoplY4rdXGU5KsxZ85b0v/3XFVY1BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=man7.org;
	spf=pass smtp.mailfrom=man7.org;
	dkim=pass header.d=man7.org header.i=@man7.org header.a=rsa-sha256 header.s=google header.b=Hasn+GRG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A64606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 12:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A64606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=man7.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=man7.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=man7.org header.i=@man7.org header.a=rsa-sha256 header.s=google header.b=Hasn+GRG
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e3b22e971so664226f8f.0
        for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 05:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792845941; cv=none;
        d=google.com; s=arc-20260327;
        b=ou2Lt52mDjMARZ8rQ1/MaGDPlj9/woPU3Ln3QVZu3d/y5WJ4+zcKNVeqtcWlnD3h9a
         yICDj9+u45dzOlF8PXMJ7XNqIW+X87plvA3ciG3xbWy/cm1Is+hrJNJHxRMzQbRlzu8V
         +WbSovJxmsGgILmhyNJzzh0vwl3dusuLM11/TTCEDli3SpIug4qF/5QHpIVUtdnsoTK4
         KnGbYO1iKWBqFglyMP9zHgHwFMu8HDAxz+VrDZWQPHexthUhCcWiuOfCYm9U5Gv0i8I2
         UnC6DWMnfCb6IKRG0+H1cMMnaUGHjMs9QlqNdiEmM77o6F8FbHP/iJNHxvxvmD2cNsO7
         lixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V8NBBg4BrhAyHa8LCJtMhQxIYNCYOhHa3RY3qQdBIHw=;
        fh=8wbL2FTZktRidkWf/U9JYpkWvbP1A6TtP1VhqbdRvu0=;
        b=haQUtySbEuc3ofHmL438Glz+6cIa+enNdTVBOzxzddlw59bMKNXmTi9pf/5tna87uv
         2oPBi73LyEYvE9I8xDe1iLPf7Di7yoCIFt2wsv7I9XgSUJSQ32CI/8zpLzKu55/4gvHP
         dLfnTRBXmTLXY2NHzZvhqDOqmPwIiRsawkd7lK7tSpIMJAbVvU20Og27foHCpaxnoW+3
         ru9Hf7+KkTytrsEajtkn8K9XqOGV2qFDCDnd66CXXFaPDwDxjU/KgWpW9PqwUF5/PUqx
         4rOqnke3pDpnwfRavKXalqCL7K/Md2xnO0vgbZxlvhN91y/1bMAchCOI5wBdufvPPELN
         ajvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=man7.org; s=google; t=1792845941; x=1793450741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V8NBBg4BrhAyHa8LCJtMhQxIYNCYOhHa3RY3qQdBIHw=;
        b=Hasn+GRGqKuwjHK4NG6sX+Kq8HfbnMEinMc3ytK1HbK5ZFybsvgHp5sdGctX0BjflG
         eiU1Rw4R9J+ZawCmag5bYcgcpC/1NZd1XlNcXl2xMdlmJQ9XR0ESZMthGxjiWFqsVA0m
         rt6s7PwkJHFWtVr3qx9erOO3iiU0wHpW0AmslNUbSFpOhAMm9vHaa3Yt09zLZp5C6t1L
         e5ghZm/clzUqIDu23xVgzwGEpJONLNzR2Kft82i8P8SNlFj0tM/IdhYZxnL7Dg+rGdcw
         wzf/trtk7VEgypQuLBNuGZ5bQdgOfZ8o87lyoEzcEhkQRcnD2nV4hSWphWo4sipORn/T
         q20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792845941; x=1793450741;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8NBBg4BrhAyHa8LCJtMhQxIYNCYOhHa3RY3qQdBIHw=;
        b=OyuvWTTCwaD5M3j0Z2JnsNObssUDm/AB4HGD9znHmvngqPHN4qag96uaND5QebslpH
         /Gvqxec7d/bhVy42lBHMFRwkoqTP0ax/z1IQ3kNhcB9D3LhlERWA3ed6q+aJ6yYktu1W
         y/ZuoyaNcLN17dFFNx6EuVyGtFMY10tnoFV3qnZSvhU8xrAgJtuSmHA4XXicK6tB6fgE
         2IFrIi6twV3TRgLZIU2fn6853pGwDC+cY85NYnNHdtbycIhiaPV6/5q004+iiN/o9lZQ
         dNvgbE0cGPzapmkR6/pKrjClB5xDLHhzxRZyjTEyMC1DrHXrm157KNp/jIMn51KB32pt
         gn4g==
X-Forwarded-Encrypted: i=1; AKwUvBycRmTogd025AiCciIexhZuEPDHiTzB4yijvMcYFF8lM5fmH9KgsZgjNPGJFPo5gHsUGlioOCdtG28=@vger.kernel.org
X-Gm-Message-State: AFq9FYJld5UkyRycAUuXNsRqBI9QAkXLwiI6BEhFHrd+rxGm2I9MPely
	BcXOoU3l5u3/UpGreVlQjP4DHPCdugGpY5xJ3bbjHbbV47qWlSMtrNdhnK5AihHbpi1kUU/4zON
	2gij97Zls5IunILoq/pjOnuVgxv1r+6EXdPIoKeuo4w==
X-Gm-Gg: AYBFou371RdOEDEo81Z2BCNjw5tOIvgJVZm/Jg/jeFH0pLJQ5otz0QCLYKBUXAeCJLP
	juJLJWUQiiHaMvxdx8LSIaamNP92uIsSMIBedzbiQhBQNgbm1vsg92Y3jK51WeU6sfDYt7LddpK
	ry/RdYBFWHP06x0+uGZSsySMShWxF2ihHajdKPjo0UONm13Po2yw5NtdOUd8BxYSrBBcQXZ5z4J
	p6VRTVowOxoSZe37r23szR1ODUHdB1zFt1lPNu5L5roPS/ozLOizxVIoAcObIxmILb8K+Ti8KVF
	C07+qYbEKyH6EmeRPYAh+4WeEijf2aZL9lwuATkafEVHvXN5SJKoU/4JKiFMffduL9sQ2ybJBEz
	HgBoKe3LSCfOPZRkFQg7n4n3LyZ3bPgzKKOxitLqVNTRw/MxirQMKuq95ehHj3sIC6SiAGGNquT
	78eSzEteylQrztn/8eeFPFT7RlgHo=
X-Received: by 2002:a05:6000:29d6:b0:48c:43a3:6a74 with SMTP id
 ffacd0b85a97d-48e3eb75e51mr1580132f8f.12.1792845941162; Sat, 24 Oct 2026
 05:45:41 -0700 (PDT)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
 <atpnWiYQzs_HZ1Q7@debian> <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
 <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
In-Reply-To: <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
From: "Michael Kerrisk (man7.org)" <mtk@man7.org>
Date: Sat, 24 Oct 2026 09:45:02 -0300
X-Gm-Features: AclHuK-qsdVGyvW1jvL79Eh5CF3DS6Hb3TIJ1kJSVtelgLbgIceQQ9heTszWRAk
Message-ID: <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
To: Christopher Bazley <chris.bazley.wg14@gmail.com>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, 
	"Carlos O'Donell" <carlos@redhat.com>, "Joseph S. Myers" <josmyers@redhat.com>, 
	Martin Uecker <uecker@tugraz.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Christopher

On Fri, 23 Oct 2026 at 17:51, Christopher Bazley
<chris.bazley.wg14@gmail.com> wrote:
>
> Hi Michael,
>
> On Fri, Oct 23, 2026 at 12:54=E2=80=AFPM Michael Kerrisk (man7.org)
> <mtk@man7.org> wrote:
> >
> > Hello,
> >
> > On Thu, 22 Oct 2026 at 16:54, Alejandro Colomar
> > <alx+linux-man@kernel.org> wrote:
> > >
> > > Hi Chris,
> > >
> > > > Date: 2026-10-22 18:29:31+0100
> > > > From: Christopher Bazley <chris.bazley.wg14@gmail.com>
> ...
> > > > You know your customers better than I do. If they expect GNU C sema=
ntics,
> > > > then it seems reasonable to document those semantics using GNU C sy=
ntax.
> >
> > The customers clearly do NOT expect GNU C syntax.
> >
> > My preference would be the earlier status quo: standard C syntax, with
> > an explanation in the manual page text that explains the relationship
> > between the arguments. The current proposed patch is a compromise: it
> > has the disadvantage of being nonstandard C, but does at least clearly
> > hint at the relationship between the arguments.
>
> I am curious to know what your attitude would be to lesser-known
> standard C syntax.
>
> For example:
>
> int pipe(int pipefd[static 2]);comprehensible
>
> is standard C syntax, and requires the caller to pass a pointer to the
> first of at least 2 array elements, unlike
>
> int pipe(int pipefd[2]);
>
> which has the same semantics in ISO C as
>
> int pipe(int *pipefd);

I was unfamiliar with that syntax, but at least in context it is
immediately understandable, and I so I don't dislike it, And it is
standard C. I really don't think Linux man-pages is the place to
introducing nonstandard, GNU-specific syntax (that people clearly
don't understand).

Cheers,

Michael



--=20
Michael Kerrisk, man7.org Training and Consulting
mtk@man7.org, http://man7.org/training/
"The Linux Programming Interface" -- http://man7.org/tlpi/
