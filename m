Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925953D47A5
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784217351; cv=none; b=QC8eQeZyfT5FBnSAWc8c8HLs8Acszi/QLNzXZ21l8+sLZ9xh9uWsDNgiLmrinaNmTCHq6+NX/hlI7SJa1ljHLYByOQDD1LB4I90HDT1Ii8GDwUga3FYVWq2AUKLxqlLU9tHjoCsPMmnDBLei+z60i6ld1sjFS2F6gsZ5g2NZkl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784217351; c=relaxed/simple;
	bh=77PWRFIWfiIKr2EH+mOaqyWzAdTp9sVc6e3YiC6AagM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4ytWG0/zWbRi3+gMnl9s61Go+B2Ik7eZOsIZtiuIfm2Wxdotz0pLXWcLtb88aAKibV9by4G1aHWKNc6pZk+lD+UeXBjRHFASlmY9++V9MJNP4Jx9J1ZJZp6IWLqGIinryLvrrfwV/ot1eWYSgw51qOrsnN3DE+oBVVvmMR7LJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Km+/EWNT; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Km+/EWNT"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8111c0c7561so94457507b3.3
        for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 08:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784217347; x=1784822147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mrbP4oN2jpP5CAV0KS8kHOFy7dzYGtv1amhxWh0BxpY=;
        b=Km+/EWNTSvtGSJFcyeP1BmTOXaQzBkMEX50OFCvgRrd2Hb6yE1ljhqJMyYxLr0hIPd
         PXZs55qziKC9Upx4yOQ9LHGVH/EbPXukDJ4KJxspf5/koysF66u91KKAEqpwZqz7I72q
         UMsr35OnysP3DF2k9HUGLKFmB9IWVpR7KnJj2HIgtbpgydVNNE5hVvqihP853BAMobNw
         NdQ4ZMHu+8+5tw1uRjNnjkswqKhnjcI2fz1Etoh2Iaw4lYD3YEeF9PZZ9lDUP5xlJDjS
         3KLzrvNTrH3I1GQIEYeAGHTDN2kEuXN9PLX7hmyNKTnU56RkbdiMvRvEAp30oNvm5bJU
         C3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784217347; x=1784822147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrbP4oN2jpP5CAV0KS8kHOFy7dzYGtv1amhxWh0BxpY=;
        b=RtxlreLDHuv8UgJNZOgeJSZArIQ0N9RkJSztJmoTkCbp6ZLutxEiyXsASmo6cuDDYk
         65GHAH2H9w2kJXEV5eC+NAqoe+WgWpt35ZZHtJtoOg6h0MZN6bKf2Vyg7h4uwtKVTUuQ
         xQgsmNtQf9+GS4P2tH7IQKs6rV3x8iKlAMUppperi0a8fCoa6463iQwyDvoKmBl/I4sK
         mSSd8YDpHKu5FW+ZllbVtK9F2/s3nL9Y6pipV3N/A8MuZcYDFnogFQdLlPJ4nDaxaVm3
         drRs+zO7sgzdvIL5pOe3Bi0R3tBYjKfDNL9Dqpg/BCm5l/GmY8kFmnmYPBP5fsOiVxQa
         a8YA==
X-Forwarded-Encrypted: i=1; AHgh+RoUK2ze/qBpEwbFbSAZDViaccWtnGK1MUKgQ6FWlyfyfEN/yr73Xr485rzJvupYR2Bbv5Xsp8L5Vhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIww/92xTQX5adNW4T87mxPd0sSLBIl60De2ao+5jb1JSyyPaf
	J8JbjHtNKI4dB0Pxp69GvgYZZpM/FSe98Xdt9YPeDVDSlEpkqweXTn4yOXUDzw==
X-Gm-Gg: AfdE7cnG0ItdcwOj1vixGDPJDIUANKNb/Hv4u5qw/GayCli3wiPhovommGGcO50Ejh1
	8LfoXs/URZPv5h1FvrrNgialo23CQof9wF5wtgfD+h+WOuZD42WrdDeNSQoSQFtPz8j2DYStmoY
	862sy91uhBoxkeQv63JzwYyYwpfKuiX2nPyg6wnQtAmEzo6OeG6b+xiB01T5usIy6y3bXSFRbTc
	V8ayGsG3vX13VGTKmdwl34NzTfQQvu4Dw7Co3OK6WL0u+fGzRhXSiIuZQcvNzrjsvh49Gq5Jekm
	LRJUHfAelxTp/s5JJRlmAptHdqTN/GQ+ssz4Bvn7+RBEIf/sf1KRiNXIbnr8vmNCm7AHTMGwE1/
	A7RVbg4W1hrhw0uRGHdJCYE7WzJ0wDQigWb2CQc9T4o8vBIbDeEbM30s2h1ARQbr/o+IHLRPZg5
	hbhw==
X-Received: by 2002:a05:690c:6905:b0:81e:97c9:bcf7 with SMTP id 00721157ae682-81ec0167c80mr80032377b3.71.1784217347086;
        Thu, 16 Jul 2026 08:55:47 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bf7ab9bsm198339267b3.20.2026.07.16.08.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 08:55:46 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:55:44 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>,
	linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-ID: <20260716155544.o7fx7ecnpjj5sdai@illithid>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kt7qyvgopv62zwat"
Content-Disposition: inline
In-Reply-To: <aljtsrJVLTN6qlxP@devuan>


--kt7qyvgopv62zwat
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: syntax of options in man1
MIME-Version: 1.0

Hi Alex,

At 2026-07-16T16:45:16+0200, Alejandro Colomar wrote:
> On 2026-07-16T09:46:25-0400, Douglas McIlroy wrote:
> > Here's a typical option heading (from tail(1))
> >   *    -n, --lines=3D[+]NUM*
> >=20
> > It is tempting to assume (incorrectly) that the short alternative is
> > -n=3D4.  As far as I can tell, the convention that "=3D" is part of only
> > the long alternative is described nowhere.
>=20
> Agree.  I've had that concern for a long time.

That's why I recommend a somewhat different presentation format.

Illustration:

$ cat ATTIC/tail.man
=2ETH tail 1 2026-07-16 "groff test suite"
=2ESH Name
tail \- a porcine corkscrew
=2ESH Description
Print the last 10 lines of each
=2EI file
to standard output.
=2ESH Options
=2ETP
=2EBR \-\-lines=3D [ + ]\c
=2EIR num
=2ETQ
=2EBR \-n\~ [ + ]\c
=2EIR num
Print the last
=2EI num
lines instead.
=2E
Prefixing
=2EI num
with
=2ERB \[lq] + \[rq]
prints all lines from
=2EI num
forward.

Rendering:

$ nroff -rLL=3D72n -P -c -man ATTIC/tail.man
tail(1)                  General Commands Manual                 tail(1)

Name
     tail - a porcine corkscrew

Description
     Print the last 10 lines of each file to standard output.

Options
     --lines=3D[+]num
     -n [+]num
            Print  the  last  num lines instead.  Prefixing num with =E2=80=
=9C+=E2=80=9D
            prints all lines from num forward.

groff test suite               2026=E2=80=9007=E2=80=9016                  =
      tail(1)

Regards,
Branden

--kt7qyvgopv62zwat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpY/vgACgkQ0Z6cfXEm
bc5S2w/+OxKExRDwlrTC0EspLkNy2A9wJoqJinrr+v/PZqehlOWb6GoRwBN/mdpO
meK+dOINiuzevg1ntAR9YngYkldPzZpHPVwISHW5jUr+KllPtNJiIQ9eP7XMOebk
SpudGClpjjwcoWvU2B9JYKThJisKjg/yppqTn8/+vSSE15sMAOCVb+F6N/9O47Xc
WOxbXUaNwvrjgG4HyXpM0lrbH9MbdoYyBNDStELUpxD+Fv9pPTxdc+arYFYaUEhM
K8aMmveFdr7sSKtQVJFLW9vC/3Og9a5+GEDjZN1rXWshaG/vNmh8l5RMw65UllSA
YdR359Jbw4s3Ip8SdTua5KyzyC04MrFr2w3ZNwDOVAoMdx7/uq4rYDC6lvR1B2Bm
6HeKA4qwZktolmkdLLPgJoBMyuq3giEkUBZ6flWly1z87Us07mEFNKBGb5Z6wzx0
cU8pMdkvN9IxUDe0A011j1HSMmYgzHZa2I4wO0je5XL+OIAKN0gyVytpSbm9ApCf
VTSdJ5BgU8Q18BqiDh5xIiouqwvtMy/T8Zxk2yDdVb3NepTeaNl2TNFAg9qTkb5j
Q5LAYTiM1N8IL3YwdcnpuvWXJuQD6tEAN9XOPAh7HLTSfyfLZImSjjayVt5Iyqhi
28tm/1PTlBdLIQBq6ZcfFPhq08sD65NVl2Ey0p1AUx2fA2WNL1w=
=i6dL
-----END PGP SIGNATURE-----

--kt7qyvgopv62zwat--
