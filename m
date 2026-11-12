Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516486;
	b=U2WST3l+YmszHLI5HYYdcrFVKxC6zNEp+oHCBjicct8iZaLpm1nqiD0QecmyM7d/x7oh
	 KqSAz64xykQCBxkKLRkrexC0B4C4V/ULaiz5dlvtL6BDjsyAOEhUyBmLBxAFrsNV8bBsN
	 NkRo1uOFfRSxPCOV9vi9F2tugPmVL52Z5wDSwRmThVgpgpkb4vyTN1nxRspi3E1FQpQXW
	 RhsUs6apQjw3MTe1iJe9XOxLEub/e28whvJSdnULLFJ+ZZ5i8eaa4bxPet31XD2GgStcG
	 CZlubHeTmdm0LxmQPeUoQefgISsRCnnNlEkEHmvScNRX0oSaiPmIH5fliuCTwS+mpTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OgPmsogpGmiRDRrzMm+SLZ77cv1/n5bDZCN+ZuF+CaY=;
	b=nAshulPDXH1BZXbxjnbalmGU2J99F0tounCjhlXuBTwBBZvgoBLiqFuOeZy4XmR4KXSD
	 h+mwatUohe59oAba1j1BshzhFVvg6YSacl0yB8YH3TiBNwqLqSYuIcFGkwlExE0rZiCfa
	 RDdHmG7ugm1PMKx0PaS/g4wSbQvfODjlMcsdKbJH6izvdLqbiHsWVhTlc9p30WhJ3rJ4Q
	 4nHZpA6TA+cNJLw2DFPf98J64sBA9lyNhFVprC1/SleHD18xfws63YJVBs7wHofO22ajq
	 mNhJFh3TKzI3IUjmjvXQ2KZahXpRCSYQ7AJSLuGF1hijIFI7LLjoGRDxCeiyKxYnY1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z24fajD6;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8964606A882
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 20:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8964606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z24fajD6
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-677af43eed4so238690d50.0
        for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 12:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516485; x=1795121285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OgPmsogpGmiRDRrzMm+SLZ77cv1/n5bDZCN+ZuF+CaY=;
        b=Z24fajD6HvAe7X9FuwzO8Z6QPU3Q9vZdnP1A8z28OlpcBkW582EdHkG2cEFBB7niS3
         JXF4bEMQIwcRnHafKKCmW0790Lam6wUipRb4UQGGFQP8Nlik5UXebi5pQFcSW+8euZwb
         RI8uQaJqvfFPA4j+7qW5vv3NgFWjj7iTt8cMu1LshdCgZUTHGM8hUo4kTYejcng8AuRJ
         kjkwQTUa58DFgHUeNto3NGQBGacE4Zb/Cr2GvFXN/3W+K9lMUmqlOxsx7SQhXp6nHlih
         BpiBdMaXChIz08pgiTUMzolBJikckC0mm9Uoh4FlzkhUtjGeeQyqm7zRO7QD/y8qsWRu
         eAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516485; x=1795121285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgPmsogpGmiRDRrzMm+SLZ77cv1/n5bDZCN+ZuF+CaY=;
        b=f/EpxuX5LAV7knRGPnk7aQRf6kUeBkfuYAj9TbpmdW2mca7RNZVwWznofn9kPaUTcQ
         nO+B/dZXz2GezwFVFN90CAb8Q0VZZS194Ds+jHNFRfN80jxrBqoikx9G+dlugEoAG8uU
         VMSQkLYXGm27oYBzejSjcCXmX1leaIGrEAw8E7jD8qQLL2TNRXBJHTnUKX+bC8TEMJp8
         bhzkKppfZ+X/pLzYnXEDktctjU37AWV3alz7ysvQRzuQkIz/17lH71dzL301JIN4dfp2
         8IrcjuCJ/I64+t+eEJCE+KKBzc5+A7fzLO/QoR0XZXFC53NhdCDI3Dgaojikc4fFQ9S3
         GLeg==
X-Forwarded-Encrypted: i=1; AL+hErG8TmsMLsPt+FzVwgFpelGT90lRANoEMi93Pnkc6zRpPQIfAgrTt6vvK8IH9guZ+i9aXic0aqNQtR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z967T3VEKECtZpqxxvviQDBU/G6UdupRJ32+V1cU6BsCzcalK3M
	XJYbFUXEQ4a+NV1JT2PQsT2tft9ubbvGU4ThwtQSlGgBD+bLG63v5TQ3
X-Gm-Gg: AYBFou0VeOaSm497wLQmfBxpB+fENOIdVxC7bP7a1a8cx06qeBLN7gnBdKPqnpsWtlE
	5siLue1poRMG4sBeRwRyBS3t7J/fAy/waWwaBB3emCzJa4/5zWcMQ0UqGFXlcWxEfI9OeCW+IjX
	ZFM/AqAZIl0q+zDC+G5MsJB4oK/TyK+nNc3qoV50Zh4aHWsyuc2M3a7zAmptWVDxBJcxviPVu9y
	Y/J2rSihCUI204CipRGZK6E7PAqMvQ0AuRVJOIHDElk7REzLmTnndtG19kOKGrNL8Jz0ovrM1rE
	TEGXRkuq+fQ8LaXIeegUbjV29e5Wpp80zKZKp7ReoiDhBGH1p6lq8qVEFZfJvMkr4rwsUwmneH3
	QO6gx57Bm3vzKVapv1Sk/CwzUBuUwFLjHm/Jz1AYJVJ0ddtCL724gK0b2UO8tjQvzBpYTCaFSlt
	ojD5Z35ldX74EaLHjg0E07kdVxBrJXgpPbkQpjFceerQSH5akbKoEmsieMsuA/Xjz2WMQ7XkOB1
	b3F5Z1zRdI/vGHVa4RET9dv9XSb20XA+QyFVkLya5se+9uBuRkpJq/F4vbKx+D93u/a889ebQzB
	WjbsqZid916JnmYIqQ==
X-Received: by 2002:a05:690e:810:20b0:67c:6cfe:877 with SMTP id 956f58d0204a3-67d896a3d64mr299903d50.19.1794516484256;
        Thu, 12 Nov 2026 12:48:04 -0800 (PST)
Received: from illithid ([2600:1702:7cd0:e980::48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98b9a8sm4724727b3.26.2026.11.12.12.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:48:03 -0800 (PST)
Date: Thu, 12 Nov 2026 14:48:01 -0600
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>,
	Xavier Leroy <Xavier.Leroy@inria.fr>,
	linux-man <linux-man@vger.kernel.org>,
	Michal Schorm <mschorm@redhat.com>
Subject: Re: copyright year ranges and "collapse"
Message-ID: <20261112204801.ojv2mwm37tgsge62@illithid>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan>
 <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
 <20261103165448.3y5ujyzvgypygjgj@illithid>
 <e9634fc8-26be-485d-8bf5-ed32098a8ae2@redhat.com>
 <20261103183949.2r6w43u2ok6tij76@illithid>
 <4c2d83e2-72a1-4df2-9287-542010188d21@redhat.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tu4gz4sxormyppyj"
Content-Disposition: inline
In-Reply-To: <4c2d83e2-72a1-4df2-9287-542010188d21@redhat.com>


--tu4gz4sxormyppyj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: copyright year ranges and "collapse"
MIME-Version: 1.0

Hi Carlos,

At 2026-11-03T16:40:35-0500, Carlos O'Donell wrote:
> On 11/3/26 1:39 PM, G. Branden Robinson wrote:
> > At 2026-11-03T12:55:53-0500, Carlos O'Donell wrote:
> > > The man pages project can choose differently.
> >=20
> > Of course!
> >=20
> > > I agree with the guidance because it is more accurate, promotes
> > > eventual entry into the public domain,
> >=20
> > Only when there is only one year in the notice.  If there's more
> > than one, how do you know which parts of a file have passed into the
> > public domain?  If people can't identify these parts to reuse them
> > freely, then their liberation from copyright is a mere notion,
> > without substance.
>=20
> Only if you have one source tarball?

Not only then.  Consider how frequently a project might make releases.
The delta between them is the size of your potential error in assigning
a date to copyrightable change.

For ncurses, which snapshots almost every week of the year, the
potential error is pretty small.

For glibc, whose release cadence is (maybe) semiannual, the potential
error is on the order of six months.

Does that matter?  Possibly not.  In the United States, among book
publishers, I routinely observe, starting in July or August, copyright
notices advancing to a calendar year that has not yet arrived.

Such copyright notices are flatly impossible, but seem not to cause
"important" people in charge of copyright policy or rights
administration any grief whatsoever.  The penalty for such a practice of
falsification must be practically nonexistent for it to have less
economic weight than the discounted value of earnings with a known
maturation date 95 years in the future.

That publishers apply this rule even to technical books whose sales
volume is likely to dwindle to zero in less than one twentieth of that
time seems like dangerously insane optimism.  It makes no economic
sense.[1]  Maybe it's a way of reaping some non-economic satisfaction by
throwing copyright term reformers (all six of us) a middle finger.

> We often have more than one source tarball as a durable artifact of
> the release process in downstream or upstream, and with that you can
> "promote" entry into the public domain.

With an error margin as computed above.

> > I don't think you read my message closely.
>=20
> Maybe. What do you think I have missed?

Measurement uncertainty.

> > > and can be referenced without access to source control.
> >=20
> > ...without that?
>=20
> May you please expand on that question?

The whole sentence I queried was:

> > > I agree with the guidance [requiring a comma-separated list of
> > > years, employing a dash only for contiguous ranges] because it is
> > > more accurate, promotes eventual entry into the public domain, and
> > > can be referenced without access to source control.

> ...without that?

It's been a few days, but I think I meant to ask "you can determine that
information _without_ access to source control?".

In other words, I think that even for a project like glibc with
semiannual releases, an error of up to 50% in computing the year of
origination of a copyrightable code change is too much.

But I reiterate my concession that copyright holders who actually
extract revenue from their limited-time(!) monopolies happily impose an
error of the same magnitude even when it would be just as easy not to.

> > > I leave this up to Alejandro to decide.
> >=20
> > I don't think he requires your leave.  ...unless you have executive
> > responsibility for copyrighted materials in it that you mean to
> > withdraw if Alex doesn't administer the Linux man-pages to your
> > satisfaction.
> >=20
> > Is that the case?
>=20
> LOL. No.
>=20
> Let me state my goals.
>=20
> Firstly I assume we're looking to achieve consensus in this
> discussion.

For a consensus to be enduring, I think it must be premised on a shared
understanding of relevant facts, and/or a shared understanding of the
boundaries of a matter that is disputed but upon which there is
agreement that the dispute is held as non-injurious to the consensus.

For example, in the present discussion, discussants could disagree about
what the origin of copyright power is.  One person might hold that it
flows from the monarch of Britain and thereby, via the monarch's
anointment as defender of the faith by the Deity, thus from the Supreme
Being.  Another might maintain that copyright power is instead a
socially constructed apparatus of humans, but nevertheless binding on
anyone who submits to governmental authority.

To return to practical matters, I think the issue of recording a
copyright notice that is accurate is what we're concerned with, and if
we agree that copyright protection is a thing that governs us, we need
not agree on its wellspring.  My position is that a copyright notice
with a listed year range of the form 2000,2002,2004-2007,2010 is by
itself helpful for identifying the portions that have aged into the
public domain only to the extent that its corresponding source code
archive releases to which you refer are more frequent than annual.  The
accuracy of the notice can at best increase only with the frequency of
releases, and can be lost again if copyright notices are updated only
annually with a "bumping" script.  (Ultimately, you're stuck doing
differential analysis of source code changes and using the dates on the
release archives themselves, at which point the copyright notice
contributes no non-redundant date information.)

As a thought experiment, consider glibc 2.14 and 2.15.  On the GNU FTP
mirror, glibc 2.14 is dated 1 June 2011.  glibc 2.15 is dated 21 March
2012.  Now consider a person working in the year 2107 trying to decide
which parts of glibc have fallen into the public domain.  Any given
difference between glibc-2.14.tar.gz and glibc-2.15.tar.gz might have
been written between 1 June and 31 December 2011 (inclusive), or between
1 January and 21 March 2012 (inclusive).  How do you decide?

Consider the following hunk of diff.

diff -urN glibc-2.14/elf/pldd.c glibc-2.15/elf/pldd.c
--- glibc-2.14/elf/pldd.c       1969-12-31 18:00:00.000000000 -0600
+++ glibc-2.15/elf/pldd.c       2012-01-01 06:16:32.000000000 -0600
@@ -0,0 +1,295 @@
+/* List dynamic shared objects linked into given process.
+   Copyright (C) 2011, 2012 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+   Contributed by Ulrich Drepper <drepper@gmail.com>, 2011.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
=2E..

The entire file materialized between 2.14 and 2.15, but it bears
copyright notices in both years.  I assume that's for good reason.

Please tell me how a copyright notice of the following form:

+   Copyright (C) 2011-2012 Free Software Foundation, Inc.

=2E..communicates any less than the one actually present.

(In this case, we can actually cheat, using the time stamps reflecting
the Unix epoch and our knowledge of the common practice of running
"copyright bumping" scripts in January of each calendar year to deduce
that _the entire file_ has passed into the public domain for our
archivist in the year 2107.  But if a "digital dark age" has intervened,
our archivist may lack some of our tricks and expertise.  Thus we can
deduce that my assumption of a "good reason" for "2012" appearing in the
copyright notice is likely overturned.  The file was written wholly in
2011 and the claim of a 2012 copyright year, applied on 1 January,
was spurious.)

> In seeking to achieve consensus I *don't* want my objection or
> disagreement to be considered blocking in any way, so when I wrote the
> above I intended it only in the sense that I don't want to block
> consensus from forming.
>=20
> If you and Alejandro form consensus that the project won't keep years
> separated, I'm fine with that.
>=20
> I could have written "Please don't consider my disagreement to block
> anyone arriving at consensus on the matter of expanded or contracted
> copyright year."
>=20
> Instead I wrote the above terse reply, deferring consensus because
> Alejandro as the one with commit access has ultimate governance over
> the project.
>=20
> Alejandro doesn't require my leave.

Okay.  This all sounds fine to me.  I don't regard myself as having any
more administrative authority over the linux-man project than you claim
for yourself.  I strive to be a friendly advisor to his work, and to
field challenges from man page authors who worry that they can't get
their job done in reasonable comfort with the man(7) macro package.

> Secondly, I want to ship an updated man-pages in Fedora, and I would
> like to work through the outstanding license and copyright issues to
> support that.

Is Fedora likely to _gate_ inclusion of a man-pages release on a problem
raised in this thread?

If so, how times have changed.  I remember how some glibc files bearing
the Sun RPC "label on the tape" license[2] were not a problem, and those
who thought it was were treated as somewhat barmy--until the affected
files were relicensed, and then everybody agreed that actually there
_had_ been a problem, but only in retrospect.  Perhaps those who thought
so all along remained wrong, like Bernard Knox before the head of the
Yale University classics department.

> Alejandro has asked what is missing, and I'm providing feedback.  If
> there is something where we don't agree I assume we'll work to seek
> consensus (like this topic).

Sounds good to me!

Thanks for the clarifications.  I still don't see how the comma notation
in copyright notices buys any additional accuracy absent additional
materials.  A repository history that assigns a high-precision time
stamp to every commit (down to the second) is a superior tool compared
to release archives (of any practical frequency) for determining the age
of copyrightable changes.

Regards,
Branden

[1] It might make _marketing_ sense.  "Check out the 2027 Chevy
    Suburban!"

[2] https://lwn.net/Articles/402312/

--tu4gz4sxormyppyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmr2JfoACgkQ0Z6cfXEm
bc68FA//VF95aqNc4af63YOC3PDP++2+8IQsFJa6Ex1Y1gq938ye+vO3KskEihaB
/3poeY7BKWQzxBYo0bHGVUgSxaE5dgMll0dUkHQUYUYy4pWgKIvBKsbngvTFdYpE
0kltO/PgflLmd45MjQLPZI+D3DUcQSvR1ymEMkLIr6ytdRt4TwTUIJGGUSLS17PR
TLPcQkr6YslNAraOlalm1wSjGoGKT00zJoYMSkuDmIFnkUdbLS4FKRSymDwqRFHu
obGmeWuvKltKSmyE9nK+vrDSoGUalY/gFqUYTmpyy7n3l3BIBLQ+OZ21xHdeCwbe
TOnPtjWlRU/N/SdAqZ677f4v0oaJi2DKE1N6Dy8yWrwUvQV88V9Ly7ilwq+iDylk
cOTvsiXH/LS58NiSMSp8YzOZUQO+xmW8qGEb3VACgqZijlgu7hcCCbfNY8UrnFfY
tm/+bW+ETiP/jL8ijeTbgJq5OfofbiOJLCLvFnoga+YDmVDfAYpVXo3iR5jfja2C
pjrsr8oMtGOCwI7koiwB9f9cinZiWXD/1E8UmDXmgSIdwDJ2X+nVMmjSoOEppY+q
OdZ0fv8Y8RX0AquPsdh7kky8rG5LJDrgRoeYV9xQ2t/AN/njdwdTPW7gDv4vZOhS
YDTywFbvE6saKjX58M/KECW2h66hR+zKpXkfHgCOKN4pxB9NvEg=
=zHT7
-----END PGP SIGNATURE-----

--tu4gz4sxormyppyj--
