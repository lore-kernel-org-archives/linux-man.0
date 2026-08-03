Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BCC426D19
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 17:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779932; cv=pass; b=AKDClVfN+b4TfYmyn+fLh4Y35QvMi/e6gRoOby1rRvLE/CJ/OKfw93TxvK08VPjwj+9oLOTJEx5MFa8UODYG33x/07/PWbkkFKmwtRUoVVZ2Sx7nrflUEr3tuF6NRT4onhWzagiRxZH+470P07CyBhJP9l/J1hBpjSqpm6TMWq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779932; c=relaxed/simple;
	bh=WFodYirg7FxM9JUGmAWkkleSDdLKOtrgBQfgnlLk+zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIb1B5pOoUW7OmLeBxE78DpnYxvfZHnigJ9EQjN9GRq8GFvKbMMgmuoZql8t4/TFOgfIrq/FT+t76TPKK/UuVzHTuS0sDmfPzzJDvaSOPboUeMWntoDMiE1qGojhIsJq6d3uDHpWEdcyyNmdiQqcla/wRsR6/cospWWzuz1YVYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=altmBSHW; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="altmBSHW"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39fa5e3a428so1523411fa.1
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 10:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785779928; cv=none;
        d=google.com; s=arc-20260327;
        b=RKMd0hxB52ysiCFpOTJT7rHT/FEaAA1ToBLuRMi5xDZ8cisvukKzp3b+ddBEFMcU38
         oa7QjBnRIEk8Ew1EJidX4p3Cv85AWsqdNiUDWzEBP4y0sfqXaB8rDEp9yCQo6UA6pDmo
         N+bQTrCasMa1ot20c2+UHorj1gmSG5bHpMSX/6mAkPvX3vaqj+Ozfqm+Aps+dGoElXqX
         5jgxqm+O8ASVVhhsPGcw6eBs2nVjvCzTPh0IhMLfCoydRIDmKVJiEPbd/sEnxXy4nucc
         J4taK+Kz8sZ+fJT2mMuYR25+n/XiHpMZNOZXUS5N03sD2PvSpDiaK1bRcDks8pHJTdFE
         +9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=29/wujsvr81tXAXcj/jsWIiP6fY4Zj141ZS/rGD+Wik=;
        fh=wOeAAQhpDwG1vp+OPVultw3EIwPQzowT4/5r2OSjNwo=;
        b=KQ12GCoui2DSQo14U1lICUgXWqhWP2EAd/bgjgmpcHJCo1ItergjOBw7v9l3/h/h3f
         8r0JcCcyxVBfLvHOD2ZeIBNnLbHYxvBTd2XYHk/xG8QQ4cnB1YnFsSW52VmdQmJc3J0N
         L9XUmsTZ4DYY8Gx9vLyGgAYaarNf8aXMN3d3tOUivY2cqBaAUmtCnLG2bfM2R7webpk6
         lobSytnHVVq1UNkLmf38FXMR5QLhSiWVePEXae+CymV46ipElaVlN/7cm1hJTF+iefGW
         K30zxPY8jDqYJMAVgAtMZtdxHjJ8HE78s+6C35Br5/P3tJueb1Zu4OQo9smRfn8YtgZ0
         NeIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785779928; x=1786384728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=29/wujsvr81tXAXcj/jsWIiP6fY4Zj141ZS/rGD+Wik=;
        b=altmBSHWrNUvBVMGjQoidGh7nDTEDfa4hmYGIBbDYXWhFyD3BSuTbe69x4a8YeU9HB
         fP8kGMP3aTNDVQ4uFZgmlSNQMebrPmFDjfyeu36w025Ggr9lNoXQr549XwRFzZUYnYbm
         P3Xn4QN9258aORpJqBerO/beuhQ761yZsC6rCek1JnApWkc6ziUkFTh9alpuhqe4rQka
         xNprg+uAcxffgqRj7SyDR5YVCs8P23RF5/eNmNotS/S3reDA4CkkBbIY+F+UXXkptfx5
         ZaCio4j9ySMG/A9Lp89Q0iFwHhKCSj9TN/JBLY0RExzf0+5gdO+vmvZoEdMAQsCbbt6B
         c5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785779928; x=1786384728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=29/wujsvr81tXAXcj/jsWIiP6fY4Zj141ZS/rGD+Wik=;
        b=tJ0HaSi+BlXXzBFTz1tySOUmB8oGsTtvSHuSh+4YIF3iIPsNumYy+0YOQgtj4PTr3P
         LTY8LMdwH9NNbTGsCoentIR2bPOTNe67AX6GbSm9yMrMdx5UK0bv6T3wm5VbbfO1FmwK
         A8d6I2UnQUeX0AGaFfupefAhtu1In1KCXp1Ft8c/u9MLIj4KoiLjf89IQUHUt3VIeGTx
         TKnsRPUvIYtjfCE5zjHdYIozILWGKhpOU20B1qvUziqxoqaVNBk9Ka2ZFBuQ5a5m9osk
         y6RhTXmEcH+T3D0qwNP2aMz2gt831oHeDhD6dknNZRMqe6KyCNAy1e/FaROg3tzNhWcG
         18GA==
X-Forwarded-Encrypted: i=1; AHgh+RpXwIwL/E3xOWmrDIpc7X8MXLC9YjaVYmtqE1TzsUVM5ky9zczyifOzRP4HdX5o5OgyTIzE5hYAAuY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvb/ae1m7hB0VnyhnrLsICtZl/BUzbAgi52QmKT7d8mi0VO/gC
	upu/f69yB1FttWOIBU6WxVYFXgtq+6nRo589mfrO8rZnbfQlf330OQ6KoGqn1JsRdXGLOonX/qF
	TiXcMRC4hgeMimGQeQtgI3WjoXsdjqsTN4g==
X-Gm-Gg: AR+sD12H6RNxfyMvDyBgPFziFWXD/Au2Dsp8PqndMx/TEIu45WD4EidK/OHKZN8nj0t
	dB9eCs6H+AHtU6OgpnBoTQnDE61KeaNNqsl4t6Gux86SPtmU8SWTro+MhksN7AvVNcGhHcjupzq
	AHrEOBneiokLF3XaBhdM9akO97OST2U5m8AgGydBnetroZHtYNhzjtLeMmOej8C59JDtHlm+UIm
	+oS/PiISotl1NGYc8jzB2Ly7ySsmcX8CJkKqGOVpw/hHI2wZqhhOA0sBHS/Acucu/sLCK9p+Bqp
	tMOgflPP1M2UQdw+Z7SEL9R6jYdZCIN8mXdRnfPFkyNQQ4pAm+fI4lMEElycxOUoIiXsu1Oz7mo
	=
X-Received: by 2002:a2e:a987:0:b0:39b:11f9:6132 with SMTP id
 38308e7fff4ca-39fae643fcamr941811fa.1.1785779928280; Mon, 03 Aug 2026
 10:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <am3XeGZyi1Pvr77-@devuan> <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan> <87zez5bz49.fsf@gentoo.org> <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan> <am5_uA4MSujYCS9X@devuan> <20260801235332.vc443gozbqkqdqm5@illithid>
 <am6HTtAMkEEkWjfl@devuan> <am_jYJL6uAapMGXN@devuan>
In-Reply-To: <am_jYJL6uAapMGXN@devuan>
From: Mark Harris <mark.hsj@gmail.com>
Date: Mon, 3 Aug 2026 10:58:35 -0700
X-Gm-Features: AUfX_mxBHKdhh9koysm98PpDB2cL9pOuILjrvHQWp6wuGklrC65pzQgTwrN_3nk
Message-ID: <CAMdZqKGRJuR_Jyt7TapMQFQ-6wz=OF5DROFhXkZLQNAn2vyimQ@mail.gmail.com>
Subject: Re: proposed revision to memory.h(3head)
To: Alejandro Colomar <alx@kernel.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, Keith Bostic <keith@bostic.com>, 
	linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alejandro Colomar wrote:
>              Most C libraries, including the  BSDs,  glibc,  and  musl,
>              provide <memory.h>.
>
>              Illumos  and  gnulib don=E2=80=99t provide it, though, and i=
nstead
>              use <string.h>.

I don't understand why you claim that illumos does not provide a
memory.h.  It clearly does:
https://github.com/illumos/illumos-gate/blob/master/usr/src/head/memory.h

However, it only declares the 5 functions that were historically
declared there: memccpy(), memchr(), memcmp(), memcpy(), and memset().
Including memory.h is not going to pull in declarations of functions
that have always been defined as being in string.h, such as the
strn*() functions.

This matches what was found in SVR4, the first System V release that
was fully unified with standard C and claimed compatibility, and which
was the basis for many commercial Unix systems.  For backward
compatibility SVR4 retained memory.h with the 5 original mem*()
declarations, and those declarations were duplicated in string.h for
standard C conformance.  They did not even add memmove() to memory.h;
it was only added to string.h where the standards committee added it.

Also in 4.3 BSD, when they added memory.h for System V compatibility
in 1986, it only declared the 5 original mem*() functions.  It did not
include string.h or declare any str*() or strn*() functions.

So I think you will find that a lot of systems that were following
System V or 4.3 BSD may have a memory.h, but it is not going to work
the way you are suggesting in the man page.

> > New programmers will follow those
> > instructions and find their code breaks on illumos, when it really
> > shouldn't.
>
> I hope Illumos adds <memory.h>.  Also, I don't expect new programmers to
> be exactly the kind of programmers that use Illumos.

What operating system do you think is most used by new programmers?
You are right that it isn't illumos; it is Microsoft Windows.  I'm no
Windows expert, so perhaps someone else can confirm, but it appears
that Microsoft's C runtime also has a memory.h that declares some
functions like memcpy(), but not any strn*() functions which have
always been defined to be in string.h.  If it's not even in ISO C I
doubt you will have much luck convincing Microsoft to add the
functions that you decided should be in memory.h.

Suppose I was reviewing some code intended to be portable, that
included memory.h for a function that ISO C and POSIX say is declared
in string.h and that isn't even one of the 5 original mem*()
functions.  Even if memory.h works on the author's system, it is by
accident.  Using the standard string.h header that almost every
implementation for decades has strived to comply with avoids easily
preventable build failures when attempting to build the code
elsewhere.  So I would of course reject the code and point the author
at the ISO C or POSIX standard.  Perhaps you wouldn't because you are
willing to fight the other operating systems that don't provide the
nonstandard memory.h that you prefer, but I am not willing to do that
and I doubt there are many people willing to take up that fight for
you without a large standards body like ISO C or POSIX backing them
up.  I don't want to tell people that the man pages cannot be trusted
for accurate information, so I hope that you will not lead me to do
that just to avoid the introduction of non-portable code that will
cause problems on conforming implementations.


 - Mark
