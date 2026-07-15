Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F15A282F25
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 16:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134496; cv=none; b=EwpA/a4EkXc/su1YYWq5HV/hguuhF0wu76UoD6MWDYqu1jFznQq2MMH6gS6fUE7nHho2tZ4IurtAb9tTgDEmljrl+XlGmizzmr8fRNUcLNdxVyjdkLSzbharYfTF9tqyWkZwIrVJgno7pxkPOKOMZHzV7eAutIMC/TTIs/6zfio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134496; c=relaxed/simple;
	bh=roioPImzclInOLlzFMR7VE01qUVS/LuSy/DhenZ8kN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjQmn7heAgh0Nbg1Lq+R+8y8UhOGhNotttYE38E6h4NEgx1rGRCVTefTrCvOUfGAiHGgDyNUeHCO7t0dgGXjobvP1WFkNAfcTezJ1OrUCI7HxJOw1u6HB9e8QUzvav4lJa+e3xF1CDL1u9fTx2rJp0z9/XPRwX/towP7+xsVS5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAKmG9QD; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAKmG9QD"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81ed2a06b9eso7687007b3.3
        for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 09:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134493; x=1784739293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RwPXoj2ezslFAL31pt0JQ4m2eZDS78gaJeJN9FbioRw=;
        b=lAKmG9QD70qYYaK4jXT7tA6aQjOYKgt0P4zeKqVVASpsZWVOkUriA8TfSohpWS8mSn
         ee8Fr2wAemeeOQUDLmqv0/mz/1DGl7SGWxmWyqTeK9G6YH8YLQtfxC8ScH5+fA5k+wJq
         aEiL4itGZb4B0c+L5qfM7E61blt3O6l7NQK+jkqXtey9/t1iIFNvRtQSVoL5uG49mrnG
         vHOX9Nw4LOHYIqQjAvTPEsfTQVPDZnlx1c/JsiaBFQo0vKqwKmL1Rf37IUXdBn40WNXn
         I2up7lsRRlcTDzd6Q+XqGN3LvdX+MQKaZqR0nxPaq3IgAIQo4emPFtEszc+37nvLS5lz
         Mrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134493; x=1784739293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwPXoj2ezslFAL31pt0JQ4m2eZDS78gaJeJN9FbioRw=;
        b=MYqDD20L6XG9vY0T4BfoT93ectFU8wOmcLWKuqbQRMDiLECyqWAdjYPwp3FbLOSLd3
         IaKKPbEN47GRMl8KH5r6XzkKXlprKqV9RsOgRaHuDS26xsDiWd4JWc8CEsDxlHrwGbKD
         mWoTteICNye/d2GxEM5pP9jTm6X+E2n9fNvhB1ZejXzoErAHFXojJHA3qzctgQuK7dS0
         8DUDpfF/8pImtNY5N2tjJpaMsgPX/JUiAv0TeH0NFQWwNYsr+gsTEsJ/6gUcS8bGriNw
         jEssUIGl0J+XT2CeqYUMCh7kvckd2nNXXZQ5XqoyIiMqM178MIZt+M30RCvGW2j4IkJB
         dvXg==
X-Forwarded-Encrypted: i=1; AHgh+Ro3Mivnh7P4Gzywshqf86hS44Q12opzgxMpf1DZZw9aWOK0tAvvklJDNDMu3PDDpDxuADXAgritPiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK9zAv8W2x0LaZr5UasT10tcVVa4x8yp/PoMHPhvtmmWBFgaw+
	wZ5jBvBfSbw+xDJt4Nz5F7g0APmrDjxoq2Wqw2lQqqmnhFJW3WJLsd73zccRWw==
X-Gm-Gg: AfdE7cmyyVsloXtkk2XUlvTD3pv5NfrxtstFdgoXOK9q7Wb+Z3BtNBh3GRd5Y4HNMPG
	hDIU0waS+3h8A+/n/hDFfDu9LKC/g2u/XLcpalRok/e9IjWOiwjMkDcEfeEfdzzo/7EPWQ3xPUL
	n/O1s6vOCLD9pxNgz73e+/45sFphAwiWyDWo2naTWUi8/g0Xz1xbpUslzqbc+6bsZKPHBEAltge
	PHLL3QlChqwP5TrqVK6JWj2fuRsFliSOGrW267j8sdrfBMaO3ZHEBfuA7Q8ottNH62a2xvGMCGI
	KAfy7EECzX80O2DoB1I8EByEH9b0VQuZ8rurJkq16/vGYQBDKODM27mzp0u59YnthUrfNlJp4my
	7kGM9c00iFzIDecjmPpr7WFVnRRXKQa5GpCQjcNMQJDME+Bq5WUkcMbxLcRoTqXu8Ytd2Yza7U7
	xa41EGjYYt4n9i
X-Received: by 2002:a05:690c:c50c:b0:81d:a1e5:a498 with SMTP id 00721157ae682-81e902bd056mr123988857b3.62.1784134493223;
        Wed, 15 Jul 2026 09:54:53 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c22ed8esm172382147b3.44.2026.07.15.09.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:54:52 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:54:50 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: DJ Delorie <dj@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
Message-ID: <20260715165450.iakjkw6qwgcnpzq7@illithid>
References: <aldxiBVva99diG5t@devuan>
 <xnwluw725l.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7jwmp76hrsdm7we7"
Content-Disposition: inline
In-Reply-To: <xnwluw725l.fsf@greed.delorie.com>


--7jwmp76hrsdm7we7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
MIME-Version: 1.0

Hi DJ,

At 2026-07-15T10:33:58-0400, DJ Delorie wrote:
> Alejandro Colomar <alx@kernel.org> writes:
> >> Add the .in macros around .EX there?
> >
> > But we'd need to know where to add them.  There are cases of EX/EE
> > that don't need to be surrounded by '.in'
>=20
> Ok, now you have a new rule that's even easier to not know about :-P

The man(7) package doesn't impose a rigid stylesheet on its output.
Many decisions about presentation and layout have to be made at the
project level.  Historically, there have been, for example, many
differences of opinion over whether items like file names, environment
variable names, function names, data types, parameters to functions, and
names of other man pages should be set in roman, bold, or italic.

One solution to this problem is to come up with an element name for
every distinguishable syntactical item of interest.  That's how
DocBook-XML ended up with something like 400 tags.  Granted, its scope
was intended to be an entire camera-ready technical book, like one in
the O'Reilly Nutshell series.  *roff macro packages for man pages have a
narrower scope.  Thus, the "semantic" mdoc(7) package has a mere ~100
macro names, including gems like the following.

groff_mdoc(7):
     .Ot  Usage unknown.  The mdoc sources describe it as =E2=80=9Cold func=
tion
          type (fortran)=E2=80=9D.

     .Fr  is an obsolete means of specifying a function return value.

                Usage: .Fr return=E2=80=90value ...

          =E2=80=98Fr=E2=80=99 allows a break right before the return value=
 (usually a
          single digit) which is bad typographical behaviour.  Instead,
          set the return value with the rest of the code, using =E2=80=98\~=
=E2=80=99 to
          tie the return value to the previous word.

          Its default width is 12n.

     .Me  Usage unknown.  The mdoc sources describe it as a macro for
          =E2=80=9Cmenu entries=E2=80=9D.

          Its default width is 6n.

The only alternative I know of to not exhaustively cataloging every type
of "thing" one might use to compose a man page is to write down rules
governing the usage of a smaller lexicon, which itself is necessarily
semantically "loose", and thus frequently derided as "presentational".

There is, potentially, a _third_ option, which I mentioned in my earlier
email.  As I said, literally no one expressed interest.

https://lore.kernel.org/linux-man/xno6ge8p38.fsf@greed.delorie.com/T/#m9fda=
91ba28ca257c67d4595f81d38b32c5c9c937

> Is ".in +4n" the default for .EX, unless the user changed it?

No, meddling with indentation is not part of `EX`'s job at all.

groff_man(7):
     .EX
     .EE    Begin and end example.  After EX, filling is disabled (and,
            on typesetters, a monospaced font family is selected).
            Calling EE enables filling (and restores the previous
            family).

            Ninth Edition Unix introduced the EX and EE extensions.
            Documenter=E2=80=99s Workbench (DWB), Heirloom Doctools, and Pl=
an 9
            troffs, and mandoc (since 1.12.2) support them.  Solaris
            troff does not.

> I wonder how often that case comes up.  I wonder because I would need
> to review an example of the problem to figure out how to search for it
> ;-)

It wouldn't be hard to snapshot a text dump of all the man-pages
project's documents, as with "nroff -t -mandoc", do a "sed -i '/^\.in/d'
man/man*" over the tree, snapshot another dump, and study the diff.

It's the sort of thing I'd try out were I on a mission to eradicate `in`
request usage from the man-pages project's documents, but I have no such
mission.

> Now I wonder if the problem case is predictable enough to have the
> preprocessor *know* when .EX needs the .in +4n, and when it doesn't...

What preprocessor?

> Ok, now I looked for it, and we *already* use a perl script to
> preprocess the files, in scripts/mk/build/pdf/book/prepare.pl.  (this
> just means perl is not a new dependency, so we *could* use perl
> instead of sed)

That script is used just to generate a PDF of one or two man page
corpora.  Deri James and Brian Inglis participate in groff development.
(Deri is the author of gropdf(1).)  The script is there to get older
versions of groff "over the hump" while we implemented PDF and
hyperlinking support directly within groff itself.  (That work was
substantially delivered in the groff 1.23 release in July 2023; note the
script's date of December 2022.)  I see that it also has some features
to stylistically massage Research Tenth Edition Unix man pages.

"prepare.pl" is not a general-purpose preprocessor that can or should be
run over a given document in the Linux man-pages.  As I understand it,
one of Alex's objectives, as was Michael's before, is to keep the files
in the man/man* directories directly renderable with "man -l".

Regards,
Branden

--7jwmp76hrsdm7we7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpXu1IACgkQ0Z6cfXEm
bc6Qog//bzYq2Jh1HM340K/p/WuBRVO2jSLk/yqNEg0hmNjYlJa2+tbmiGXfX5Zy
IjCXCgNTNd2kzszvPkXXh/vTqcbAKBatJFblgzwK2WEZcOmOhIoWSVmue3FeE+an
HbXMT53HsKOt0RDeKTadd6qZvS6aUQXp4+vOylMXp/t0oXdR/8RNDguMF586FE8z
DvBg+YIyuEJeDux/paZEAcqP/jDAWKcB1f62GHdu7tLF7A0l8f/L1jB0tPjfKlMa
N3QIAVkyaVnCs4BzVkmX/4hRJ+aAwfQk9bWEx/GQgWkfaAl+FIoDdzrOlK8Kb8WA
mcmNgm+MB6/YsZH++MBliflG14I9JBr97UQHE9YG/X7gIu41L+sOvs5L+/x5paLl
xPR1wh2siAFXqmA/YbxLWJiHwRzpq7CQDEQ8GtMujJOh07gHarTY0E/CR5JB8FiC
f0LdxR9zLfBORYAJQ7Kre5uocWnjDVB+HopeZud8FUl2EbwD7Tq6BqvQhk4146Dk
hDsA0UJtkcpPYOR5KwMRHWs0Il++Ur4AQCJSolANU4Q/L99jg+ZaXQ64WTdtsuGX
Uw8Zv8Ubh/Gg6K5xmzK3SOmoAB4lj3TKnBgjDD60BAFvPboyIxjhk3uEDaUWwl82
E/3J9mTLZPTWLQ1UkNfIXA+HWOezCEx63G1QqHSFyNKIQVX48z8=
=chfU
-----END PGP SIGNATURE-----

--7jwmp76hrsdm7we7--
