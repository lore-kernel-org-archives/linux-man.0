Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793309067;
	b=QCMMh2D7mEheyLTOB4WKbaI8aXKco6iT8q1HrypYYHTB7bxRP/dGtkCRxcQT8Cdq74l/
	 fnYV9evzwYYtjuAGtS81NAdud6RVkefYLuX3DY9OfVwqDB+0nSydjVdILduWsEL4Bsb+J
	 QViMvIIlulWw8e4PxukSnOwi4fYGWHjeNRXtFJlj82nqni5CwjvpFEdBeLUnC2KyHLuYD
	 feb8XZT9PQuNuW5m3aTZpqxHeRUyziedos7oycAu9M30A+GSJtlMx0xHBcH9RTA9uMAWA
	 PmjsIMbFHee1GZEX8M9KBvROp0+y+cqRw7Yp22YMAMBeJgSHcSSTuMVHc9Nir92wEeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SSGskmXrsYvRXStvHggD+mIfJ1YYFQVH4I9/fBrOoYs=;
	b=4+Xm55HOL4u0zD4v8FX9RyLluTf2bKYVMYgvqUlslJzCOodxaj86UBf5f8z0EkzdMSYU
	 tazMMFRvRhKFTY2jLF+xJWsq9T1PbO/Ixa2pKXktkU/GWnVWjUNaum6ZgLueEEfVoRzCp
	 gA/W9P5uUmMT+1Ueu0cJV5yj4nZr/9eMUSx/ijS/BJvG+bDzePCbe8khf9ZyuiTUMvWif
	 Oax7biPJcqENNod9kvRp7uomb4QfHrmqlSw6KBsnTNVMMdtKT/P+YyteBb+ItsH6c5fo6
	 WrSN60P+hO+Q9/YbWgYvmuJCsSq/yHLdPBQmcRlEEV2NGLWACa0YgLbhAoAFp748zvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SselF6v5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCF9606A324
	for <linux-man@vger.kernel.org>; Thu, 29 Oct 2026 21:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFCF9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SselF6v5
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35c76e9614aso187973eec.0
        for <linux-man@vger.kernel.org>; Thu, 29 Oct 2026 14:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793309066; cv=none;
        d=google.com; s=arc-20260327;
        b=FhL77ZJZeYfMDp5/imxd5D6EsiFln5GwI33+q7C1RlwYBgELZr46j0zX7Qtcz8KmVL
         J3yHw9nVV94KPbCt44FIdeHxVGMo6Uwm7Z7p1NFCp6F9lfzgQVC7hE+4R4LiEt632VOS
         GAZ9LK/nWt2Vxzw98YidH0+YTh6eXu5w3QHM2y5LBu5S8DFioJpW0O9KG215Cf6T0LPr
         68/XrmU9ccqRYMnAzWIoIZj96cYMF8CX83tcJuuWo+9vUAXP4UGD85nVNuJ2G/AzyUjF
         3+NTDijHkRWDT6f/Gvh9r1qvCzM5xNUEhltAnFzY9n96JOu2jU6RXZkNCMgI7tywFlTL
         xEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SSGskmXrsYvRXStvHggD+mIfJ1YYFQVH4I9/fBrOoYs=;
        fh=JWKYuOMONJcZU7OiXRhXumy38QeF6yGZH6jD6Tu3Tts=;
        b=aDzhcUAIRZMxYlnDBqgGfC/uCEOgsPT7GC7Bqd+Cz4lMfUTVepZtUNzKExR3VI8z6k
         CoGQe9Jf4Zbrxkm+OVfW6EaC9XltCzzQaf8U9hq4NLEmZ5E0Gx7iQRlTuyhDuV2Lj0iy
         kItBmrVN6RWuunO+9bg/mwNrJOZGCtgrIOaUx/CyoXVMMLZWXJJEnB47cm/KjRyj9rNQ
         k1Ce9T5e9FFv3yM2rBkn+TikF2etlGuiY0StM4V1fqSFFxDEoQKjSorW4Q82iA7LId8D
         fbRzmoxDWP4TxUnx90alVv72yp9a72M41DLVDOy/cHuqNUaWtPUUFop7TaOJPsASUa6a
         OZww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793309066; x=1793913866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SSGskmXrsYvRXStvHggD+mIfJ1YYFQVH4I9/fBrOoYs=;
        b=SselF6v5lNY+DOkJP5gPCSMs037fQvNhtzsJEV4B9WuHypGKV85dzvZ4Ne7OSp+rN6
         vo1NO0ScacfNcsyB2DtE4rp1v0LOdER0sLfz+grqduGdTiEkzYvTk9oF1MAKvX8Xxyy2
         qar5w7wk0oDrfqxAb68oWjlmorO182hrptncxg4AZKepL04KWbeCSibkHKXoZq5lOMeS
         8d7bAV2F6bZxoJ1KY+0LRVTeXta8I6Ys/BG6L45dyw/ILdwSrR+xReGNA6lXhJcY3UT2
         wMnuhwxf5yGdMMvmoHBWIN4DSBPdaZ6FqnY6TaA1whBhK+DXzIYqA9texa+6indrcNwP
         I3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309066; x=1793913866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSGskmXrsYvRXStvHggD+mIfJ1YYFQVH4I9/fBrOoYs=;
        b=T7z21aMVL4fA0AdTV/r/nwpFG5j+PTTgggUzI/9t3nGH02Ho/hU3GMLnfbNHhbCGiR
         Ogi5FNl3W0dj6zoZTNz4DVuYErrajIzFRT7Xt+aJPmQJg1nvatb2k7IgE/0HaSIf5024
         /I16+Qr/OeF8a2fVobL22pGRIEbAIpFWCM1EXyRIV7iHVpi6YI4Uzjinw08W+aHyLjxf
         Ihw+uTOzj35Lgd4atyEAZekk/G4Ud9wJ7STIsbuGKVEkxYtWEIxCGqwvwuj/eWgF6j80
         SGNsXyn4eocQ0ZBLYHQ23YMkNMVI8jf/JfHChlCqqfOLOHWhfy/hLkNDPFq9QULD98Kd
         boqw==
X-Forwarded-Encrypted: i=1; AKwUvBzSgKPYbl4IMRu4bs3fJ8vtLfBR1pJFIDrnguVD6WF/K/NUatFNT9W0DN+NuXc6u0JVSeUBRdY9cHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPHmn5+5TUB+H1MYQ3adEo+C7Umg23TUYuijisLw0AHajtvLft
	uKMLArwYmx4n0qwBO2FKRl2vDn9z02SS/HnMaJHU8PMPkdSApH4SeL5SuMpYD7noHhFQ6X+fRAc
	schrv6x0sSi8WHQronIdTZOJnuw3Walg=
X-Gm-Gg: AYBFou2J0PJ3kkVrVC+2exgNtQDAeyqZ0D83yr65cArb4/KUhjIW1OZTdu9AeLO//dT
	0zl1v07P+aQW2cn49KxNptogEe3JvHfG1LBGnBr2HvHfOWbpLhUvugaTvEYkzZo6cIrqhtT4t/Z
	a2ycu6SAYnvA4C6qUCD4VF7c+aMOWBsp80nELIYW8HaOAc579wu3oYhQpJiFZmGxlhqQafserZN
	0qhaq83ikyuoIRxeBZafT+Vt2xzFr1GZZxKm9F7VQMjz/UnC8ki0Z7pj8eBujb5tE1t/mGHhPa6
	xymVULPXb7uHLVZAdxK2hiwz797D3EJiVtJL3+i84EkxrL0PX34LiRq2Q5AYD/iVEgEL1bE2MdJ
	CGttbTWSlOST3ZUubV5RJef1JBmt6JYRQc+Jx461ZvH18UQ0eIKbRvVGA0cG5/CZIrp4sUrLPmp
	zWG1aP6YXnS+aEYNVA9yp88kG//Vt4eD9wxqx6MRXSnVLVXCS3kIz96jPn0Omg/Tgdx3cSYtf6N
	MfyZA==
X-Received: by 2002:a05:7300:7f95:b0:35d:eafd:5737 with SMTP id
 5a478bee46e88-36a423bec77mr1180146eec.22.1793309065678; Thu, 29 Oct 2026
 14:24:25 -0700 (PDT)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atpnWiYQzs_HZ1Q7@debian> <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
 <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
 <atyxz7Uj4rue8HjP@debian> <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
 <atzcMTC3Hl4GPD39@debian> <fbd4d03cbaf3e0b3a978ca3ff3902103ed954a87.camel@tugraz.at>
 <at2l_NpU28j3n6L0@debian> <dd9ca27e6b4c227c08cd707aab9b0b5d495c203c.camel@tugraz.at>
 <at2vv1isjbPZ6-34@debian> <76bff7cc342961bf81acc4a2d60e8c3d01918433.camel@tugraz.at>
In-Reply-To: <76bff7cc342961bf81acc4a2d60e8c3d01918433.camel@tugraz.at>
From: Christopher Bazley <chris.bazley.wg14@gmail.com>
Date: Thu, 29 Oct 2026 21:24:14 +0000
X-Gm-Features: AclHuK9XUSrlkLwH8_PCq92TX0LR7YKwdkdNw_TIIdygwwh10JBNtZbAAN2Rn9M
Message-ID: <CAEHU8x_+Lyf=K+pNzG0SWPRkQrb5AtqjYdkehV-fwX3ahsPrQQ@mail.gmail.com>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
To: Martin Uecker <uecker@tugraz.at>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, "Michael Kerrisk (man7.org)" <mtk@man7.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, 
	"Carlos O'Donell" <carlos@redhat.com>, "Joseph S. Myers" <josmyers@redhat.com>, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 8:41=E2=80=AFAM Martin Uecker <uecker@tugraz.at> wr=
ote:
>
> Am Sonntag, dem 25.10.2026 um 08:38 +0100 schrieb Alejandro Colomar:
> > Hi Martin,
> >
> > >
> ...
>
> > > >
> > > > > Much later it become useful to express non-null pointers.
> > > >
> > > > It still hasn't.  It will once we get rid of the bound.  That is, i=
t
> > > > will be useful when one can do [static] or [static *].  And even th=
en,
> > > > the fact that it can't be used on function pointers makes it a bad =
patch
> > > > in the language.  We need a feature that is consistent.
> > >
> > > Yes, but we do not even have a proposal and [static 1] exists today.
> >
> > Actually, we do have one: n3803.
> > <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3803.txt>
> >
> > The wording on this one is good.  I think I forgot some trivial
> > duplication of the diff for both the non-abstract and the abstract
> > declarators, but I can fix that when I arrive home, so we could have it
> > in time for the next meeting.
>
> Yes, please.  But this would also not work for function pointer,
> so I thought you meant something new.

I don't think that C needs new syntax to express non-null pointers to
functions just because null pointer constants can be implicitly
converted to pointers to unqualified types, any more than it needs new
syntax to express pointers to mutable objects just because ""
engenders an array of type char [].  That would be tackling the
problem from the wrong end.

I already have a solution that works for me: my fork of Clang (
https://github.com/chrisbazley/llvm-project ).  For example, this
function requires a non-null callback function pointer:

bool ObjEditSelection_for_each_changed(ObjEditSelection const *a,
  ObjEditSelection const *b,
  _Optional MapArea const *map_area,
  void (*callback)(MapPoint, void *), void *cb_arg);

https://github.com/chrisbazley/SFEditor/blob/8971ff7bc2ad047be637b4b09f185e=
bd4ac8bc5b/ObjEditSel.h#L105-L108

To demonstrate, I modified one of its callers to pass a null pointer
constant instead of a function pointer:

    ObjEditSelection_for_each_changed(&mode_data->occluded.obj,
&mode_data->tmp.obj, // previously occluded
-       NULL, occluded_changed, editor);
+      NULL, NULL, editor);

https://github.com/chrisbazley/SFEditor/commit/8971ff7bc2ad047be637b4b09f18=
5ebd4ac8bc5b

In GitHub CI, I enable -Werror=3Dnull-to-nonoptional for all of my
projects. As intended, the above modification results in a build
failure:

/home/runner/work/SFEditor/SFEditor/ObjectsMode.c:669:14: error: null
pointer constant converted to a pointer whose referenced type is not
'_Optional'-qualified [clang-diagnostic-null-to-nonoptional]
  669 |        NULL, NULL, editor);
      |              ^
/home/runner/work/_temp/optional-clang/lib/clang/23/include/__stddef_null.h=
:26:15:
note: expanded from macro 'NULL'
   26 | #define NULL ((void*)0)
      |               ^
1 error generated.

https://github.com/chrisbazley/SFEditor/actions/runs/40923220788/job/123621=
744519

I don't want anything like this (fictitious) syntax:

bool ObjEditSelection_for_each_changed(ObjEditSelection const *a,
  ObjEditSelection const *b,
  _Optional MapArea const *map_area,
  void callback[static](MapPoint, void *), void *cb_arg);

What C actually needs is a standard extension to the direct declarator
syntax to allow pointers to functions of qualified type.  Even
disregarding _Optional, SDCC's __reentrant and __banked keywords would
benefit from such standard syntax. SDCC currently has inconsistencies
in this area, for example https://sourceforge.net/p/sdcc/bugs/3989/
and https://sourceforge.net/p/sdcc/bugs/4027/

Although the keywords __reentrant and __banked appear syntactically in
the position of a C23 attribute, I consider them type qualifiers
rather than attributes because ignoring them can change the calling
convention and make calls incorrect. They also participate in type
checking:

int reentrant(int *) __reentrant;
int banked(int *) __banked;
int plain(int *);

int main(void)
{
    int (*r)(int *) __reentrant =3D reentrant;
    r =3D plain; // how is this safe?
    r =3D banked; // error

    int (*b)(int *) __banked =3D banked;
    b =3D plain; // error
    b =3D reentrant; // error

    int (*p)(int *) =3D plain;
    p =3D reentrant;
    p =3D banked; // error

    return 0;
}
https://godbolt.org/z/hPsxWe6Ga

I increasingly think this is also the right position for the qualifier
in a declaration of a pointer to
an optional function, e.g.

int (*o)(int *) _Optional =3D fn;

as a possible alternative to

_Optional typeof(int (int *)) *o =3D fn;

Currently, type-qualifier-list appears after
attribute-specifier-sequence in both alternatives for 'pointer'
but not elsewhere it would be needed, such as after
function-declarator in one of the alternatives for direct-declarator,
nor after function-abstract-declarator in one of the alternatives for
direct-abstract-declarator (which is where it would need to be
permitted to allow qualified function type names to appear in casts).

Best regards,
Christopher
