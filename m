Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793299760;
	b=z+YrAuJsc4wtZ+JHhwTE092CMS8nFKBIjPhey+oiDklOlokVkNRAA7Mf+Tw5ZoVgoHTG
	 JMasz3keWT0/IcNpOFX+lSAnTPE3oMNwEnZQPFm6xKXjjebvDmz984Xt0r6PZE0npEdnf
	 KI2UVoBwbDS+Rbxov9GyzQyFsa6tGokvxXiF9e6kOtPRbJ3w6DSrCTF1uriHBRF2Ra6gM
	 BIGLJauz654xijVqtlkRiJOB5Owz0gKbw+Cva2Tq0il1AAKD3zjFQmBS4aoSgXGoHrPxk
	 82f9rhlSTDws2kMKlqDEREnyYqwUl0BW4m+o9cioibLmhOEGlXetE6FxPxSLYGtq5Wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=bK/ddHg8c6mFo+2nMFhFeeAud+Xm375QeAsb6wqVN6w=;
	b=bb41RvEcwMZiEzW4lWeoeY5d3N9yMMWEDb6cZSWaSAMzyS+uDQWXm9c0x9S3yn3AE1Pk
	 Vv+Ia6eXXLyoK6cEDxzuyeblMW0ABBmrR1l9BYtdAxveyOc/iyEg6T2le8VqVgNF/xiQ/
	 7TyrsYoL74e/0fNN9AVA0NybH6Dconuh0b343iXInnm3aYMy9O8VXcStojJIZQcapfngZ
	 DUEQKpyJ6xrTeMvM2YKOOOzCAo3fVmodmr0egWcZKTntSupiBNgY99kmRL7Qy5NyD3hF2
	 w0QILOq82V7xtfFbDMCT7t2pvi8AbXI3aYMr/XRTzyXUbZkEmEjJ+AeeZXU4nedAzjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhqMk7So;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E8A606A31A
	for <linux-man@vger.kernel.org>; Thu, 29 Oct 2026 18:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07E8A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhqMk7So
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so2573315e87.2
        for <linux-man@vger.kernel.org>; Thu, 29 Oct 2026 11:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793299758; cv=none;
        d=google.com; s=arc-20260327;
        b=f4TMFyPUkKGVr0giuWsL1x2mErjCZhtGB4wZIxWsQgS5QhoxHcOCvZepOg0x/ivxwA
         X/EJ5lCRXMlSXSPX+EFq7eB25xVZ3yTQpC0V1x9CRIi++g26u/jhnsu1Z7SDoOZXb3sx
         LPr6LwmDOpiXxE1lAzSW5BUNRYDhFCLqMBMsxADd7lWe52C+Fc7lQJSnsB/V4DBAPLnb
         49Wh4wN8u2TVd0I110k3LUn4+0NOctKMU3odmhbYrATKlq5nAsO8HpdYp4JVNKQt+HDK
         etc11RLPpSdTmRhL8qW3pt83A6W5/HXyTMTC4SFeQbAjU7dKdkA8CXgxIeFwnx1/kFp7
         yKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bK/ddHg8c6mFo+2nMFhFeeAud+Xm375QeAsb6wqVN6w=;
        fh=kQ48aT3RHrGsLkl+l7LrL4W43JzpbOuthkTPrszFUq8=;
        b=FcVjZGVjL8Skt8NdKcTRhEEghHzBidgdvTdmp/iIQVf5yHs/szcTSPtC+wRPUGuXZP
         +2nH1x/tKYhRiq0MNiqectX2aDHYrXTWyoHonMRsDlHIhxjEMcv4lYsuwpI1sYOXAXuH
         LPmqVk5WznCCVsAlhobWggeXtdVgSClP/efkUtCd90Y1Z3LoCCDhSTWmauCyTJoFt8QH
         XYlWRcZgmPqaLwjtrorLMfeEWODN5C/JsZDZTZstXlo88Pe/2QaGNUW7pZYUQZ7AZ3hV
         dNJN8ZYks/Dd73i2iRo+GAawsdMgST5S3gSQDH2gWdNEhhKPkJlxoAQmgcOUCvEYffbB
         aeSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299758; x=1793904558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bK/ddHg8c6mFo+2nMFhFeeAud+Xm375QeAsb6wqVN6w=;
        b=UhqMk7Sor8P5VDVEMdhbPe6OPX9JoxP5sVqB0KzJUBByRnDbwJeU5dRvXlZ/oTNE9c
         YAE7rYh+oOOLV5nVU+MTfe5fFNfQ55sPksreSYNspoRNpUXHjLFS9zbeJatKWYvB38/Q
         9WkJ777w9z+LoVx1jmq3fRpo6ApwliKCQzRaurMlKjCQx8bE97lbXOpCF9c2rkAf9/W1
         a+A+/9bzYtJoVY9Z5/L1vu+p1Y0mBrO+zJeKPgF66K0WLHeSOQwlSqwEqYs9GHYW3jkY
         S1zA875a8kyg3XddgvExghnj6quZFnymkB8Sfcx43e9nzDfDJBT0zuHc036Nnuu/Gzkd
         XNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299758; x=1793904558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bK/ddHg8c6mFo+2nMFhFeeAud+Xm375QeAsb6wqVN6w=;
        b=xdkYLdO7y9PPm7ATckpoktja1uIRXYSx+NoXYdMBL28GR7yrnLyIlY/hs7hbvne6Qn
         qqv0h3OgojVuKElT8FE7+tD3ClO/03IjPN++vhCHWHG5BGZHwv61DryH5JBHSfSE19cs
         fjzJWVmDqllXwW9KJ2Xl7Ue3CBszhf1hRW5JhszUXwLidxmx8AULb5+f6UjrLWSdcaLO
         Y90v+QNpJzhoBA1BpD+n2/TiVdpkqe+D6PXQr+Pm90Uzw/6WQnLLOQh/9TMUcQwp85UW
         RI834hhUZBz+piWFB9EOXkFFsrtO8axyc6vEoS4OA8kmKlVfn0UXUYRHfekm4D1XAPrb
         LjYg==
X-Gm-Message-State: AFq9FYKbf+hQpTlGb74pzNp+SJX+WCCRuLobo2E5t82HcOvD74egSUFu
	zzlnnCUf7D5sr5/SmtgknDQLPkT57ChsTnxnEFb8Sr6rXyLVvCW9/wv6E8A45E0yhusOAIg1lt0
	hAVwLBhQlCkAWspwZU5AiJpB6NEKG51sCAA==
X-Gm-Gg: AYBFou1tihOTf+l5cBftOZa1626kYx1fF6Z30iLOlnqShGrqoVUAAD70hpLoNPT2+mc
	0v7xQXV80keVAFT4IQoGonISoKvxf+5eMvANxMbseJ4QjHb91Ez1h7SpH0co185Qy2dw58/D9GY
	65T74S/tk86ih3vQ54nj8P4F5oRhW8xrYIXwvrnaeq3VgABUPl+FN//uN+919YxmnWciWz2w+nf
	40ddFGSOjc6ESuaLv2TA2ihBBH7APPYKghTl+Dg2t6VjuJLFGQQHPa7eu+ODE+GGMn42gMQ+BpF
	uv/gIwe9F4aVbM7QXoWTv7bTM/C+qBMAVhvogirwuJhH9FiMyLiMO39sRgqQXCNm5JhOYM3t8sj
	A3iQB3oeOlkzuck0PoyjMcpvvQsp8Lgx1lmpu
X-Received: by 2002:a05:6512:a87:b0:5bf:a221:ef55 with SMTP id
 2adb3069b0e04-5bfcad758d3mr2323446e87.50.1793299757886; Thu, 29 Oct 2026
 11:49:17 -0700 (PDT)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <auFA7dfNv4jk3R9e@devuan> <auHu-XoGs3jufdhY@devuan>
In-Reply-To: <auHu-XoGs3jufdhY@devuan>
From: Stefan Puiu <stefan.puiu@gmail.com>
Date: Thu, 29 Oct 2026 20:49:06 +0200
X-Gm-Features: AclHuK8tRZQG-WQZXz9EtUT0G-xIaX2dSRU5O6kievNbVC5sSBq0VYnD_EsZPJM
Message-ID: <CACKs7VCkdNRyfsPZU-859vjPzfeHTPo14gj3Ezgu3JYEGLyiZw@mail.gmail.com>
Subject: Re: Serbia
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Sorry to hear about your Serbian "experience".

On Wed, Oct 28, 2026 at 2:49=E2=80=AFPM Alejandro Colomar
<alx+linux-man@kernel.org> wrote:
>
> BTW, I keep the hacked phone, turned off, just in case Google or anyone
> else wants to have their hands on it to learn how they hacked it, in
> case this helps improve the security of Android phones.
>
>
> Cheers,
> Alex
>
> > Date: 2026-10-28 02:15:52+0100
> > From: Alejandro Colomar <alx+linux-man@kernel.org>
> >
> > Hi all,
> >
> >
> > I travelled through many countries in Europe earlier this month, after
> > attending a few conferences in Paris and Prague, using an interrail
> > ticket.
> >
> > One of the countries I visited is Serbia.  Because the interrail ticket
> > covered Serbia, I thought it would be a regular European country, but
> > it isn't.
> >
> > While inflating my bicycle in a gas station, a police car stopped me,
> > and the only reason I can imagin for them to stop me is that I have a
> > dark skin and hair.  I wasn't doing anything wrong.
> >
> > After they stopped me, they searched me and all of my stuff, for at
> > least half an hour in the street.  Even the boss of the police station
> > came to the place.  They claimed there was a problem with my passport
> > and had to bring me to the police station.  They also looked at my
> > phone; they asked me to show them the pictures, but I didn't have any
> > recent ones.
> >
> > Once in the police station, they searched me again even deeper, and
> > after some more time, some new people came to the police station.  Thes=
e
> > seemed spies (intelligence agents would be the technical term, but they
> > lacked intelligence, so let's just call them spies), and took an SD car=
d
> > with my keyring (made me questions about it), took my laptop, and also
> > took my phone, and ordered me to give them the PIN.  I gave it to them,
> > since I don't keep any personal information on the phone, precisely
> > because I expected this to eventually happen.  The few contacts I keep
> > on my phone have one or two letter names, so they can't get much from
> > that.  And the laptop and SD card were fully encrypted, so they couldn'=
t
> > do much with them.
> >
> > After around 3 hours with the laptop, SD card, and the phone, they
> > returned it all to me, saying "oh, btw, the phone turned off" (lol!).
> >
> > Of course, they had hacked the phone.  The fact that they handled it of=
f
> > already hits that they've been playing with the bootloader.  But I did
> > see evidence of hacked apps "calling home" to their servers after that.
> > I won't tell exactly how I discovered it, since it might help them
> > improve their hacking.  (I will tell details if you ask me in person, o=
r
> > through encrypted mail.)
> >
> > At first, I distrusted all of the hardware they took, so I didn't use
> > the laptop for a few days.  However, after seeing how simple their
> > attack on the phone was, and after looking at the laptop inside to see
> > if there was any obvious chip that shouldn't be there, I came to the
> > conclusion that they haven't done anything to it.  After booting, I als=
o
> > didn't notice anything wrong in the software.  They could have tampered
> > with the bootloader or the kernel, or perhaps the hardware, but at leas=
t
> > it wasn't obvious.  Since the quality of the attack on the phone was
> > really childish, and they seem to do it often (so they should be good a=
t
> > it by now; they're even using Israeli technology), I very much doubt
> > they could have done anything to the laptop without me noticing, so I
> > started using it again.
> >
> > So, now the Serbian authorities have probably cloned my SSD drive, my
> > PGP and SSH keyrings, and my .password-store/.  I doubt they have the
> > ability to break the layers of encryption that protect them, so I won't
> > revoke my keys for now.  Maybe in 10 years or so I should.  I assume
> > these might end up in the hands of other countries with more interest i=
n
> > breaking them.
> >
> > After all this, they set me free, and in fact, one of the spies seemed
> > to be interested in me going out to the street.  They probably wanted t=
o
> > follow where I was going, since they had my phone hijacked.
> >
> > Near the border with Hungary, another policeman in the street saw me,
> > and quickly moved his hand to his gun, just in case, and it remained
> > them until well after I crossed past him.  It seems Serbian policemen
> > have a problem with people with dark skin, hair, and beard.
> >
> > After crossing the border with Hungary, I told this experience to the
> > border patrol in Hungary, and they laughed between them and said this i=
s
> > usual in Serbia.  It seems the country is deeply corrupt.

I'm from a country neighbouring Serbia - Romania. I've been there a
few times, though it's been a while - in 2007, 2011 and 2012 (the
latter two for the Exit Festival, which was quite nice). In 2007 a
police car stopped us and started checking our papers, and were a bit
aggressive verbally, but eventually they let us go, they did not find
anything wrong. They only spoke Serbian, which I don't understand,
luckily we had a guy who could translate with us. Also, they had a
system where foreigners had to tell the police when they were staying
somewhere in Serbia; they were a bit pissed off in 2007 when we did
not have the paper from the police when crossing the border back to
Romania. My impression was that they still had the old police state
behavior from communist times, and also suspicion towards foreigners
of any kind. Were you there before the elections? Maybe there was some
paranoia in the mix as well, who knows... Ceau=C8=99escu was quite paranoid
before his overthrow, he was suspecting all kinds of foreign
interference, who knows, maybe Vucic took a page from our guy's
manual.

Anyway, I hope you are OK now.

Regards,
Stefan.

> >
> > I'm leaving quite a few details out of this report, since I don't want
> > some information to reach them, in case it's useful to them.  But I'll
> > happily share the full story in person.  :-)
> >
> > I had been curious for a long time of how indetectable these attacks
> > with Israeli technology on phones really are.  After this 1st person
> > experience, I can say that if your phone is ever hacked, you'll most
> > likely notice.  It was an interesting experience; it probably gave me
> > more information about them, than to them about me, after all.
> >
> > I've updated my threat model and protections after this, to be even mor=
e
> > strict on not having anything on the phone.  I've bought a new cheap
> > phone, and this time I'm being even more strict on my policy of having
> > no names, no pictures, and no PI at all in it.  Just CoMaps, weather,
> > offline translation, and a few one-to-three letter contacts.
> >
> >
> > Have a lovely night!
> > Alex
> >
> > --
> > <https://www.alejandro-colomar.es>
>
>
>
> --
> <https://www.alejandro-colomar.es>
