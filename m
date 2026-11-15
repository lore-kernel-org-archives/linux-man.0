Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779644;
	b=qC/0d8cNs1jEt07mDwF4L4Tr7fb+eOAMnIbO9rSUVHkJYmM86LkJCm901VMbTZLkR2ji
	 LKMaQFXjzN9qifTB7kQiL3P7WWOd1/RiWbEZxxOu3JYJRzLrCY6dfQbCoPMiDqRxbK7oi
	 0ayapafbIGLvS/2QQLYtJiOGcSQCCbTW7edZpsnOJMZ3Tou9tdL+Rw+H8KNCEO/6F4gQP
	 8u8An8E2E24Tgje/9834Rn0L9T6xVCEAWBYIQFy3KeBYAGHp/RgWasPIvVSmhf2fuZFEw
	 JZWt9+Im4kfJqUfhlQ0yGDMhTDcZ2us7n4+OWfz9Zsk9ytjP22/gOH6bjXkDjOGFjiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qJV3qLNr1KS0yEvsjWxkXej2Res45wI3MVDZ2URjHtQ=;
	b=hNS9gOvVfxgtxVTUc8+YAuqMxvSUmMG51s6VdE4VgVBcMDpe54QWGSli4pnVB3930lV4
	 58bGs+tYckRXudctcnD7jKS0jIe/a7O8oR3+kMsumU/M1Y/Q5/qLU7pjBn36nwi4GHAvt
	 KvaO+LtiPRDOeO7ZenYHn1K27hUqQB04c2/wONkfH8dNJAJ2YWEeHMkzKdzv3AXZFdhnX
	 dN8Rq7IqfnmeA2Xmc99X4CC6IUrcpefGCEvejkOmoZF9MIX9femtIA6V24hsPBwpepf9C
	 aWYVOvYO/O6rsymjyVNHVzcPhqoyLbZeiI8J2hfSAu2pwqhxmS2xaOIms0BRQycSaDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9Fys+Ke;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAC9606A323
	for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 21:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FAC9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9Fys+Ke
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-53c156ba662so2478238b6e.1
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 13:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794779643; x=1795384443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qJV3qLNr1KS0yEvsjWxkXej2Res45wI3MVDZ2URjHtQ=;
        b=X9Fys+KeI2M4+VCdcGZV6DaS5Q8aCw1Bn2I15FQGOeZjHYCIaMi9K2erb7ssOHjLbx
         k28lEj0jHSSiAj7n+XzfcMnDg+cI9TXUrIhD+zuM6tP3T0+yZRUNOXAPEeBdlsJT2SFA
         x3GNGIj0R7olpEHFazTEWeABYMSrJGuD6ubZ0xUt27LpJjeRcMchJHzWCKe9uJmWgeMK
         imTcNbe3aHgd0lrwA14JbTeShJgj9BbBu+Lh/qfcLMMDePLx94W4zDpBmebT9IW7Ae4N
         JsTDzF12unRHRzue1b7H8tkB9zChfnfYaRqNqP4tOTYo0PUBpdTiFRmvQsiD69LR79X1
         iJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794779643; x=1795384443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qJV3qLNr1KS0yEvsjWxkXej2Res45wI3MVDZ2URjHtQ=;
        b=xBlzRd+ggLyoEnkTWMd9gOU1LR9QlkH7u+H0Trl3PFRxvNhNS58cOVRQjqFfL6h4Yu
         /TDOO724NW99GujqWpC+K55AsqNiHOt6cclKSAj4YI9Bsy/Pfl/pG8ODcVAZQ+kcsh2D
         OLzw2seo8ArHRunlDvo5KYnQbGsAJKt/SJzR8zylkFPoo0WK6UUZoMrZ06F9h3glR3Pd
         +DFGmL/K55b2teNHp7WnoKW0PleOwNI9TvYwnPmtLcwbt/1lVhALXW4dNJRVzD0ozVpK
         /eCkZYpKFG8A8XXqmv8iVG+fXQKLVHAWVQ1RUK3z26FNm4tL2RaYY/SWPa1Rjtk4sSxx
         HYYw==
X-Forwarded-Encrypted: i=1; AL+hErFRSQ0myQzA8dSSk5jYJq7mRMYxu7fbTt8PWE5I2M3Y/ZtnwpwLLh/pwgsP7EEaqnni/XN5bh6URRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IclQf5eCnAB9864fRvDYM6+Oytmtt2l2n0g+TPTIvGxOxHfko
	k56lm/B7Q4yI4kbbQLs9sNAJZQ7Ol8FFg+1ZEsfj+1SKloYhZ/NEjT2cJ0NoJQ==
X-Gm-Gg: AYBFou3dCDfPz3XLCKcX+bx3KjUQezKrukYaN7uLISlRM0zu9bG+CYcHmY5B1rJSgN2
	3B2WMIXFYKvxBYhV3NbBd69hq46449lllQNeJ0td9NMtXdQfRDkE+P/97sdryYwKHsvT0CsEfrl
	tTBISaAjKeRxognLTFgygKJe7sdgXN/J7/Ku+9ebjupKvn4A0E2M2JHikIGQR/rCO2UtoMXhyFa
	vALnxRiC//Lx4YJIimd7nYXKZuPk7lqFEILAojSVKYeRF4fiT0GAvwR0pkOg+Z0UeJMYK+5wyYv
	/VQy2+rqhC1yZD7kOAHFXY7cClCRBxKEtjo8GV64ABO4GDuPNdJ1tUBiQnb6SY9vARUo63zqXaS
	Vn9Zy5tdX6F1O37ekk/dgi4Q8NremDvF87yJJjhpeUtStvJirmnPd4wh6n44TAn9P9YddMHNQYF
	OUqrgKpLY2Ef0IMg4NrpN21I9KutKen1i/pteGY4q6T98v+sEmxITTekEhHkYew+pPAk0JMS/b0
	xbRkjFJNxKBdQUnZgQQfFh/+jVTYdaRiwDlxWx49mNgV8fFDywOHASFIJe2X1NmDFaEuqcURgZZ
	/0Xr403wDes5pXT1z/10HeFvxY09CdxtZ8tT978=
X-Received: by 2002:a05:6808:4d17:b0:571:a186:d6bb with SMTP id 5614622812f47-571a186df2bmr4302878b6e.57.1794779643333;
        Sun, 15 Nov 2026 13:54:03 -0800 (PST)
Received: from illithid ([2600:1702:7cd0:e980::48])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-573f61c9150sm1376760b6e.0.2026.11.15.13.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:54:02 -0800 (PST)
Date: Sun, 15 Nov 2026 15:53:59 -0600
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Matthieu Buffet <matthieu@buffet.re>,
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	linux-man@vger.kernel.org
Subject: Re: [PATCH v2 2/2] man/man?/landlock*.?: Document UDP support
Message-ID: <20261115215359.tcfw7u3apvbqxde5@illithid>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
 <20261102233932.29912-2-matthieu@buffet.re>
 <20261106.73089117d0af@gnoack.org>
 <au8HcBs37d1yUkZ0@debian>
 <bc495b26-2e26-4fc0-934b-37d55cb423a8@buffet.re>
 <avogyPekOEm-xBPV@devuan>
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
	protocol="application/pgp-signature"; boundary="5hhwshm35qb3xmgg"
Content-Disposition: inline
In-Reply-To: <avogyPekOEm-xBPV@devuan>


--5hhwshm35qb3xmgg
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] man/man?/landlock*.?: Document UDP support
MIME-Version: 1.0

Hi Alex,

At 2026-11-15T22:18:06+0100, Alejandro Colomar wrote:
> > Date: 2026-11-15 21:55:50+0100
> > From: Matthieu Buffet <matthieu@buffet.re>
> > On 11/6/26 11:02 PM, G=FCnther Noack wrote:
> > > On Tue, Nov 03, 2026 at 12:39:32AM +0100, Matthieu Buffet wrote:
> > >>   A Landlock rule with port 0
> > >>   and the
> > >>   .B LANDLOCK_ACCESS_NET_BIND_TCP
> > >> -right means that requesting to bind on port 0 is allowed
> > >> -and it will automatically translate to binding on the related port
> > range.
> > >> +or
> > >> +.B LANDLOCK_ACCESS_NET_BIND_UDP
> > >> +right means that requesting to bind on port 0
> > >> +(explicitly, or implicitly
> > >> +for instance by sending a datagram on an unbound UDP socket)
> > >> +is allowed
> > >> +and it will automatically translate to binding on a kernel-assigned
> > ephemeral port.
> > >
> > > With the caveat of not being a native speaker either, the commas in
> > > this sentence feel wrong to me.
> >=20
> > I was trying to make the comma match the fact that the example only app=
lies
> > to the implicit case, but if it sounds wrong let's use your suggestion.
>=20
> Perhaps you could use two levels of separation, with ';':
>=20
> 	(explicitly;
> 	or implicitly,
> 	for instance, by sending a datagram ...)
>=20
> But this is a bit beyond my expertise.  I've CCd Branden, which will
> surely be able to help.

Well, maybe.

I don't know of hard rules governing this sort of construction, but use
of a semicolon here "feels" wrong, as you're not joining independent
clauses nor are you separating list items, at least some of which
contain commas.

I might use an em dash here.  But, trying to interpret this language for
myself, I think the best solution might be to recast to break up this
long sentence into shorter ones.

Thus:

A Landlock rule with port 0
and the
=2EB LANDLOCK_ACCESS_NET_BIND_TCP
or
=2EB LANDLOCK_ACCESS_NET_BIND_UDP
right means that a port 0 binding request is allowed,
automatically translating
to a binding on a kernel-assigned ephemeral port.
Such binding can be done explicitly or implicitly.
Sending a datagram on an unbound UDP socket is one implicit means.

I also recast the text to tighten wording, to reduce use of passive
voice, and to favor present tense over future.

Does this help?

Regards,
Branden

--5hhwshm35qb3xmgg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmr6KekACgkQ0Z6cfXEm
bc4xNg/8C3QLqgNsVPSJDr/q6QTcxNf9piF9i2CCjZtpO4FBPSIUqCVRyGFuBAbn
FBOHyVx3YT6IXLyDFvKKyiJClFDBX0fYZlPVep2tQuuqlf5WsvlOC0QyErtasaQT
wS5v/REL492R4rKuW5PEm6Zq/1SW3WApMvCdsRTE8Dj0rPomC4Mon7HGSrxY8XhB
1pLwGgGGPAdVR0vq7clPeBIM4IfGqntGn15VbNXkEbKf/KcsQeeot/dwcxc82lme
+emmuDIOgJ8bcz78ZJDLdBO66xxJlEGbmpwM3Y7BuVbsuhAp9G86MuzvLGr6aLLo
pUFXQZZdXkAkCd92wSZ4dyH0JU2oTJELcmbZPHIi/eBUxD0skghY+f4hDniFiVEL
+ylUOJFPsScbE3LCmV1pxH3IOTipk8SpckKNz+Uqhxj9WeCjQbalhSPb7l3UasvX
L4F9WWcdQINL7ACALoUneeEMnsT3bE8GHgr+iCkIFHjOvGiMmmL8eKIEjzU9Sku2
wQRBblTDasGExayRSHsilWbwBbv7XB/nbOSdLsy406i5uX2uwQYfK+931rw5+5d/
lsXRy5s4XIgUrF21BJcavndWr2zbClJpVFuotFUag3P2/tZiwIZo5ThI/O8+oPMI
dJLtEHr1gCObtD/xG3suOudWuRyCoHYpO2sW3J8gKdcTNIAaTkw=
=tOPD
-----END PGP SIGNATURE-----

--5hhwshm35qb3xmgg--
