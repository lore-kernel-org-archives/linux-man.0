Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792858592;
	b=EjSG92kCUFjaAspdTWGAyQYKldDLhjn7sRG5Z3ZzFyH/38Qr5T/pBat4LjENQGUlkc6C
	 InLn7Ras1sE8YVGjQBzUOTdsbAW7kz6yWq0xqcUisKRpZqbVZBf0xuTVcI9bCqW3nauuS
	 dW8D2j1Qp3MfYaF6aAGqWsGvVqeM1hza7OJFo7aW/ZVJRXTAlinHR1Ww85LEIDXfK6EWl
	 bunU1k4oIchLdVt4Io/IvN7Dojpo8++MvFrqCNcNPLzpHQH2Cf8vWG4lKCQmmp7k09sHB
	 ujnIdeLi93Hy7KMxkCgL5RsO0VM67pzJrxz9QFl8kp2h9THkOrKiBQI0e0Wu2+NQqSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PELdwsNJS0VHwsmmftbM4bH5fHuMzdOkrMsh9iddr+8=;
	b=r3Y29iVTsdnj+g19RAC1LFLuCFxq6k3A2UuvFZuvOT9labVTcJ8vFc5n1AXBhBFvp2BJ
	 /03Kndr7A+0bVc6ErrAd9UYQPnF1wiJhM7FXT4YOAzKnI+ImIlLyD7Ep/5Qdh9Kswc51A
	 weP5X5C0Sgv7M8RotuJFc8E6r5pMd4ilk/M5xUT5K0Tmctu4tN2n1i8/hCN/LQoDnnJtX
	 Q9hcibFYtKSsdxsEsFDvt0jtZeyqnfIUQjjo83jA+ef4+P3rn3IkCIjudJCpQQxK8rFFe
	 cLl0fADXfq6aOCvPvEtuQRX7j57ti4HsmH3dyimchIfgzXIUxJp3u+w4uLenNB9Uplw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V3J2zIvN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA9D606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 16:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA9D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V3J2zIvN
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3514b90bb89so4180799eec.1
        for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 09:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792858591; cv=none;
        d=google.com; s=arc-20260327;
        b=glkG9cwF2+3pw/YGgaHY45pEuYS68RViJyhrwhqf7nxTGDKbYMJ7/K/D92BQi1Et6L
         a0eyKSDRtgooeX+jHTYx/wN6uEGAPSRDzc/7t2hC8ftts0RD+0CwrYcuA7SklXXVhh4U
         6PRHiJfLt8cUKcNAYb8S02orG0pzzBOQC/P4TTHoSxpjDj7Yq8O5VNnRvyPiyusZdxEm
         UIf3huxGzO6FugGHXEpb8F4mVzEnEi8GbvEEB/opPyqluCNbXU7QVBG8H3j34A++9u6C
         GC6wDG5Vlfpx/v4EZh+ncORxh2J1NPvlgE/nhWjIEVU0GBF77BeLQI3H367XdR33qaWu
         8Jbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PELdwsNJS0VHwsmmftbM4bH5fHuMzdOkrMsh9iddr+8=;
        fh=+fp3izfkerUtxWMTGnqGiDxvn+wxxo+aI+eQbD+lf8Q=;
        b=Ob2LOWpJKm1FCT/KpjEB2bhc25ww0GK6UR7Yluv87QsPfBYHBREmkgkcXuXRntvSKc
         AF5gMeSbJwqfn5SgJBRfvNNZMsUehwYM9XDBrTDizuP07w4Pz1lT2VG1sV9EJc5ztUw5
         igY2iKmTEhiSZu/9ndgvmb8DIOMWwZc5qDo1nh9+RGzEOokvo7hYdTi3GSkY1trFG6E4
         SpUj7TA/YyVPsnAdIodr/jHzzdAasZ0rv/2w/UN8Q/anaNpIS/Eix00F3jSFMwjcjsHM
         CM38z9jDrS2FVnLr8ORyahb5kgqBetysJkgYZocMmjUs9vYfA1shm6g935I7rfvQ24Zg
         WzWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858591; x=1793463391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PELdwsNJS0VHwsmmftbM4bH5fHuMzdOkrMsh9iddr+8=;
        b=V3J2zIvNZxb2NdFHjKsx126ygvWcXILhxU7kLdBcBOpOKnecU4qqRjind3lODjU876
         uGSq2rRU/MxEkohAD/4tdKJ//SjcsyHXVxxyWz9rCLmzSWtxzqnH/IrRmgel05NyONG7
         RnVMo2aOYwuYpzxSiBmCGmbcoQ5r2HapD8VQ0L7RROTk8BtS0zZjeSe5usKDkdsPNqDj
         1GeOytdAdtk0RxjXfzXvqieSizE7u0jAGhtACPlJo8wdh74nDk/5Bwz9kOYZfknCVY8f
         iEdt+QHM50E0vGg43nk5RaWjhiApZKxumWqzu1b72JLKvGWF5bIxkn+uozFwtJJoQkJG
         s9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858591; x=1793463391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PELdwsNJS0VHwsmmftbM4bH5fHuMzdOkrMsh9iddr+8=;
        b=Jg44Z56zMwVSK/iH7R0R1a5hBsayWo895ZHX6DI/14MfVG4ocJY+GjFnwmi8rwapOD
         sjK7tE3P5P0+JONynT8FMexNh1tdbqpWgP6sjxbxjb8TaJxU75DLCaWx0GeIkhH6joYp
         UzUpdJbIql3Pjrgil8cZP4NjwlAL6zT8azlwddjbLCq/UP5mqDI0HKDd30qsN8IcHJ5f
         XDfmjzaG9lGk8+jIKP9SAAFquurSpFAcTL2GLvxCTnmM1fvX5nHswN/wmNUmZ8DMt4UQ
         7ygnvqJy0it4q/8L9JYLEUJ9jSYYXrLTt5nCRuqdaxzgb/6o/0tdEunWMbfIK4D5q0Pi
         8bvw==
X-Forwarded-Encrypted: i=1; AKwUvBwTZ6xzKRskcCaoaGmOopUGbqkARBEjIs0DDJqLiNzm9p8JHah/au4/TiSAGmG7rOjHjG6xc5ly1OI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXs5W+SStYcCUxvUrqy6Utcn13bqG6K1c7RK35+5rPI+4g2Cnn
	CYwWTizeFIuUVaOUS8gop14QCnoDvTp/72enrPIdXyeHUpWkGUmvOUaG7UsoLQw9y1R0wMt8mJI
	gHJjX+mxX7TrJRFCzvwEUBAjHaRFDzjU=
X-Gm-Gg: AYBFou1nlAGzOD/GYPdna+e37M7mJmUoOpFLHAr7fK3m36LAhqXjus2UzFI8yaJqTSb
	v5uYBauZHO0wOMx0MbeZuTHI30o358nh94z3qTfRIiOoxOEwRRe8+rKuU2+kcU/qIg1iLws1dms
	o+VNbrfK9clshDwJ29GO5YItsUngLhQaY4qcKW851z+6ooxUK0Ao4NRWzchizLk5+OZrC048ATk
	hY5GWmCLbJRbKbOW9/XRompZxuf9uMvEFBvZwCfuj1ryfyuUanlvYtEqdmkqC+/T3Z3ARNmlzHY
	DPTmjA4EYGnRTGwKmqn/c7qmyYDVsUeTcxEZ0lK0OWaMUSX3eYB0HtqVisZJdK1ozYpjCkF+oTd
	eiKo4jnYUr4GeoxZaQbJJS7hUXQrBViKipGCPuLXaF3WZz6nMAhJZIEDEhb5WRIku5eEnmGdU9+
	mTfMWZglp8dulz4drPa0A=
X-Received: by 2002:a05:693c:4152:20b0:35c:6268:8127 with SMTP id
 5a478bee46e88-369e845b089mr3931503eec.13.1792858591388; Sat, 24 Oct 2026
 09:16:31 -0700 (PDT)
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
 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com> <atyxz7Uj4rue8HjP@debian>
In-Reply-To: <atyxz7Uj4rue8HjP@debian>
From: Christopher Bazley <chris.bazley.wg14@gmail.com>
Date: Sat, 24 Oct 2026 17:16:19 +0100
X-Gm-Features: AclHuK-ZJb87PSGYW2PelKGR8dOwrQbEjR3e_7POB43zT21uxxX8J4Ooqzflbeg
Message-ID: <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: "Michael Kerrisk (man7.org)" <mtk@man7.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, 
	"Carlos O'Donell" <carlos@redhat.com>, "Joseph S. Myers" <josmyers@redhat.com>, 
	Martin Uecker <uecker@tugraz.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 2:38=E2=80=AFPM Alejandro Colomar
<alx+linux-man@kernel.org> wrote:
>
> Hi Michael,
>
> > Date: 2026-10-24 09:45:02-0300
> > From: "Michael Kerrisk (man7.org)" <mtk@man7.org>
> >
> > Hello Christopher
> >
> [...]
> > > I am curious to know what your attitude would be to lesser-known
> > > standard C syntax.
> > >
> > > For example:
> > >
> > > int pipe(int pipefd[static 2]);comprehensible
> > >
> > > is standard C syntax, and requires the caller to pass a pointer to th=
e
> > > first of at least 2 array elements, unlike
> > >
> > > int pipe(int pipefd[2]);
> > >
> > > which has the same semantics in ISO C as
> > >
> > > int pipe(int *pipefd);
> >
> > I was unfamiliar with that syntax, but at least in context it is
> > immediately understandable,
>
> Actually, it is not understandable.  [static 2] doesn't mean the same as
> [2], and this is one historic mistake of the C Committee that I wish had
> never happened.  [static 2] is never what you want (I was tempted to say
> almost never, but I've never seen a good case for it).  Programmers want
> the meaning of [2].
>
> The main differences between [static 2] and [2] are:
>
> -  [2] means (in GNU C, and in common understanding, but not
>    acknowledged by ISO C) that:
>
>         -  The caller must supply at least 2 elements.
>         -  The callee must not access past those 2 elements.
>
> -  [static 2] means (in ISO C, but ignored by GCC):
>
>         -  The caller must supply at least 2 elements.
>         -  The callee is free to access past those 2 elements!!
>            (of course, if there aren't any elements after that, it's UB)

You can, of course, document for the benefit of callers that a
function does not read past the static array bound.

>         -  The caller must supply a non-null pointer.
>
> The null-pointer issue is nonsense, but we can live with it.
> The allowance to access past the specified length, that's the real issue
> with this feature, and why it should not be used at all.

Of the compilers I have tried, only SDCC currently warns about access
past the specified length, and it does so regardless of whether the
length is specified using 'static' or not:

int foo(int a[static 2])
{
  return a[2]; // warning from SDCC
}

int bar(int a[2])
{
  return a[2]; // warning from SDCC
}

https://godbolt.org/z/zf3nPerdn

(I'm tempted to report the warning produced in the 'static' case as a
bug, but in reality no warning is a conformance issue, so that
characterisation is subjective.)

> The committee was clearly confused when they added this feature.
> It was around the time when 'restrict' was added, which is another
> historical mistake of the committee.  In general, every feature they
> added thinking of optimizations (and that includes these two) has
> resulted in a mistake.
>
> > and I so I don't dislike it, And it is
> > standard C.
>
> When the standard clashes with reality and common sense, I'm not sure
> I'd give the standard much credibility.
>
> >  I really don't think Linux man-pages is the place to
> > introducing nonstandard, GNU-specific syntax (that people clearly
> > don't understand).
>
> People clearly don't understand [static 2] either.

My understanding is that [static 2] was introduced to facilitate cases
like the following, where an implementation could theoretically
generate code that reads the first four elements together, but would
have to load subsequent elements individually:

int len(int s[static 4])
{
  int i =3D 0;
  do
  {
    if (!s[i]) break; else ++i;
    if (!s[i]) break; else ++i;
    if (!s[i]) break; else ++i;
    if (!s[i]) break; else ++i;
  } while (1);
  return i;
}
https://godbolt.org/z/ra6zh7Ej3

I have never yet managed to persuade a compiler to optimise such code
differently from a version without 'static 4', and I struggle to
believe it would ever be beneficial to do so. The more obvious case,
where an array bound such as [static 4 * n] potentially enables
speculative loads when unrolling a loop with an early exit, does not
need the compiler to be permitted to generate code that reads beyond
the passed-in array bound.

Christopher
