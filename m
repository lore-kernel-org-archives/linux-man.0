Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5524BE44C
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 12:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648736; cv=none; b=SMx6iF2bykoTjZQJnsmOQfHNjtrVNAmDwvSBybNmt+H0BJr+IycWzqP96SbpMku4lKWpsWtxNj8lYihdsywapBO6jhM7WPVT8v32HK9x9QBAMRmtMWNX9NFzlpNROZXkNpGV5reldmoiAZzjY2rMB+zblRF/rmjD7qlVuUGoAmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648736; c=relaxed/simple;
	bh=cJTpe1shAF2sijK0DwwKj4F6LunnoSQxARgsfM5jeK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Hy48H2Xl2nDCC9vKu0fwukUQbTjNGb2ZfyQaZLh/AczupywQ9n5okzHdwYf63rHau7HmSSDoiNDyRTFemUJm2rYm02lg8I5zhF0DS+ixmzSAtlNBP1tDo/jgnjoeSZXgX+zfsZ8S3ak9upG0hBZGQ6EqKvTDSeizonYKvgW9M1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kY5SW6X9; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kY5SW6X9"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-6713d20d375so720611d50.0
        for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 05:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789648728; x=1790253528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9grmWrorJCgucd2SUZH9qBOHkFkCTPtSwk/5WVDe0/8=;
        b=kY5SW6X9qfpdJtJFPE8FybjUqiKeDnVtx92bGbrnLvGkvuPwRZXe0duXVdNgUpVgxO
         gkgZrNj+bPH1BTbq1IA0r3nsuaMXKy8xKrsnvXSNN0O+W3UmYT3ynsC6Cl7+YPmhEQPc
         6V6mWREOFPw5oMxm12EHDXmQOciDYBid6J5FzduBSaSRrEopuA956eZbGywprHQCJGzB
         e4jI4fMBQV2ze/nQvgWXeoPKEQ5L9sFLhATdtQV0EI3nUKB11cyOfh459zF/XGCDW7Jh
         LuQZwP/hTmTt98LlK1JcC/Lh9dEc8K3gRYsnMszsllryNKMWuKgzwaSvWWSV6kZfX5+O
         TulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648728; x=1790253528;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9grmWrorJCgucd2SUZH9qBOHkFkCTPtSwk/5WVDe0/8=;
        b=qXK5JtE0jsfOyE74MUZ4Auz8h9+2UBiZlUDyWa9/J5tFcMhDB1Q9MvCGkqPJeCOBl+
         kRl4VWz8YnZHtC68VGOyazlwxcutGYClbn5C6hOQS01L/ds1bnU1gy0PanGG5P6J2u5i
         gbeMUqQr9EkNMmB2K0gSrwQCUGc43YPmWYSzMiYFu2BsqpxXf2gBs5FFQ9d3vBwgavHk
         2tHaBHbbaiD/nCwNJM/djrpn/iFLN72xM0dCJhpL9Se64tT1LjUTiI7NeYCtgQDu8HJQ
         fg7DfpHocjctvzmsJ9S5IJFkpf5y0xbikvR7hA0AdQ5qp3HAV1mb7y/k9/6ILO/w5G87
         aVzw==
X-Forwarded-Encrypted: i=1; AKwUvByfEQAH/+R1i7edHDcChccbK4aScpzp6AKz2HzUWOb9mLbfXclSPfzBSJqN4MEN0zPCj86us1sKvqs=@vger.kernel.org
X-Gm-Message-State: AFuF++l064zKO96WC89909Tq+J4LyJZOrutivIYe5gfJe+ScuWg4kLwK
	2MhsV6OZeE2WiYGmvcVq465QOzs8TOqC2SA2CAyDVSVKYQtoWAlV8t7bVCXwlw==
X-Gm-Gg: AYBFou1GJWFxBZ3lbBOYY0lAd5b4BbGKgYS/0wy6PNArah4pInw7u/9RmYcep5SicMl
	xnphLhmFs2fZUY4crURIGwzE7QUjHBrD5OvCqOGNXxEygu47jOmwAHc6FskD82aqP7pcu9YyIjc
	UMhicp1G/UsENGy8uUPkVswzPfT8BVSFGxAac4XIlWLDTx3WIJdCaUNbZ41qcADV02D9nUbQXzw
	ZC3DplxRFjL8flcNl1lFquWmiLM90JrA0q5WPQ40o6SPH9W1TxFSwA8VaMu5A05EaKXKraz/lRd
	aOfc2iLNKeriVstK+rwhLvOOUO9hb2RNXajh8UIDylR0Tmm6L4/2/hczEsyS03+/QynpFQFbxCi
	xci+JXWkC6E932fnTI8QUuKH9Jq3KerYXMqe8DsKS/8KWNKAhbeQO6ISEatg1YDS/HtQPuJUjxI
	Rbd/MrRay3Cx8be3FuSaFdvMb7ML0pVdoJIP0RFqLKSelzMJ61SigR9uteKU8jkTswZ2O0LN7gq
	sbRsZ796Q==
X-Received: by 2002:a05:690e:191d:b0:671:44fb:9649 with SMTP id 956f58d0204a3-671631d72e7mr1923543d50.3.1789648728155;
        Thu, 17 Sep 2026 05:38:48 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980:4f4c:9d3d:ae83:2fcc])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6715f787276sm2484035d50.19.2026.09.17.05.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:38:47 -0700 (PDT)
Date: Thu, 17 Sep 2026 07:38:45 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: astian <astian@memeware.net>, linux-man <linux-man@vger.kernel.org>
Subject: Re: ioperm(2): confusing terminology
Message-ID: <20260917123845.valu5ro5zur23o56@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="axbdxaimjmjjx6se"
Content-Disposition: inline
In-Reply-To: <aqvHRZ7DfbdG5XBt@devuan>
 <aqvVeSW_dHnYbwca@devuan>


--axbdxaimjmjjx6se
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: ioperm(2): confusing terminology
MIME-Version: 1.0

Hi Alex,

At 2026-09-17T13:00:30+0200, Alejandro Colomar wrote:
> > Date: 2026-09-17 07:04:37+0000
> > From: astian <astian@memeware.net>
> > On 14 Sep 2026 14:56 +0200, Alejandro Colomar wrote:
> > [...]
> > > One thing that is very important is that we use semantic newlines.
> > > That discards .md and .rst, since they are meant to be written
> > > with paragraphs as they'd be read by humans.
> >=20
> > Sorry, I didn't read groff_man fully, but I'm curious: what is the
> > meaning of newlines in man that gets lost in those other formats?
>=20
> They have no meaning.

I wouldn't go that far.

Like TeX, *roff uses newlines, _in context_, to help it automatically
decide where sentence boundaries are.

Because the formatter, not the macro package, makes that decision, the
rules are documented not in groff_man_(7), but roff(7) and groff's
Texinfo manual.  If a person follows the "semantic newline" guidance
=66rom man-pages(7), they can worry less often about what the rules for
automatic sentence boundary detection are.

roff(7):

Input conventions
     Since a roff formatter fills text automatically, its experienced
     users tend to avoid visual composition of text in input files: the
     esthetic appeal of the formatted output is what matters.
     Therefore, roff input should be arranged such that it is easy for
     authors and maintainers to compose and develop the document,
     understand the syntax of roff requests, macro calls, and
     preprocessor languages used, and predict the behavior of the
     formatter.  Several traditions have accrued in service of these
     goals.

     =E2=80=A2  Follow sentence endings in the input with newlines to ease =
their
        recognition.  It is frequently convenient to end text lines
        after colons and semicolons as well, as these typically precede
        independent clauses.  Consider doing so after commas; they often
        occur in lists that become easy to scan when itemized by line,
        or constitute supplements to the sentence that are added,
        deleted, or updated to clarify it.  Parenthetical and quoted
        phrases are also good candidates for placement on text lines by
        themselves.

Following this practice also helps keep document revisions from
"bleeding" into unaltered adjacent sentences in a diff.  (I think it's
worth studying why the Markdown/AsciiDoc/"plain text markup" communities
have not independently re-created this practice.)

> > diff --git a/man/man2/ioperm.2 b/man/man2/ioperm.2
> > index e4a058164f6f..9b9aaf3840e2 100644
> > --- a/man/man2/ioperm.2
> > +++ b/man/man2/ioperm.2
> > @@ -4,7 +4,7 @@
> >  .\"
> >  .TH ioperm 2 (date) "Linux man-pages (unreleased)"
> >  .SH NAME
> > -ioperm \- set port input/output permissions
> > +ioperm \- set input/output port permissions
>=20
> If I'm understanding this proposal correctly, the fix is because I/O
> is an adjective of port, not of permissions.  And then 'I/O port'
> would be modifying permissions.

The parse is not quite that rigid, but the proposed change helps steer
the reader to the correct one.

> If my interpretation is correct, then I believe I/O would be separated
> from 'port' by a hyphen, not a space.

Not the case!

One does not say:

  *I am a Linux-kernel programmer.

but rather this.

   I am a Linux kernel programmer.

Generally, in English, you can chain nouns that function as adjectives
to an almost silly degree.  I recall a favorite example from
alt.usage.english on Usenet many years ago.  Here is a noun phrase.

  sump pump backup alarm silencer switch

What kind of switch is it?  A silencer.

A silencer for what?  The alarm.

An alarm for what condition?  Backup.

Backup of what?  A pump.

What sort of pump?  A sump pump.[1]

> Is this the correct interpretation of the proposed fix?
>=20
> BTW, should we contract to I/O?
>=20
> 	ioperm \- set I/O-port permissions

I have no strong opinion on the ordering, but a hyphen does not belong
there.

Regards,
Branden

[1]  The word "sump" is almost never seen in isolation in general usage.
     One doesn't typically say the following.

       My basement flooded in the storm.  I'm standing in the sump and
       water is up to my ankles.

    It parses, and is grammatical and meaningful, but it would sound
    odd.  Maybe not to a plumber, though.

--axbdxaimjmjjx6se
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmqr300ACgkQ0Z6cfXEm
bc6D1Q/9HsLkU5daSI7NzdQv86NUzmxKlHpcKxW9g0klHaxAHQFzQrM/ItR3CjGL
WELBAU0uUwD+HWHOKsrYXAPnrGVCfnycWIiOGj+/2MiOQnU+F+JrtW/3IHA9GMzj
ns1iNrNl8LusuD5kfY7JYcbveiymOK9/Rnfl8GUbmzXrbuwCTVQXlu/8WCriQMmD
isHjoysYZqlLbl8mYOu1N3N5rq1qJ6uTxogjNWNjSoIICf252qVAbK52em4IigIY
eVEC6npgz74FrHPIBKYlz0aZ42wFC2mNML1IF/BJykWPuoBN0looR67xWuQS0hD6
qRMD2ylQChrLVMU7shRZR8AV9HHtR+bqf8dBjpWBIFEUboO0rawlOYgV0AZYRcfL
Rv+gi6HnerejqvLAJM/bc6ksoPPnOl0ShPlu/3rnKfNHz6AG0yLj4MoehGyR4+++
Q75il2LRt9sE/hWLonRLbBZ+yksWy+naEirznan4Xwg6DBISjHaAckZna0l35iG3
iula/ciAA1Yf5MMX15KHu9iDoHSS8ddhhIVWFMMZjWxds7Fr5t8XWTud1aeQPhI4
QZn6uXLzUVqs6YufthJ9tpC7M/C5cVUHWW2FfbWjpoX3Uwvx2m7tH75HrzpT+d/I
PC166PwKWbALyjhmqEus7iakBrMmA0A5iiueQWpP0EX+NUKatUk=
=u1yd
-----END PGP SIGNATURE-----

--axbdxaimjmjjx6se--
