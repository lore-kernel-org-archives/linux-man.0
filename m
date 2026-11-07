Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794054618;
	b=ko7wyIixsEAFUf+Jye+dhW2WgiT97GNw5/CwOAAmjkmj45Bv2wJSXSr9V9wXTxD+J/Vv
	 r1EiSSADxktHTBc/Iyk3fXJl1F+mRmAOJ3G3L5+rLbPvDVL+iXqdQAF/C7DxLrxBfX3QE
	 +8NEzLLgnf+IS5vOb7EoVFC6V6SHtnZYGjE+OB9rUXxZwND554bXmUmbbpmeOEG8kYpjV
	 Y+4SjtDBUPPa8/n8sYWCo7XA4xZ5eWHTKnBPSBnJoBgyouWqRjE9gHkNJYgmi0wi6leuY
	 qKiWzrkaYPCm9NVefa6nUgxcm1Q8KvJyFCL4WcRT3/OktFyX035VSX9IssZErCyBugQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794054618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KLHc+glsikIBqqEZcpjoAlxXZU22l7NToVG7wCkXV1s=;
	b=rhfP6ZcGGkdxGRQZTQHj05TWCN0lJYTPKoobHvA04fJ/CZJl3smFUUqihk8/zCd3Biul
	 I9jP6yHyN/zS1RYE9xXnS95MqHXbYD3vqGm+hKfEmzxDDOdpEkDFgTHeeGe/JFZaQL9uu
	 9sIPLC2At5a2uZPbY3ZzMV+MsUVp0T7OFsXF0o5geeBFlt4SvfSyU9mi1Aoh+EWq+8act
	 +H98QzgfMWKSDxdQMQLHWw2mmYUYD7JERpSXcKmu7QQhtAKQ3oQ9nYzCtyWIyU7Ng8xE6
	 soExWXD7TTNVWxZDfd8UogcZ2biaIVo/7zX7xer7FAyofF/hpvfa4gFG8RCMqaJBrxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G9q+hLFK;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F90C606A32C
	for <linux-man@vger.kernel.org>; Sat,  7 Nov 2026 12:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F90C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G9q+hLFK
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67be6030c9fso1099417d50.3
        for <linux-man@vger.kernel.org>; Sat, 07 Nov 2026 04:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794054617; x=1794659417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KLHc+glsikIBqqEZcpjoAlxXZU22l7NToVG7wCkXV1s=;
        b=G9q+hLFKDDvWDZvtswXfdpYQRMFVFX6jHWxrhA65IXIIJWTtxN5WKt9Aqr551RgAJm
         UWODOTenN9Khyw5WeGCwqKtQjK3cLPd2fqjEWgVWL0wwv4EYSwXZeKdWLWeovENLc5C4
         6J8Hwk5DNeLjI3Q57GHH898Wq0XjAjrrIQbI7xIAyU0vaK1gc4vM6TNUGefY46ztF04d
         fRh2P9CLa4It9k9EbJ/uu9X2bwyVeLYXjczdE25JSNnurd0aHr/yFExp9pmOck1hqILp
         cH2mhLHoeLHcfXtVSJlZN2jcxdtc1FJy898i70RgPtc4wkG87FEncGRewQRiaC1kACml
         NEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794054617; x=1794659417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLHc+glsikIBqqEZcpjoAlxXZU22l7NToVG7wCkXV1s=;
        b=jNstkj1OxtdFsmhDD69cpOE0awK04yh7VTI9QFoTydU7f8sX/ns2EJbw0DIdHsZugW
         Xe4T1DncyyFJ20srbsUdVs5B90arjaLnVugTMy0ui1EXzlop6CIG8qVcmk7qezDwgJxS
         srxXhwBFr1s3+1DdAJEWXkkHEoiJwFUCd/R1Wf9n/9xMhj6daeoH6bo33cnpsijm91sa
         3iN5lO0q5i67rNsJgDvD0n5irUql1vN8HcvIFsQwQ2g9hFpo26hlZckpJ88HjPDDQahQ
         eky4UWOYaFK7fbAhxvjvLoMb4KBU0TTBcfHKuOhKx9UHGWd+fFjmsgDv9ajxXCXSWzPi
         nqtQ==
X-Forwarded-Encrypted: i=1; AL+hErHsCFmQ2TPWkzRiSwBaLJURnokpp8r85uA7sjAL3OWgTDD0qgV/67l6Z0IZsuV6MSNCT8JkGgVMsLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e7oFILE8hJDB4Oy1RRmNrvxU8LF4+jdP35beNgWFHv7BHkd38
	U/LxvE+A+j3NyxVUWaXWQf7udZ4lEZmX+VOGYECxIg1C5vgnckSjOk3UA/R05g==
X-Gm-Gg: AYBFou3BvrXu4/a5/KC8aqusYRcHeBcVOwzx3NeKKMT2HlLRfDKF1sXAa8sW6b6pa2q
	/p8uhXlc63ZZPvAqy1DVM9lroMm2tN6yx3a8L/8UlYDxIqX7FH9c5woNMu6+PWAQe0+GEUslC93
	MaASBM+0BDh5PqU0w17P9d5yjnvxWXI1+8s58PahBmibYqpjizFuiK/nhGmjR4DIhGXlwh2EMuO
	jBj7pVKMBxdb75cWnXtctYrrBfIOgFYw2xjdgr4CjukVevfRnNVwrJ3/2TKXtu5OP1E7GdMSEoK
	0E2lNpA9FosFXRFeMHW/C2WyjVH35mm8LmdH8aHpvNFHBK+WzfuYBX3orX5q4/YdP4CYy87LL8x
	d8sm1WZAc8jQEGCmtLXCsk11gwX7QXg2de/gh9eowNDfuP2Xy6dhfQORVni3sOJLHmELR7I9KYa
	P5fATc6MybY3TIJ5creAw+Nui1pb2poJ7PkvGEFSVEcu/HIVomzdQ6B63DuQEGTpro2bIIdFn3H
	Bj7ExbusdQuJnWurTW/n4QvPHNuOR0xDwuKUtx4IdXi5OapaEJQiFI6RbkXXQBaXviUfDmexz7D
	o0RS5pnWs47IYoWO
X-Received: by 2002:a53:e00a:0:b0:67c:1f7:ac6a with SMTP id 956f58d0204a3-67c1468eebemr2282106d50.103.1794054617379;
        Sat, 07 Nov 2026 04:30:17 -0800 (PST)
Received: from illithid ([2600:1702:7cd0:e980::48])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c135e8d5esm3880735d50.19.2026.11.07.04.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:30:15 -0800 (PST)
Date: Sat, 7 Nov 2026 06:30:12 -0600
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: =?utf-8?B?Tmd1eeG7hW4=?= Gia Phong <cnx@loang.net>
Cc: platform-testers@gnu.org, groff@gnu.org, linux-man@vger.kernel.org
Subject: Re: groff 1.25.0.rc4 available for evaluation
Message-ID: <20261107123012.nz3taywmsxbfwhop@illithid>
References: <20261029232813.aqji7n3bznufkpua@illithid>
 <DMNRZBG2DIZW.3EFUTZS9WX48K@loang.net>
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
	protocol="application/pgp-signature"; boundary="ghorv2rzq5n4mquw"
Content-Disposition: inline
In-Reply-To: <DMNRZBG2DIZW.3EFUTZS9WX48K@loang.net>


--ghorv2rzq5n4mquw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: groff 1.25.0.rc4 available for evaluation
MIME-Version: 1.0

Hi Phong,

At 2026-11-06T11:34:12+0900, Nguy=E1=BB=85n Gia Phong wrote:
> On 2026-10-29 at 18:28-05:00, G. Branden Robinson wrote:
> > groff 1.25.0 release candidate 4, 1.25.0.rc4, is now available from
> > GNU's alpha site.  You may download the distribution archive from
> > there.
>=20
> Hi, there's a typo in src/roff/groff/tests/soquiet-request-works.sh
> that caused the test to fail since its refactoring in 111c42a69abc;
> s/doc/input/ should fix it.

Thanks for the report.  I agree.  The test is pretty thin stuff.  I
think I originally wrote it (back in 2021) only to make sure I didn't
corrupt the state of the interpreter.  Nowadays I understand the
formatter's internals a bit better, but I also hope to turn `soquiet`
into a macro, so I didn't expend any effort making the test more
sensitive.

On the same today I introduced the error you found, I added a new test
script that _is_ more sensitive, so improving the one above would be
redundant.

commit 2eb2d11cedc3edcb755c7a00273e9533e9f8957d
Author: G. Branden Robinson <g.branden.robinson@gmail.com>
Date:   Fri Oct 16 16:44:34 2026 -0500

    [groff]: Unit-test `so` request.

    * src/roff/groff/tests/so-request-works.sh: Do it.

    * src/roff/groff/tests/artifacts/sourced-file: New file.

    * src/roff/groff/groff.am: Update `groff_TESTS` to run test.  Update
      `EXTRA_DIST` to ship new artifact file.

> Otherwise, I'm happy to report that this RC builds fine on Guix.

Excellent news!  Thanks!

Regards,
Branden

--ghorv2rzq5n4mquw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmrvGb0ACgkQ0Z6cfXEm
bc6BrA//eXe6qz2c/QJNkwTLH339+kSBaSlWoF8EW706Utl9cAlFzzlitffuNtSB
6pyxdA4Aq2eaq9H6j4B5QmRoquCvuifBpKwIRidTghIiKywksuoxGBKoMF0WkQrV
Qf7AjIKXY1E/Qr+3nz1TvYRWfK23LF/c1oopsWGK2J9gtfQftjmJMbTk5jQ58oI1
Q/i4ZlqYufVztRqroLwm9YoxHwhq4iZNdlSpFZCSy6tVHO0kRhMCIBBU5ItFMuXZ
O8See5673Wm5NYfUbYMvfzM0uxhhKadqXLa69AGrNdVTfhLt79S52RjdKQ2f7Rlx
AhXtQii3v8doeO/JLyFaS88tlAtYrKGIHzS93wOMSWyMwlLszEAMScgAj5YCKOtt
qi7ctYB9CnLmpvpOUuQcmmotKamfNJdpl7XVZvOCJWMXDO8S7pULM+rn4W7XoU5C
7sbfQPPm8EfPpIJxNfzvvQsyYe5Kzc2KwLQxPDq84Cv2XxupiiosWbSJz5z6GW5X
pI5Y96NXfLcw4jr/ZVC0ECcictgyYSwyOgpDyJ3428sqU2ip5XYIf+1ORnQwpdiJ
Kj4WYVJKthGSYWg1JSvcxgfAYslCzRA6USGVQOdmHHSFp2RDwNSen3aY9UO+PX/4
bRIV88TO5GTxDYwt05VYU2DQ5OIlhhConXKatme5b+inRg6TMDY=
=bkjZ
-----END PGP SIGNATURE-----

--ghorv2rzq5n4mquw--
