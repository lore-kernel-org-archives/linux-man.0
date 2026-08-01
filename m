Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5C82D0602
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 12:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785587968; cv=pass; b=VRQuH7EsnkdS35b0CkcRT4HOWvHcYrHPlU3To0e+mBWmQa87gm/xbqlH12Vd76Y28elPC1ksRKhwEpw1vrRrmxQPgfF5Hd1xzg/TbSVt1OUCyXJXm1uVTzeG1CXnHcjOlMfYZy9kFxRzKW8qE8P+eiKPW9iyNNF+n7cnTzYkaBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785587968; c=relaxed/simple;
	bh=qicYkMwZzgeEbwmi3UHnq6FbLIA6M7wZ1sF8/QlSGD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvUV3GLlEUjtn/9p4mY4m3lEKV475qZldHKgkuWrdFSCoS8mKm22MOyvI18MusGX36QTNTCRXxtoIjmUk9fF05hwTXoMGxHSb1mfaKZ1uinmzlStkEpRf+lYPMINr7ZuDg5uZ3RvTfMtYIyaBmERRH63+tu50P199mPK+E7Aeow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dartmouth.edu; spf=pass smtp.mailfrom=dartmouth.edu; dkim=pass (2048-bit key) header.d=dartmouth.edu header.i=@dartmouth.edu header.b=kpgoYZIw; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dartmouth.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dartmouth.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dartmouth.edu header.i=@dartmouth.edu header.b="kpgoYZIw"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39da69c5ba3so15119961fa.1
        for <linux-man@vger.kernel.org>; Sat, 01 Aug 2026 05:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785587964; cv=none;
        d=google.com; s=arc-20260327;
        b=V+od5iYb/+qN6Q4qX7b7/LLuCcIUYQsKG8Z8RLtcPKHzzPS9B2SnQxMfJGWzjmfigV
         S0xVZLJjKE9dJ33Fz3napC9BzCHPqEWG7agdYjte32m4o69sRpueSsa91Q8CIfSvozz3
         WxkDzXNqibuxR2V0qUy2itZIyIoftaQvbJv06lz4LAmjjCgINcyFIuZiWYllOgjhqB4t
         KngKMtqOwxxX+LIUb9q1QlyuGwwVILZdPuOIo0CjZs5j4un966pCHVoGioL7iP5Q8SrO
         +W4oBIGp+c1OjZ/3k8ZnIlgOZyKRfvl0KMF7X7Bi2/nrcsqLae6NXgxCN+Xktx4G0lWR
         +GeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8imhXrUx/e22vfJ0ljDmN56J03/fYM7sho2xIQ2HaOU=;
        fh=BIQbIcz61iNUz0fUIOP+33J8QEtV7Shbr6amJjJ93TY=;
        b=C2qRjNMvG4bnlm9Efm1TX0GPimuFIW8V58oaOLr56ojUauQzUFUIYnh7yVpu7sFNME
         roP/UxJ0Xespcp7t+5N+3PlJk47DvCDKtNx51RMBla6WsKyvdjoTZ6ng/Lp+WJGQAAap
         0ofqbOk+3+Vv73T+4r4i8JihaB/nx+2kgpQbesjUgjowFTjhKTy9VNqF0ipi5N6WUNFB
         hQBkhmxBsVPh4SrqcyB3rNf52T9J5bgDZZLPtoOt67ShYzMf6bIm4kuOncdMQAL8j1qx
         cKi9/b/BXSJRpDo+sbmIbSAcVlK6y+mxi7HsuBK6ckcKzh48Mlim81EdgXnm+NovA0wO
         /Ptg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dartmouth.edu; s=google1; t=1785587964; x=1786192764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8imhXrUx/e22vfJ0ljDmN56J03/fYM7sho2xIQ2HaOU=;
        b=kpgoYZIwxjvuq5SwY+PAXuELAYqrHlN+gk72GFwr9GUV7CCG8L7tt6SlcVQafMb9UQ
         i3KPkHTz1x6bbcDV+d14nPngdK/u0V2sazJEiN5WFYqdpGDPw+KXacAbstOrirVWzYRx
         ySWbmWM7PeczqD4kQyEDhym3JX1gtgFa6dNGO2Y9W6d1QXZ/ynRU9Ln8XXdfTXDDFqCc
         tGQ0dwwusHl+YxVSJ0RnLf3bl9jTiu+wqseF1t4exK6P6lAUHjymT1g3sgWLzVbr4S0I
         CIyQx4cxIzHt92uy9LWv2EJmISaNQoFVcNemM5z6iEqxTDCFqNcjQe7SPmDBA5bnrk4n
         uBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785587964; x=1786192764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8imhXrUx/e22vfJ0ljDmN56J03/fYM7sho2xIQ2HaOU=;
        b=NVnVQNG9VLkYX5nm2aQdpSaBAvlHxmTDob0ooAHF+fc3NaOw/4+I4ZYY705H1mBLbI
         a/MEELhlZXQRPz5Yzbp/BNCr4EJYItFWKfZEEdW50w0o7cF4k0K7ELolK/6WHtNDvu/t
         TSqqEb9Q38C9Y3pgszO/jpfv6yGTrNx9hpyJnQT5uWY/c72Trh0vbdNPL8/aeQWCyasK
         65GjIK0Pp0PBMavJH/rG2FOjXTa56/Ddf/reYcco/fMyQN2UdxMLbYn+zJ7zkFrQ1r5e
         i8dYpnlb7UyI5GABkSfF9dXOrau5vXqXyBPRHdpJalmy6q0AAuCNjAm6LTGPlTw7HaTH
         UZPQ==
X-Forwarded-Encrypted: i=1; AHgh+RodZU716CjDTLEk6QxkN380AI0yolAq5fRRDwOcFbkcWt/L5Mb2i0X76H/LGpaGLG7p5T+32AAY0ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmdheiyqzGW3aSygBuPZZe6Qty4GlATM6atDgNGW3xX7YnlS/t
	c4R7DoVjalLYsj649iwGG69BBy5K2gwLXAe9S+fojmB4m74NMm4gvtkG6iplyIShg40rzBqZdud
	abS9qU1Ec255ZCcMUVLGz6u9eaFN/FuA2Sqz01sR22A==
X-Gm-Gg: AR+sD12SLMxtLpCakVpQ2ME5pjA2Dd5z03sgfFEKLnyBca7xsvqm+TNwMpFVmVBVNIG
	XtstsyKWvwdnT4e6HZjGWdWcqEZahZWfHRLvviqAf7MdRuOQT445tUSrMdZLot3gejcVuEHobvK
	nyqMmpSQdXJsKUyL0zyIpd+aeulA6yX2+puVlGv4Bsgx0qQyOgy05j+k1ahKfeeFdgTb3RdQI1H
	BZzbVMJY7wrmp/YuznCP7HY8GzTcjsibPJ+3vDxxCCrqM6Un2y70l/Kq7V5o2wkQyD42TUxq/GP
	z3cetrypimlUQa8NyGXfuX/ojuyjIXCHrwX74WolV2TwpHMrrCk8xOVH2rDLWIByh4m78gM2mmE
	AIep4FbyCFrJ1nnpSPgrxqXDF7Go0dvG2gwjhAA1hLmBNN/0bbbIBxmnAoIUtIvjmnh4JmoMDAa
	Jqkhmqhcgehx1YW+oE8K79Llrnvj2U89H4BVh3+Uu3MgEgvHY=
X-Received: by 2002:a2e:be22:0:b0:39b:128e:ae68 with SMTP id
 38308e7fff4ca-39f8602410dmr6436921fa.0.1785587963776; Sat, 01 Aug 2026
 05:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785532392.git.alx@kernel.org> <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com> <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com> <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com> <am0lAEb1wuCJPDk7@devuan>
 <9223d084-7de4-914f-9b53-8862510542d8@redhat.com> <am0vIUDzNzTnXMcI@devuan>
In-Reply-To: <am0vIUDzNzTnXMcI@devuan>
From: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Date: Sat, 1 Aug 2026 08:39:08 -0400
X-Gm-Features: AUfX_mxUuBzbCDVww9qJVEk4YEqP4kGCcBa00_r7vK2wUXaatSaG2f5kkzKPMlg
Message-ID: <CAKH6PiWTmDsuFOOLGqMjEBY7+GafEmnfwoy-8-ZDxoJ-14JPkA@mail.gmail.com>
Subject: Re: on the irresponsibility of pursuing C language reform (was:
 [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
 provided by <memory.h>)
To: Alejandro Colomar <alx@kernel.org>
Cc: Joseph Myers <josmyers@redhat.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, linux-man@vger.kernel.org, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org, 
	Martin Sebor <msebor@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Branden wrote
> I'm sure I don't need to bring to your attention what a mine field
> string/`char` sequence/memory buffer handling has been in C since the
> language's inception.

Yes, this is a property of the language, not a peculiar deficiency of the
<string.h> functions. As I see it, patching up perceived deficiencies of th=
e
functions adds complexity to the language definition and to the task of
code-reading, with little real benefit.

Doug

On Fri, Jul 31, 2026 at 7:45=E2=80=AFPM Alejandro Colomar <alx@kernel.org> =
wrote:
>
> Hi Joseph,
>
> > Date: 2026-07-31 23:11:56+0000
> > From: Joseph Myers <josmyers@redhat.com>
> >
> > On Sat, 1 Aug 2026, Alejandro Colomar wrote:
> >
> > > > In other words, they were in that header for 6 years, and it's been
> > > > implicitly obsolescent by virtue of the standard choice for the 37 =
years
> > > > since then.
> > >
> > > Yes.  And I'm trying to revert the implicit obsolescence.  Obsolescen=
ce
> > > isn't a one-way process.  Sometimes, evidence shows up, and the obsol=
ete
> > > feature must come back for $reasons.
> >
> > When it's been obsolescent for 37 years, bringing back a header with th=
e
> > same name is just going to confuse people with 37 years of past
> > information saying it's obsolescent (normally if one source says "use X=
"
> > and another says "X is obsolescent", you can reliably assume that "X is
> > obsolescent" is the more recent information, even without 37 years of
> > history involved).
>
> This is highly speculative.
>
> If the official documentation says use <memory.h>, use <memory.h>.
> Moreover, I've never seen anything saying <memory.h> is obsolescent.
> It's been only implicitly obsolescent, and most programmers don't even
> know <memory.h> exists at all.  FWIW, I've sometimes seen it in the
> system headers, and eventually wondered why it was there, but nothing
> else.  Thus, there's no contradicting information about it.
>
> > Any reasonable change there would involve a new
> > header, say <strnpad.h> for strncpy and strncat,
>
> I think that misses that strn*() are still relatively misunderstood.
> It's only because they don't write that they aren't as dangerous.
>
> But we would be much better with strprefix/suffix() and other related
> functions in <string.h> to even further remove uses of strn*()
> functions.
>
> Moving the entirety of strn*() might be less urgent/important than
> moving strncpy/cat(), but it'd still be good to move them.  They are all
> about handling [[gnu::nonstring]]s.
>
> > rather than resurrecting
> > a very old one.
>
> I think the very old one is much better, because it can be used by
> virtually all programs already, since it already is there in all systems
> that matter, and already provides the functions were moving there.
> Apart from documentation, there's no real change.
>
> On the other hand, if we were adding a new header, it'd have to be
> wrapped in #if __has_include(), and wouldn't be used until 10 years from
> now or so.
>
> > > The solution of moving both mem*() and strn*() to <memory.h> and leav=
ing
> > > just str*() in <string.h> is a consistent one, because <string.h> the=
n
> > > remains strictly for string APIs, and <memory.h> is for the rest of b=
yte
> > > handling.
> >
> > It's inconsistent with how people have understood C ever since it was
> > standardized.  Changing the header memcpy is in is just as ridiculous a=
t
> > this point as the proposal there once was to obsolesce NULL.
>
> I disagree.  Obsolescing NULL is a deeply breaking change.
> Standardizing an existing header file is just like standardizing an
> existing function.  Nobody is saying <string.h> won't provide memcpy(3).
> My proposal to C2y says that <string.h> includes <memory.h>, so nothing
> changes.  All of the existing understanding remains valid (although less
> preferred).
>
> > > It wouldn't be reasonable to move strn*() to <memory.h>, and then lea=
ve
> > > mem*() in <string.h>, of course.
> > >
> > > Similarly, it wouldn't be reasonable to more strncpy/cat() to <memory=
.h>
> > > and leave the rest of strn*() and all of mem*() in <string.h>.
> >
> > On the contrary, it's only the functions for null-padded fixed-width
> > buffers that are niche functions causing confusion, compared to all the
> > rest of the functions in <string.h> for which it's a very well-establis=
hed
> > and well-understood location.  Some others like memccpy are *obscure*, =
but
> > not confusing in the same way.
>
> Did you read my alx-0096 paper?  It shows how n2349 --which introduced
> memccpy(3) in C23-- is full of UB in examples introduced as
>
>         To avoid the risk of buffer overflow, the appropriate bound
>         needs to be determined for each call and provided as an
>         argument.
>
> If memccpy(3) was standardized for reducing buffer overflows (which is
> implied, but not very explicitly said in the paper), it's ironic that
> the examples of how it's supposed to be used invoke UB.  If the author
> of the paper can't avoid UB, you can guess it's a bomb as bad as
> strncpy(3) once was.  And I'm not saying that memccpy(3) is bad, not
> that strncpy(3) is bad.  I use strncpy(3) and know it's fine, and have
> been recently shown that memccpy(3) is actually good for implementing
> fgets(3).  But it's not a function for copying strings, and n2349 is the
> ultimate proof.  It is just as bad as strncpy(3) if misused for copying
> strings.
>
> I'll paste here part of alx-0096, which clarifies how n2349 invokes UB.
>
>         Reading N2349 further, one finds an example of copying with
>         truncation:
>
>                 char *p =3D memccpy (d, s1, '\0', dsize);
>                 dsize -=3D (p - d - 1);
>                 memccpy (p - 1, s2, '\0', dsize);
>
>         This is more prone to bugs than the case above, and more than
>         strncpy(3).  Anyone suggesting to use this to improve safety
>         compared to strncpy(3), please, please, explain to me how they
>         think this can be safe in any way.
>
>         In fact, the code above is completely bogus, because if the
>         string is truncated, p will be NULL, and it invokes UB in
>         line 2.  See how it was predictably prone to bugs?  :)
>
>         At the bottom of the N2349 paper, there's a more correct --and
>         also more worrying-- example of how memccpy(3) could be used for
>         copying strings with truncation.  This shows how terrible
>         memccpy(3) is for copying strings:
>
>                 char *p =3D memccpy (d, s1, '\0', dsize);
>                 if (p) {
>                   --p;
>                   p =3D memccpy (p, "/", '\0', dsize - (p - d));
>                   if (p) {
>                     --p;
>                     p =3D memccpy (p, s2, '\0', dsize - (p - d));
>                   }
>                 }
>                 if (!p)
>                   d[dsize - 1] =3D '\0';
>
>         I think I don't need to explain what can go wrong in such
>         unreadable, brittle, and complex code.
>
>         ...
>
>         Using a more suitable function --similar to POSIX's stpcpy(3)--,
>         this could be written much more safely:
>
>                 char *p =3D d;
>                 char *e =3D d + dsize;
>                 p =3D stpecpy(p, e, s1);
>                 p =3D stpecpy(p, e, "/");
>                 p =3D stpecpy(p, e, s2);
>                 if (p =3D=3D NULL)
>                         goto trunc;  // The string was truncated
>
>         Here's how stpecpy() can be implemented for this:
>
>                 char *
>                 stpecpy(char *dst, const char *end, const char *restrict =
src)
>                 {
>                         ssize_t  dlen;
>
>                         if (dst =3D=3D NULL)
>                                 return NULL;
>
>                         dlen =3D strtcpy(dst, src, end - dst);
>                         if (dlen =3D=3D -1)
>                                 return NULL;
>
>                         return dst + dlen;
>                 }
>
>
> Cheers,
> Alex
>
> --
> <https://www.alejandro-colomar.es>
