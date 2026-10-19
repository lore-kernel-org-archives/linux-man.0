Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2E53F44F4
	for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 12:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411648; cv=none; b=OfinFn/nTNmRsJZpIRrI4oVQT7LZ3MNDh2vUUmUgO1GRea3qNSriJkEYQxhlRpLrBWzRKTUH1GsioRZM10LNLnGutEmpseYpRP7ugJL/8yEIAk7se0DXS4zdGfHo/3xOHXM4JgiiN+WlDSobnUqhrPel0TmiInL7B65DUVBji4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411648; c=relaxed/simple;
	bh=70N3Z/pa4t5imX9C3yinxbcCeQRekg9bwg/v06N7lDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldG/CxICDrFihbPU7Lgw4CzdpoGm6uF8gWYIb7IhpoLCyIQCoP4gFNem0uVGIYJzEPZ2Ot41Yt1Bn9evyd90J0dKpSgD835ufrQsy7ZDDdoHZ6DPGznHUXS4o4f0FuTbfEqzkFN2jR1m3dmuF7LbkJtWBoQpvY13HzaXHRTxG8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBu0fDtm; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBu0fDtm"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67999045530so1835345d50.1
        for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 05:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792411646; x=1793016446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HxmDyom0aata8bHlBQvejeILdVTDg9ToBJAIdDXLay0=;
        b=CBu0fDtmQayK+R+q0HtSUU0rfizM8g2H4BTahEIovcNe4OZGRaJ3d3HbFG1AOTBSps
         bstwSLOqe8McQvvNoaKsBquAb+viv6JADyBcSRBoc+248jcqVFgBMo5Oe4U3loxdGEil
         /erMq3QaXLittqXYf94MDmquEduBXUccjjH5Tso4bZyHwlB1RpeZrRWQpJ3Iewjgkgmq
         bgwYi8SsLHO8F7/NJlnfxH/1DySM02S3ER4N+HTXIJqWNnpfvDzQsqk1//PbTyiWyN7G
         8XEsPnZULSY3imYbuFIyRBEP/OqB15AUhGIhcl1NycC/jIQWZpw4BcYJ2/OuRLeIzPHI
         SmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411646; x=1793016446;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxmDyom0aata8bHlBQvejeILdVTDg9ToBJAIdDXLay0=;
        b=x7GZfdfQYAci63J8/wvPuc89EF4bEUITBdvKH8NQYuv85G0K8nov2Gxar+2BIc6zD4
         7JeFk/fkoKPkXBySSpnkcR+3RD0pCUjykRA7MBbJP2AikWt2L8cYAh+YRF4sOuC8QFKq
         FGWyCtqUzZbWLNeJUM06h4qTTUm0ixNZTQK9XcxnIwrMScA68wg2cYQzmGD1lXpWfjHe
         S/NOZxN2ep8xl3AfHHQgWDnLP89GVnVyUkw5liKjJoE7R+gEivva/1Nf4Qwn1BY7Ti9J
         I1lxE/npXeYxe8QDzCwbhSWdcJZAGp6T1ckyFxaKhET8w218xUHf8RD0gTYytkq8KeyQ
         7rUA==
X-Forwarded-Encrypted: i=1; AKwUvBzS8bcvsIFzZiNNfFXQvW+O4LSn7lzTGuyKxiVHb6lyPWrEVh2goymZXH4gj7br0uMVy0wYlTNA1uk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6fJKcQ9CBW9pLqZZq+Ea7RMa7HL+hmB0BGe+PMr1eOBRj0Tti
	ZBLB1TKwjNYugfiaxF5jI3PNQ5gw/e9yKJGPyMMOg61jNih2tG5it9Fr
X-Gm-Gg: AYBFou2tNvdAkuBQK96NY8QU6Moc20kyLL9S5bH+ML3qI4TQTQ5GZtJdx2CkgWSsRAG
	Q37xw99QI5K044a1vkFLk7XIodxrHqFGMnLkzsGu8O2z4KnSGgG31u/EKc7V8Acd9Tka5cT+2Hu
	8quE+w3ABy/nIHxMvgzpMJEbA4tHbifyU9/PEw/sfj1POILfqudDpmYDgFu/J2O6T6/8hJ0Tk8D
	Cm726Vr8Tujrx26ridwul9eAZR+v7xMsKavx25CBLjhvKVaH7t63p57kJ1uNBm55Cji3ut+0db7
	ZJqIcxqnLdHGIPE3oOocizsGAn0HZ0mjWGYqpkGjgJlVcmz+z/H/4MmF5ZMyFB8Z89TK9KvmhDF
	aAX+bTaGp9b/gXZzGjH/GMeVQTSUI4wj85KWqQuUEI35ojotLg0h7pXLZQbkx3fLhnUoRDD/Iav
	7TLY+X9+IHMvPGnk2uFpA5NnhVmRNgSe1uMvNvK+xUeom+lHthRe0XZEjMJeU=
X-Received: by 2002:a53:ac88:0:b0:679:a2eb:c384 with SMTP id 956f58d0204a3-679f449bb90mr193259d50.47.1792411645750;
        Mon, 19 Oct 2026 05:07:25 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::49])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1c94c25sm4008849d50.3.2026.10.19.05.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:07:24 -0700 (PDT)
Date: Mon, 19 Oct 2026 07:07:22 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: the meaning of "ffix" (was: [PATCH v2 00/24] Documentation fixes in
 unix(7))
Message-ID: <20261019120722.uuwnzo25ovuazkjz@illithid>
References: <20261018173712.27670-1-gnoack3000@gmail.com>
 <CAAVpQUCYaDWSeQormOH9SnJeiDnLanxvADGQ5WU7OkFN_zGzqA@mail.gmail.com>
 <atW_3kqU7KMcxHXp@debian>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c5f7pmd3do6ef4dt"
Content-Disposition: inline
In-Reply-To: <atW_3kqU7KMcxHXp@debian>


--c5f7pmd3do6ef4dt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: the meaning of "ffix" (was: [PATCH v2 00/24] Documentation fixes in
 unix(7))
MIME-Version: 1.0

At 2026-10-19T09:05:21+0200, Alejandro Colomar wrote:
> > Date: 2026-10-18 11:37:16-0700
> > From: Kuniyuki Iwashima <kuniyu@google.com>
> > >   man/man7/unix.7: SO_PASSCRED: ffix
> >=20
> > ??  This reminds me of Final Fantasy IX :p
> >=20
> > Please fix all of them.
>=20
> We use 'ffix' as a shorthand for 'formatting fix'.  Those patches
> usually make something bold, or remove bold, but don't do anything
> meaningful to the page.

Also see man-pages CONTRIBUTING.d/patches/subject:

    Trivial subject
        For trivial patches, you can use subject tags:

                ffix    Formatting fix.
                tfix    Typo fix.
                wfix    Minor wording fix.
                srcfix  Change to manual page source that doesn't affect
                        the output.

        Example:

                [PATCH v1] tcp.7: tfix

Regards,
Branden

--c5f7pmd3do6ef4dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmrWB+oACgkQ0Z6cfXEm
bc6LWQ//YnLmJRIYwQx+sp2Mr6T1va1bS9YDJlUtJJfXyT79ecFcQfAhdKT2PpME
9hJ2uJN3vo2eCD49/GKYOYAFpfy6FkYLuLzYmlcmAotilkd7jWh3VkfzrsrTWCM6
N/K39q3Guo6lP4ADU2eTIuWKbIDvWYlw1NG19DyRmphgHuoL+ZGs/45Y8LkyQWDg
YAScnPLAr2K4MfXhq1PCz8EtqL3uSpTRyb9knWXiZiZ69HecfXd3bqPsAdBTG6p/
T2aiWOl9zjgRbsSWriEHoIEb632ZOb2MoRhVo75e4pF6DCkHE69H/aceSVE0nbK6
1/UsOzpAo10I4IUMOxCJBGryRXdVB8zJ5lH6t6PxPAt2Q0R0gvSv56l6S++oY6yz
ren4PH1Dox26mM/m2bOAoVDXsA0X7V+xaya2wKEOzJJNrcpWB3GAgidTN8fpYW+0
kD1velM9hwhhWbxSegBQ01WW597TkEzkU8c++nthcgA4SGHY95yE94q3nqANTe/z
mHDNbHuRjlIaldTLhIsrU5uAaggvuXmgk2A49820DI/Sp+09cNgZUOROE/C8hf+a
6iXNHGaabD0OUAOGQPD8sRyia/okX9yjUQhD3FLMgRD/EkX1NzDe0eJIzhdxD6S+
k7apBk/dtHAjPOz5VZD/roGTPqhO1MjC63hVstxU0WfEW2GFyXY=
=D7vr
-----END PGP SIGNATURE-----

--c5f7pmd3do6ef4dt--
