Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C4913D53C
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 20:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785617553; cv=none; b=Xn8fft9+G9IHRq4Q1bkA4QruSwm4vDZ/6BVRLjqqtOEOaQ6HFQFw0u/ZU7Cdppirj1Hkq+ammXAYKe279OktfZdeIkW/tWzAt+YRRgBNPjeLvYTZ6GbfH3jCWsD3rhZ2dZwFDDgaSAdA2ZwXoqYV5bsTFoj9NxPp5pJj3ZRoWjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785617553; c=relaxed/simple;
	bh=NSFvwxpaypT0NRmdIfNXuCugz52dVfMJgGUDN0/SOqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBpproMkhxjAnmwWOuQHzez6Kb/o19O0waBV+e/kNXzOymsAwHV+G8Hwrm4b1rvPtjaqpQbJDvWK2hn6wI1wtEGJ3oAReYu9rOyV5YcZWEYssI7qlnnE01mUuxtIkSkfzobKwtKPAAUnVgGscnVvxmFMkJzoNPfrQcYlfewIPSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2cMKRM3; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2cMKRM3"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66843536f94so2351083d50.3
        for <linux-man@vger.kernel.org>; Sat, 01 Aug 2026 13:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785617550; x=1786222350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xKk8yQE49VQu3AjzdyjnfzLeS1hrfESwKxoqV86JWxI=;
        b=Z2cMKRM3NNdUbxCERH8E8C5psc2lzpYIYjHwgMPB5TCqk/Adlv2y0qMcKac0CHJGIv
         +rRIGb2ioBuoP7IPRgT8jcJ/W8V1W95wUCokIXZYNGvTyZU7rt8S6fY7M2WprNs/yQS9
         crPxQRe6WHfUa5ByJE8WVLNFisGCZh1O9f/7E16l2HHx3pcfX8cDzEfVFqE+J8q58iqr
         U22dly1ym5imVthbJqa2e3RtwW+/YXn/WqBWGrrqDxQ7JtWO6MUK4vmH0hB2vIr18vd7
         GercbBmf2yk7yfvOlCYYx9H+afQxQOsShGm2pZS6EoGBsIWwfd7tB2IfIdVj3xJKXPY6
         Uhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785617550; x=1786222350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKk8yQE49VQu3AjzdyjnfzLeS1hrfESwKxoqV86JWxI=;
        b=Ro1VTFlVIAkKL8Xowf9CiQ93b77sKviCjPEBEvHVlDCN/u2bsibSwtxpfyaUa0khrf
         F0hbt0ZOj3XTz5zyIhtU/yd7SHPY1L1EeU0dn9hQpcmg2/5ZS3TklZdsrPXK46KAbVNx
         ZDQlsHDAPCgU391HrfD/8muiQYgMYBupuP7DCkUfOMTXZ0YEerJEVlF29934QZF00v78
         CdsGk9b25jRwdIyv/PIPJu8KgQIzSPloanjbx5Ddz1SkCG9637Zh6zdgXw0zoSajljXJ
         8Gs3uNlWUOMAQdR4scKVITpgArB8ZHd+38R9ZcQkzqVTCx9ONZZwcuG5gSAkGtYUDUq7
         +FvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrnnqc8QH/DD/IYOCc6frWgjDPB/qGzIv4LbVf+RpniVhnUtya401LsSUL2s9j9hQAFBrmBK3N4pC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9l6S8RRmJDxp64HEP4oJFnJ+IRVTRP3oSWcDJMHN3gWAaINEs
	92rfc/WkuOjGN87yHfYT+weZRpQhlGBOUcnEU2/xCnMRllFXbJQee7VAjsx6NNQO
X-Gm-Gg: AR+sD13GlL5ge4W5udxRpieoK8YiOY8PCcqTQ4OnjAPJMv9wxf7zwqIow7MvGYByC+Y
	gU7OH3tKhjpPciZ4fxj1EwLKnABT/wTJTihoW6RxsoqzWZhoVHgIjcUyb69k0ZU1q69S7hHQ5l0
	+QrbpB2Zb4ax8woNuI3jankdR/DwDHgWVGUlO0F3GRAPnSPQCiYzVi0yptOy0x1LlExbVztbEMp
	JjQI+fOzZjd0JN9mmjcm2sjFefMxE1cMbCrIUco0tzJWDGXDNe48VhxNVXArEU990LZBfLUv7Po
	C9p5IBhBPmT7dKkwd8qvOe7W4ZnG7Ylk7E2nqbwNJ5heB6fc7U/5fAwgtZyeVb3BkrzXVGmgHLJ
	YPWhJbDrSrsQl3MQSS44b3tSnCtZU/Hvivi27eHMj7Sk6JKGscGYhFftK2JQS/1v0Uw0nnu4o+8
	TBeHpvpVwWwGRImEgrhau+537gCJgPhuAbxqYrtgH8c/jJFTMHDg==
X-Received: by 2002:a05:690c:11:b0:81f:650d:1377 with SMTP id 00721157ae682-81fd4c24450mr53167337b3.35.1785617550512;
        Sat, 01 Aug 2026 13:52:30 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d6995sm29214537b3.32.2026.08.01.13.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 13:52:29 -0700 (PDT)
Date: Sat, 1 Aug 2026 15:52:26 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Sam James <sam@gentoo.org>, Joseph Myers <josmyers@redhat.com>,
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
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <20260801205226.jta53rrxkglmpv6q@illithid>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <20260801201849.hzg6ufqxmwi2efzz@illithid>
 <am5Y5g4CltGIBwlE@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lug462fc46ecvvug"
Content-Disposition: inline
In-Reply-To: <am5Y5g4CltGIBwlE@devuan>


--lug462fc46ecvvug
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: on the irresponsibility of pursuing C language reform
MIME-Version: 1.0

Hi Alex,

At 2026-08-01T22:42:09+0200, Alejandro Colomar wrote:
> That's public, and has been since the begining.  It's published in the
> git repository:

I knew it was there somewhere.  (I see now--prominently, even!)

> 	$ cat SPONSORS
> 	Google               <https://opensource.google/>
> 	Hudson River Trading <https://www.hudsonrivertrading.com/>
> 	Meta                 <https://www.meta.com/>

I don't think many occasions call for you to quote the file contents.
In your position I would simply have the URL to this file handy for any
occasion where someone takes a run at my transparency.

In fact I think your approach to disclosure is near-optimal.  In my view
it is strongly superior to slathering acknowledgements of your sponsors
on all of your emails in your capacity as Linux man-pages maintainer,
which would degrade software engineering into something like NASCAR.

(There I go, alienating yet another fan community...)

Regards,
Branden

--lug462fc46ecvvug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpuXIMACgkQ0Z6cfXEm
bc562g//Qq6HhztDdbAEDgi5sVVQuXxMvrJ+H+YtlHSvENNrlXI+uPSLwlpb8fgq
4tWq0PXxSedpb5yOmffvbeK/MWyEff5XN7csMSPsRm4yGAa3s6jA5fpyldEEOB13
mkO+WPXdTr3QjM8xz/PCXg3DArVapsBTzCrVOaMFHifng5TjJ3dgFjWLo91BOc9P
s80rFx2E1pLmm5Y1F0wlgGY90bA0Mf4Qc87EQ8FvcZ8cIOS2lWs0FG4t7brjsQwS
Tp5bjELNdvgPlnEFX0NkvfJug1U5BIcFsM3PZZkq8veQZwyxxUwHt81zCn+SEBor
llztE/D/zSksD4RSaePnzDt4NDz/LuRPfjy7J5po7S/x/n6DvCP/TUat6NmEwjlE
yfetVUWQltm0bTY34N7kS6oivzSQ6eTND/kjd5m4/26VP/injrN0q2aiMZWzU96Z
0uqkRMXJoGGxzNKEN45hs+9zW1DZv0KAIAcuuU99wuh8DOTsj4qu5Mo/BfN05aNw
B1Vw1FM2dI2i/hI3qvlCIaffAKLZ8dkXQ365to2w0baND7hA9fMJv9mkSKTSPB0J
HHwakKMzWhM/eAv4uGVUSmAgrJ9z695JHzsmnCtbWY/uPl8OOZrjmH5sBHN4fSlj
vPJ1h45DixxgEhJwjjeEsRvGOIlJ87MwId/Cc9xDpeUEOLX/l4k=
=yd2c
-----END PGP SIGNATURE-----

--lug462fc46ecvvug--
