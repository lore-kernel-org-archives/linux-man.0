Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748631;
	b=MeIUYG3Rg9C8SgFBh3VS2IMTM+wJABTJK1oq4GeBxRUUsXHLQSv3MajQDw/nNTX0G8Sq
	 v7xmX73/vC1MqLsCb/IeE6JWjlJnBI/quqkXPryDBDTSEp9nKPw0PcSJ/zi7q+dhaHhf+
	 txwbkL1L62z5RWXP78Rwi3Vuk1AwynzME9cfQ8lxadv1m0tK7XzvguR3ozvyF9yURDAYj
	 ut1MHNOXXGZYDJ0lvnXT25XH0YB6EJmhFElzqfx6is7V0qEuaXiaZZaQ2cxthQSeX/yRF
	 2607ipp0p8gWMD3W6ZrCONHBU1ByZkB/m9gPT2DoHQyju056yo/UHljCXEqknZxEt2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748631;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XCpvne01H1rRHl9zSrcivMxDqMLbo/nXUqgaUuhxzTw=;
	b=eelHBdJznhnFBFAlj9NcAI7vS+4oGugKcISWCkVRap+ofWkolfKpI7scWq9idzTwGcE2
	 fWpEIdCC0LJqK/3SydlMvm5ENqxDvHPj42403YJ7AIy5k6+ht9uh2j/k66J+j47GwHI1o
	 jfQLilkiaWxnAbVPU/pKAolrX8PnzrlB0HqhFiMYAyex/1WL//eH4nlSaHzJysMEewiNJ
	 cI29WXnB/VrPQMa7wjnzBqICdblatsBYA23lG2Rh6XkPR2RY//CJtkQpyLPRp8FImELas
	 XpnLxQAM/EWxjAPOdDN0Qmc4x6cU64iIXYIQUxOtpltgASCjnabGMvZ+/EiQXUBTRPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oEyqZa/j";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF8F606A31A
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oEyqZa/j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3906B1F01825;
	Fri, 23 Oct 2026 09:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792748631;
	bh=XCpvne01H1rRHl9zSrcivMxDqMLbo/nXUqgaUuhxzTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oEyqZa/jR3Jj18KMjSDYw23kTnNn7C8AxthxzbEShUQVR82OwU2DBjO6uoAzsDHbY
	 g0ftP+omOLCvOaPTIN2CEshaD7J+o9tKKsS6ScFIaiHD8tDHpQfSwkEVdmEfxayCSB
	 tGzvQ8CqFY4G+7hy+MzPbIal+6rS/K82p2BYzWm7wopijX+IzFdFUMOdxyBWfbDgCc
	 BR/XwOjkBxRYCmMCYzmpMGCAsPO7WN9qxa4+e4w0y/sbRbTmmYaoxsmM1wrdTtebls
	 BOlkggdJSS5rfbZLDMHW14myJmMkMSgMopAsq2PwuQZWqASCfpOfByVp/WYXmxng6O
	 Fq5Pcc/tR4yWQ==
Date: Fri, 23 Oct 2026 11:43:42 +0200
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atsrNyzuYebABZjH@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAMdZqKEWzg6Z5oYp8N+S4rkOjUU7WT6jwbVDCAk3YN3ZdP7u+Q@mail.gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l6w4sfdxwgkq7jeh"
Content-Disposition: inline
In-Reply-To: <CAMdZqKEWzg6Z5oYp8N+S4rkOjUU7WT6jwbVDCAk3YN3ZdP7u+Q@mail.gmail.com>


--l6w4sfdxwgkq7jeh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atsrNyzuYebABZjH@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAMdZqKEWzg6Z5oYp8N+S4rkOjUU7WT6jwbVDCAk3YN3ZdP7u+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMdZqKEWzg6Z5oYp8N+S4rkOjUU7WT6jwbVDCAk3YN3ZdP7u+Q@mail.gmail.com>

Hi Mark,

> Date: 2026-10-22 15:03:37-0700
> From: Mark Harris <mark.hsj@gmail.com>
>
[...]
>=20
> The man pages are frequently used when seeing a call to an unfamiliar
> function, to understand what the function expects and what it is doing
> with those arguments.  The arguments in the call are matched to the
> synopsis by order, not by name, so for example a person questioning
> the first argument would naturally be looking at the first thing after
> the "(" to find out what is expected there.
>
> A person that is reading the description, where it refers to the
> arguments by name, needs to convert that name to the argument number
> in order to match it to the arguments in the actual call.  The natural
> way to do that is to count the argument names in the synopsis (at
> least those not preceded by an unterminated bracket or comment) and
> stop when that name is found.  For example if that is the first
> argument name after the "(" in the synopsis then it would be natural
> to conclude that it matches the first argument to the call, and not
> continue scanning to see if there is another occurrence of the same
> argument name.

That's a valid concern, but most often the first argument will be of
a different and incompatible type (they tend to be pointers, which is
the reason we need the forward declaration in the first place), and thus
such a mistake in the understanding of the order of arguments will
result in a compiler error, which is a relatively mild problem.

You didn't take into account my other concerns, though.  I'd like to
hear your opinion about the concerns that letting users think that is
valid C might lead to them writing code that has UB (or logic errors).

> So I agree with Michael that this change is a good one to make the man
> pages less confusing.  Thanks for creating the change.

Thanks for your feedback!

>=20
>  - Mark


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--l6w4sfdxwgkq7jeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrbLE0ACgkQ64mZXMKQ
wqnWpw//WUKQ6thUcNGz4hQFhcSvLxIXsiMauL0XiHKV+F2sMCJyqqVum2akP4KK
M/qmaLRN79VRzuMlrI1RzFIoxKmGPaX+Ievi30yA3zTCie6NRezOkAET19r1vEbZ
WSFiCHhEtQJOWvslnZDyvMkRMbgSmyYZTUDjdA8q6E9CmYp6RQt7n993XPjoQ4+Y
0F2mtv9x37nT1sarRTivlCKK5kdK7ME8+pJRgHHGq8NrfvwoobIFOxqWKtKjAiEl
sbiFWsyuoAlYgaTHaVmZgidQw+9+ktQ3IjkofZ+vHmX/tkgcNDn2lKr+jPAlmIza
JOg0H0XYIMJIiRhxiyuHfoATuYi6Je6Cw5DxE21laaJNSppA3w1vWvQI4FzcKwT2
1GTKmL5I2a4sxuf4v4cwNJl5NcFy2XzrPmajsu7RMW8OvUJAcscuuv+5JwsJM5rl
jwttsgknAI9jhUi31Yk0SPbNo+8JGFqslydIdQSk7h1T3fnSbOqWwg5W+jN8F8+/
A5WsmsBzW+If9KB3pPugFcIq9Zi2syxOI+vieZ2xVzVuBXxB2vfZSArgh/SSWRa0
s9kcOSm+rk//dmLQACpOU+mYVJiBK5Ms1uuMvDm7yQUlq5/PEl1qGBjUsQ1i+xMR
hbpe1ip9qOk74ZwjVL5hxlyzc4yrqBwfxK1IdM1Wcjba2l5nCbQ=
=qWFo
-----END PGP SIGNATURE-----

--l6w4sfdxwgkq7jeh--
