Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF163469843
	for <linux-man@vger.kernel.org>; Wed, 29 Jul 2026 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785346052; cv=pass; b=COUNPZJ67Y9f/sduH35QVbk0vDPyLCJ/Rov7jzzxXfXUNzZNGbvuehhU2A08RRs2jO3RtVgebYiP4qgJnkoLccjkSDwgCDKQQseQ2oifG8Njnq/EnAy3dW1o9FM/xwIgTyB9UChVUIzAWI9BoRubesw+uFTDAq0TuHC2bAe9u5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785346052; c=relaxed/simple;
	bh=gk6++CNUMjnGe5QUzWq/hzwX92RTiveRm/bcwuFSd5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUZFcHDE6Gp/7CfnmQPZzdOdlD9Dw3GtsA/CBdkHYhcjxpvTEXlEN6J2kWMBfuxTEfN9AQu+dgZ6wAOyKvBsvTHE4atK7bjPLothE724Eemlul0REh5zsyCtobTHDdCgA3EW56lpRNSWUTtkYs8Rua6LITLabFWXc6ziRHxn3fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWfcKs+R; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWfcKs+R"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2aab18795so1055273e87.2
        for <linux-man@vger.kernel.org>; Wed, 29 Jul 2026 10:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785346049; cv=none;
        d=google.com; s=arc-20260327;
        b=GbkdP7g/um4uRHvRJZ8naOVHXHRTGyy6oaNrvjLorZvJL9csJT4umX5AiKbFdI7lvo
         NTZCB31HNN/eunTt1aNc7oBIu2Nq+XkHMGVfCSAxi8Gaa8hkqbZTvp3BZrC8cgusGJyT
         1NhuiplylcqGXra4pkHXWplepz1tDOJhXOEYhiM5Cysu5SpDbIE/yAvkawyfDEJHa2OF
         7Q/OKUgODXFvS+6dsgCNXfBGrFSljd1lyi6XJv89KYldUAShFI43wzi1JxDb+m8SGaf4
         JlFwWPBuC9rmvIY90tcYYe+yfWe+f3K4BdCJiWmhNjgp6pyzvV9ilc2KIT4ligQKQwZQ
         VWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ncznWNMosG9O1FWmUarE2aUXDVyPPOf5T49uvum93ZA=;
        fh=UUnfHpJfjvjebp3lRKymVVsUIJrhsjumXt+GN3SOcSQ=;
        b=MiYkklD7mGU387rgR8G7+vaZq+Vl5+HEQ90uSP8cUdcqBLXwnmYpAECYdjRd9GiEqM
         njNbW1OzbCuvNUOqqDSJ2wFdEP9z+YpXFPaNdlEaoWOrjkymlRy3YyIrFtWUjpEDOESL
         7r6ievMApySje38ZNnLAtCwBsV+QgV12pPtegousg1DmIbrLOT5qki0E1ZCLAIOpwxDa
         iHL6koLdjwYl7293+Ve0AtU+XCVhcP9x6q3d+putytg6EW+t192cCGXrCxzu9D2R8zEd
         kTdqStg9xurR4OCZib5sbARluecgYYA8bvIfKHFKKZKrYIoylS1mpvpii6NWTWYi3lLJ
         wbzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785346049; x=1785950849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ncznWNMosG9O1FWmUarE2aUXDVyPPOf5T49uvum93ZA=;
        b=nWfcKs+Ru3Pd/LbVk3SsVgcoFMiWAa5Juf7s1THT9lcVp1YHrXojCDvW36jknFJTLF
         e6gyknAyIBODNDateHdBzOkJpyW687ERlVYuSXqAayiNTKQuaEfDXbnCl3vMkDiqlNl8
         6XhV4bw3URRGy/5m2y2QXEk63YnUTHesyvpJ/44PbHafLWmEGu0y8jUNL9p/Brz1Op/+
         yKOvbu3efXwvavSUdagOccULl9efgQESy66dr5WxM3Yw6cnMgOkdUooe/TisHk3bgDxY
         B6BFdVDSgJuOcsDL6sErYgG+225fhluhr46Z2gz+FXOukKG8SbuAOCeaVmwHXFLUF6Da
         wZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785346049; x=1785950849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncznWNMosG9O1FWmUarE2aUXDVyPPOf5T49uvum93ZA=;
        b=Rulpu9v0JpW74CJG9NLGH4P2inxP4dVncZ099kxM17dxTIF8M1FSIYwggqqvzIr13I
         talMXgxFeJhyP5NLzZGs4uqKys9FazGOlYH7BlZRd4LW4H8bFvEUd/3L8Nz0nX7yQkRF
         9xgVV3/bZ1dGyzBwkDRrZ+b/H5LBN3PLf2s2TMiA4OAOTqfh0ITutaHOZGRvhZyCIMbR
         gTIipAuz+5W1ZirF1CKmhcD58oyL0yy8hapysPC9YfakqVCW0ujm15g+aCRM/6dghRwX
         vEDlDczoGOARSyOMFDc/kGs98KrWlxTmYPZtBH2FJgUEQ4vcaVQ4jdtiwWKGMvFypPxw
         jWCg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0/GayL4inaU0IZ/Tgcu6/07IyYsc996hamPF9yKvzjOoXeNwODFS6JV5AaZLr/6ZWDiwBUnz+OJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVCVarseQgY8kjXv0snL0wq65+Sg+wUta/z/vtQbphOtZnYjls
	Ohn0k7aBD5z/ddXhjU73/CQEVJQMktkXxZwE4rQPS7sabNPt1g7s1lf1OTetGUgl0GHdZaWBRxi
	jiudbebl+OvmhfHNtDk0kLfzHT3MH4mw=
X-Gm-Gg: AR+sD12GdwlkRV+OKVGYh/3BVjYUw0xP8ExSIvxAjkKR5tPxezh9O5eBwtgWsojCBPe
	kzwGoTnyAU5aI6bNwzVL6o4Lgbi6nO2xCKjx059gD5jbY17GFGfXdDXeXMy9EBgcJozoeSs3nBa
	emt+yvHadzJs0J7nv1f4VGU7JT01pYk4J+KeTiCLztWYXKaoSUc8Ly6TfmnaVCFXQrhU/mUwgCM
	2QXqXyHKsQ7lgN/325bLog1cNJS8Eg1qnJpPxmKHlTLXn1ARs2SOumu9g5MMALn4vC1WD+WJ7z6
	Lc9gBoOFafWPwwJysYdSB5yPbtD04GyxwD6jLWIzsN/1B76Imjq8w90URd1GjfmMnLb2YPJF5/w
	=
X-Received: by 2002:a05:6512:1386:b0:5ae:b0c0:16bc with SMTP id
 2adb3069b0e04-5b2d0222bbfmr1928339e87.27.1785346048539; Wed, 29 Jul 2026
 10:27:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org> <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com> <amUw8ArFwmnsIKl1@devuan>
 <amaTpQxd52iYjlor@devuan> <CAMdZqKGFF-1fqsT0xSZDrBSGC-zztxayX3xAhFHXP-cKjEthpg@mail.gmail.com>
 <ami6Pbs0oT9gLi4W@devuan>
In-Reply-To: <ami6Pbs0oT9gLi4W@devuan>
From: Mark Harris <mark.hsj@gmail.com>
Date: Wed, 29 Jul 2026 10:27:15 -0700
X-Gm-Features: AUfX_mx7L38gadrubkph63TJ-U7o5Zj-QRwchw6xcSs01zeUs4Ih_Lkf5cwlDY8
Message-ID: <CAMdZqKE-ZkCWhH3yY7200qEYf7xtFQuhxsEi9jiLgnVU4gKoAQ@mail.gmail.com>
Subject: Re: alx-0096r1 - string (and nonstring) copying
To: Alejandro Colomar <alx@kernel.org>
Cc: sergeh@kernel.org, linux-man@vger.kernel.org, 
	"Serge E. Hallyn" <serge@hallyn.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Alejandro Colomar wrote:
> >  4.3 BSD (1986) then also added the mem*()
> > functions for System V compatibility.  Later the C89 committee chose
> > to standardize the mem*() functions but moved them from their own
> > header file memory.h (introduced by System V) to string.h with the
> > str*() functions.
>
> Wow!  This is very interesting.  So, after all, we shouldn't blame old
> Unix systems, but the C Committee!!  Another very important issue to add
> to the list of bad inventions of the committee.  :)
>
> I wish we could re-introduce the <memory.h> header, and move these back
> there (of course, with compat declarations in <string.h>).

Since you propose to add functions like memtostr() and strtomem(), I
would think that having them both in the same header file would be
beneficial.  Otherwise it would add yet another area of potential
confusion for users:  Do I need to include memory.h or string.h for
strtomem()?  Does it depend on the source or destination argument?  I
thought the goal was to reduce confusion.


> > That is, memtostr(str, mem, n), introducing a whole
> > new area of potential confusion that was not present in any existing
> > mem*() or str*() functions.  If reducing potential confusion is that
> > important I would have expected maybe strfrommem(str, mem, n) or
> > similar.
>
> Hmmmm, interesting suggestion!  That makes it resemble the strfromd(3)
> family, with which it actually has some (minor) relation.  (It might be
> a bit
>
> strfrommemcat() would be a weird name, because the cat is next to mem
> instead of str.  Should it be strcatfrommem()?

I think that strcatfrommem() is better than strfrommemcat().  Although
I am not convinced that it is worth changing the name of a
well-established 49-year-old function just because the name may
confuse some people, especially if it may end up just exchanging one
area of confusion for a different one that people haven't even yet
learned to watch out for.

> On the other hand, there's precedent in strtol(3) having the arguments
> reversed compared to the name.  Programmers are used to having the
> destination in the first parameter.

strtol() is fine, because str is first in the name and is also the
first argument.  What makes memtostr() confusing is that mem is
mentioned first in the name but it is the second argument, and str is
mentioned second but it is the first argument.


>
> [...]
> > >     shadow; strtcpy(), strncpy(3)
> > >         The shadow project more or less agrees with the Linux kernel =
in
> > >         this regard.  It has implemented strtcpy(), and uses strncpy(=
3).
> > >         It doesn't have memtostr() yet, because it happens to always
> > >         allocate the buffer at the same time, using strndup(3) --whic=
h
> > >         is essentially malloc(3)+memtostr()--, but that will change
> > >         soon, because (non-VLA) arrays are safer, as they allow
> > >         validation of source and destination sizes at compile time.
> > >
> > >         The implementations are independent, and happened to be
> > >         fundamentally identical.  It seems that good implementations =
of
> > >         string and nonstring copying code converge to this set of
> > >         interfaces.
> > >
> > >         Here's a naive implementation of strtcpy():
> > >
> > >                 ssize_t
> > >                 strtcpy(char *restrict dst, const char *restrict src,=
 size_t dsize)
> > >                 {
> > >                         bool    trunc;
> > >                         size_t  dlen, slen;
> > >
> > >                         if (dsize =3D=3D 0)  // UB
> > >                                 abort();
> > >
> > >                         slen =3D strnlen(src, dsize);
> > >                         trunc =3D (slen =3D=3D dsize);
> > >                         dlen =3D slen - trunc;
> > >
> > >                         stpcpy(mempcpy(dst, src, dlen), "");
> > >
> > >                         if (trunc) {
> > >                                 errno =3D E2BIG;
> > >                                 return -1;
> > >                         }
> > >
> > >                         return slen;
> > >                 }
> >
> > ISO C does not have ssize_t or E2BIG.
>
> I'm aware; this is a push to add ssize_t.  In the wording, I have
> specified strtcpy() as not-necessarily setting errno, though, since it's
> not strictly necessary.
>
> >  Also this API does not handle
> > the case of slen too large for ssize_t, which may not be an issue for
> > Linux, however ISO C has to support a much wider range of systems.
> > The same issues apply to strtcat().
>
> I believe sizes beyond ssize_t are not valid.  At least, for a ssize_t
> that matches ptrdiff_t.  No object may be larger than PTRDIFF_MAX,
> because that would mean that pointer subtraction would be undefined:
>
>         char *first =3D a;
>         char *end =3D a + sizeof(a);
>
>         end - first;  // Overflows ptrdiff_t
>
> That's because pointer subtraction happens on ptrdiff_t instead of
> size_t.  Thus, we don't need to care about sizes larger than SSIZE_MAX.

ISO C allows objects to have a size up to SIZE_MAX (=C2=A7 6.2.5).  ISO C
does not limit objects to size PTRDIFF_MAX, it just says that the
pointer subtraction is undefined if the result is not representable in
an object of type ptrdiff_t (=C2=A7 6.5.7).  It is the responsibility of
your code to avoid undefined behavior.  Glibc malloc() deliberately
fails on sizes > PTRDIFF_MAX to help clients to avoid this undefined
behavior, but that is not an ISO C requirement and it is still
possible to obtain such an object in other ways.  Also some systems
(e.g. with segmented or banked memory models) have a ptrdiff_t that is
larger than size_t.


>
> [...]
> > >     System V; memccpy(3)
> > >         memccpy(3) was invented in System V (like the other mem*()
> > >         functions).  The System V sources are not public (AFAIK), so
> > >         it's not known what this function was designed for.  It was
> > >         later added to the BSDs and glibc for compatibility with SysV=
,
> > >         but nobody really knew what this function is good for.  It
> > >         doesn't seem ergonomic for any basic functionality.
> >
> > It is for implementing functions like fgets(), which needs to copy the
> > next '\n'-delimited line from a buffer filled by read() (so not a
> > null-terminated string).
>
> Hmmmm, do you have any such code?  I'd be interested in reviewing it.
> I still suspect it might have been better if it didn't copy the
> terminator.

Sure.
https://github.com/illumos/illumos-gate/blob/4b44494cae63d4bf0c7d3f34828503=
e68d1c0e69/usr/src/lib/libc/port/stdio/fgets.c#L44

>
> [...]
> > >     POSIX; memccpy(3)
> > >         POSIX standardized memccpy(3) just because it was in System V=
.
> > >         POSIX derives from Issue 1 of the SVID.  It's not surprising
> > >         that it's there.  Especially, this function was always in POS=
IX,
> > >         and the early revisions of POSIX are known to have strong
> > >         preference for SysV functions, regardless of their quality or
> > >         widespread use.
> > >
> > >         Interestingly, POSIX mentions that memccpy(3) does not check =
for
> > >         overflow.
> > >
> > >         > The memccpy() function does not check for the overflow of t=
he
> > >         > receiving memory area.
> > >
> > >         This is because the 4th parameter to memccpy(3) is not the si=
ze
> > >         of the destination buffer, but the size of the source buffer.
> > >         It is assumed that the destination buffer is large enough.
> >
> > That is silly; the maximum size applies to both the source and
> > destination, like memcpy().  Obviously if one is smaller than the
> > other, you must not pass in a size that is larger than the smaller of
> > the two, as with memcpy().
> >
> > >
> > >         This hints that the original (System V) authors of the functi=
on
> > >         didn't consider copying strings as a use case for this functi=
on.
> >
> > It's a "mem" function, not a "str" function, so it should be clear
> > that it is intended for processing byte arrays and not null-terminated
> > strings.  That said, if you wanted to I guess you could use it to
> > implement a function like your strtcpy() pretty easily:
> >
> >     if (dsize =3D=3D 0) abort();
> >     char *p =3D memccpy(dst, src, '\0', dsize);
> >     return p ? p-dst-1 : (dst[dsize-1] =3D '\0', -1);
>
> FWIW, I wouldn't call this 'pretty easily', but this is a bit
> subjective.  I'd possibly make bugs in the code above.

It is shorter than your "naive" strtcpy() implementation, and doesn't
depend on an undocumented non-C23 function.


 - Mark
