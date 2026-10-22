Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792706630;
	b=2upQn9cbuo9Z4oHgG8JWp+4NzpExEVGpm/dZOJnlujOG4f2ryFUGF19UniLbBtHMAiyR
	 Fht0jwsPljE0Gl63h5T1aZKOvGE4qdobV6Jq+0XxeBObXgcWA34boP1YNsmhGYNcIt/ck
	 0ZVePwddYi07kseYAfi5zVWQY23QfwneXC2UBOwPw8+69M+09zIlA+RolHFtiecAPZjS7
	 U5FwYP1sJ3y4ioKYWn9wG359r8EliNN+LTRboMuLhk/rhF2lAuyrt1fb1MgQ18VQaq/eH
	 2ngC1xwAF1n30rdOERyiu8pZb3krd427Uj76hTxztLG6SGlyDlqq1Q3z3SfrKbmpH6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=S+BtLzYqJrni8hsBSgZVcEjqlLU6qt0m3MCxz2ke5nI=;
	b=FSHTr5JfYe7a/quUjvz92PQlIxVvWXnlVI7vdYgN5aLb8MyIg4G7h1SoSRuRca/giV1/
	 fX6RPe3acmnzodv/anf3pOuMWsWJkhwtJMyxwSzoaoVk+A+QZTh+MUiU54T0Sd6TnRF0n
	 IB93uarw0/U0av89KADA3xyVCWFZsh9ElK5DgRLaE6nsFidhq+d5g+0FzaUIle95EQH0r
	 Vo5v3Xacl8jj1MDp/h2bRJnjc4/H1KDXnLztxE6JZe+O7abM7v776w3r/RkSG1TWnO1jN
	 9f60uONEGjK0AwXDHN7q6inX6kyilBSqvsr6JyMWDXs/b6XX3nSMyaC+Ky+WU9uzwWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y12Mwjr5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB454606A31A
	for <linux-man@vger.kernel.org>; Thu, 22 Oct 2026 22:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB454606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y12Mwjr5
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14fd9dafb0dso164169c88.0
        for <linux-man@vger.kernel.org>; Thu, 22 Oct 2026 15:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792706629; cv=none;
        d=google.com; s=arc-20260327;
        b=kH5liulxKytn5WsB0hvvJfSOARHPOhPT5uwPjjcbXdfkHth//KteVj94mXcOyuOb0y
         P2j1ma2oy3hN8tlF2yjzIUUtR9fpb/Nbf3H71i9LXvFsMyPd9XbswoGpb1wa4OWVIGle
         9AWmwx1rSAr/rU7go7uoT5OC6zWXbEFUWrpIkgnL89q9wP85Bf82rS2HTZc7ycSF+ErG
         U+Bt7Se91/kx7J+clO7ntfO6FdTOA+lbWBq5y/Dm3uSbtgj5yVvHO7ZaEiOSdSE3Yy7x
         SqhnHjc3nL4pb5m/EWuFslSUJQeakjjQEXsk9WQVa8stDnG7QkL7GvL0I+3EjlMQgvq6
         5uRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S+BtLzYqJrni8hsBSgZVcEjqlLU6qt0m3MCxz2ke5nI=;
        fh=hSN0rkdHzxBOgJPk/LoCAWKtiUmozfxrsy9aZgGe2go=;
        b=fb3MZU5cUWwl0eQz6uU2geVapK3R3Iu8Zstst7xBLYUEPWUXc1PKgo4/vgz+t7hLuP
         as6ZmwmrsEo9q7RiGJZP5P6iTqpd30eFyAiZcOnXPoRkV4Or7h1o/FL+akr6oly52cBX
         ygBIBVMDSOg/zgz6O/bk578vrDD+dicAi5EOV4IPei9l4E+od+5IjGQzh7HgKTf2X3Dc
         KpMSNRlNMVgHCu6gLqrShrJ/XXZvhPJzStEKPb/h52r4Vl9T3NEjMSr7OkJul/X718fm
         SesYQ7/DdpDZg7AfBdk7BPyy0kRBBLyH63Dvc41o0KhcKZFj56+uX9NfXK+MSDgT6nIH
         DWOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792706629; x=1793311429; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+BtLzYqJrni8hsBSgZVcEjqlLU6qt0m3MCxz2ke5nI=;
        b=Y12Mwjr5fiLbRaY5fesBAk9+TJ+X2UGQ4Cg4plW43X80FMHaUbZBPaN32VEmnsFgZ5
         f8xoQIdqRt8D7t5ozr1jPYu90BvgYqZzc8+LVKOmlp9/c6lYWyFyxK02HURxjrxbqi8C
         uA+VW11Ueixfdj2/1+4A0rYOfpuzlaChYz8Q6g2/+VNbpryAJlbEYX548fVFIe3l+uCP
         KQ6J6NstTdpTLXMq7gDP+rtFKokXMS7o049SHIxZfFeJjnCgC4mJafLNGXGQ0Ab98Yoq
         oekTRTwWZv1EPitDs/rSOqSYKyp14ZvDbo+snk/S/t+0Gy17+VWwldSDiMQJ1jbOCGZ8
         x/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792706629; x=1793311429;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S+BtLzYqJrni8hsBSgZVcEjqlLU6qt0m3MCxz2ke5nI=;
        b=oK79L+U8CA77CG3Xm8lKg3MVDLtR2iZ0uZEu3v1H0ojbipVcmEA2S6/7bE3UOImn7A
         Vdc6wnYx6XJGYYGmuigns7gtRT81wpPNM+CwyY9gNlLQVBuEJdlyEe0FIg1ft2StuSx+
         XDJs9SxNaYfV/MJcPZuny2C4iveybNZuAwWgNJWwsK2IuZvG/bwF+j8PUwe36htD1cw+
         U7tFfPj8TIUqGQG7pRvOv2XjM5hPzkJnKA14NumMiaznAuj7IuhjM1yqGpVfp3cCKc/S
         Ew4Nwy5wpExwWgDyooLBaV4yCrqmmFM06Bt4pRd+ptHFHKFLSi9IrpTk9mUZ3dJfen70
         crlg==
X-Gm-Message-State: AFq9FYKf9F40Z6B+GCYldM/+wNvu0TAq5mWDm4j61miPb0T3I5FdHKM9
	+BdmUsr25paYNOI1NidPxMiEXTK6Cil+4ASi7bZhO//GCMFPnPPY+3ZIUKeyg17v6bCtvaHeAYP
	+7XOAB9fdjTMCayTp5lPlAysIN5uWIWXUuVw7
X-Gm-Gg: AYBFou2WqeRXiwjaGZJW8VOFKUbqD7HNyvk8JTGqC7vVRb9dv0zcbVxGnOvE14yRk0A
	3UnQY4B0KyxQARwLl3Mt4QotXrsnBrzi+f7TvpQ9DvBER4QHR0dZjli5BLyu/823Onm3ydspWT+
	Ny9e5o2jSE0qH1FMVonRC+QIcHJJWJdALxtgLZjE7hqSMVG0S05tXZTrU9MoJU7CFNv/OlwTid0
	8n/lVzHgFhiGTfR9sBam44Zw1+c/SntsG/NOBnze3/OZyzWSUB1N7ew/DYzV3qQub0+BwGQWsOM
	fodSJxdUUSiNs/y9am7cQ+rXYWEhewPjPbMmWPzJp7jhhgUJQWglPBPFBLVsUohRgDHZzDNsNHd
	so+uRKBlZJRd1RqNB8JXY+jx8iLxxJtWvZq2JNbDW21GXpvAJZbywCfcJwRtr0voz26M=
X-Received: by 2002:a05:7022:1302:b0:184:5f2e:aa52 with SMTP id
 a92af1059eb24-1959eb781aamr866151c88.16.1792706628662; Thu, 22 Oct 2026
 15:03:48 -0700 (PDT)
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
In-Reply-To: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
From: Mark Harris <mark.hsj@gmail.com>
Date: Thu, 22 Oct 2026 15:03:37 -0700
X-Gm-Features: AclHuK_5NLfs0rDJ1zCX1rgY71IeRZpItGHKzQ2oT6KNhfnYH2Apjc-34lo5ioc
Message-ID: <CAMdZqKEWzg6Z5oYp8N+S4rkOjUU7WT6jwbVDCAk3YN3ZdP7u+Q@mail.gmail.com>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Alejandro Colomar <alx+linux-man@kernel.org>, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	Sam James <sam@gentoo.org>, "Carlos O'Donell" <carlos@redhat.com>, "Joseph S. Myers" <jsm28@cam.ac.uk>, 
	Martin Uecker <uecker@tugraz.at>
Content-Type: text/plain; charset="UTF-8"

Alejandro Colomar wrote:
>
> From: Alejandro Colomar <alx+linux-man@kernel.org>
>
> From: Alejandro Colomar <alx@kernel.org>
>
> I'm not fully convinced of this patch.  But I'm open to being convinced.
> I've written the patch, as Michael asked me to do, but am willing to
> hear everyone's opinion before applying the patch.
>
> As Michael reminded me recently, and as I've defended in other cases, it
> is true that the SYNOPSIS of the manual pages does not need to be
> strictly valid C.  It only needs to be useful enough for readers to
> understand the interface.  Thus, if using lengths without declaring them
> would improve the usefulness of the documentation, even if becoming
> invalid C, it would be okay.
>
> However, I still have doubts, because this change comes with risks:
>
> Programmers might think it is valid C to refer to parameters that have
> not been declared yet, and use that in their code, and if they are
> unlucky, it might compile for them, which might result in UB at some
> point.
>
> One valid point is that this is rather unlikely to happen, and most of
> the time it will just result in a compiler error, because no global
> variables with the name of the parameter exist.
>
> However, with local (nested) functions, this might be easier to happen,
> as variables declared in the outer function are more likely to share a
> name with a length parameter.  Given that the C Committee is working
> hard to standardize local functions, it might be a very bad idea to have
> this combination of events going on.
>
> Concerns that have been raised against using the GNU C syntax in the
> manual pages:
>
> Very very few programmers know this syntax, and thus they are confused
> when reading it for the first time.
>
> This is obviously true.  However, this is true of any innovative syntax.
> We should consider whether the confusion is dangerous or not, and
> whether programmers can learn it easily or not.
>
> I believe once you've been exposed to this syntax, after some research,
> or asking the right people, one would easily learn to read it, and then
> we'd have overcome the issue.  I don't think the syntax is inherently
> difficult to understand once you've seen the documentation and seen it
> a few times.
>
> Also, this syntax is not very dangerous: a programmer thinking
> that a forward declaration is actually a normal parameter will pass a
> wrong number of arguments to the function, and thus will have compiler
> errors.  This syntax is quite robust, as it requires several bugs to
> happen in the same code to pass compilation silently.  If one replaces
> ';' with ',', the parameter will be declared twice, which is an error.
> If one renames a forward declaration, it will not match a parameter, and
> will result in a compiler error.  Only if both mistakes happen at once,
> the compilation would pass, but then the call sites would also have to
> match the bogus declaration.  And also, the function definition would
> have unused parameters, which would trigger diagnostics.  So, concerning
> safety, this feature is not very dangerous, even if used by someone who
> is very confused.
>
> Do we think programmers are unable to ever learn this new syntax?
> Are we ready to accept the risks of using the dangerous invalid syntax,
> but which is more intuitive to programmers?
>
> Reported-by: Michael Kerrisk <mtk.manpages@gmail.com>
> Not-yet-Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---

The man pages are frequently used when seeing a call to an unfamiliar
function, to understand what the function expects and what it is doing
with those arguments.  The arguments in the call are matched to the
synopsis by order, not by name, so for example a person questioning
the first argument would naturally be looking at the first thing after
the "(" to find out what is expected there.

A person that is reading the description, where it refers to the
arguments by name, needs to convert that name to the argument number
in order to match it to the arguments in the actual call.  The natural
way to do that is to count the argument names in the synopsis (at
least those not preceded by an unterminated bracket or comment) and
stop when that name is found.  For example if that is the first
argument name after the "(" in the synopsis then it would be natural
to conclude that it matches the first argument to the call, and not
continue scanning to see if there is another occurrence of the same
argument name.

So I agree with Michael that this change is a good one to make the man
pages less confusing.  Thanks for creating the change.

 - Mark
