Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F241A5B8C
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 01:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785633321; cv=none; b=es1GntmPYLI/xLcJz19gVob3pT88LetQPx4AtpdpAYvUC0jkKRClq1vPaxJL0r1HtFLEbsf8wGC07GIbkD8u3P+C55refVCClOdBTA9vUNcWwyUce8wG+ClnjB5yFTnBpbsiySLFMIzWSw0S/fO52ucL16fJCCHLX+fGNDgQvL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785633321; c=relaxed/simple;
	bh=Z1WPuqVGKW47OtbPS5dxEJqEW5Xt8jdt5/7dRpQ/vdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFF71Ty/hSmblbUp+NWyCrDRO5zGPmtfyS6p3EiAw5IwS62hielwTsxjbVlzZ+N9wBrT/rrLu4rZL8w74sZGqbxvZ1G7TTsEJSMb1pYhBTU0zHLZTJEoujdPrwi+RggrrFcZbiH3ed+EPWDAmHT9PKntL2a2kTm7SvaawTRnmpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s95VG9Y/; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s95VG9Y/"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81f36179dd5so31847567b3.2
        for <linux-man@vger.kernel.org>; Sat, 01 Aug 2026 18:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785633319; x=1786238119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DeDEdSFU9MMiXjXJUFwBQ2h2Q+5u1xEVcA16WNH0qpo=;
        b=s95VG9Y/2MpiS7rU5NGtEZVuUOFoQwUlTUdu4KA61agUSmzCfKonmEKXTA4DpKg8Zr
         +bM29MMV1AiOJDFkMo+7vmVgKyTb6J0D+SFg5kr4tfyrPcBNbkX/WeR+QkIqi16PSk0T
         xb0diSr+ajo8BPyJIYscfrUlKsu6x5qpkfRcq/+VOuDmV7fAnWb/JWTsc09JdaANPW1l
         0kDmKykLlNSKsmD0bE6xPHtLGC0AmOUgmsgj6E+sUY0c6JMevGcpGeL8lcfAC39ncNgP
         QpxQbgODFlVHaN+PM7cgbmx6Ls7sNDyxP8eIXSd8UOZqQqAuPrZW5JS8+JPcXtNay8Bf
         blZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785633319; x=1786238119;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeDEdSFU9MMiXjXJUFwBQ2h2Q+5u1xEVcA16WNH0qpo=;
        b=JCTBqidAwvHZ/YZuQghTtkEpoyGVfABJX4HvjwF7pSqjviaz/bNAKxy7aSYb9b7Jbg
         9jCWWdE/JjULO2iJs3ovuu+qaIQtb+/ZcLx9ifmX6T+dg0zainezDlTK3w0gthuw+tmp
         zN2p1Vji9wUeEztZxiIwGu9DH+ybDqPtkJJ4fkMtpOxFA24P3LR/rJnFlN0ZKEc3UI2r
         IAkP2gEMZnK/dh7ZTyiQPXjdJImNdsHX1nRR1MLsAaskqU/coeHfvbvxMJsj53qv2KH/
         kE4kLYV7/KPGrV9j066OMJyAlvSxD2Nx6os3XmtP4kqg/gJ/cb9zT1OW2fm9xWckqOBJ
         ujiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6D5odb33cIzgj9P2sYu+BQZIL4CCBERL5fCABEyc8HAQRCs9xJYkt3C+QQqb1QBpSB4NVrjUo9hQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3f9JLrXAN9h8IhBFEoU9A8hjAnzPA9onJ2EEalKZZw/bgmfjm
	XYZvE3lOWxhxuj5phgw+HnXHse8Pb6rHPhOdu0qlvJ6TwBG1h8h1kFAT
X-Gm-Gg: AR+sD12flvrvT4pExf7KNywFiz9IoGs6tsbkpi77imGLAKYAU1rgI5g/wNJp5t143wV
	gTJHq0PNDGvXULxRwCApwHhpsGDKamfSwG71nUF4ejBD21FM6wO4f+ud6lgX+7LrnRbhbKqPcSZ
	BQAksuiNsjHEF0w4bgVceobK4KBnCuuvOxPg7matZB8mUadSrGSukxc/SytatbxFzcox4qj/JKO
	vnvspTBPyebYq//tu4ZtHO0NXXCA8Q2ZbAbetlWG6WpyNgXP+GfJKZVpAt+NWFWvt9GI92qmXtd
	bW1r7jUFZkpJlQ1KVKVZDilEDBd5lHB9RvYAQi9+iJ5aD2j8skRbZ056eZqFn7MVEVRSfBv6S8M
	dTj27OqEnpEPqB9Yf6hgxtsB7EynH7xZyUZK2BzqhUN6+PsLISPf4CB0sYcWD+wkfpk1/Fv/9gS
	2W+p60vfxNPkL/oC9aBYAq5RUrgQtFLEeLM2suCg7kDsYDHH7clw==
X-Received: by 2002:a05:690c:498b:b0:814:651e:a553 with SMTP id 00721157ae682-81fd4bd375dmr76644367b3.28.1785633319497;
        Sat, 01 Aug 2026 18:15:19 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf60a76sm32460397b3.13.2026.08.01.18.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 18:15:17 -0700 (PDT)
Date: Sat, 1 Aug 2026 20:15:15 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Collin Funk <collin.funk1@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, Paul Eggert <eggert@cs.ucla.edu>,
	linux-man@vger.kernel.org, bug-gnulib@gnu.org,
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <20260802011515.f6os2t7druci6zuk@illithid>
References: <cover.1785532392.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v7dm2drlvqq6jemx"
Content-Disposition: inline
In-Reply-To: <87cxw1s58a.fsf@gmail.com>


--v7dm2drlvqq6jemx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: the Linux man-pages as an educational tool
MIME-Version: 1.0

Hi Collin,

At 2026-08-01T18:04:05-0700, Collin Funk wrote:
> Alejandro Colomar <alx@kernel.org> writes:
> >> I'd like to underscore this point.  As I noted in my response to
> >> Doug, the flagship book on C, as we all know, is stuck in 1988.
> >> The throne is vacant, with many pretenders, some with excellent
> >> cases for service as regent.
> >
> > In fact, the throne might currently fall in the Linux man-pages
> > project.  While not being a blood heir of the Unix standards, it has
> > become a de-facto standard.
>=20
> I don't think anyone is arguing whether or not man-pages is an
> educational tool. The argument is whether it should educate based on
> current standards, or the maintainers preferences.

There are always going to be matters that a relevant standards body
hasn't resolved.  Its work would be trivial if there weren't!

I think what the Linux man-pages community is negotiating here is a pair
of related questions.

1.  Should the Linux man-pages make _any_ representations that are not
    supported by a formal standard?

2.  If so, what are the boundaries of its editorial authority?

3.  If not, hard luck for the Linux kernel, eh?

It's easy to say, "I don't like what Alex is doing with xyz(3)."  What's
harder is to articulate a reasonable-sounding, defensible principle that
should restrain him from doing so.

As Kant said:

"Act only according to that maxim whereby you can at the same time will
that it should become a universal law."

https://existentialcomics.com/comic/293

Regards,
Branden

--v7dm2drlvqq6jemx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpumhwACgkQ0Z6cfXEm
bc4zDA//XSi2cmS8dPLAf8UweWX3Zdi4mrq2j8HE4v6M83ZyXnXTvUchA6ixqUj+
88vU5+XY6Trt48od6Na2utfK+Ky5zQRcSKB8gTPmoac00jzJlfd4IpFSkSjy53U5
5+w24iHFWWunXcc0yniOk4K9TQ7yyXtBMxRP6z64nmFMrmWJK6Mo7cmmQzZ5zgmo
cBOVmympY39ZZmpVFzW5wW9A2Yz3LMmD3nyWvB1yYBZaJdkpxeLJnfKUZiTNfRUI
sOU99MsVXPCb8aUfZGevSSRBeAJaBa4TjiqSWB9AqJAcIo0FA/5KKFBhKoHD2ZZf
jA8B7kXajofSccGZylOL6EspbAXmAIWVv5AqYBk4ncDqMQ56AJnuvwgM32WNB64U
q939G6XVT4AsYRjkTFSDoOGbomSdNx4lYiwtIsbwcdlcKAJBtzQ+ZFQ3dhQyPxGQ
9KIwMjIArXCvyH2b9V0wR25l/UUMY6pTCFSA+ZsixYzNWGIcIcX7DQ7SHXb2Give
KHMX6hmz+ef3EAwFIK/54t+Qle6fVs4xI8qK1SPmouGfDuqBcs2JeA6UAmuupDcs
eJHRbrewN5s7ZdeT8gZKi/LHTrrKCa1hIUMlf1bYoDif9FyWCP4t0CA1usTBIjVJ
NGAAc1HkloBx8USdeDIhnds1xzSWznBI7jLM6nVOSMDNKYqMYAc=
=6uqR
-----END PGP SIGNATURE-----

--v7dm2drlvqq6jemx--
