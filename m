Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792756441;
	b=uvpv/9/3Axo9e5wXtbQVKElytUnzN6OQ/YOk4XCttyCggqFWPoGCU0r3tzobIH7lGP1Y
	 5GOZmn2KN5sxLdTAm+UgJtMnBceajWRGfKEgMRzOBWSd9Sids/92R3P93iBuRWf3g4WVO
	 DGCcgm8pkpNzREWHsLqdDS4x8oZTrVNoT1R0zm5N+B9EdgHOPodJz8ndpijCEQcag3UUO
	 F/X5fQBtNtQgS4wPmAhptF4HA8NdT/cWrNRHdvY0GOhBjWT9fWWPnqDqdGWzYnHzHebfb
	 bKQoaptoGFGtI87XkVmKEOdVlyPuyh6DqxH+mRVNfRiEAH1aavUwLHma1W13RCmOdHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zhWjKZRbFnP3odh2Asb2Dpa4YHVc3WaHn6Ri90vQACo=;
	b=YNfSqroysKszirhZGD8YHnuwhUwbD3bxdRg+E5WZVeJTe5uZpGgnE9cTCeAKw8Lfeexh
	 qEXPlu/r1akSbouyDSdnNG69Dbzz+miNf+7DcPdixqfwoPuxZP+KH4kz46fuuirkdzHQR
	 4zWJ/qvo6x0Q535bckpdtxPb+Al8rRMKrPX+PhYc5RpCPdNDY7WFcFGuhnqA5Hk1er63f
	 dnFc/nsFmgkJFZjFNoi9DITXetSB/4D4Il/0IU0naqDPzSGOHztBLXjEsIzqcTxdi691b
	 iFGyQOuVsTXT4bguI9CtLCH7S6RKOSSyeKefhsA8EFr8G263EM3SZtFP8b8ntxWwgEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=man7.org;
	spf=pass smtp.mailfrom=man7.org;
	dkim=pass header.d=man7.org header.i=@man7.org header.a=rsa-sha256 header.s=google header.b=O1PyPMgm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FEB606A31A
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 11:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13FEB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=man7.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=man7.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=man7.org header.i=@man7.org header.a=rsa-sha256 header.s=google header.b=O1PyPMgm
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e3b22e971so226303f8f.0
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 04:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792756439; cv=none;
        d=google.com; s=arc-20260327;
        b=qi+zyS167FfObuTKdgtfrA1j9rckIyox3UB5VljqI5TpaWRXzq4N9nb/9fNQlkDdf0
         5BufgpUccWXa8CydmS7BKtDawATzepnvxQpvvA46OQ4VK8WlPyHKbzsibdqzq18FyisP
         +NsK1HJe9tLSOckJr/MbMMgW+dNRH3YKIpZHWikuu/fOi+dIJZh+nVvL1hPsUvFNyBq0
         TpMI8rIa/dSIs11AuiDvQ36SDhmpRWhHLrZ0dJEhkkRmMw3L7p70csam49Bf81OqGXGO
         wjevA922DwOyZBFjkzR3CAYP0jB0piQqNkGD4QPC74+k6soRbv6OdXc1KdabWa5MTlhL
         QcUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zhWjKZRbFnP3odh2Asb2Dpa4YHVc3WaHn6Ri90vQACo=;
        fh=sHf/gMJI7UvdVi3cn5ZanbkbYNzqpjzbJn4fc6NdEHI=;
        b=oONQhcmn2bVWRd668pvwQLagYRKUHU96Pgdbegn1/i+JTiJ+93V0H3AsTguMUyTB4U
         g1hl8WfomvN56gD4IwAftgZWXjVC+NgXQA8FPHcrAfyVKHHhvN3FxbyWMF+99g6022/v
         b8EIxd9PUstn1h6RXyVlhidngqloE0h1ONEHuM4qJdcI9eMO4vs8gTOwJ/+pUvG/sr9W
         nBkQloRUJr0opblsxhB1VDkUSHirlBNReON531aGn4TuM8kogyR1M1KyybVfrDGBDjUo
         AnWOJ9qQs/lys+JX0eXRG2SnOJVrXWJCutENDHN6tU4YYdOcjQ3931Dr//5kbRPBOBOB
         nPJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=man7.org; s=google; t=1792756439; x=1793361239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zhWjKZRbFnP3odh2Asb2Dpa4YHVc3WaHn6Ri90vQACo=;
        b=O1PyPMgmICfORhnTTQADa5ipBf2F85gezv+tQQpDsXDhsx1mwglFWowVnxMZppOqQB
         VCsLmkw43/pkhCoBpxqu3kPLdT2crjTC17tcPFXGVpVakf/ROPqPPeTw8C0H8eHx0/Zv
         KDQRvqDTLyUuhAU/O2rccKkYeHNZj5JQTawvRd2gXDEeH3FljBFEsck/72L/Z+8xG1Ik
         rLLrzdmp1pRvo4dGOalOxbzpOIDELm6IIsFxgdX6TZOqCo+Wos1j0e/czvqsnj/AT50J
         w0eZUxjwDpSM2aQ0alPNVu0eX/oJA8ZqUY3OoC2+hiEcA11vQTeRwGwTQ/HMfxjaj2d7
         g85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756439; x=1793361239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zhWjKZRbFnP3odh2Asb2Dpa4YHVc3WaHn6Ri90vQACo=;
        b=Jl+ZCzYe1mrJ/JiFjtnN2afSfK+MqR+NPYJeX3Fas1ktf9EozvDYOd+naEvOYlb50I
         k+1g6Uze/BjFrStlAJG+NBaLPIZDUlHMjsWABZMUExFFJlmcuba1JCRuyrcRoQ1Iu/M3
         Hly+7ZaM0p6bRmifP8V7UK0oZyIdD4MMpg+en0dUA5QSnxPGqY8BAZ2BQF0FmZoAbRLJ
         nnzujXavWOkWZCROfPruEqf1kfglcK8yjgte/uI7cB/Q902F2Hj/F+YU7LkDJhnJtxgA
         kgm1w+ACBIKMHHzrvmH9yAkK2W9nX+kIuVl2jyuOnKKoGKD0CSjVMmv0jGjvmAaoBqv0
         72ag==
X-Forwarded-Encrypted: i=1; AKwUvByqiMcCyJuar64nQpbwzQ5slGWyA8wePUMJTvJrYmUSvlAJ/cWjmklDsq2rNoi3SH1RI4o4XNziZpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOz4/SuV/p7UJkVHuM9eFu8A9mJ843EHhR4Q12whW0Y0li/hMg
	G67a8WHWGltnlSl7wHWgyVd1WsinNKg47R4P4Nts8zlUeNinxhCZQOOjpCZ6cRU0dyL2/lGI7QT
	KKMDuWrgtjhtuxQPQDUmCWWo7I56wdlcFqGFxJVDAcw==
X-Gm-Gg: AYBFou2chGHCKFcxwQeJYEpCwKDbJellu+p2YN9LIFKFKmP8JNwJVSIDsmET9acXxQk
	qNkJBgAqaA8xXLEgAGLOTZFVhbrAoyPH1qKxS3IjRMXCZ3ql+eyvKUPCSBrWR9yYImZuekxg1T2
	82Wp6Y7CMrRMlF2c+hT7mf1zXE40bnPrL+WeQpxrv+TTLo7FCr7dw5EJey6PBBfEfApTX669KCt
	6S/wZO2wt38DMJXT3gBj8EwTw8BpF9jmQjV1xc7GGUPkPqqZ78CR+Fu1rwWQQNprRvHUtRFyyi8
	t2EsU1Yqv6/SNeBMfSC4DiokWNAVdWohI2Jo/cn2TU+sJjp3H4DJRpwdhMGrUYMAtZqqARUUwwS
	u9dmN7Tmr2DnN0YC/WVYEm9/ssr89NCUu06IQLQS/cSr3lUjNbgkf0BSi8LX6W39EGmZX1WzBc+
	n7qrohFYrWx5nJu2+Jwz+uiUDaY/ct5Xlp2A1m7ijkqXTqePo=
X-Received: by 2002:a05:6000:144c:b0:48e:bf0:30f with SMTP id
 ffacd0b85a97d-48e3859a495mr3290777f8f.34.1792756439238; Fri, 23 Oct 2026
 04:53:59 -0700 (PDT)
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
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com> <atpnWiYQzs_HZ1Q7@debian>
In-Reply-To: <atpnWiYQzs_HZ1Q7@debian>
From: "Michael Kerrisk (man7.org)" <mtk@man7.org>
Date: Fri, 23 Oct 2026 08:53:22 -0300
X-Gm-Features: AclHuK_7s-sDDoWL3ulVpsjNKMrzLW6smfNslQ6-SWV2EOf8O_aNwVWLDLPjkbE
Message-ID: <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, 
	"Carlos O'Donell" <carlos@redhat.com>, "Joseph S. Myers" <josmyers@redhat.com>, 
	Martin Uecker <uecker@tugraz.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, 22 Oct 2026 at 16:54, Alejandro Colomar
<alx+linux-man@kernel.org> wrote:
>
> Hi Chris,
>
> > Date: 2026-10-22 18:29:31+0100
> > From: Christopher Bazley <chris.bazley.wg14@gmail.com>
> >
> > Hi Alejandro,
> >
> > On Thu, 22 Oct 2026 at 17:45, Alejandro Colomar <alx@kernel.org> wrote:
> >
> > > From: Alejandro Colomar <alx+linux-man@kernel.org>
> > >
> > > From: Alejandro Colomar <alx@kernel.org>
> > >
> > > I'm not fully convinced of this patch.  But I'm open to being convinc=
ed.
> > > I've written the patch, as Michael asked me to do, but am willing to
> > > hear everyone's opinion before applying the patch.
> >
> > Why did Michael ask you to do this?  I think there is some context miss=
ing.
>
> We have dozens of users having reported a bug in the documentation,
> as they believe the forward declarations are an accident/typo.
> Clearly, most readers don't know this syntax, and think it's some
> mistake.  I've been dealing with them nicely explaining them the
> existance and validity of the syntax, and they tend to understand it
> quickly.

I spoke with Alex a couple of times about this in person. Via man7.org
I have received numerous bug reports about this syntax. It is
nonstandard, people are not at all familiar with it, and they will
potentially misinterpret it in ways that will lead them to make errors
when writing code.

> > > As Michael reminded me recently, and as I've defended in other cases,=
 it
> > > is true that the SYNOPSIS of the manual pages does not need to be
> > > strictly valid C.  It only needs to be useful enough for readers to
> > > understand the interface.  Thus, if using lengths without declaring t=
hem
> > > would improve the usefulness of the documentation, even if becoming
> > > invalid C, it would be okay.
> > >
> > > However, I still have doubts, because this change comes with risks:
> > >
> > > Programmers might think it is valid C to refer to parameters that hav=
e
> > > not been declared yet, and use that in their code, and if they are
> > > unlucky, it might compile for them, which might result in UB at some
> > > point.
> >
> > I think it is reasonable to assume that anything which resembles C sour=
ce
> > code will at some point be copied and pasted into a C program.
>
> Indeed.
>
> > > One valid point is that this is rather unlikely to happen, and most o=
f
> > > the time it will just result in a compiler error, because no global
> > > variables with the name of the parameter exist.
> > >
> > > However, with local (nested) functions, this might be easier to happe=
n,
> > > as variables declared in the outer function are more likely to share =
a
> > > name with a length parameter.  Given that the C Committee is working
> > > hard to standardize local functions, it might be a very bad idea to h=
ave
> > > this combination of events going on.
> > >
> >
> > I agree with this concern in general, although I don=E2=80=99t quite se=
e how it
> > applies in the specific case of the functions that you are documenting.
> > (Unless you are expecting those functions to be declared inside a funct=
ion
> > definition instead of by including the appropriate header =E2=80=94 in =
which case
> > the hazard already exists.)
> >
> > I guess you are really worried about people copying the style rather th=
an
> > the content.
>
> Indeed, my worry is not that people will copy these declarations
> verbatim, but that they'll think it is valid, and write similar code for
> their own declarations.
>
> > > Concerns that have been raised against using the GNU C syntax in the
> > > manual pages:
> >
> >
> > Parameter forward declarations are also supported by SDCC, albeit with =
more
> > limitations. I would be interested to see whether your usage falls into=
 the
> > category of usage that would be supported by SDCC or not.
>
> Our users are mainly interested in POSIX compilers.  That is more or
> less GCC, Clang, TCC, PCC, and maybe something like Intel or IBM
> compilers.  The main two are GCC and Clang.
>
> > > Very very few programmers know this syntax, and thus they are confuse=
d
> > > when reading it for the first time.
> > >
> > > This is obviously true.  However, this is true of any innovative synt=
ax.
> > > We should consider whether the confusion is dangerous or not, and
> > > whether programmers can learn it easily or not.
> >
> > Can we still call it innovative, many decades after its invention?
>
> Maybe I should have used the term 'novel' rather than innovative.
> While it's clearly not new, being decades old, it is certainly a novelty
> to the programmers that have never seen it before.
>
> > > I believe once you've been exposed to this syntax, after some researc=
h,
> > > or asking the right people, one would easily learn to read it, and th=
en
> > > we'd have overcome the issue.  I don't think the syntax is inherently
> > > difficult to understand once you've seen the documentation and seen i=
t
> > > a few times.
> > >
> > > Also, this syntax is not very dangerous: a programmer thinking
> > > that a forward declaration is actually a normal parameter will pass a
> > > wrong number of arguments to the function, and thus will have compile=
r
> > > errors.  This syntax is quite robust, as it requires several bugs to
> > > happen in the same code to pass compilation silently.  If one replace=
s
> > > ';' with ',', the parameter will be declared twice, which is an error=
.
> > > If one renames a forward declaration, it will not match a parameter, =
and
> > > will result in a compiler error.  Only if both mistakes happen at onc=
e,
> > > the compilation would pass, but then the call sites would also have t=
o
> > > match the bogus declaration.  And also, the function definition would
> > > have unused parameters, which would trigger diagnostics.  So, concern=
ing
> > > safety, this feature is not very dangerous, even if used by someone w=
ho
> > > is very confused.

It is not enough to say that the compiler will warn people about the
incorrect arguments. I have seen people do the strangest (incorrect)
things to "fix" warnings and errors they get from the compiler.

> > > Do we think programmers are unable to ever learn this new syntax?
> >
> > No, because programmers are clever and it is relatively simple. I wrote=
 a
> > paper that explored the drawbacks of the syntax and recommended
> > standardising a subset (which I assume is what you are using).

I have talked with programmers with *decades* of C programming
experience who are unfamiliar with this syntax. Indeed, when I first
got bug reports about, I also was unfamiliar with it, and thought it
was just a bug in the manual page.

> [...]
>
> Agree.
>
> > I still have not yet seen a proposal for anything easier to learn (that
> > does not rely on forward-parsing).
>
> Agree.  But indeed the counter-proposal that I've received is to use
> retroactive scoping in the manual pages.
>
> > > Are we ready to accept the risks of using the dangerous invalid synta=
x,
> > > but which is more intuitive to programmers?
> > >
> > > Reported-by: Michael Kerrisk <mtk.manpages@gmail.com>
> > > Not-yet-Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > > ---
> > >
> > > I've cut the diff below to just a single page, because this is just f=
or
> > > discussion; the actual diff is huge and uninteresting.  It's just a
> > > removal of all uses of fwd decls of parameters in the manual pages.
> > >
> >
> > I don=E2=80=99t agree with the change,
>
> Thanks!
>
> > but the fact that there are no useful ISO C
> > semantics for parameters of pointer type declared using array syntax
> > weakens my concern. (If the parameters actually had variably-modified t=
ypes
> > then the change would be far worse, from my point of view, because the
> > parameter types would no longer be expressed correctly.)
>
> We don't care about what ISO C says.  GNU C clearly assigns semantics to
> array parameters, and that means we have to be careful about them here.
> If this can result in sanitizers breaking code, it is something to be
> careful about.  Moreover, I hope ISO C eventually catches up.
>
> > You know your customers better than I do. If they expect GNU C semantic=
s,
> > then it seems reasonable to document those semantics using GNU C syntax=
.

The customers clearly do NOT expect GNU C syntax.

My preference would be the earlier status quo: standard C syntax, with
an explanation in the manual page text that explains the relationship
between the arguments. The current proposed patch is a compromise: it
has the disadvantage of being nonstandard C, but does at least clearly
hint at the relationship between the arguments.

Thanks,

Michael
