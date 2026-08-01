Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129B63C1D68
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 19:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785614081; cv=none; b=mOYESFcuiusf/C9IeWrPHnAzBaNaqe86LV6zEH7JozAXS0V/adM6Z+z32bCzX+kau+Q46gZiNhm0BBdDAWCUK1StUhU8U/OI+0CN4e9MfR/xtRpQQy1LuRyoLWEwKZjsXZhADLRwZkimFGOSwtc6M5eF9PCytt2v0opE+lafeds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785614081; c=relaxed/simple;
	bh=tjAsvlJEiXT1FZCqAGM32r9e+eP9QdeEQ/6oxZwN9wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeSqrJZCXlmXerCNI8UUPfJlcZwUBhELgI+fQZiTzkaL6481ajbqDaywI7a7FMiNSmjkuNoBg+oKC3aExtaG0HVwx1m6d/kDOeGSYEjd+rPMLCAhGeHh/bp/kZjeH37wUNOX8SCcFBWuheJh5XRkjl7SDULKoOALDw8snmNDXeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FomOqLP7; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FomOqLP7"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81e9f7491ffso33286267b3.0
        for <linux-man@vger.kernel.org>; Sat, 01 Aug 2026 12:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785614079; x=1786218879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0EvSOUE97G3+kBAgv7NQwP2Z4yyby47Z2zDiDiayQAk=;
        b=FomOqLP7fRDj1wwaTarUn1G+8dt992+NdUTo6yaZtj0dHsjhZc8umT6ocI+2b68krh
         Q9FsKHeKkVYbmJa/KOBRbM8fYn073RN5jLpxhiSg/ra5OMnbpfvmRH8KVOhPzXCKHgb7
         F96QTPRCHbQ1hCx2AxVIaUme9hPYaDtpv/qLe1q7UrjcyL2vXBm0L6F1m8hiGHgLcYzo
         H82sI1R4F1o3c0KKMn4VHL5eP0PbxtGUtBkxsEdyOwT9Ijq9Q5OkUktX/7pi9Pc6Zcbl
         dETfspXl0hQTz20yQwK3R9iEDlykvjdCfVlEebklSJaVHDmcGUWzi9BHHkZzIP4ep+Bc
         xDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785614079; x=1786218879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0EvSOUE97G3+kBAgv7NQwP2Z4yyby47Z2zDiDiayQAk=;
        b=WBaTlj6yHMMlyYdFAsf10zYmTGYfUNa69LVvJLBPlrHzOjP6XYfdETWSbeDI99HyHI
         OKKvt7I9/ktWD6xaV/Y+9UAy08dcraBncrgUCvt1jGey+yDhWZN6xwOBYZx2RX46bSSO
         h1t6omTUmoUvtLQKcdLQUS5rrmA4Yass6/gHPdw2OIbHCPtXRLWwJUeIaVO8SqvdzZrJ
         AuWy8mjkbusOIIl4PtsbPdzPd/p6J9vZj1Q1vXsOoFaF/8HJYXKfqcu/Kt38J0UFXoPk
         pwJ23au9j36+wUqwofaHjqbYb+pSXfOCduZIyYGnhbLpWZB27CeBn4SbFXh55wAYT/Ou
         OX1w==
X-Forwarded-Encrypted: i=1; AHgh+Ro2koltldYG7DZaSlCqVgaCPKRDYmZc/NQVKyXGBeB8cX5eAnXdF7pDQvw/MbamqRK2pT/atgKnkIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXLbiNIocNXR5HnveX6ShfRuHLiZ+huoYrT1HFTjrkXmgcJsNU
	aZa/+HvvReSbBYMMCH6VwfEohtflY+iAH+zP/EyYH7cLXn7fp5gqGkeQ
X-Gm-Gg: AR+sD1160W/fW/r2ZIa4rwCp/ILUwXG+oarRjay2AjnpD5VDx5OIN3kHfrsZOrYSNXz
	h0DgdZLMkg4F4NQO02oJHBlHdSSa8lflnarhVpwEnt4x4a/A3EzJQoGSg72w10LYsUMxJL1l0dO
	h9MoA3EgRWAVCV9I2G+ixT6kV5eyP7BRwGhZ97qGuDVb3mMvE7HfsXNVeMqTp5t18W7Uu+9FBJV
	d6hXNmeoUuqBu7PyGGS4ctd34uyE871QZuZXlXDaSrdt0zEw+yC4Mz2S9N4h4x806i0sDR46J3v
	X4PgNM/x3AIC5g/ysA6hd5tNtaC5T5oilIQG5GXonFv4A0MUBp21/P2n1NN8M05FAOhKOcZLs6w
	0DK7kyzAjO9/5BXBqQX4Vs4w3I8qqpQVzyPqVJ1Wg9o3IdgyVkmwzd8noUlRnErKHbKVvIDxYSZ
	DIowyEGq8wJnpZGSwFNlb+RNejUR+v9yvG39LZsPquwYgS6R6YWU8=
X-Received: by 2002:a05:690c:6883:b0:81f:64cf:2c44 with SMTP id 00721157ae682-81fd4a379f3mr73106817b3.14.1785614078777;
        Sat, 01 Aug 2026 12:54:38 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d5ed8sm29037497b3.24.2026.08.01.12.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 12:54:37 -0700 (PDT)
Date: Sat, 1 Aug 2026 14:54:35 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Cc: Alejandro Colomar <alx@kernel.org>, Joseph Myers <josmyers@redhat.com>,
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>,
	Mark Harris <mark.hsj@gmail.com>,
	Nevin Liber <nevin@cplusplusguy.com>,
	JeanHeyd Meneide <phdofthehouse@gmail.com>,
	Christopher Bazley <chris.bazley.wg14@gmail.com>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Iker Pedrosa <ipedrosa@redhat.com>,
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>,
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org,
	libc-alpha@sourceware.org, Martin Sebor <msebor@redhat.com>
Subject: Re: on the irresponsibility of pursuing C language reform (was:
 [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
 provided by <memory.h>)
Message-ID: <20260801195435.lmuo2gstytdqyt5f@illithid>
References: <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
 <am0lAEb1wuCJPDk7@devuan>
 <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>
 <am0vIUDzNzTnXMcI@devuan>
 <CAKH6PiWTmDsuFOOLGqMjEBY7+GafEmnfwoy-8-ZDxoJ-14JPkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v3jqe5dmj4tqp6bk"
Content-Disposition: inline
In-Reply-To: <CAKH6PiWTmDsuFOOLGqMjEBY7+GafEmnfwoy-8-ZDxoJ-14JPkA@mail.gmail.com>


--v3jqe5dmj4tqp6bk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: on the irresponsibility of pursuing C language reform (was:
 [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
 provided by <memory.h>)
MIME-Version: 1.0

Hi Doug,

At 2026-08-01T08:39:08-0400, Douglas McIlroy wrote:
> Branden wrote
> > I'm sure I don't need to bring to your attention what a mine field
> > string/`char` sequence/memory buffer handling has been in C since
> > the language's inception.
>=20
> Yes, this is a property of the language, not a peculiar deficiency of
> the <string.h> functions.

I mostly agree.  I think it's possible that C's string interfaces
managed to innovate some deficiencies of their own on top of those
proferred by the underlying the language definition.  8-O

> As I see it, patching up perceived deficiencies of the functions adds
> complexity to the language definition and to the task of code-reading,

That's true.  But it is also true that without clear guidance from the
standard's specification of the library, and with the flagship text on
the language having gone unrevised since 1988, those perceived
deficiencies cause ad hoc innovations to sprout like mushrooms after a
thunderstorm.  Some of those innovations, like OpenBSD's strlcat and
strlcpy (1998), claw their way into acceptance.  Others don't, and
remain bespoke features of a particular code project--often with little
commentary or accompanying documentation to illuminate them.

The result?  Reading _any_ code that involves string/`char` sequence/
memory buffer handling has a substantial complexity tax stuck onto it.

Culturally, it used to be that any inadequacies of the C language or its
standard library were hand-waved away because a coder of sufficient
ability could bull through any challenge with cleverness.  Our community
has been purged of that preening vanity ten thousand CVEs at a time.

I think one of the reasons Alex is getting pushback is that everybody
knows this is a horrible can of worms--Joseph referred to "relitigation"
--and that in turn is because seasoned C practitioners have a shared
dread that instead of a brilliant solution existing somewhere in library
design space, we face only struggles over who the taxing authorities
shall be.  And everybody hates the tax man.

> with little real benefit.

If there is no Pareto improvement available in any dimension, but just
reshuffling of code-reading tax authorities, then you're right.

I can, at best, hope the situation is not that bad.

If it is, what is to be done?

Regards,
Branden

--v3jqe5dmj4tqp6bk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpuTvIACgkQ0Z6cfXEm
bc50AA//T5Cudc4pXDRlczK1I0jhK8OjG/w23xhSujQF9gZOHWC8kMhIqTCbqrEo
ldKnzPu/kpccsrkVvx6Gt89aCVPFxtvgdlg4vhy3BNaiDWgS10pBHI26bRQ1Gx3n
fZDKTdmmiB0PIAOGXWImmD7AmNjxzuMjwBG/VVmEaTunyHF5EaK1A/ICTSlc+hZ9
5jzuAZDj10bsBAHpG93U0xJsXywQpwxNBViNYOskOzth8q97Hl0epT/UPESipu2x
K1+Sv0bTLMSCSlZ2yFtMdF12QVqjOhALLWyWekXYJRugjOy9HXNtEFRFeD5tmBgo
toHkC/mlyk2lsAdQBwsxM8HeazgKhg7yBDLfcE5Qfst/54DdEntQR2Y3E2u30S7F
kLu851KcE5gYYIoCBWPUEXj3MXvrD7qXPrPz6Rd7djqfGcIqVWOxYkBPUiCt0HfN
lzouOY2TtSvsPuQRq4SOR1n7cjfPFepbnc8X7WovN86reWx0i9CQR1oQPuV/f/6y
Fh5N6GJT1SVwAZ3gU7XVH0qKEert30CSziZAN18Ti4fcxejjuqBhkD7mwc/UNdvT
PVjva1YOW7fgJOvZ5UAYhZZ09lXkiJ7/icq/Z2Ytz9eSEQXOx78+GXP8UeepGzR4
p4lZb1D1XarzJ+MNHO1VkqfUQ1a49+3i4jiFkvAHNJE0rN5ZIPI=
=4bFx
-----END PGP SIGNATURE-----

--v3jqe5dmj4tqp6bk--
