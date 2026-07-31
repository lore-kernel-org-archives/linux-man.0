Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C23A2D5408
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 21:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785534687; cv=none; b=oc/hT1sZ0ym/w9YI6AXAf49peH3/iepGlmokc+7CfqpaaFutKW3sJ0r4OZejOybsH5Wa31m8iuDdYHCpTC1S/ZpHmUFDRNu/aajAZ3ZmOTCOgE2v2dKx5V+tukvMoi35VuTdqvydVWts/G6DqWhfX6wTqc/9Jtb7U8yL5qHllE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785534687; c=relaxed/simple;
	bh=TRpVhCtanYKe0Pas7mSqvWMEhehjoiBW947sso0FIKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eakZLbWOvV8bXFUYyplAqNcfYlNGgfWoQUG79GJSeUE/tTMl6ER4JLbtkYJmfCnIkEC/SvXTjxZH2aZYLORCTU1GVVxWRCmRgGTbGEwJ1/1+s1tAp8cHWrs/40msikBDRBfHrp/Vfv8/X4vQg1wv0i7dpo7cP6zUu+EgE+j61As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJaEpAJy; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJaEpAJy"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81e83f1f15aso18319477b3.1
        for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 14:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785534685; x=1786139485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TRpVhCtanYKe0Pas7mSqvWMEhehjoiBW947sso0FIKc=;
        b=YJaEpAJyw1FzncPW0MywR40l2E0LBcPOHv3sP/lc0WYImjgQxG5ONsEFeY3+5yltqS
         rCIUj32zDyMMRsyV0KzLE9BPmE6cuCecJmt4MqYgEZRFErNTAwXNAZk9VAl3r+J81ALm
         /jblfjfWlbXeKlQoS6xWd7uhJ0bPk54bs3cgCndOG4mZi00CL2wgLmIiWq5ZhSpiFo24
         m1i5Ybarw0oVCBR21uvuklhVerIMZDt6MaErkqHpaftyU1P4zIYz82Yqq4T5tvF0D7Sd
         tWuc6HfiDlbF0pWlnRnY+4STIEBhbvkXPWjIvlRMa9Szaw35TENpaBp1XeUoA5PLFR8l
         /WQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785534685; x=1786139485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRpVhCtanYKe0Pas7mSqvWMEhehjoiBW947sso0FIKc=;
        b=Z0tzm3OExej5KwATYi7rIEvPtN1y+GIwN8iCm5Us3OcVHZk/D/dlks+rW11kR+ycM1
         zsAaUzoyLORNWtf2KQC2GtNAWAQ0leekkvwvpxK/eRwLlZZuYGn/aMGjzTxWj4kKgFG6
         AqxqYg8FdXodNDEp1s32uOnAo27vyarGiyW3y+zzDh5kLUhl/HUSDXaBUxFrHMGo3rEi
         gLgAlwKyOZ+DZ5N4fmArd0e6RlxwgXDh8sdNOCxhTlFvComITQiIgtfBOwevFiOwZxJW
         O7iGqhKGhVeVEQL8RfzSW9chhAW2QWkAUoaOH7uCTMXRjgJt6auzqlW0Bk7CLt2p8PHY
         RX7A==
X-Forwarded-Encrypted: i=1; AHgh+Rp/fffQogj9yM1EWPTqN8QT5ypK2CWf1SKws1UahGfzF0mvDw5O1GZAWEL6pBsebvEg4ENhbh5MLNA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj42X/AnLtgMVjYXJyqTi3zdWKrMsfPD2t2qLo8neetbzTNzve
	uptDWj6XRazWrROHU9igU6WK395YpHw6euBxAI71o1hZWu5dINpQwWoQ
X-Gm-Gg: AR+sD13mUd7scvCZRaN2/StKSquFKFLVEoFigJbPO0aGNhkCWYCZYyVwQfqhe42De17
	mwvuIq0aCz+efRhNKEdoEOMVJMAAOBSojI3oPjak5ZOSXe8OKeKbVVacaB2bG9Q3fS4M0FSius5
	wdeVeSx3QQ8WtvMs0ydo5IUyro9XL3dnzTSoES3e5kE6lHScbRcTk4O9uSu0d5lWlF9ZSCpcLAU
	HrP6sRJgh1hDXAtrLpZDnN2bmaFExRRniB/LQPlo27vY60ENxs6t/t3DqiR1yXMogTMEOPpHIqF
	eK26R5PxiNXtvczJ6KqbAv+8fr/cJpoxeg8ervg13Q8e9NV+VMedfm2DEYmKeM2FihvjifVgolT
	JciA+Wo5NBLS+UITj6VU4CeVD6rMiKMUaP7ekfbgaWScj3CQ81Yl0kOoL6j7zy03mAU+VTYlkt1
	kkjEL7S5JO2WCcUwlsCl+fkJNRAN4Fyij8fCUbCLTAKQNnocZe+w==
X-Received: by 2002:a05:690c:d96:b0:81e:b78d:688b with SMTP id 00721157ae682-81fcbc4bdaemr40011277b3.12.1785534685175;
        Fri, 31 Jul 2026 14:51:25 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd123dacsm14603527b3.39.2026.07.31.14.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 14:51:24 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:51:22 -0500
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
Subject: on the irresponsibility of pursuing C language reform (was: [PATCH
 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as provided
 by <memory.h>)
Message-ID: <20260731215122.4p4aepsbgeoibx74@illithid>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="utmw2w42qygtzpgj"
Content-Disposition: inline
In-Reply-To: <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>


--utmw2w42qygtzpgj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: on the irresponsibility of pursuing C language reform (was: [PATCH
 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as provided
 by <memory.h>)
MIME-Version: 1.0

Hi Joseph,

At 2026-07-31T21:23:35+0000, Joseph Myers wrote:
> I think it's irresponsible to use the man-pages project to promote
> personal idiosyncratic ideas like this in preference to what's been
> the standard location of functions since 1989.

I'm sure I don't need to bring to your attention what a mine field
string/`char` sequence/memory buffer handling has been in C since the
language's inception.

More to the point: what's a better forum for pursuing this attempt at
reform that will both (a) reach a significant population of stakeholders
who can variously red-team it and/or endorse it; and (b) has sufficient
visibility that it can't easily be ignored by people who oppose reform
in this area for whatever reason?

I hope you do not wish to imply that a closed session of some committee,
or unofficial backroom politicking would be preferable, nor that WG14
should close its doors to members of its user community who have not
been vetted for a disinclination to boat-rocking.

Regards,
Branden

--utmw2w42qygtzpgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmptGNIACgkQ0Z6cfXEm
bc5U4g/+Mu/GjXHtsDdN6DmHg7V6hGvnzxppt3hYS9Y6X63Ewg5XdQAAOlFRzsIO
LO3gluLNgN3jPggn6+JsLUoBQ3d3VPBHD1EuDsCsFShK7FR1t64uJZtNwFS3qOYV
OGjZ3qfcoZ8KbsqMLAV/wf4VbHwcFh4ElxI1x3DLgVbEWHEPmDsIMbkkDHalcVeZ
98UGFfcMpe7GdFbXPufgNSkHjnegkmMdFCW/w5ixXiYrY/QhQlGqXt8qnHtUv0FV
WczAAIx6TJtNMuzJkulOPFJ2N6sQ2janyd41gmbSUqyfe1Af7yGYlF6V/+b3xbF7
OV3cDqTCmXAcNk82qjC0nvWlTOmS/Zeoud8k0Hsf/pzwPVugw7G3d0SWdZuo0JGY
1Ec2dbq5Pc8FvEsqI92GNVKnRUTHYoG34gofrrNmzTBRikVljMhEOckbJpqmEy/C
xb/4rGEX5yqd817SLTU0NLw9Ijme+RbjmFHn6SXd4iR/V9HYp/R29c1rF9zoZbAb
p/5MtVfsbDPOweMsM52Ye5V2qijkYiTZB5YOT8BXqBaPH/A9T7fVHnvuDE5mlNMx
tnhxP4eoERAWxno07bGFJVCDkR0zbZjZ3wlBVxNm096nqjUEm66iE1SG+oqbfOs3
x5TLanzatTGWZfW2VgsdY8BuhiVYY3Wo4105m4A+w2QJ9Kiedzs=
=g5ts
-----END PGP SIGNATURE-----

--utmw2w42qygtzpgj--
