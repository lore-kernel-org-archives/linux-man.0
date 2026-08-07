Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3C14B04B3
	for <linux-man@vger.kernel.org>; Fri,  7 Aug 2026 03:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786074586; cv=none; b=PnsT33XAUM/YQ2YilJe8dNs+wUNp03L4GkdnfX6uUmnuLEgHNh4dJQSHosYXtX9Mx4KtWqFb5LukBkjt7ZgR0KyjyHmiG8JGRxEuAhdXOp+UKu27uIOLDjbcV41wwrgILa+UckhPBp7PDlK9H+oQL0lyT1U2uusFQcOE8wTW+oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786074586; c=relaxed/simple;
	bh=pQ7rKNzEV5uCdErxfEJVDcQW0G7fUr8xrYYhSdK5xA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLcb4ikSyZ++1Pww+49E8eHiEaOCbDE/7XL2pO5NFbYFsLIfu5Cw6W6N/IKR2ozg20SwbgJQhwnLwE9kOuahuMfLQzQJuiZ9PO6zQz9CRELQ2B0j5umtNC10qXmBa6BQ29LABItXU5DpplifDvUl9GtIjOeLWyLbx8APH8tqX6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pYYO/B48; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYYO/B48"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6611669cd16so3987126d50.0
        for <linux-man@vger.kernel.org>; Thu, 06 Aug 2026 20:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786074584; x=1786679384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e/PA6cEESsFq1gVIHRKN/aEwQHbzcHAu/pHQQXaZHi4=;
        b=pYYO/B48G+f9P6PHu9GkSDkfDosQFN00CiOk3vPiFf+ihsOeHF2Sc1mY0cDT4O1cIY
         2pSSf9dtF9v1BxS5n4x3SjS1SvkwqKoXOa+cfMW7rVXxLIgvpP2wvpF8yvYuA7vU+KyH
         a0kWM9uYHRim83fGWAFVmSGnsVuwiFKOPSapRNSKrQjTkyEtIjCFoDdZrw9Yf49Jhj1K
         X1pFP+qeBwyd52GKmkFbhQsui+qwvFU/pwT3mLOcegW0XJsxZ6fnAwR8J2tz+CKEYlIp
         ZHd57fX+ouf1au5FaP4FEYQLxKq9Tq6bUkA0d6UgI9S6eSBqJ0fOnvqgj5hyWR2i1g7N
         Tcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786074584; x=1786679384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/PA6cEESsFq1gVIHRKN/aEwQHbzcHAu/pHQQXaZHi4=;
        b=pF+fr/Z0KlXcLFmnM6IR5ehF7RYyzveD5v+4IEgXV2LGu/PFhYWJzU+1iPngqGSioU
         lXQC1oReGlxubLN+RLscbm313bLTYIV2lZl7CBlc0AG6nEHCHssJT6lYPCGuCnVjVcDR
         BPlfbmJ2CPtUT6bu++cYvpaUme8HEpgIAgr2leqMWF6+VSt8FrCo5Cn4vLo79MJ2nNgX
         qfI1DPCQuBNQphNZZN8jYjGlsiJKg1Xd6+djml9adIPRqgNx9wQNdoYhoe4ZJZHEf3iw
         UFyLfPKeSbArdm0ORKx8XIsZh7eBJREkTFDH355wp6USwPY42eqXAKP9/Ks4MsowVEeE
         OhCg==
X-Forwarded-Encrypted: i=1; AHgh+RqHEtaS/SfEFie0c7gVYyXxtwJCtX3oZSr7NXVRxc10/xPjq1xDgxdWT9GX7HtjzolyRS2E1kQ1MPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCAKPiYQvCr+t2Pf6pgXXineYRI9y87a5GO8mlrCI5+UNKJV2d
	DuhwaTEc71b39LlrMGdz+BGJbW31adoLCghcVEZ6bYBxqLemzGxDntCs
X-Gm-Gg: AR+sD105muTvIFDRLJuozStgGly+LiJ+w6T0u8cWMC2pGt227SQFPpxWKvx0USxS83Q
	yyDszzFhQZxVoQDIEHYnU/EdioTk9nhUt9vZG9EU9dYgQOtxEHilDS+CVcPbTN94NJZhGkI+0Kb
	bP2Ue/DvGvdqbXSHtbkddSgZBrRBUAmikIvjvnCR3f/IoTwkCXaCGNi4uYrBAAGfcXDhMtTzVSo
	VBjeuvfTBBHsrVgq75wHt7B1K4i+zGtFE/lBoB6Cd8QjX3D7noSj26y2MQe2t5dYuhfPB0ljP9m
	QUD/9YT43RxhCDe/9alb6AaJcjEBk7IP90jgbipW0+xKuTyE+b1eEP4zZJGcO9dZjkyEQQxaHjj
	TJclg+5jhGG6GRDGhejM5qow3JV02b34cyPR8Tj9GDBMiQkVKcnTUfN3dfTm5HRt1TCDPCL77iX
	S66l1NqeeYUeVUBVnxYwd/Q1EigRMvmhoEci0nevOQC10N/1jR7g==
X-Received: by 2002:a05:690c:22c7:b0:814:5f5b:6378 with SMTP id 00721157ae682-820222ac93fmr133015107b3.12.1786074584407;
        Thu, 06 Aug 2026 20:49:44 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f5780991sm3051807b3.28.2026.08.06.20.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 20:49:43 -0700 (PDT)
Date: Thu, 6 Aug 2026 22:49:35 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: DJ Delorie <dj@redhat.com>
Cc: alx@kernel.org, linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <20260807034935.elgrkedh7c2a4txp@illithid>
References: <20260807021256.pwzsls7awqmbslti@illithid>
 <xnqzka38wo.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="srsvejtvtlzkr3sa"
Content-Disposition: inline
In-Reply-To: <xnqzka38wo.fsf@greed.delorie.com>


--srsvejtvtlzkr3sa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
MIME-Version: 1.0

At 2026-08-06T23:29:43-0400, DJ Delorie wrote:
> The problem I had with .PD placement was not the compactness of the
> list itself, but the inter-line spacing between the list and
> previous/following paragraphs.  You just have to know to put the .PDs
> before the paragraphs that come after the space you want to affect:

Right.  But having to know that is one of those fiddly details that
deters people from using man(7), no?

https://lore.kernel.org/linux-man/xnse5q90jp.fsf@greed.delorie.com/

> .P
> normal paragraph
> .P
> * list item
> .PD 0
> .P
> * list item
> .P
> * list item
> .P
> * list item
> .PD
> .P
> normal paragraph
>=20
> My HTML background had me put the first .PD before the first list
> item, which bunched the list up against the previous paragraph.

Control of this sort of detail of formatting is, I submit, more
straightforward with the new `LS`/`LE` macros forthcoming in groff 1.25.
If you want a (compact) list bunched up against the preceding paragraph,
don't put a `P`[1] between the paragraph text and the list.  If you
don't want it bunched, _do_ put a `P` there.

Here's an illustration of your example above using each method.

$ cat ATTIC/dj-delorie-demo-PD.man
=2ETH foo 1 2026-08-06 "groff test suite"
=2ESH Name
foo \- frobnicate a bar
=2ESH Description
Baz qux.
=2EP
normal paragraph
=2EP
* list item 1
=2EPD 0
=2EP
* list item 2
=2EP
* list item 3
=2EP
* list item 4
=2EPD
=2EP
normal paragraph
$ cat ATTIC/dj-delorie-demo-LS-LE.man
=2ETH foo 1 2026-08-06 "groff test suite"
=2ESH Name
foo \- frobnicate a bar
=2ESH Description
Baz qux.
=2EP
normal paragraph
=2EP
=2ELS itemized 1 2n
=2EIP *
list item 1
=2EIP *
list item 2
=2EIP *
list item 3
=2EIP *
list item 4
=2ELE
=2EP
normal paragraph

These render the same.  Here, I'll prove it:

$ nroff -man ATTIC/dj-delorie-demo-PD.man >| dj-PD.txt
$ nroff -man ATTIC/dj-delorie-demo-LS-LE.man >| dj-LS-LE.txt
$ cksum dj-*
3663585518 394 dj-LS-LE.txt
3663585518 394 dj-PD.txt

Since groff 1.25.0 isn't released yet, let me add full disclosure.

$ nroff --version | head -n 1
GNU nroff (groff) version 1.25.0.rc2.16-0e05a

The result?

$ cat dj-LS-LE.txt
foo(1)                       General Commands Manual                      f=
oo(1)

Name
     foo - frobnicate a bar

Description
     Baz qux.

     normal paragraph

     * list item 1
     * list item 2
     * list item 3
     * list item 4

     normal paragraph

groff test suite                   2026=E2=80=9008=E2=80=9006              =
               foo(1)

Regards,
Branden

[1] or its synonyms `PP` or `LP`

--srsvejtvtlzkr3sa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmp1VccACgkQ0Z6cfXEm
bc5VoA//XrUkxULw+OJBifYjEkeeTFU9ehJ8CMEChDgRZCF4wt5KtmdlDGeZ1xiy
25+DmlPZKylBUPBNc25ZcpCycnW4yUabiEd6KfcLHQY3bxCTx+s0VZHCd4kpqCnL
wnJuigQOI11QyybJLF6nPxmYfVR1c7ec+y0pQGaAOXTUCdfa0kRxgdl+hCZBC4YE
q2nvmhKIECTKf0Sym1U7MLeLz50wd2xRe1VDUIM+T7tz+BYss0lD6IIAtpRDK+RW
8BW6cuGDn8DSJtRsGW/pjiR9v2Z3lBT91DNxmejSJGaai8is6oeEdBCsR6Ovyz1m
DiWdmeLp3RNQZL2gt0+EzKm5VWgmeBB548m4nt6pk4j9C6h4Hx/L+QxPvX7ZO064
Q/IcGlQcvZRjtE2b/SKSSZImGDnaPc7FFFm4wwvWtWdfIKU1m/2GpREhrWFVwKma
ooJb36i+iswXTPC4EkkChdXn9kul1qmeuytrkwIKcNp6HSNpoMRyqJTLOmTn2Ma3
75o5DjORl4W69Y9K0syX2BOu7ptajl25Sz08LLiSlrRvQu8GDHungJQD/TME7NQ4
Ikd0DVN7iJdm1P0R0I/A/tXP4pBdA5ELUBG/x2SUlAHCWCTDMBhBfInQHq4/DVOr
a76VyeU4/QJUNJktiOsgOQohodzcb1oI9IXkLDJG2yp/oMWeznw=
=bdW8
-----END PGP SIGNATURE-----

--srsvejtvtlzkr3sa--
