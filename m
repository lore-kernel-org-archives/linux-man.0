Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714B0188CC9
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 00:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785629318; cv=none; b=LL8omN3gZiYxcrF4PaQpuAscKRvk+sR2KpNcqwiBj4VNNJCOWYYtZHpi1yrL/EVjIdvS+VbTgH57m39zfibYDJYOwwJM+10z5acZhumuHwuSsCebJp8rVof8M1BA+saAF7oaAc0UFVF2vUIy6yN85BfEpqclAYdCQTFWSt6FGGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785629318; c=relaxed/simple;
	bh=YX+ZF+Xm9BK+V3poHwulNCj9xqEA2ZEWW6x5dJW/t48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2iVM5PkrCsPGcgBiUN6GW9yZZfOBajVbCZf4iPwIYoOCj/uIMxHKI84GDX7Cc5sX3IE3pQjx3BYzobQcCq9QCf1J7tpRj+rWWMEECdS89SMdN/kStw1kLeq3JvXH+TExSkVwfG6rIAH6ZuQDAwaqmGCF9Eex8/HWeX38Knob2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y93jtLHk; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y93jtLHk"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664ce3000e6so1914161d50.0
        for <linux-man@vger.kernel.org>; Sat, 01 Aug 2026 17:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785629316; x=1786234116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xRCuCCb2zrY+EHdKjpHrCEXfZPvkxSkasInskZZp0IU=;
        b=Y93jtLHk4hnQxBIG4DO/jEX0xau8jB+Cjprdla2B2/8We6QaCexHAP45knbGqoXubu
         LxeHXDDUu9fq2fo06tlK+d0ipDIRbOpdnNix5P87G3tB74gfCcQDnaPpBFVWdaVVWPrf
         bgVML0RzatxFXCmdx8et1VPOBOFuJMfmBH5j5x1tOB0qJOpa3csv+M8aiSP3CfmDTSyu
         HfxFqgptVQdgBxm2LqcmSsKr/tRH1SLAqGr9QJMTy9vUfqQ530fovKzBFe3leFpdd6ws
         kGW8qcg+MHVAOtt8KWmblRxXPAuJYRiG2waUnWlaGolpoEzFLVI/kldJaS+GKJzeIbeS
         KkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785629316; x=1786234116;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRCuCCb2zrY+EHdKjpHrCEXfZPvkxSkasInskZZp0IU=;
        b=UEHO79WwF6Uyeck3uuCJstG23vAw6yFY8PscxwhjVJDuekX1u9xDghwg5xTitT9RJ8
         xORmM7b1GL9l3sAWqumSSwqnqU40EiLZK+ZyBNrDk3Zxx/wRmRJqDAxKAjVE8o4Rqy7x
         b9Y2K8J958hWmsuZtIFn2MSofIVSB35yPqvfYJWOJWYKqHkRBC2CRbceu7eAYg+BGWSm
         mRI4Pn6rfIbtOjL+6Dg9UmiSkiY+E7AwkAiVmkEJodzJne5yYKUTEl1wJL6XkpOQDkjr
         g7m80XbCia4mW8/vbZmnu1cN48znyWSo/ao/pcYNER7nPFO0zrIYr5Wh4LxYCuhJwtIb
         BYpA==
X-Forwarded-Encrypted: i=1; AHgh+RrxueOR0K4zZoYVAUqplSYcg9i9K/GOGtgWaJOw7DFfxWZLoRLIEZGTc7Q2LM6L9z+BxArRO+N2Uvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOTztb7HyhGgdQpvYgS+2dJrsfa7XLKf/WGDV3fojAKhmEGG8j
	WVvb0m0GHfMYeRw+VEMZuev6e9qMFpwCMbInl4l8rAot7NSkp+D0AogK
X-Gm-Gg: AR+sD11TBHvhKy1lS3KoSmx1rYtZ3wgDsbjwfsFOsEkYK3nugODfk7W5/H1pPKsdkwr
	iwAJnatpRWgeK9b5A8pSXx/JXhF2cP/eGJ2VhLHT25jzpVOvFzkylF9epoIAEpyjqeqkvhzmPwS
	+MEadRa8sBn7Oh7loXT6m9ai85JdyqjE7wyzKm6G6SsbLX19D97P8DUQ2Nv9gVtPBPBopHcJi1q
	rtp/xxkdNSbjMJ0mYAolmSn1xYJXJEXdYQ76FbdIH7B5b2yOUzA86DS8OiZPfZRpB7DkdBIFzDW
	mfQT4KEV/C//B1CzmejQ9TzNkaNa9EZvmoE2cp6h/mxsZllSrGerZ0jBN7Y3olbYE49rg9duYtj
	IvGHUoDkzBgeulNHueX5UmVZNmPD3pHBZ+8yW1GGLnyOTaCPpp85t7HnaOMSFhKQugJeGuY0w0v
	nK2FXcSd/8wrxI1FP4653ydXFiRwcG3VezGc7pt3Likga4x7COpQ==
X-Received: by 2002:a05:690e:4297:10b0:667:bae0:e55e with SMTP id 956f58d0204a3-6694efca4acmr5838023d50.4.1785629316217;
        Sat, 01 Aug 2026 17:08:36 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948fc7ef2sm3148816d50.13.2026.08.01.17.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 17:08:35 -0700 (PDT)
Date: Sat, 1 Aug 2026 19:08:33 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: the Linux man-pages as an educational tool (was: [PATCH v2]
 man/man3/mem*(): SYNOPSIS: Document non-standard mem*() functions as
 provided by <memory.h>)
Message-ID: <20260802000833.zpu27l7ibvrbouna@illithid>
References: <cover.1785532392.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="artnbi2l5okyk4e2"
Content-Disposition: inline
In-Reply-To: <am6CnOddgaM10pry@devuan>


--artnbi2l5okyk4e2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: the Linux man-pages as an educational tool (was: [PATCH v2]
 man/man3/mem*(): SYNOPSIS: Document non-standard mem*() functions as
 provided by <memory.h>)
MIME-Version: 1.0

At 2026-08-02T01:36:28+0200, Alejandro Colomar wrote:
> > Date: 2026-08-01 18:29:13-0500
> > From: Paul Eggert <eggert@cs.ucla.edu>
> >
> > On 8/1/26 17:10, Alejandro Colomar wrote:
> > > #include's aren't that important.
> >=20
> > But this whole thread is about #includes, no?
> >=20
> > I would focus energy on areas of the manual where effort provides
> > the most bang for the buck. As your remark suggests, this particular
> > area is low priority.
>=20
> I wouldn't call it low priority or low bang for the buck.  What I mean
> is that it's not a breaking change.
>=20
> I believe education is important, and provides bang for the buck.
> It's not all about features.  The features are already there, but
> misused.

I'd like to underscore this point.  As I noted in my response to Doug,
the flagship book on C, as we all know, is stuck in 1988.  The throne is
vacant, with many pretenders, some with excellent cases for service as
regent.

But no head wears the crown.

And at the same time many C programmers are shy of consulting the formal
standard.  We can lament their lack of wisdom in doing so and in failing
to spin themselves up in standardese sufficiently to grapple with it.

But we can also throw 'em a bone.  To where shall they turn?

Sure, if they're in Emacs, they might go to glibc's Info manual.

But some people dislike Info, and some people use a different libc.

So what remains for the motley crew left behind?

The man pages.

I think people come to the Linux man-pages in part to learn C.  When I
was starting out, long ago, I wondered why there wasn't a man page for
the language itself.  Years later, I learned that there once sort of had
been, in the 1970s.  It was Ritchie's "C Reference Manual".[1]

But it wasn't on any Unix machine I had access to.

Why not?

Because Prentice-Hall didn't want it there.  And still don't, I guess.

https://www.tuhs.org/cgi-bin/utree.pl?file=3DV7/usr/doc/cman

Maybe education is not a job the Linux man-pages project _should_ have,
but it is one that has been thrust upon it.

Regards,
Branden

[1] Not a man page, but you could render it intelligibly with nroff.

--artnbi2l5okyk4e2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpuingACgkQ0Z6cfXEm
bc4bvA//UN/Q7IOrELNLkkh2Y7TbAH2qD0WE2RwI1grVxo+4kQ7HV93xBzG92wAP
RT6gIOkKJy1pQCWOE5d60+PoAECRuXQKB9dKmD0mIBwdTxepoOxLVKytKORn8Zh4
JtzsjHHPatFVueT1j+0K675sMkEA3vR6CfC9DxBcJBTGvjZdYsP74C0k2k+/K+pc
aWYJFwg5CurQ4+m0w2weyMOlsej/Uej9hZeAzBgu9je1Q+nrL2tkXzr4Z1wVa3sH
/M7LZarXmDQ18rma2slVHPTIeBodn8MNWWQoUYpW7+HHZRMdlVamVn9UnRh8U4dY
2WlIdvNdMnuXWavXQYB7Z545PvrshTd/7CMdlR8sWeWXAriJsutW7fgEihrswgmk
9fDHfyQb5g++SmxjPXrcG530AwT6bXXJzTGTUQAeUwfk5ybcdH7RhcYmyiuuQiF7
+cVxuNlB4mmLdxC8EYBIBCQ0jtQcPwoj5hH/gSy7ezY8oqqdQ2LmOyoDizN/LWWr
WwhQhwiFAaKDbVt6gaA6ziaLNUe2pSQFlIPftxKh+py2+4JBtYIYPTDEGg3iZW02
ivzQbal1ZbrMH11ctHnNvRuE4bLuFEirbdjBpiUkFOvu2Kn9oAUoPOkdi9w/7tw+
flp4DkvL88ZnvvAErzXVJsq03VZtFYPamPPe4Vo3X7YGxyl1Yjo=
=HWul
-----END PGP SIGNATURE-----

--artnbi2l5okyk4e2--
