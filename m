Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792783970;
	b=Y6/NLheKZP2yhD60yl+1KwsrgMmO2BumhKI4GbbN4RG/ObHyHeGw6QRuQWgSzj8eyv9g
	 CdvwRsSSunTPeArPfPos1EaZS+GSWP5NKADmi3FjYNAikcMpFX5ao5JRCK0pVHi41ZBpC
	 7rmQMjLMBZEnb0UK6NirUEgGHYZtYtYgZhomD2OQWcnKbTQOXpnJB8bNZK0ndZ0H9n8sB
	 opUZwtGamYwruMtisIYnoswzCqTDeX236PNP5GwJLULY+WlVCb+tWe7IFyll1sbIuTelo
	 FQL4F/wZ0OPigwLW14GBBH6U4yQ9tJSTO5nWuRye3WjtQ30ku12zQZPPcWp+qRiXcjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=L8cHuY4yVn5rzpIOBMLGoSMxm1mBDl4FcKUY/nU6W6A=;
	b=tFJ5IG0CfaOvOqoN4t+ir91w3cT2adtDtEPy/3wFJSC4IsGfXqNwiyc5odke3+CgoYxP
	 aqooqjsngC5KR5x9MDQIPnk+nqT1bO8XHG4A52zySWJ9/mYpT5f4gwiKLZX0UbCUn/2EX
	 ZUTo+n/OXiQpv0xXYvjgRzL64NWA/Bgl7j3lrHImcGsE4RfiM7s2vZm6f2QfPnGPbGhkc
	 PB12R7D1iAYhNGTcfXEYq7fIRZpxbRBmaFRndq3XwolYRYpxzxVpJW5RZpn/CAwbFH3yZ
	 Df8p8F36705PNiTVwsFcKktg7pKgBFvZqy8j1oMEyDrNxwXf23TsUhYid5ctHoeOWaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SwdnLqfk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317B2606A31B
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 19:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 317B2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SwdnLqfk
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so2829474eec.1
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 12:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792783969; cv=none;
        d=google.com; s=arc-20260327;
        b=n34LXnw5hH8faU/JV0cjiN7siVWGYz0mxGEiUp5U+cpH/47pEP6WdUawer441ybkSC
         BP1x7ddRo6ptJmMl2XFxN9kt5yttI9rA3EpCiDq6iWyBIFwHftL4oRDv10bTlrOyCs/Q
         yM8XpbFVxYUg8a0TpCqKzTeKBWi7E3oPovApfqLBcpmtVUxu+GG0A4nSUJIPozjRz3Lk
         pb7/1GHuBDvWMs+Y3DMRKGjPgcNKO23ttLWWBhHD3MEXuIcEb6QDDDjmLM3doHYJq6F8
         Q+mOaJY1u1ZZk6cGvuehxCnaazTvepEzV7Akjmf+C28CSqwwjGKA0MFg436y3MhkJFat
         NvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L8cHuY4yVn5rzpIOBMLGoSMxm1mBDl4FcKUY/nU6W6A=;
        fh=dJgLC+R1TL0747mfjs3eI6CWn708OPjXvW/O9Hvyb/Q=;
        b=CxXLxi6B8KWvve86x3mnsL+7Mdaa03KuESPGnRDQF8ZMzGHFMxoRhQQix9YmL3ByeK
         6QdWxzv+d1voHMNwosy1WHBvSYWTD7xJ0Ymfl8Rb5wPyAVO8EjFykssDsfnaSzD3Gqp9
         f69nucsjUuE9Qnq6J9vgsy4OhvGVp4jyuin76hLwkXgUGyQmpM4Bsp+di4YBhrnE3B35
         WLFUbVze7b0R1FrzzfvgCeZ/6fh04WyEcoNiAhzsaJeraDqtlciAGp7VfwTD2/zH2YOu
         w0U9bXVsYrH6HFFz9MBU5h25oo+aNbfvMurqtDztsqL7YvwzQI3vCnCeIPnYYi223qnN
         XUCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792783969; x=1793388769; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8cHuY4yVn5rzpIOBMLGoSMxm1mBDl4FcKUY/nU6W6A=;
        b=SwdnLqfkX7Ddm8Chrhq6h4iT1adsRClhW8x3111Uq/9/Ni5lJdKftb1UbJ4q9GSJ+d
         myWMdx+nd8dzQz6JZCi843OTfOf7WDY+Utx5W14wNjabzGEkoeAjv4ypZ331DFaXqXUz
         vSpo56hTdt0Ph5O5pvhxf9AF56Zln3Ev1z8IbLLDGvlO4IgVvyasspmqKNha+b862Cf2
         7cVrKuGqhLUUw6ocPmXBcMHP6eOF2r763tPGGMHz1+Nk2RHuM9pzC9rv6eETpL87B0KR
         M0dmaQkCNlt77Jbb2AmSAwFctdGXBkrOdb69St/qKJqTxQ1f4Gt6cnWB4B6r8WIMagfc
         IRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783969; x=1793388769;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L8cHuY4yVn5rzpIOBMLGoSMxm1mBDl4FcKUY/nU6W6A=;
        b=I0vIzy6Uo9LaffVbxgDsVLSMxSGuVgzt1Gw6Bc70g/qVBMoLyIPV4CJFmVbKPyj0oY
         QGfOUfGZmCAb5azE6diB0EN8K+jjpEzfN7cteeLrKZTfSSYII9y7RxBUq5bC0hHospFI
         N91UwLjqtza429fWxHDsr2xECyppNMqv7yt+c2lc3DijKy0QjsJ8ugAnNmwvfRdP2w5J
         lu4lvCXkoQST21Z5YTil7vvTljUKLgTDwhwT+K8IfI70L9GkZacRlqClQTl6XO6AkkLv
         9UDXXiuyoBXmZX1wF5VntpSahZNezosOWA+PSzCLPxdH5HKxWag4QI8TJyirSjvZhu4V
         kCCw==
X-Gm-Message-State: AFq9FYIjzUgQRYd/xQf3Fe4U3j38eixX/UXIUgQb2a5yOOCYn0zC0zLj
	xU2Dwlc+K4qw3d9aKjmy45KDbrhEcxibg/o6ib70BA+/3TPNPWXB5+lJwbTJfuIj2Zz6XxpG6EF
	bY5yuZbpZBoot9z6bAcCjRIgxPyjGqgk=
X-Gm-Gg: AYBFou2prBU60Eq3WxHgHFCgyE+9X5HlpR2im2ROpIprxYR3VEkzvxzB1tXJUk+53OE
	AvAPVjx48Ayrj0bsYu9UVWHB46BYv17hbOMx76zKB6zQUVrPb4w0CXeGxEyk7w0afrGh7tzrUan
	avyXTWChEMb+v9D+D+nGJBcZ1FuU5SXncGxRg3QubkgYLBiEFAR2vhr6XWwnLg7BTYEnmEowBqD
	sMss0stYwue8xi8NcFxOCMSvXZ7K1iLGz5VHUfV9hf4cD6Qe4GDiM+KwHSSnsGOZhf419+15czr
	WFV2E//C1PK8mLDdyoXH8miDO2MKXlVADsRNWQLT0iqqDLVqL0XRqWjHE6l5hQsbAqNqnipODCL
	6YeEJNlRVFQQrR4pJRI5TUNkbsGWiyewT/cZZAXsDO4yjEXgyz7LpL0vqvb+0MwDtdRw=
X-Received: by 2002:a05:693c:42d0:b0:361:167c:2364 with SMTP id
 5a478bee46e88-369e845a30emr342835eec.8.1792783969012; Fri, 23 Oct 2026
 12:32:49 -0700 (PDT)
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
 <CAMdZqKEWzg6Z5oYp8N+S4rkOjUU7WT6jwbVDCAk3YN3ZdP7u+Q@mail.gmail.com> <atsrNyzuYebABZjH@debian>
In-Reply-To: <atsrNyzuYebABZjH@debian>
From: Mark Harris <mark.hsj@gmail.com>
Date: Fri, 23 Oct 2026 12:32:37 -0700
X-Gm-Features: AclHuK-drSngfQBjqKTSjynqFGlDS3ETiT-1AmaSWpf7YxDqofdMoDf5qwfcWfc
Message-ID: <CAMdZqKH=pJUf4kvHNKaPMzdznajxS6EWTn2cXnTqT2ttjithbw@mail.gmail.com>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, Sam James <sam@gentoo.org>, 
	"Carlos O'Donell" <carlos@redhat.com>, "Joseph S. Myers" <josmyers@redhat.com>, 
	Martin Uecker <uecker@tugraz.at>
Content-Type: text/plain; charset="UTF-8"

Alejandro Colomar wrote:
>
> Hi Mark,
>
> > Date: 2026-10-22 15:03:37-0700
> > From: Mark Harris <mark.hsj@gmail.com>
> >
> [...]
> >
> > The man pages are frequently used when seeing a call to an unfamiliar
> > function, to understand what the function expects and what it is doing
> > with those arguments.  The arguments in the call are matched to the
> > synopsis by order, not by name, so for example a person questioning
> > the first argument would naturally be looking at the first thing after
> > the "(" to find out what is expected there.
> >
> > A person that is reading the description, where it refers to the
> > arguments by name, needs to convert that name to the argument number
> > in order to match it to the arguments in the actual call.  The natural
> > way to do that is to count the argument names in the synopsis (at
> > least those not preceded by an unterminated bracket or comment) and
> > stop when that name is found.  For example if that is the first
> > argument name after the "(" in the synopsis then it would be natural
> > to conclude that it matches the first argument to the call, and not
> > continue scanning to see if there is another occurrence of the same
> > argument name.
>
> That's a valid concern, but most often the first argument will be of
> a different and incompatible type (they tend to be pointers, which is
> the reason we need the forward declaration in the first place), and thus
> such a mistake in the understanding of the order of arguments will
> result in a compiler error, which is a relatively mild problem.

I am not talking about someone writing new code that they will then
try to compile at some point, I am talking about someone trying to
understand or debug existing code.

For example, they may be looking for all code that writes to some
particular data or performs some particular operation on it.  They see
that a pointer to the data is passed to various functions, and then
for any unfamiliar function they may quickly check the man page to
determine whether they can rule out this call as unrelated.  Because C
function calls use positional syntax but the man pages describe the
function of the arguments using argument names, they will have to
count the arguments in the synopsis, which will give them an argument
name, and then they can search for the argument name in the
description to find out what the function does with that argument.  If
the counting is complicated they may end up with the wrong argument
name and determine that the function does not perform any action of
interest on this argument, resulting in failure to complete the task.
Even long-time C users may be foiled by the forward declaration, but
it is possible that the person does not even know C; perhaps they are
calling into this C library from another language binding and are
trying to debug what is happening.  The man pages should do what it
can to help them, not throw monkey wrenches in their path.

>
> You didn't take into account my other concerns, though.  I'd like to
> hear your opinion about the concerns that letting users think that is
> valid C might lead to them writing code that has UB (or logic errors).

An error in thinking that this is valid C syntax doesn't impact anyone
trying to understand existing code, so I don't see the concerns as
comparable.

If someone adds this in their own C code, and it has not been adopted
as valid ISO C or as a compiler extension, then it is extremely likely
to result in a compiler error.  If a likely compiler error was good
enough for you when someone writes the arguments in the wrong order in
their code due to confusion over the syntax, then I don't see why it
wouldn't be satisfactory in this case where a compiler error is even
more likely.  In both cases there is a chance that it will be accepted
and do the wrong thing.

 - Mark

>
> > So I agree with Michael that this change is a good one to make the man
> > pages less confusing.  Thanks for creating the change.
>
> Thanks for your feedback!
>
> >
> >  - Mark
>
>
> Have a lovely day!
> Alex
>
> --
> <https://www.alejandro-colomar.es>
