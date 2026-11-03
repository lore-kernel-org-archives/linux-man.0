Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724892;
	b=UJUmWHLFG/yp6mDnUYjVo/D0D5fBsoj3d7Eh6nmMq1HiwGhFHSgmR+Dr+qPv4m3Mclqm
	 T+V1thCkc28z7wOWC3P6d1OCNqohpUsI+ep89ESpPw82n9+4NKHuVSBdIK1rIKY4yPqK5
	 UeeCTWjWlxn8Tl1PGu6cXDOvOeEJr1ekJ3c0oebMZ+7Di7nifQI3w+UZcxuMeFFqWW0Wt
	 3AmiUo2hg6URrXtbstL6fj9ESnacj5PzzFJepl2bIyRQw7c7GSM/bp5J37ZOzaNA1Rg8O
	 E1MRMo37Nuo1g6Ke+Ed/QKprYZ9eQAAaMEnY+mZqm1RDQadIRo4f9r3iAL6DrUlIQfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MDufNqdFW6Iz/Du4NCzYGSYBKTLDPr7LDIL/lQCog4Y=;
	b=y3VoJSXUiEEAzLJ3r3FzixjwchxmrKDIhp7nGEn7d43pTJMmCQKr3t2N2ySSW+CjAFBF
	 5BuOvnbAnlseXqmjrI19cLFWQplQlusH9z1WnurY4FJObspdgTiQeU1OfiV6Y2e3EjJPI
	 WoXNEnOLtdes/Tbud6aXIz+1oVnhzGhS8w7L7/h7XkpKS7yL23IU6wv64xaeL+vOm9kvk
	 4OTcMHiivALz1jbPgJpHF5tO1rFNjMWhhCIj83jyrJgTqvWwO1oe4eIjb1k3mkNw4LD6m
	 hQT70KyCf59pLcQojM7WYwuxXU6y1oV+1kaT5HIFCMUyTEC/DvjndcGgAPyymSz+qEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YyXrmROj;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AB6606A33B
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 16:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0AB6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YyXrmROj
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b305e10ac7so4105537b3.0
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 08:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793724891; x=1794329691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MDufNqdFW6Iz/Du4NCzYGSYBKTLDPr7LDIL/lQCog4Y=;
        b=YyXrmROjix7BBwutDLkx5XUGnJI7mw1DL9OhAjAw6+3TzbmfBy/kSP5et1X9cqxXPa
         lONutPBZepm8vF5MXvtYp2lHEz/v7+aaNAkPFXl/y6xA5MvQ+9Z3vJwYWHy90N+aaJwc
         tGqpsS677yg7HTChHtzjd74QBnqXJNQ/iRz5V0pqLmCB8nRIelSXFoLvgcUb38Tbi6qx
         tiMjcvL1ESGvIp9Jp90GBR/rEvgvZ5dIOJH6NEs7si5T7Mh103oS0Xaw0jPDlKN07Pjm
         /nW0NTqHdH3Bvba7lhAY37bMEZXSPIJmwiCreABSbcbf/XE7hNCrefh9kQIYIDhaDRvW
         m9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724891; x=1794329691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDufNqdFW6Iz/Du4NCzYGSYBKTLDPr7LDIL/lQCog4Y=;
        b=Fa76Ud/7eaf54J2sGykLlkZuugxlWW7Mkpywb40NUW+jZyofnql3rAHIk/NZEvL2Ee
         FHPzY6kyP6Mxs7O7DfT8SiiASHsiNtQhRr9lvZQcqRcaTbJ6+2/ikQ5qqvKxnuYCDwTR
         QhqaMfK7144Gu83+/sQBUzAMS/znscZidnUc9y+AOmztjwdXiT+br43GcMxZ6y6HTa9j
         89O29JVftgxxE3+jAUimJ/FxemUrHYrZRWvdLuG2aL/GDl16gFJsE1vF5o3pkmmDWsNK
         B7pdKTmcFxV2BB7SawcHb3VEKDDzytyeASNsGh7ArMf6jMVSZkD3oHlR0l9ZHnKKksJJ
         cW9w==
X-Forwarded-Encrypted: i=1; AKwUvByuBTZwWfykBPP6AmPvcGzz1NhrB5z0fklr2C7ywzzg0i1iVqk2W8iQvb/yHe7Xb5y8J1pxYlTvA9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U6PFNAtzvCNzIqEZz8NEWxVOvg6v8NtwdLM5UgmL9Z0IrIY4o
	LarvOE8rRVa41CBZY0g5jC2G0v8PJj1xPaMEBCrduMi2DHGRBuwrALrI
X-Gm-Gg: AYBFou3ifHYLVneiwyGaVsrc9fAGCnxJrnfwFoczZbjBL73GpsvxRg7PGsTDMxHqUdm
	tZFngnCi6lmIE0OfzA7aO30GZio9DBjZPLTdiCdP2OXL6BwWMIxyM81EsBWw0U/Rg+IBHmQE8/i
	5Tk0mjwoqb0CS5WiHebihLwj6sdqlRjBTPFpDLEZnn59V8J0DdSTThDmK73jgZHoiaTPackPXDq
	o4Mr33lsL6uPvVzSYa4GzjcZz4nHX65u7iwkWOHUuxZxjWfLBaGr+f0SUFyTMCyhBch/CpAVL4S
	LOII0l8As++LhWuRCxoc2pdPL2CI9gbFL6+keWr6sjtEoYELIDIKhbbyajUXWA6oG5cNgtqJ+BC
	n4MssknfI9BRjBA8ZBJqwPE6V/j1q/hAs6aUvdQQ5e+xcV0lMRNQ5I3NjUJh8y+b1fIKTGIi9Pe
	FLIbxJojj8RDu3VTUoCtmK5MMKyTNfg9nvZtMisMCjHHmbfQhKTFioNWl5bDwfEUb8pdzFpKie+
	vFk1cCuzN5BfUeHbU31QhHJNo289wwduglkKVjze0WaT8hBHlxQzM0OQb8Tl30aPRs9LBpnGw8J
	vMtupX4FKnnapC31zReS9EU6q4XzTKVQ73Vp3w==
X-Received: by 2002:a05:690c:a849:10b0:8b1:2b31:6cc1 with SMTP id 00721157ae682-8b2b6710effmr69217037b3.13.1793724890755;
        Tue, 03 Nov 2026 08:54:50 -0800 (PST)
Received: from illithid ([2600:1702:7cd0:e980::49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3099791a6sm577927b3.27.2026.11.03.08.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:54:49 -0800 (PST)
Date: Tue, 3 Nov 2026 10:54:48 -0600
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>,
	Xavier Leroy <Xavier.Leroy@inria.fr>,
	linux-man <linux-man@vger.kernel.org>,
	Michal Schorm <mschorm@redhat.com>
Subject: copyright year ranges and "collapse" (was: Two copyright notices
 missing in 6.20?)
Message-ID: <20261103165448.3y5ujyzvgypygjgj@illithid>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan>
 <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
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
	protocol="application/pgp-signature"; boundary="hotv2ssphpn3zwe7"
Content-Disposition: inline
In-Reply-To: <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>


--hotv2ssphpn3zwe7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: copyright year ranges and "collapse" (was: Two copyright notices
 missing in 6.20?)
MIME-Version: 1.0

Hi Carlos,

At 2026-11-03T09:55:31-0500, Carlos O'Donell wrote:
> (3) Collapsed years
>=20
> Michael's copyright status collapsed from 2002, 2006, 20220 to 2002-2020.
>=20
> Were additional contributions made in the intervening years?
>=20
> If there were no such contributions then the years should be kept
> distinct.

I disagree.  The duration of copyright is life plus 70 years for natural
persons and 95 years for corporations.  As I've noted in groff's
"HACKING" file, these durations are so lengthy that no work of computer
software or its documentation has _ever_ yet aged into the public
domain.  (Some never enjoyed copyright status in the first place, and
some has been contributed to the public domain deliberately.)

Barring significant and retroactive reduction of copyright durations,
which would surely be litigated by Disney et al. on Fifth Amendment
"takings" grounds,[1] there is no way that any of us will be alive by
the time any Linux man-pages contributor's copyright lapses.

But let's suppose that Michael Kerrisk passes away this year (I hope
not!), and another of us lives beyond the year 2096.  Good thing we have
all these comma-separated years to tell us...what, exactly?

That something's become part of the public domain, of course!

Yeah, that's right.  Looking at a man(7) document..._which_ parts???

Without something akin to Git history in the form of "git log -p" or the
equivalent, we can't know which bits of a document undergoing repeated
revision over a course of years go into the public domain and which bits
of it don't.

And if one has something as good as "git log -p", one doesn't need a
copyright notice that very carefully says...

Copyright 2002, 2006, 2008, 2012, 2027, 2031-2034, 2045 J. Random Hacker

The enumeration of years is, therefore, clutter that offers no advantage
and no practical utility.  It reminds me of a character from pedestrian
science fiction reciting a quantity to ten decimal places when at most
three significant figures are necessary.

Condense a copyright holder's year notice to the endpoints of the range.

I am not a lawyer.  This is not legal advice.  The expertise I don't
possess is limited to the United States.  Your mileage may vary.

Regards,
Branden

[1] because in the U.S. at least, there is no form of property more
    sacrosanct than the promise of future economic rents

--hotv2ssphpn3zwe7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmrqEcgACgkQ0Z6cfXEm
bc7pzBAAqbmUM/pVosiDpOMcuJFpwWg4bmOE0wMf/aFCR+8HPJnfEQ+zf/O7PvV1
HHRmX9+48QiUvACJA40U9LRVvFAvvtqzAqPgby20bOTaa1hmcInJgoUU6wqCHzWi
FOaTMgo0pM52eYynADVK/FMHvW41JTZ9oZ+LB1Kb0efjXYZ2T87T0zk0qg2s9MEV
HTfRwLSLRti+OnXkU7FayPwWOPGOhBbakgbFR8tr4D3PUI9YvQiqD4klslPFHoy3
UZsWbTTnk6nZjEDzyQFVJYkEVtn6vVgyr4y13UmcHtuWNrS6CnTSJYtCtKfv7zHP
pKv6/cQLtxh+d7RQk9rSZbgGJPnloDLcJqM7WTy1pY2K2YwDOHx5lfGawE1YfvjJ
0OP4Aaw+TRKy94ZrXNtyo778/SyBNsEZ/hoWlR7F5/sbDd5034TZ2C0MteHvKRAC
LACUXrNw/R/ecQxvtBeEsPEoM5rOgjB0Jy7CZNeCoT9ui77vV5ltp3ecIDy/MesQ
WuDKYAIRew9+Dz1tbQ+bSRJbsuSZVtCVVlus15BTiqi1dmfkoyCqcjH5gqqjjUf7
394ZTWRAlgM3VF4xc5tqBqA5Zy2V3GxipDWHyLtALkJiNo0JrgSgllwGk8Yy197b
33J6OxL9jKmBWEqGfoThr2aXQrqH5K2DaSgYYv4f0mUsl2klCrk=
=bNba
-----END PGP SIGNATURE-----

--hotv2ssphpn3zwe7--
