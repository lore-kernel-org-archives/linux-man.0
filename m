Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6E43B0581
	for <linux-man@vger.kernel.org>; Thu, 30 Jul 2026 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434322; cv=pass; b=B8Fr/6F0jSRtD7TVQKyCYviPgP3onTWUT+vLo32niTiyb2kijQbWJo8tM6FU6+78/0A+wZzfcPKcwW1TD2q/fytmY9jI6AUPvFp9nYTDt5+YzoDDzRvz+bXHWTRVxkppV+l09K1oqXw0vP3q62+YqAgjMV7KHkYsr5XstkOSvK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434322; c=relaxed/simple;
	bh=bIr+V1z/cvuSCyW+W2uoIg9669mr2uArCLRtvrHe6OA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1cTpi/GhLYmGsmMgbRU2NhGMHIrKT2mO//6iCA3pef8x/9mPieg014VMeL7bR/tQ8MWlVkYLwJ7SuqCi8UeY2OqFlo8cdnhSdqObQA3kQAbcEkTym+7rtRJarSjj7HCPeM6cSnh1V3df/0mBcs0u7jso6Q8RC6WJ2bme6FeS5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgvPby2o; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgvPby2o"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so68311e87.2
        for <linux-man@vger.kernel.org>; Thu, 30 Jul 2026 10:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785434319; cv=none;
        d=google.com; s=arc-20260327;
        b=geiysYgkwh/S1wlRzut371g4Xq2BawQAwZGz90oJedUCwZ51WkP4yq+25NpVL9TlFW
         TAPtgWvFzK51CXVb7EbZ++QUlCj752SJfwd0qYCGJViRKH9cwOoc0SuCMtJPugwoRhqH
         RMfKhbyEcWQMqA7n6NMuIH6lkFPpzPOOXI41lhu8x6BrAJkooCGT2ffFQzkcP7Nvsp1/
         5zeL1vcUWDFjQ4yw3mJ64HYFxCuszm2PZYzRYQWWMXQ2zRnVMFcloTAuSvN1X51SO398
         lDCQt1T6BC+CW6ILWcnlIj8pwdrDaWFccokvL0nWuTa4q2U7G9T3WZzkCuYEUX4lm5T6
         +/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PNNn1eTJ+Q1s16X/7JWegWifBQ7pOYDXuTq1HGghCdg=;
        fh=bbRbAUajM+tsc6zTkpQALOs9AQzzfnKawgcrptqS1aI=;
        b=jl7z8Ei6G7SpQn2tNBUyuyXmgwX8BdLMrhuCqhlv8n07aVd9RxHD8mRyZAA1G9h7NA
         BItIH4Es56WwhkdFNf5BD4ia4SuBCaqVs7oca8DK3I3MlPXHeEGcSaQqhnt+12nAPKVe
         7Ym1jnNCk5K2hCJa9WmXms3TWf7Hd0Hh8a+UalKSWhOe7PR0MndtFJLdL/CBSYMF24ue
         nhNATEezOe3m6uvA+opBwewmHuo3CHsSJIzN05yiAO9qJNqMixoEVvov/dFZM2PiHYO+
         AoXgjUpYMAVJ9Dt4/gP6Rz5rG0mGctfbM4AXAx9YqkxlpKOECTZzTTVWDUWcOwql9Zbj
         tnSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785434319; x=1786039119; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PNNn1eTJ+Q1s16X/7JWegWifBQ7pOYDXuTq1HGghCdg=;
        b=UgvPby2oDt6AQODnXPx2g3upASgnhRAMZAkKj+/w2kXRcDcA5NyCs1CqluiaIGiT/H
         iuXmqR9PlVem1+L3ZPQa7qNeafiimkQr7SM7eTlXGtTPqn2PAxqfDOVHCnvns49VI59w
         IKV0qqeSnlSiqjxQ+PLeMeLKqOYhc5SHA9662/sxSuhHyjwv9UgYR6CcAxmEo7NmMhDY
         r+kBTSnxTj2wncc96/R08SsYDKMZaruyAni00WgPldEX86ZklqLt3H5ePCT+FK6d8WzE
         +fWsg7Ek4k2lsP0EYswkL8IfuvjQFtylJBeQ+3WkNyPgMS45eN8m8r9z8XAXP6/ESfsq
         U04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434319; x=1786039119;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PNNn1eTJ+Q1s16X/7JWegWifBQ7pOYDXuTq1HGghCdg=;
        b=Kg61NMBpJHtb/pcbn+cih5hIjp4x+q3u/tHaLizndWudpdwv6EfP1s7fl+9lWfIpDP
         pz8k9knzZHhjWnZPazyJmZBVbqd/QO9XGg9UDatsdvxRWQTQgcPJFrqKNRGEUSmEEPd3
         e9shF/C/hkwIiOQ5XoY00egaxt+fAFxsJe0bMrQNpWhp6cU+xQJLzyBAtEUpwObmq9wH
         0ntCTNqEfLUNhDgjPMAhr51UaLJ+4YC29fkCqZHyslIqYjTTMJePEcyfF0gzCyA16/Yc
         7LmDuUn1PPEotbFDj1njd+NAee5Jpb3OTd/BJlImW0h2EQ2zYoyEy9aufCpZXOpoclrk
         WTaA==
X-Forwarded-Encrypted: i=1; AHgh+RpVG768PmpypqjlYXVdSQjWwkcd07F6iPlzl06S0TPZDS3ZZQXuSpy6b2376MrENEyME9sCHgy5anE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdMRZDU3JmyM6/j3XGCF8bigsvxaTToIyJYt8e/h5WGlwZfZxA
	ZgrwoPKvvXxvpIeg13Ol+cX7GADob0ywDbVgL4cqcORxfJLlYuV2w7Cg/EVqmQpjDjMIOUDBe3O
	pOk6xFu3Hju+IqMeW1ZHQzRi6bKEL1Mo=
X-Gm-Gg: AR+sD10Xj06BP/T6Y77NbM+ORQ563fj80wVcpX7xzeRR+kBHfs52YwV2FGPBfj2f6if
	3aaUz3NfXTEu6ummLez745Jmm4qMWA4WWx5Vfq1mD4DWMNjzH4MbGZfWyvYAM2newZRPDP4i68/
	urMWth6jbt7+ymb9FaXp2iJeyxIfN/J/ZrDp3/NQYoRkhLe3ugFpzXfJEs+qS9D/DDgxd2LMlhI
	Z54CMWGyvCeq8OgDEhPsOsxeM6yg1hd65u/mpg0CTvtokWcEn7kkxP0UJN3+VMI41mH7J3QJITq
	MxhkMEzlITeP1hHvnhrv9J/mMfZXsHabf/HIAGADQjQRQsmAaEmSwURDD/IOrnbtedtHRfWzxcY
	LaGVeX0u1QA==
X-Received: by 2002:a05:6512:128b:b0:5b0:1139:71e5 with SMTP id
 2adb3069b0e04-5b2db34428cmr706849e87.2.1785434318518; Thu, 30 Jul 2026
 10:58:38 -0700 (PDT)
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
 <ami6Pbs0oT9gLi4W@devuan> <CAMdZqKE-ZkCWhH3yY7200qEYf7xtFQuhxsEi9jiLgnVU4gKoAQ@mail.gmail.com>
 <amo4wqgjuirq_otN@devuan>
In-Reply-To: <amo4wqgjuirq_otN@devuan>
From: Mark Harris <mark.hsj@gmail.com>
Date: Thu, 30 Jul 2026 10:58:26 -0700
X-Gm-Features: AUfX_mxBUHeZkL_8MptGfPCWcAAukRZeBV0d__lPDnrA4B7ineoQD-F4thlPX5k
Message-ID: <CAMdZqKEEncWS64BUL1qa0SfcNUaNA9XRBPWTpHPB==N3VV_Nzg@mail.gmail.com>
Subject: Re: alx-0096r1 - string (and nonstring) copying
To: Alejandro Colomar <alx@kernel.org>
Cc: sergeh@kernel.org, linux-man@vger.kernel.org, 
	"Serge E. Hallyn" <serge@hallyn.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Content-Type: text/plain; charset="UTF-8"

Alejandro Colomar wrote:
> >  Also some systems
> > (e.g. with segmented or banked memory models) have a ptrdiff_t that is
> > larger than size_t.
>
> I'm interested in those systems.  Do they support POSIX.1-2024 and/or
> ISO C23?  We were discussing the possibility of standardizing ssize_t in
> ISO C, and also adding a requirement that it's as large as size_t, and
> also potentially adding a requirement that it's the same type as
> ptrdiff_t.
>
> It would be good to know if those systems that have a larger ptrdiff_t
> are still alive or can be ignored/forced to adapt.

SDCC (https://sdcc.sourceforge.net/), when building for mcs51
(-mmcs51) or ds390 (-mds390), uses a 16-bit size_t and 32-bit
ptrdiff_t.  It appears that Open Watcom C/16 v2
(https://github.com/open-watcom/open-watcom-v2) with the huge memory
model also uses a 16-bit size_t and a 32-bit ptrdiff_t, although I
haven't verified that one.  Both compilers have active development and
support some of the new features in C23, but do not have full C23 or
POSIX support.  I don't know about any others with ptrdiff_t larger
than size_t.

>
> > > [...]
> > > > >     System V; memccpy(3)
> > > > >         memccpy(3) was invented in System V (like the other mem*()
> > > > >         functions).  The System V sources are not public (AFAIK), so
> > > > >         it's not known what this function was designed for.  It was
> > > > >         later added to the BSDs and glibc for compatibility with SysV,
> > > > >         but nobody really knew what this function is good for.  It
> > > > >         doesn't seem ergonomic for any basic functionality.
> > > >
> > > > It is for implementing functions like fgets(), which needs to copy the
> > > > next '\n'-delimited line from a buffer filled by read() (so not a
> > > > null-terminated string).
> > >
> > > Hmmmm, do you have any such code?  I'd be interested in reviewing it.
> > > I still suspect it might have been better if it didn't copy the
> > > terminator.
> >
> > Sure.
> > https://github.com/illumos/illumos-gate/blob/4b44494cae63d4bf0c7d3f34828503e68d1c0e69/usr/src/lib/libc/port/stdio/fgets.c#L44
>
> Thanks!
>
> Let's now consider an alternative world where there was a function with
> semantics similar to memccpy(3) with one difference: it wouldn't copy
> the delimiter.  Let's call such a function memcpyc().  Here's a naive
> implementation of memccpy(3):
>
>         void *
>         memccpy(void *dst, const void *src, int c, size_t n)
>         {
>                 unsigned char  *d = dst;
>                 unsigned char  *s = src;
>
>                 for (size_t i = 0; i < n; i++) {
>                         *d++ = *s++;
>                         if (*s == c)
>                                 return d;
>                 }
>                 return NULL;
>         }
>
> Here's a naive implementation of the hypothetical memcpyc():
>
>         void *
>         memcpyc(void *dst, const void *src, int c, size_t n)
>         {
>                 unsigned char  *d = dst;
>                 unsigned char  *s = src;
>
>                 for (size_t i = 0; i < n; i++) {
>                         if (*s == c)
>                                 return d;
>                         *d++ = *s++;
>                 }
>                 return NULL;
>         }
>
> (I've written both of the above quickly, without compiling nor testing;
>  I might have made a mistake.)
>
> With such a function, the fgets(3) implementation from Illumos gate
> would change in this manner:
>
>         diff --git i/usr/src/lib/libc/port/stdio/fgets.c w/usr/src/lib/libc/port/stdio/fgets.c
>         index 9401217410ca..ac1f330ea46e 100644
>         --- i/usr/src/lib/libc/port/stdio/fgets.c
>         +++ w/usr/src/lib/libc/port/stdio/fgets.c
>         @@ -82,9 +82,12 @@ fgets(char *buf, int size, FILE *iop)
>                                         break;          /* nothing left to read */
>                         }
>                         n = (int)(size < iop->_cnt ? size : iop->_cnt);
>         -               if ((p = memccpy(ptr, (char *)iop->_ptr, '\n',
>         +               if ((p = memcpyc(ptr, (char *)iop->_ptr, '\n',
>                             (size_t)n)) != NULL)
>         +               {
>         +                       p = stpcpy(p, "\n");
>                                 n = (int)(p - ptr);
>         +               }
>                         ptr += n;
>                         iop->_cnt -= n;
>                         iop->_ptr += n;
>
> IMO, this wouldn't make it more complex.  However, such a hypothetical
> memcpyc() would be much more useful elsewhere.  For example, it would
> simplify the two unique uses of memccpy(3) in FreeBSD:
>
>         diff --git i/bin/sh/parser.c w/bin/sh/parser.c
>         index 0c1b7a91c257..713a35ad8cd8 100644
>         --- i/bin/sh/parser.c
>         +++ w/bin/sh/parser.c
>         @@ -2116,7 +2116,7 @@ getprompt(void *unused __unused)
>                                 if (fmt[0] != '}') {
>                                         char *end;
>
>         -                               end = memccpy(tfmt, fmt, '}', sizeof(tfmt));
>         +                               end = memcpyc(tfmt, fmt, '}', sizeof(tfmt));
>                                         if (end == NULL) {
>                                                 /*
>                                                  * Format too long or no '}', so
>         @@ -2129,7 +2129,7 @@ getprompt(void *unused __unused)
>                                                 fmt--;
>                                                 break;
>                                         }
>         -                               *--end = '\0'; /* Ignore the copy of '}'. */
>         +                               *end = '\0'; /* Ignore the copy of '}'. */
>                                         fmt += end - tfmt;
>                                 }
>                                 now = localtime(&(time_t){time(NULL)});
>         diff --git i/lib/libc/amd64/string/strncat.c w/lib/libc/amd64/string/strncat.c
>         index 2c63ab50b3c3..4a1e8c0119ac 100644
>         --- i/lib/libc/amd64/string/strncat.c
>         +++ w/lib/libc/amd64/string/strncat.c
>         @@ -19,13 +19,13 @@ strncat(char *dest, const char *src, size_t n)
>                 char *endptr;
>
>                 len = strlen(dest);
>         -       endptr = __memccpy(dest + len, src, '\0', n);
>         +       endptr = memcpyc(dest + len, src, '\0', n);
>
>                 /* avoid an extra branch */
>                 if (endptr == NULL)
>         -               endptr = dest + len + n + 1;
>         +               endptr = dest + len + n;
>
>         -       endptr[-1] = '\0';
>         +       *endptr = '\0';
>
>                 return (dest);
>          }
>
> memccpy(3) is a bad design, which forces complex code, prone to
> off-by-one bugs.

It seems like you've already made up your mind that memccpy() is bad
and are now just looking to justify that decision.

Your modification of fgets() is obviously more complex; it adds a
whole additional function call, and instead of copying all of the
bytes at once from a single source it does two copies from two
different sources, specifying the delimiter twice making it more
error-prone and difficult to change.  Both fgets() and strncat() need
the delimiter in the destination buffer, and the one place that
doesn't is only "simplified" by removing a single "--"; certainly not
worth a whole new function.  And if simplicity or eliminating the
+/-1s was important to the author of that strncat() implementation,
they could trivially achieve those goals with the existing function:

    size_t len = strlen(dest);
    if (__memccpy(dest + len, src, '\0', n) == NULL)
        dest[len+n] = '\0';
    return dest;

Changing that to use memcpyc() would have made it more complex.

I think that copying the delimiter makes sense.  For example, you
should be able to use this function directly in a loop, e.g. to
process '\n'-delimited lines.  If it stopped before the delimiter it
would need extra code to skip over the delimiter before the next
iteration to avoid getting stuck there.  But if the final line didn't
have a '\n' at the end it would have to be sure not to skip over it to
avoid advancing past the end of the buffer.

Even if this hypothetical memcpyc() function was slightly better I
don't see how that matters.  memccpy() has been around for decades, is
already in ISO C, is already in POSIX, has already been implemented in
numerous C libraries even before ISO C existed, and is in use in
non-buggy ways, so I don't see it going away in the foreseeable
future.  The purpose of the standard is to allow for confident
reliance on a defined base set of features, and removing functions
from that set that are in use and have no fundamental flaws erodes
that confidence.  memcpyc() has no existing uses, and also little
expected use, so it would be difficult to imagine there being enough
support to add it to ISO C.


 - Mark
