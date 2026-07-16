Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DFF375F67
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784221554; cv=none; b=Sou1YwUKg/aWTXJQRGdswdCckV8H3xWTCWNmFJWN7XMDH+AU3J3Dz5dKY9j2jENfnkWMCq6g61KPjPpYBw58fZlx/leDEixsQGNABQCK/g+u36zQwO9iKlqAkVsP72cQdVY5OuzMHq2vwdyOznbyvR5A4nkTmfbID+AA/HnW4pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784221554; c=relaxed/simple;
	bh=4vL4UWaUijNY9PD5dBMTeA7vFShrDuL/QYkIH1oD630=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vr6VxR3foJMrOYF4ceiKlmtp3s7T2VfVdU/bsGAycKrJch8VLy+iJ1rSGZ/iZ0Xnqc7tyLQ53XLBvgOfHCUtF3K+VlncsQ8Z29MSxW1WqCEa7FWXt9c7k9q4s5w/nyk4me4Dftl0+xXsiRuxNxz2Tl7uVv4cbmbdXmzOJV1aMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVt3Aq/g; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVt3Aq/g"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-668005ba03cso4302311d50.2
        for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784221551; x=1784826351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0LHFt5fpzSuETZ7hJL4ibwk+5HSTwa1rIP8lPIRrwE=;
        b=AVt3Aq/gTSFKT7+3AUNKNf+YV+4EultokeWtY1zDIuk/DOH2Dqb45E53yPtL/PNpnm
         8uRKAoL4sZ6tuZaynmxItHdebdT/DW6xXaeqwsbfio+rhicw8l+BzBbtV87mLpDWmc3c
         hFODZLt36+crGKGoZq4yYOdcazJKaHwfxd0GPS+a9kFG6nicU74rH3npWMFQFRb6ddap
         vB++WdaWRzNz34LStFdeGVlVzycwZzygoETRdXa6DulXy0atodYhZ4JNwyVRjuWwzS9C
         p/AjSALsyS1AxDG6AaueZ3igLAIsTt/hzzw3Y11XwOtSEqHjjxsn6rarvLAZ4S+d/iXD
         uRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784221551; x=1784826351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0LHFt5fpzSuETZ7hJL4ibwk+5HSTwa1rIP8lPIRrwE=;
        b=YH1FnhbnHtjufLbf6D+9529RkmzxvRIzwnzHtUo2kG0ZVgEEWdXdq0hsrAl4j2knqo
         cJYO2sYV/8JxrNE78/xzNup2Fvjgb5FCR7A/52Gd3Mlo6ICeQIhFDZY/eiuSjAOeJX0S
         fb7/ev4AOJEf9XT4YZD0bqAOgzcEMCDmFO8AzpznwZJPDHm6p98s3thQg2skk1y13b//
         zSwXp/R9JJ+/THbPM83EO18fXs3/qSaJcCZ9iL/nbeAJl0BPQJQsCDYxXuWPWPLtshO5
         lEibopq5tGj2mo5ENGznt6buHrLMGB3w5jNc39A6IeKYhmdr42phrCFhI7f/nmWls67D
         5h2w==
X-Forwarded-Encrypted: i=1; AHgh+RpaHwx0+PqSH2TDXg9Ha+k7pMzMpJiDmR4dX5ovuzW3Mh+YFo+jpIfWF2XekuJgwH2xeMJ5+oNzOjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4x8cq/AxDG3Gq7DyF9r6P9did6wxwkXcy81OYzmg5oVcTU5Ab
	G6XYXdvcywXlw05gOCOSu1plbtj5HzBq/RsUGbdtm1MY1nTFic9BW3bi
X-Gm-Gg: AfdE7clHeO+cH1VGTOZbvmB1WBiWIQpB91/sinZWc1gUW03/VVkO6+yHXUJw5QNs1i5
	cnGjOnGrQ5omhvfkuwDMJhZ18RqpLnZtz0K6BfHCnDTcHGcAncXELD+XitV7yrT1jD/XIlI1OGT
	oAH9rtYqbSYL6UpeP2cQnQXpwTIySBr/1xssZrnWQdaYyR0ZU+jJapz5CUMr/38UWNIrVQBB/Ha
	gF/yTk5atWZsktvF3rc9piojrMY9OpL7uYZ6RapoxOHe6PXTTRNA59hhQ/Osb7JqWEGgZ48aUcS
	4bXSE9GStj3uv3NV2ypC0Rvsl9Q2TmaIj1Rl4X/UXuy1rcEIgXwyKS98DtehIhYYcq/sy3/NSGN
	djUik25gOK93NfJl94r5vYT+cTBtfs9wgL96eYhOTw7H5EoiVWwpTc4f7CsyYvmrDw3I=
X-Received: by 2002:a53:ac9a:0:b0:668:2e0a:bb29 with SMTP id 956f58d0204a3-6682e0aca7fmr1570574d50.68.1784221551243;
        Thu, 16 Jul 2026 10:05:51 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6681fc49cf2sm3896973d50.9.2026.07.16.10.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:05:49 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:05:48 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>,
	linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-ID: <20260716170548.am3fg45uaudlqpl2@illithid>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
 <20260716155544.o7fx7ecnpjj5sdai@illithid>
 <alkEKUNzTGnpiYdH@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v6eyai6m6mkhscor"
Content-Disposition: inline
In-Reply-To: <alkEKUNzTGnpiYdH@devuan>


--v6eyai6m6mkhscor
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: syntax of options in man1
MIME-Version: 1.0

Hi Alex,

At 2026-07-16T18:20:30+0200, Alejandro Colomar wrote:
> On 2026-07-16T10:55:44-0500, G. Branden Robinson wrote:
> > At 2026-07-16T16:45:16+0200, Alejandro Colomar wrote:
> > > On 2026-07-16T09:46:25-0400, Douglas McIlroy wrote:
> > > > Here's a typical option heading (from tail(1))
> > > >   *    -n, --lines=3D[+]NUM*
> > > >=20
> > > > It is tempting to assume (incorrectly) that the short
> > > > alternative is -n=3D4.  As far as I can tell, the convention that
> > > > "=3D" is part of only the long alternative is described nowhere.
> > >=20
> > > Agree.  I've had that concern for a long time.
> >=20
> > That's why I recommend a somewhat different presentation format.
[...]
> >      --lines=3D[+]num
> >      -n [+]num
> >             Print  the  last  num lines instead.  Prefixing num with
> >             =E2=80=9C+=E2=80=9D prints all lines from num forward.
>=20
> Agree; indeed, after checking, the manual pages of the Linux man-pages
> project follow this convention.
>=20
> The pages that use the dubious convention come from GNU coreutils.
>=20
> I've had plans to write new pages for coreutils, and haven't done it
> yet.  Maybe it's the time that I do that.

The reason coreutils's man pages look this way is because they prefer to
maintain much or all traditional man page information in each command's
help message ("tail --help")[1] and then generate a man page from that
using help2man(1), which fills in a man page template named "chmod.x" or
similar.

Here's the thread where I learned that fact.

https://lists.gnu.org/r/coreutils/2026-05/msg00080.html

Maybe we can make help2man(1) better.  And/or drive constructive reforms
to GNU-style help messages...

Regards,
Branden

[1] I distinguish "usage" messages from "help" messages because a
    "usage" message is what you get when you invoke a command in a
    manner it recognizes as syntactically invalid.  This is an ancient
    Unix tradition.  The usage message should be short, summarizing only
    the available invocation forms without attempting to explain them.

    A "help message" is more of a GNU thing, part of that system's
    campaign to standardize `--version` and `--help` "long options", a
    practice I regard as mostly salutary and benign.  For example, I am
    annoyed by *BSD utilities that afford no means of inquiring of their
    provenance.  There's often no way to say "identify yourself".

    What I _don't_ want, as a user, is to be blitzed with 100 lines of
    "help" when all I did was mistype a command invocation.

    In an attempt to practice what I preach, groff's usage messages--
    uniformly, I think--look like this.

    $ tbl -X
    tbl: error: unrecognized command-line option 'X'
    usage: tbl [-C] [file ...]
    usage: tbl {-v | --version}
    usage: tbl --help

    A true Unix grognard would desire _only_ the second line, but I
    think that (1) error messages should be _explicit_, and (2) _all_
    valid invocation forms should be summarized when reporting "usage",
    even if "everybody knows that all GNU commands support `--version`
    and `--help`" because (a) that's not true--historically, GNU find(1)
    didn't support it, and the GNU dynamic linker ld.so appears still
    not to--and (b) not all commands are GNU commands.

--v6eyai6m6mkhscor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpZD18ACgkQ0Z6cfXEm
bc5aHw/+JyESEDB5nj6mW/vc1HMmUUCnvmulfMH4+P6ywXFkoGdXBvEQXqrBcbdw
6ZtvgGVGPGvYntIIFL1vNg7E6h4MN9cLoNK9VuGB9p8NsBXAU9GpVM6cyILdjozW
lVNSsEeLTrav5q9ZX89mXglO2WpInVViylZGjzQRZYYsA5yTryP2CctEsboRlYqL
91e9I968O2ZT3XWzuHnuu/a8egq+yWQmUhSEnfV8rctB+lS8fuSk330BMwa770ZS
lET2tqHlWOwEYAGAwaGe3AO8sdddu3icHKxkj0fnQaBVLfsc86SPiBOTTSTJzuSS
co4//vhXP4A9ACaoVXLneMYfn6Quhchow0velr09/SEqCvHR92609hZbVsesSMj0
gxl5R/KVlxXGmFkQo1XPx2TKR17bAObRAlktWgXeZqhKry0X9M6KYvTobWYbM8Kj
K30grOQLgFNozJBD2iRibrTjhYKObmpeJpr2j2C8Ls3KjbNG+Y//EaCYzPJqL5oI
JZineAwu4E1q62TmNSsKZio54xciPrFfNVO3oOKjXnNSN9UlmJT3VqQEFRVBVRjt
Qoxhtab8vOh0HmEtNGrpruZYhjTeDPDeC6hjkB5Py5AT7pQ79aOuXp8Ru9FkatDp
CRaAlLn/T2NPw+OGr4jhRcIntlYqZfcgsTajPVTgznfkbliQeS0=
=ttL5
-----END PGP SIGNATURE-----

--v6eyai6m6mkhscor--
