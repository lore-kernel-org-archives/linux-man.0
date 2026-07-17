Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B1734574B
	for <linux-man@vger.kernel.org>; Fri, 17 Jul 2026 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784308515; cv=none; b=PxSFmKLcPl8i5+jAc7r/6FrEMbTPPuM5LL8GBCrTExnICMFVyHENe3D5d+xZ992Eo4Iu1QOupCqf/yX3DnWARrDMtpoZnXq2wfMkMTom6DmAqIQn5Rf7ZTyaIruPkNNahrpL38F1uDb4KL71jtW7Cm1XWW5olC1t/jr6BbREdpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784308515; c=relaxed/simple;
	bh=bqIw/sCqd7hIHxfqHPgWAbgNvW1K3GNU3CvUG0tvyLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpugiGltodCsHlEPOl4IAoCfnjD+JRfJJMekZ2WFigzZmjsOZRT2sTHoJDFEXvs/RLIKGzIKIBDTWqubrKdL6cXWHwz3BC5hdWOhPrbLd80/rPIUInaB8FqI00p7OgxfsviTU9PyquTogysz1KkgKwZTzDRUE42RSmAeewAR7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oL7kcuvX; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oL7kcuvX"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81eaf3709b4so57285117b3.0
        for <linux-man@vger.kernel.org>; Fri, 17 Jul 2026 10:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784308512; x=1784913312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KqmN2L9zuyf2oPwOA0ZXtsOBX/pAsa+Ioz74/6wbeL4=;
        b=oL7kcuvXx+wV4xTnymx+X/+kcoQAwmaiQY1Zuu3fzOur7kSXnRrLl73KvdphD+I2La
         2VyjywRV/69SaYF7NYYOj5e31sb1CB96Uqosn4Bx7X9h8dFbXEcsTrkpuKQ6ZGo050pK
         Gc0xAqYiDwoE2gllLP/7ND1eTLu/8mLyCCeH02H2leOGHu6MjWFZnjikkGlDV0kM7nvT
         2MhKHoxePydbB7nCzyq4/B66bJHFW3AiJ9SHgP8RIS1EioOIj4GkYFq27GWn+9bqeymc
         ITpTUAIWTbYSbwG+oEH8FnhZniTWz7REjh3qOy3+oJq2TmYJnF1HSGQ7mJKAudcCinS4
         MWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784308512; x=1784913312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KqmN2L9zuyf2oPwOA0ZXtsOBX/pAsa+Ioz74/6wbeL4=;
        b=jeKHOFLXCCeoKQsmqrf19yqEo3k9UQZ3cAjEUg3P/NOA8ihfWOvc/8McIUtxVExL9N
         1tPkKhTQua4iDT8l9Ww/J2Et9rJ2XHi3E7NLjthYpz3hA/uWY4Ae8ieaKfaQ+Oa/zkfR
         65NlL8iv5h+aGw2vSZDLF0WWcfrIzF9W6kX6A7KM3z5yXErKDPW3/CnxQZ2+iWlgHlsW
         ufz5PfqluSYvbFxnqneW7zyihE/d470GMNMXJwOh9ynSxaYlYLsPIeTEdXb1yVb9PzRw
         kcqb+k8RO+CLAYx43/ZI3s0vW8KjdthQl1/2NFqqSUB1z7WacaQHazq5JkCitOnZ91/9
         M21w==
X-Forwarded-Encrypted: i=1; AHgh+RqFqGsSqAYg5Wpnh9+ko7cyafrQxUDVBnQ0MhfR0f69H3LztrMv5mzsJ+bkkxrOOv03XKkccE0Cw6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEa4tgcsWBIFfkh0m2+Ensuw6CVged9eLln0GBX4lOBsLhfR/9
	PmzVoCsAo7qGdWTtIcxJB6LO5s3fqix+hJSDyIihbUgVMHpC+0PbohHz
X-Gm-Gg: AfdE7cnvSp/8HWpdK9JB3zqaCkffk+rGe8myWYEpTEPzx6vE3NHr9ctuWTZEgTqpOd1
	bqNl/kDxCb7BSpMAXmFfvfwfNBoBY3P+oRWF5rkOLv3e93C/gzBwlky3StM953YpySUfp4tbBPQ
	iFf+PKWcv605Ds6Mpp6K+SYNeEVMHimK2itX4l2cqOXifVzga7OFRkr+JhB2d+zX1ve8ppYI7oe
	bwmw3DAkih52VKt/Zz4jIBEA6rZ0KlhGC1GjQhIDBaNb8ZsxlVD92WEyzXKpkRksBp0Hmc0whaQ
	x1BJxjoHMrToVhyNukkVbcYZLrE4UPll2sz/6SPRS1AxHbyNUxxELbe4GGR4rqzAaEU5WBXgTaw
	4laHJ/rrSuvUoov0a947Yv3A3WZlY591I/pODONQtJmGN7vJ8IqqNTt7756YM+RQQYe8=
X-Received: by 2002:a05:690c:4b13:b0:81e:89b2:8caa with SMTP id 00721157ae682-81ef2724952mr12094957b3.29.1784308511734;
        Fri, 17 Jul 2026 10:15:11 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef4016594sm15192507b3.3.2026.07.17.10.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:15:10 -0700 (PDT)
Date: Fri, 17 Jul 2026 12:15:09 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>,
	linux-man@vger.kernel.org,
	"James K. Lowden" <jklowden@schemamania.org>
Subject: Re: syntax of options in man1
Message-ID: <20260717171509.4sdaukkhloy33lne@illithid>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
 <CAKH6PiXx=WycAiPGti3LAAfpmDQExkcWsatXjOXpD=GdiMc0ng@mail.gmail.com>
 <alobDcKZVkwVqzRx@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f5ubpsg2vcdabamd"
Content-Disposition: inline
In-Reply-To: <alobDcKZVkwVqzRx@devuan>


--f5ubpsg2vcdabamd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: syntax of options in man1
MIME-Version: 1.0

Hi Alex,

At 2026-07-17T14:10:23+0200, Alejandro Colomar wrote:
> On 2026-07-16T13:19:20-0400, Douglas McIlroy wrote:
> > > I think there should be a separation between an introduction to
> > > the entire system (maybe this could be intro(0)), and an
> > > introduction to the first section of the manual (intro(1)).
> >=20
> > I agree. In the early days, at least, there was such a section,
> > called "getting started". I like the idea of calling it intro(0).
> > The very name suggests that there are more intro(.) pages. Elegant!
>=20
> Thanks!  I've done the split already.
>=20
> 	commit 214f536963b0a108abc54b336d8ac21b4c9f1c7f
> 	Author: Alejandro Colomar <alx@kernel.org>
> 	Date:   2026-07-17 14:05:19 +0200
>=20
> 	    man/man?/intro.[01]: Split part of intro(1) into a new intro(0)
> 	   =20
> 	    Let's keep intro(1) for introducing just the man1 section,
> 	    and move the more general introduction of the entire manual
> 	    to a new intro(0).
> 	   =20
> 	    Acked-by: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
> 	    Signed-off-by: Alejandro Colomar <alx@kernel.org>

I wonder if James K. Lowden's proposed "man-intro" document might be
worth a second look at this time.

https://lists.gnu.org/archive/html/groff/2021-05/msg00032.html

Regards,
Branden

--f5ubpsg2vcdabamd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpaYxQACgkQ0Z6cfXEm
bc4LAg/+O6cdSPtjAyfT3eQXYkjwtAlP4QP9yx0pC/Sq3Co8mGysMBtnq9pxRdrZ
cQOoaXXZbhG5kIBhIQs84W9RvniXDrsfMFBictKXWh1dcm63iWUQl4LswLKJ6iO3
vMHCHVdQENGi9kJJnQ909LxuE+I9Gxog6+e44WtCbL/CRx2gn5LwWRroIr9WgMgb
1MV2mugTrT9z9qsoUSmFx1gvEEuUof1mXNC5tjmzOSDABscsc6L3YcghFvRG/+UO
42BXzybRnx3RqOSQ5xP9bDuUuqgkxRoFmjFatdr16ldgAndwkjTq7Z4LGjY4rAQ5
uvtlAjvXOfXTq5taO1kb1UUycROOvx+BEOcWfH9/pazjMyU0aKnfmJfm8FwbPBik
Fvt3pMOF57BVt1skF8mUgM0spqnNvbL53xUWEjm3UkQ+Y5tDQZ71gT/rGoRD5Qun
mwdEgg6tL38TMBuc0+/JFk5hHliIunWt+GBhFyihpO0xmVOEaqZBr0gClXeZbD+l
D8s9kjzYhPsxVlZj605JD8JalQO2Hc/srSw2ikMZjsebKdhYi8FdsiC+WBUEkfXL
DsPfJ+39wE3HVd1Ij8RR+rpAJ4XHAq1tOSvXFWHCPv8TKvGLCvXsS2UCKB2UFlpZ
iL+sLBybMcvHU4w/dTUCqzyzETi7GFFWPhTeeZJY8qsQRTAQEtI=
=aeC8
-----END PGP SIGNATURE-----

--f5ubpsg2vcdabamd--
