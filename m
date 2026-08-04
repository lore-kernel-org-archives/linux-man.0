Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6533EFD26
	for <linux-man@vger.kernel.org>; Tue,  4 Aug 2026 03:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785813940; cv=pass; b=iS4DzhSWr7sktsaHMQb/GEpsDEfvX2o79Y9IzZeRDfWlM5svw5qEcu3DrH4+mJl8XThH4uQ8eBLnfH4zHZE0H0LbcZ5RfKI8cIKopyOEC4+z4Bn2mV8SxOZCVtOaXEFZ50Gh3ODY1T1w0TmoC40XVqFmfDnFE3NkBxOAB8p+Cag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785813940; c=relaxed/simple;
	bh=PfwOMTcOJc4IVzpaAzfTP15LUM/RBVGCgV1Vps+VD+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jfSSutj3Dy3OvZ+2Z8YQXX1PiZ2S/kVC63mUa32z2A3qO/9F5WTu1JumTPeZwZ2ya3wSxLaDVQ8Co2R4CwWSywmLEhjrW4TZ6ePWath6M7rJfZSpvgwmPkaKQaBsUqhf2R4qpEMhu2adhEGkCS50Ytr6G7SLK/lEM49K02IA+FQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQA4jfaP; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQA4jfaP"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so34190671fa.0
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 20:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785813935; cv=none;
        d=google.com; s=arc-20260327;
        b=TfydxQzXJ7NNbTl39Uu8M19vrZNwNtUPWgAy/2pMGTdJDVRemFc7q1lOB5EiwFCuhy
         tmKjVjsyyA49evo1XMbQqP3BAwypKKOBvGAg1vcEzI8IC+JoI54t+oZ542lSG/EiNcHQ
         1zDAGwqu+Iit1l2z0pGBEM/1uhE4M5IkSflmcekVhHqDEEUe9rKeKmkj+NIOoflPvr4m
         k3cLjU1puqLEhbB/HAj0kgwrh/jF8b8z+9OwFabIkVy8fuBZ9O3sJU+Xi8s3Lh0Ugc5W
         a13CENIM3y8mX9ETkePa9vS3E5QspwDxKY+OXZgHAqVKffGSslw8RQslXuYLUKW629Wx
         FLUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q3tEucddpaSMnG9GZ6GxzrMhazGyB+e3BtC9NpbeHPw=;
        fh=qVCcwS9lI7id+1hEcjt0+hi7yHULTqjaTCtVc9sqK0M=;
        b=XyoC+qA/vybwiAmbCLgS2nzGLO9SdSH5DYSGAMq0Qe4ymw/mrHukQfCM6BU4NmQWJW
         L3tgV5lBuAzo0dwzoG0wcu+AxQ6t6BqErbVE/gGWgNsb3JT9sjB0z6yBthpEJrgcWmFg
         TGoRiH+gkR5X0d6wbDBQ7Z14a/x1BvMD/F/L+3yvdLs8WgfXp4f88uGRk6Q374FDhJB6
         liPguDcuKCN1r9VWPwCrbCUznM33TPOowKk+aWg1/KCdpC53tHumXGCpcDCOYFDGL8+e
         2SjilSx2jE2jTx2tQ4BN9tvrouSF1FU/I09Lacy4oPp2gVMV/8U3FsZAHVmf2zVEyzKD
         rbcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785813935; x=1786418735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q3tEucddpaSMnG9GZ6GxzrMhazGyB+e3BtC9NpbeHPw=;
        b=oQA4jfaPRMDgdIlpB5jSWkudH5dreOpAxHY7c2paS35n7CZLReHsSC0NCbAfDK3MOQ
         qvqauAecsED7CqYcgS9+9LI4x1senufE/t8PoIaYs1eioGVfmdXkY4KDKW/FIP08U0Hi
         3t2ca071r/6nNGCy/NruJXYa76lTiG5+xeVLpU8Di0CHbWPBIH32uVy+Wu7ZIBwfkYRm
         x+0xyVil7mwF1JI6SYSLdo6uhS+Fz33FR/2ArpcGdWq2heDb6dRSUteSTdbCc/yf/Xc/
         p8BAnRPw8JhzggFG8VeKhAsEVYfETROMx5LdubqzH1j6i4OAbHqgYdOmdshc2fC4spIy
         7dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785813935; x=1786418735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3tEucddpaSMnG9GZ6GxzrMhazGyB+e3BtC9NpbeHPw=;
        b=pSPALJbAqSo0oj+sVFS4db5K3SrwonfeqieSnlTUSJ6lwqXQmrpyTsLnxaDH3BOSIT
         o7NzvJhLExT5OQuwT+JQ216nV+Lyfk15eYuhi2U8QcaRt9lz8Vo6+F/m1MppCxqUK6L6
         hKKS4kvuLmy41cefgkUkI4H1hY6TenaA2hYOWDJm4FCHU6yYMpi+qOq8G5luP1FX8cz0
         Ns3Fq09hUA8lULDf60qiqI4vshmyJRBg+XzIhOUEwMfZZNNvnt/M6iM/KK4x6SgW/wb9
         dL8lUvFNn9N5yhPWwt0hKH0eniUZWpytrYgnKoajK+WywOVU/QHrJVxR1LJ9jEH76Kgk
         u5OA==
X-Forwarded-Encrypted: i=1; AHgh+RoT+HXC8MiQb3U/cGvHkM/awwz0o7lnWpxIl+bQzosyGZMN4Ns8WzpY08cAb4w9YpSx0yQsO1piMLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH5h2lRbnyX5mpyV07vKJ3m8narwN2SD1w9kimb2j0o2A4gdpD
	VO9kNrOzD+56DDjQkcn5kx/bvYWsl2n6KvYiGpFZfttJgHpBMjTyuO3Yg+EpT+l7fC7lkuPrj/x
	Do1lKBwuWtfHXLBiTuUK15PFrcA8gGTs=
X-Gm-Gg: AR+sD12gT4VePcsaS99bCCrC/Kvox+dvajA/npYt+O6NQ3gJ5zmzxEqIphU30b11SA1
	pc6PmkGA2PFYm17uauSclIHML203JJGvLb0RE/bRDamMuDXYkTYrZg7bezkJL6WAsbtiuV93d4g
	tu8ZoUGPruC7Cax6EL+f2IurIgpGinkXFkGazRHD+7dPtKmwoeBhbgSYfQ53/uH+ATWO9CEq5tN
	AsLxqu8YO50QRpn8+kAKaCDlIaDfMtEd9SN1uLzol9mK9coB/ea+TFnSxgM7pz6V17iYl9Sh7cM
	ttcYSzQvkTWYATK2PI2nn5NUpM9+iMC92sVrIe9gPGnHfAFfeyxNg9TOpDZzSRlGVf+ML6lgrA=
	=
X-Received: by 2002:a05:651c:150a:b0:39f:a2be:bc3f with SMTP id
 38308e7fff4ca-39fa2bec180mr12593811fa.16.1785813934406; Mon, 03 Aug 2026
 20:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <am4jxBOh_VRvhCQw@devuan> <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan> <am5_uA4MSujYCS9X@devuan> <20260801235332.vc443gozbqkqdqm5@illithid>
 <am6HTtAMkEEkWjfl@devuan> <am_jYJL6uAapMGXN@devuan> <CAMdZqKGRJuR_Jyt7TapMQFQ-6wz=OF5DROFhXkZLQNAn2vyimQ@mail.gmail.com>
 <anDgpLT-FlRrJKC2@devuan> <CAMdZqKH1=20mAxRR0-F+Pf4EXv57Nchr1TSwe_5CsEaEKp00rQ@mail.gmail.com>
 <anEjBKn5ZzeUF8g2@devuan>
In-Reply-To: <anEjBKn5ZzeUF8g2@devuan>
From: Mark Harris <mark.hsj@gmail.com>
Date: Mon, 3 Aug 2026 20:25:21 -0700
X-Gm-Features: AUfX_mzAD-ZF65MZJbcEDLnvxf9uSS8ffdpK4WkDZ4roDfvYng3gk3Q6ZOtyhgs
Message-ID: <CAMdZqKEACoFA6pc5t1N5CX6AKkV3XDEMoeY490ABGONG2uxU3Q@mail.gmail.com>
Subject: Re: proposed revision to memory.h(3head)
To: Alejandro Colomar <alx@kernel.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, Keith Bostic <keith@bostic.com>, 
	linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alejandro Colomar wrote:
>
> Hi Mark,
>
> > Date: 2026-08-03 13:14:35-0700
> > From: Mark Harris <mark.hsj@gmail.com>
> >
> > Alejandro Colomar wrote:
> > >         SYNOPSIS
> > >              #include <memory.h>  // See STANDARDS
> >
> > intro(3) implies that the SYNOPSIS section intends to reflect the
> > function's API; i.e., the interface that it has agreed to provide to
> > applications.  Do you disagree?
> >
> > If strndup(3)'s SYNOPSIS stated "int" instead of "size_t" for the
> > second argument, it may work fine in many cases but that is not the
> > API that it has agreed to provide so it is inaccurate.  Similarly if
> > it states "memory.h" instead of "string.h", even if it happens to work
> > on some systems, that is not the API it has agreed to provide so it is
> > inaccurate.  If memory.h ceases to provide a usable declaration for
> > strndup(), that is the problem of the person that relied on the
> > inaccurate information because there was never any agreement to
> > provide a usable declaration of strndup() in memory.h; they should
> > have used a reliable source to determine the API that is actually
> > supported.  I am having trouble figuring out where you disagree with
> > this seemingly-straightforward logic.
>
> There are already pages where we can't even consider a unified
> interface.  Let's consider the case of ttyslot(3), once part of SUSv1,
> then obsoleted in SUSv2, and then removed in POSIX.1-2001, but still
> provided by the usual systems.
>
> The SYNOPSIS says:
>
>         SYNOPSIS
>              #include <unistd.h>       /* See NOTES */
>
>              int ttyslot(void);
>
>          Feature Test Macro Requirements for glibc (see feature_test_macr=
os(7)):
>                 ...
>
> But then, of course, the actual #include is a real mess.
>
> Funnily, there's no NOTES section, because I moved their contents to
> more specific sections some years ago (we were never happy about the
> NOTES section being so generic, and so I eventually put some order
> there, but of course, some parts weren't perfectly moved).
>
> Okay, let's ignore the fact that there's no NOTES, and assume the
> comment meant to say 'See HISTORY'.  Here's what HISTORY has to say
> about the #include's for this function:
>
>              The glibc2 implementation of this function reads the  file
>              _PATH_TTYS,  defined in <ttyent.h> as "/etc/ttys".  It re=E2=
=80=90
>              turns 0 on error.  Since Linux systems do not usually have
>              "/etc/ttys", it will always return 0.
>
>              On BSD=E2=80=90like systems and Linux, the  declaration  of =
 ttys=E2=80=90
>              lot()  is  provided  by <unistd.h>.  On System V=E2=80=90lik=
e sys=E2=80=90
>              tems, the declaration is provided  by  <stdlib.h>.   Since
>              glibc  2.24, <stdlib.h> also provides the declaration with
>              the following feature test macro definitions:
>
>                  (_XOPEN_SOURCE >=3D 500 ||
>                          (_XOPEN_SOURCE && _XOPEN_SOURCE_EXTENDED))
>                      && ! (_POSIX_C_SOURCE >=3D 200112L || _XOPEN_SOURCE =
>=3D 600)
>
> SYNOPSIS is kind of a TL;DR.  In some cases, what it says is all there
> is.  In other cases, there's a lot of details.  When there are details,
> tradition is that the SYNOPSIS at least hints that the user should
> continue reading somewhere.

I wasn't asking about your comment "// See STANDARDS".  I understand
that you had more to share that was too long for the SYNOPSIS section,
so you added the comment.  I was asking about why you wrote an
inaccurate include directive in the SYNOPSIS section that does not
reflect the supported API of any implementation.  Even after reading
the STANDARDS section, the implication is that the supported API is
memory.h, but POSIX says it should be string.h.  However, even if you
had your own libc implementation, it would be inaccurate to claim that
the supported API is memory.h for any more than your own libc; you
obviously cannot unilaterally change the supported API for
implementations supported by other groups.


 - Mark
