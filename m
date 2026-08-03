Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB92E414DC9
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770287; cv=none; b=R8mQa7lpzsJFvdn6/eF035SuTgUa1TW+Ups6onfPijnceNFWdveFeHnmh+o8UzOKHi8t7yVaIDoqXV0OLWcKh8T/WnBulYWQ569K8gehOBWkHcce6xFvl2sGSFbSOzzf/R1G7aQlj8C/x1rxXaomnzGIVGjMIhfHrL2cHlqSgQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770287; c=relaxed/simple;
	bh=SRwLDg6DtopfNjhDmuzE8BD1OhFnjjpk6L2e0Iv10x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmTYt5LZAFrhzttoeLqM4gpsqrB6Fj9yi97E9w2dJGKUOSFdItZTKVIdM81yjcJ+0ZmZF+Kv9CKCaI5VmqDZ5BSmwm6C8w3NXMfok/oZRb6tmFdjFwdZnefxJRRWmeA6thoYYqhcMXwlFetS+aOVZ6jKzBS+0Wi+dLBv2v0Azc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/8wSGjv; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/8wSGjv"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-80dc4a68e4aso38308647b3.0
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785770285; x=1786375085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YNAKoZVNCXlLteqM6AwJxv5Yts2JcO3bhh6inmFsBy8=;
        b=B/8wSGjvsjW4E5vJoyM8qhP6RpNU/GdALvrAAKb8DXuBJOUrRTqYdNM6/mC4NZXPrN
         4meCyhu2QoGdiwIW2qI6I+SYCGhJP3xAXFbtdAEknmlVuWUJGiLnsSfrPkWatWL+o2HH
         M+b3LKgdlo/6nA28wCsSb+rEKVs4t2w04lT8RkQKb8tt56GNpc+Eh715nm6XZNPm/SkP
         Wqm3Vz3kfmQeMLj5H+Xjd/g20/vRQI2s/1EwMTO1/UtunL2vdEaE/aFl612u0vqZUraM
         SCNfjoLCPKvvrFMv4xoje7VO6tAii+UOsZn09D5a/zl/wZYy5EMS2Mr7R3evXCbM4cVu
         Ub7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770285; x=1786375085;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNAKoZVNCXlLteqM6AwJxv5Yts2JcO3bhh6inmFsBy8=;
        b=pNLKyUHYicPWvdxoBvwgAcIeJkZKlz+5YJRUn90ah+QD0wXS7iS0HG3Rue89EJsW9H
         QeNUtqrimtkMcbkL3xF1r7hbGWiKYKKF8o/Kawer2bFhBfAScZh9mKvEgUYFCQznPe9E
         D/jryc1yhvBTWjdftpYLtATVyB3zc/JPt3bCldB19vUh5bPNCJBC1jy8iODdu7QjnzZx
         ZdQmnz95RCbjyxIXg0h2qe4pIu0LxRM/929Sn1Q4i7iAUQ536PiERRdSkQlE3m/XEFhK
         pcFF9GI/Rs6ex5KFldKbHybrX62L+kBiLxw92tUZtgeam9hXiG5TZ0qvrSdhUjUloYxx
         pqwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqr7hBoyeRu0iBBEklAKCsqDBX5PUtuAJm/BXK5NCccrKaRVgoLCJpxeGw3eanPN4TNPqWQIgDD5EA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHcAknutRkth5nzZ2G+wtfd5gQ7SUWrPXgJrpf+Uamot14CPT7
	pBQw+9qz0WWCmvbyGHZvYXrcMUoPjaaLVR0mXziPyhtafkB6BVAARqQd
X-Gm-Gg: AR+sD12stkFngsAbgFCIX/STTWrEb6LQwEwN6K/R7BWgB+o1GKgMSyKc8BL4WVWUh5j
	9BmRd1S5EkzC4pdfmR7IamUVZWUrjpP6CbsbYA5jeAPds71Wv7ri0IJwxXXDi6p0uKaWq2kUomQ
	hhxJR0IhAYlWD5PP4GiAU1mxAfsykEJyvBzDhbPxoZKI1sy5OPmo2lfUjnzxw8klhuLRbd9DHZI
	nkm2AykegBUcEAXllHaDF7bs8V5huSOiGdQTqUv/uYXWb9McGw/MyJpF2JNwy5lXUtMdWAoiztz
	x6IMuXLJuFsjpEwloGgvtnIpSUk6wRJ4y1/AgtHOwzpxG6CFaJw1v20kbEhnPnXqOfPlcyxWOxE
	7mZSzZBBcC35WygETy3t81lqlQ6ne1r80vPiQbPi2k+3vDvP6nAVmoJtZ6Z8cOdfpRKFKmoRQfB
	YwJtYEsLSAHMicIgeAGWk+GY7hwj22dYKgzoBkVRyVpvhozFkjSg==
X-Received: by 2002:a05:690c:38b:b0:80d:fc34:a79e with SMTP id 00721157ae682-81fd4c8cebamr120917177b3.35.1785770284456;
        Mon, 03 Aug 2026 08:18:04 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd1242a1sm56317897b3.42.2026.08.03.08.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:18:03 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:18:01 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Joseph Myers <josmyers@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, Sam James <sam@gentoo.org>,
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>,
	Mark Harris <mark.hsj@gmail.com>,
	Nevin Liber <nevin@cplusplusguy.com>,
	JeanHeyd Meneide <phdofthehouse@gmail.com>,
	Christopher Bazley <chris.bazley.wg14@gmail.com>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Iker Pedrosa <ipedrosa@redhat.com>,
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>,
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org,
	libc-alpha@sourceware.org,
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on glibc forking/reclaiming its man pages (was: on the
 irresponsibility of pursuing C language reform)
Message-ID: <20260803151801.6db6weqqt3w3lxn4@illithid>
References: <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <20260801213421.7e3wvyjwmlwxzd55@illithid>
 <am5oWn8dYoP0r2dw@devuan>
 <82eff373-3460-3cff-4ed5-0a04b4fe4fad@redhat.com>
 <20260803143817.kvq3m5wcx6vvspul@illithid>
 <9878d16e-82d5-2280-24d0-dbef614254d4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c7us4whjzhz2xtka"
Content-Disposition: inline
In-Reply-To: <9878d16e-82d5-2280-24d0-dbef614254d4@redhat.com>


--c7us4whjzhz2xtka
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: on glibc forking/reclaiming its man pages (was: on the
 irresponsibility of pursuing C language reform)
MIME-Version: 1.0

Hi Joseph,

At 2026-08-03T14:44:55+0000, Joseph Myers wrote:
> On Mon, 3 Aug 2026, G. Branden Robinson wrote:
>=20
> > On the bright side, I wager that a domain-specific translator to get
> > from a specific Texinfo manual--likely one that imposed special
> > rules on its maintainers to enable extraction of data necessary for
> > man page production--could be written.  The job will demand someone
> > with solid domain expertise in both formats.  Better, such people
> > actually exist.
>=20
> We do in fact have such translation for GCC and binutils; parts of the=20
> Texinfo manuals are marked up for extraction with a script texi2pod.pl=20
> with the results then going through pod2man (as shipped with perl). =20

Now that you mention it, that does ring a bell.  I probably didn't think
of it because you're using POD as an intermediate format.  That
forecloses some possibilities, but mandoc(1) maintainer Ingo Schwarze
and I share the opinion that it is the best-of-breed man(7) generator.
I reiterate, though...you give some things up with POD, like tables.

> (Being intended for converting instructions for invoking a
> command-line program, rather than documentation for library functions,
> no doubt significant changes would be needed to be useful for glibc;

I agree.  Every time I've looked (cursorily) at a problem with this
shape, I've thought, "mmmm...tricky", and moved on.

> also, the glibc manual documents lots of things outside of the
> individual function descriptions, and that information wouldn't end up
> in such generated man pages because it's not suitably structured to
> put in them.)

Yes.  Every few years someone asks the groff list why we haven't just up
and converted our Texinfo manual to man pages yet.

Structure.  The biggest impedance mismatch is structure.  Steve Summit
raised the famous old point about a "reference, not a tutorial", and I
don't know if I'll work up the steam to reply to him more fully, but
that proves a tough boundary to police.

There are people who will read _only_ man pages and never anything else.
Those people release a horde of Hyrum's Law gerbils into your system.

Regards,
Branden

--c7us4whjzhz2xtka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpwsSIACgkQ0Z6cfXEm
bc6mFQ/+N5GSfUPmixxq80iWjEqC5ciUJHz55DSHaSyXf7NMXTSr3nRuGuN8LSBY
8jl7+x6YDkY9Ozodg2lndm57KjxMpUR0SUhueHnSaBn2oJKONGMuOCiBMu7tdCkn
f9VKgt4TMTFAo3uvGO6AA3736edHgaZTXqRd76EYu04SxOEQcnBLAn9IQGsnx0T1
KHxaf32DjDz2faQHvPTx/u7uGZBG5tHgBlU6uWiHzKuCDcgDZOZMHRE17lfX7OVu
t6zocMKwwBDZtCCNLguZpdHd97jB7npk0VYZ99Rl1GhrrzTBk5tGin96mhZMxkeX
UpVH6JA+EFRtYOlnlMwdrbguQkqzMgmlSSp3f4L+tVLieRFkSycZjx1psow/rLQc
KGoMldvSFSkZmQiDOxZAtGyAT2nRLFuEf2a42Ka8gVIsUDo/bQ77dV8QGoR75nPK
/UX8uUQjNOBqKV7fIlkHNLDvZbr76tFGhZdjQ21WifcRuE9oiiK7W6sRW0FqIUpX
rmishNxpCkYdIVZL/i02fkp/JUeow+nCtc7oLddf7Z/Nvjz1zQa8X34+2OMxBXpB
Bo57+4UH3McPipVHivhphFsSqBmuIj9VYaKlDJgpBVNA8v6IvTYfsZ0pxcJSCj/U
7RolzN//zx11qdWDRnRZq+a+jB+PkxyxV8czmpbrc9eqJq/qXTQ=
=LR7w
-----END PGP SIGNATURE-----

--c7us4whjzhz2xtka--
