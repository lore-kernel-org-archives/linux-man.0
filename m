Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F48047ECE4
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 23:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542274; cv=none; b=Guj9z3tM+dKNB8C4NK/uRVoKfxJ9r9LxJDih2ew07YEs5zdBw2kXwd3uQ4eYDMf1QPwl9YFFHYbse0FYSKGmBX+x5mppgBB6NX8dfQ77nDUHacRR8qD04xj5tNJ54hh6wDEbhNA1odFvkV2qh84FwzYuiIUGO8bmSzAoSAak86o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542274; c=relaxed/simple;
	bh=rA3FZSbmf5xK8LYhK+yC0seJYznvIeBkyD/6NYDeknQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5Jc2xzV8YJ2iyqQtSK8ol3pmdMp+KgahNmr14vS8dvM1ekpqGA1h95i9vHQDEaEokoJcoCHTQbfK3YND+Sd+vvmF3XgueHH8j0C/WZbGgLNkx6+Vza+SaqQdiWqCv6MthoP1vv4hOyzDLLI7WakgWDoorAXBW0ewiO2o0+cKpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRGv1mSZ; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRGv1mSZ"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81ea0b7d137so13684727b3.2
        for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 16:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785542271; x=1786147071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AyPCAYjfYfmxIOCN9DONeclG6KlmOsdJ7QBZ3kDQHR0=;
        b=pRGv1mSZIcPBshdOVrjAO+mcQ7jf+EhDn/QkjH2MK5iK9vBk5SdovdW97sgFmof58X
         cAOEWF66kneF/1ADZ7Q/2k8gx5MJs9S+bS0scBcaLQCwfW4j3CedX7KiPF8yJPEKNIKX
         EGxC6V/LKzZ3Pb+tJwrP9LI7Wd64V3Bie+MHFw7f3Wq+DoQ+UeUkxKIhSe4k3ei57W2v
         oN7MynF79iM5gknm81Ys7xNMM71vE7IlUszpxQ3kxGgMb7q+YuVbVrgbTFPB8rqn5hLk
         ZylsqVYxRPbFZCOkQ25ZfPFHa9DOdoF0A6/6A14FlpMfSdusDcBuOhCBgQeUd7U5hFZX
         puSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785542271; x=1786147071;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AyPCAYjfYfmxIOCN9DONeclG6KlmOsdJ7QBZ3kDQHR0=;
        b=pbkFD7q1xQSCx1nm5IQZZ5HHX45Cm8JjT+9a1jhlqal16xrZw45crdZ6fkXNREyEk8
         qoUKMSVI02K3bhYawwhNA56nJPZtOYSaqLV2uU4xapaRmm1uGVeC8biyKofOZq9npwW0
         3ebFdgeEkBjaAW3VmAf4UqqXiUwCeNAL6xuf9bEsHjNCivP1oNyRctuFnGuQyp4Gg+8h
         bDk+J50+eJwTjT5Zn6FSW9ZuupWmXIwPZyNfgHPldW9mIrPVr/t890M9Ph7SFaMJfjJr
         Lg5gsXivu2GipxwBJavgXOKxDxEQvi2sM/ag/11R3DfJp2farn/kHp1WheCUcpxT5ZIA
         KMNA==
X-Forwarded-Encrypted: i=1; AHgh+RoL8B/pvDLx4hdP7WTwUNrsT8NxqRY898wJQJrWwt7YhF4tjoGvD7wU0Iw7itzbKcecBJnIXdyPjBM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0IHMs/xUf3zGRiQowmhXU/dkMdlNGIR4etXEe5VDIDWEyP3P7
	Z3dG2/+/BNWib3qMvXAz+PB8His4pZwTmOa7udHNB+WBVCcoNnzPOhOthbV79Uj0
X-Gm-Gg: AR+sD13/6plF4Ec6HsBmnO9fWKCz9WBBEDp2bv09rRbzsSrY0TNQX3I19qJr0Tfu0+l
	tigLVk4mhqsDlNppN94oAUQqSwwQMVyqCmtdsmNqxb+FZJn4nZUn1kDf4PVFov8318Wv5B3N/z5
	tDKAfS2btZ3cakmjIVeJjuvfX0MYZoeigvC19LsIyXtjsEwEVM/DNh50EQYBNdjFOSMsMDpKN4J
	785mdBGgj6gjEQV4CqHxpseAucs8wnsbZdfZCZ8cvwRiZhsJsXqIksRGUY91tvgpZ/nQjQ3TwUp
	mR30J/kx36MMhBCXN2pbO2KpW0O5zlEFfJg3ffMdZkRh9SM/7wmRbw3OcP+Bfr5p52R3bd5XLf9
	epQSZsM2Grb3r1fHTlWJtlXxgOMaWY9BE5itGryFU9Kks9zJDzYQ3MyrUgq2sRHUd1Stal86tcl
	KeDyLK/lVlUqm8RHr/xn2iq58gSVCxLyzWrcahODAOkyqNKTEoXG7fkISiJhMS
X-Received: by 2002:a05:690c:3381:b0:81f:238a:1709 with SMTP id 00721157ae682-81fd4c2202cmr26393077b3.34.1785542271429;
        Fri, 31 Jul 2026 16:57:51 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd135816sm16882727b3.43.2026.07.31.16.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 16:57:50 -0700 (PDT)
Date: Fri, 31 Jul 2026 18:57:47 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Joseph Myers <josmyers@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>,
	Nevin Liber <nevin@cplusplusguy.com>,
	JeanHeyd Meneide <phdofthehouse@gmail.com>,
	Christopher Bazley <chris.bazley.wg14@gmail.com>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Iker Pedrosa <ipedrosa@redhat.com>,
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>,
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org,
	libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <20260731235747.7bwyb2xul4zhryuu@illithid>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
 <20260731230847.prx4gay3ejvqdy6q@illithid>
 <8b8fc216-8c6e-fcc2-c72a-2c26555d95e7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="catlbfwvx4mvmhzy"
Content-Disposition: inline
In-Reply-To: <8b8fc216-8c6e-fcc2-c72a-2c26555d95e7@redhat.com>


--catlbfwvx4mvmhzy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
MIME-Version: 1.0

Hi Joseph,

At 2026-07-31T23:28:19+0000, Joseph Myers wrote:
> And I consider it an abuse of position to change man-pages to declare
> to users in general of C libraries on GNU/Linux that your standards
> proposal, at a very early stage (not even an N-document), is the One
> True Way of using the functions.

I agree that there is a _potential_ moral hazard here.

> It would be more neutral to say in the man pages that "as of July
> 2026, one member of WG14 has proposed moving these functions to
> <memory.h> [reference]; this proposal has not yet been considered by
> WG14".  (I doubt the utility to users of describing proposed changes
> in man-pages at such an early stage, especially since the information
> would be long obsolete by the time those revisions of the pages make
> it into distributions, but it would at least more accurately reflect
> reality, and be vaguely neutral as long as you do it for *everyone's*
> open proposals, *including those you personally disagree with*, rather
> than privileging your own.)

I endorse this perspective.  Another thing Alex could do is gate such
readily-obsolescent stuff behind a *roff register so that it doesn't
format (or, if one uses soelim(1), even populate the document sources),
for _official releases_, but is still there for people pulling on Alex's
Git repository.

My interpretation of Alex's tactics is that he feels energetic about his
proposal, is willing to think it through carefully and advocate for
it--these are good things--and that he wants to get it in front of
domain experts and anneal it by fire before formally putting it before
WG14--_also_ a good thing!  In the meantime, he is the steward of a
platform that _is_ topically implicated.

Such a position _can_ be abused, but it also seems not quite fair to me
to expect him to stifle his advocacy in a _relevant_ forum.

Conventionally, what Alex faces is a potential conflict of interest.
There are a variety of ways to cope with those.  Foremost is disclosure
to others of the potential conflict.  That's such an important factor
that I'd say it's 90% of the battle.  Most of the time when people
resist disclosing potential CofIs it's because they're self-dealing,
they know it, and realize that disclosure would be self-incriminating.

There is another tier to the issue, and its recourse is recusal.  We
most often see this in the context of arbitration or in the judiciary.

However, Alex is not situated as a judge or gatekeeper here.  To WG14,
and to C library maintainers, he is an advocate.  Has Alex rejected any
proposed patches to the Linux man-pages along similar lines as his own
advocacy?  That would be gatekeeping.

Alex might consider deputizing a fellow maintainer to handle updates to
portions of man pages where he has, or expects to have, business before
WG14.

Regards,
Branden

--catlbfwvx4mvmhzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmptNnQACgkQ0Z6cfXEm
bc7oeQ/7BM50b0QhLB/1PEMxL8YOXTqy7lTq+u99G8F70UubgyHHvZuFUE13Ofjw
gJHIBEGynd0Rew4PP1OR0XbBy2+CDskj6ggNNkfnPdGudWiXzHODNBndxYAIxuCZ
6QPP2nteKSh31ufEgJtDZhmAFtb5Rcn25fs70vmbcHu/heRUJGb/MvHn0/YBLEVb
IMixyKUu6g5V1TuimUIUPtggcerGMmuq9Ja2X8we8AIQy/6RBRjC+DdqJHUMA7KB
GUYyZoQTDOCw5YaoX6TeA2wfWqwDKi6fNB8dXI21ygRh2TYmpnWf00innKkRFARn
EOLQTngrqqpn8QjOSj4RwHhNMTuHXzqkliM3JFLIs7WP8Jt1IeW55eNMmkKpzs/c
XBuhDL0Cv0xRpaRNS08UTFQvpmxm56+EwBG3XjKpKJDvLDUZTDY5NwFekK54CsBQ
pNGnTGtwFnQAV1JSju2ZiVHKRUy3/Gb4J7q3xt3A1Gc4bW37wJZRMioQmDdXIHNf
AlHimkZj8yP2ix/cnFVC3e/t0ZYxT+gh4VMTGgwtbJRbJ6hqdQ8TWU2Vp6ZaEsPh
seXi+WOd2A4jYqOfIC33bYoUUJs7CTdRlfZs9n4rZzPG6awX7wPHB9xZKqY756oG
1RjHqp8jRWUi3Rkq/MUAH+tUsCJkCuGxRWhRzEVx6QNcDoEPHzw=
=0YmB
-----END PGP SIGNATURE-----

--catlbfwvx4mvmhzy--
