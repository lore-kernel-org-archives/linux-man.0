Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963600;
	b=vHV9f8Emp0D95p9caCrMKkqZ+JwTXz5x9a1izw4sY9Xtic7UjgZITUR7pefPXgCpVQFt
	 wcMtRUws7A+vlJPTZHJP2BugwjP3DFBmrF83CFdJOzW4Yu22LO9mMzygTcjkjR4HFAuIu
	 Ok1bSHu/YH/kiphtkPqSKMGlX4qwaTrrEKAv8rYJ0q/QlCc9aFm25LcbqxwqZNZF2rFxr
	 MGWPzNAA7ZBT/M2j2o8CFHBDBizfzAUOxqOfbvT/MaxwJPYeIEzoEtDxQM2QSIDZiGZUD
	 dVuVkX96w0zmvoneZGvn+heQQHlO3yEJiDGFa1YFeo+dEa2Vm9qyGABg0d/4moUlo4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963600;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BSQ6Br/O9kYjwM+EnT/AzR1q80SEHbqf5VR/WcPiMrg=;
	b=MLHKFSaY6hC+9l9GFn0nknqkty+ENhosVMXAmrOeWok7vsM5FE+YSnbUXZjh8XC3hsVb
	 il27qeoRXaZup/19SLoOVMUCWTsTSVYGShsrSEw1sMcJQH2zMjpMOZSBmC9W9Rho0S9EK
	 WAb6kOJPGSsQmoWCW9vms6DIX/lw0qHdYm5MQJqxYVi1AshX3CJlf/ueX3qYDf/18Jgbt
	 koOu/QNyZkrtFkVI2Vg/nBD1/zaIVXMVHdS8Y5vu8KPuqoNmfzlW7lleiANxvBGvxo5u1
	 fgLK8MdK7jtXvPs3GbggL5hq9bqFkjWA/5/oBOU4nRi5aj+6ZG2A/zftULvdsWJIWBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FtFidoSX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B97F606A31C
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 01:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FtFidoSX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D431F000C4;
	Wed, 18 Nov 2026 00:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794963599;
	bh=BSQ6Br/O9kYjwM+EnT/AzR1q80SEHbqf5VR/WcPiMrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FtFidoSXU9uPYx8wdzMdHbrx/3/j5gI+fnwO8utAVrglVL2bExPqt47sgu/coR4Rc
	 M0fW36Cdp4mK65yXLbFaxZzo5VBwljiR8k4f4rtTfzwywuQ3UF4LU6om83MggjAGX1
	 J6eNAcP5CSzRUauSuhOwieiAnOik2KFm2opw32zUi74lll9jB6kBA7jlKCKzoP23JK
	 NL22waxdzd7aV6Irldw+bM0ydenDIs3bNNn3D69DN0ib89X17rvDG/g6rCgD5z1pRo
	 83IABUQe0pY3MKN36J++Xjst2zl6xJWKYUCgwLCKTjWBKY6aXk+SWZXSTEppbBNXEQ
	 l5fK38/JYiUOA==
Date: Wed, 18 Nov 2026 01:59:56 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: [PATCH v2 2/8] man/man7/unix.7: Multiple same-typed SCM_*
 messages may be sent in one message
Message-ID: <avz4awkoCeYWYGeW@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-3-gnoack3000@gmail.com>
 <avpTxVySkPfwWolT@google.com>
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
	protocol="application/pgp-signature"; boundary="4xw4nt5yqsgu3tab"
Content-Disposition: inline
In-Reply-To: <avpTxVySkPfwWolT@google.com>


--4xw4nt5yqsgu3tab
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: [PATCH v2 2/8] man/man7/unix.7: Multiple same-typed SCM_*
 messages may be sent in one message
Message-ID: <avz4awkoCeYWYGeW@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-3-gnoack3000@gmail.com>
 <avpTxVySkPfwWolT@google.com>
MIME-Version: 1.0
In-Reply-To: <avpTxVySkPfwWolT@google.com>

Hi Kuniyuki, G=C3=BCnther!

> Date: 2026-11-16 00:52:32+0000
> From: Kuniyuki Iwashima <kuniyu@google.com>
>
> On Tue, 03 Nov 2026 21:22:04 +0100, G=C3=BCnther Noack wrote:
> > In the Linux kernel code, __scm_send() in linux.git net/core/scm.c
> > walks all control messages in a loop like this:
> >=20
> > 	for_each_cmsghdr(cmsg, msg) {
> > 		// ...
> > 		switch (cmsg->cmsg_type)
> > 		{
> > 		case SCM_RIGHTS:
> > 			... append(!) file descriptors
> > 			    up to the SCM_MAX_FD limit ...
> > 			break;
> > 		case SCM_CREDENTIALS:
> > 			... replace previously set credentials ...
> > 			break;
> > 		default:
> > 			goto error;
> > 		}
> > 	}
> >=20
> > So it is possible to pass multiple SCM_* messages -- they will compose
> > if possible and override the previous value if not.  Since their
> > contents are being conflated that way, they will appear as one message
> > again on the receiving side.
> >=20
> > Keep the recommendation as portability advice, and describe the Linux
> > behavior.
> >=20
> > Fixes: 5b5cb1958062 (2018-07-10; "unix.7: When sending ancillary data, =
only one item of each type may be sent")
> > Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Assisted-by: LLM
> > Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
>=20
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks!  I've applied the patch.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--4xw4nt5yqsgu3tab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr8+IwACgkQ64mZXMKQ
wqkv6hAAtvouRrd2i72KtuCsckcwOlN5boGjhhaywvYPci1X0yOqygO+vgyxBMQ1
S/oQx3VWYlGqFNWaFiG1uaJRsK5vBYn3PgR7U83iKbsc1BANfO+okNe1zupnDMiX
zEMYcPFl67PDG1ux6tLOQqDfX2iCV2wef8xhjw93+e0me8QxRv2uY9wRqfHfsJwy
1F3YZxfVrH8geljT69mtIyx6NYQ5YAGD5iOnl4wKupBgyhtiCVF/s+dkBBilBa1r
sPWjpk1Il4KHu1Y8qxfRV+Bn81cAA46DksLCfdnptIFWqPt5ysMSzRFnAfkeU0Zq
ODEHWXVjHXK+AXPEtK9eRCBlYqYIThUQC8aZzOdHsF7QFm48LB44CnGuzqzAndHS
MQkab8MGN3F43oP3xMgunhFeGMcnYyhcgclw4oi9/DacLG/plCa14IYYWGwU1UYz
yqh62ohqtiQg9jrvzafR9WhRjPx/SYmnpqPQOct9/mdYp+B7x+Uh+Yln3gwE5f/+
sdYnhmNmTpaWI0ZfK4p39Wrhfo8hfNl7E0gU/dEtF3YVM1nl25sV6fEZDYMu+EIY
bUQ4JGFEjOzGISB5QSbDj2gF+SjRGRv9cRdtKZXboVW5K5nDZUvbO9+DopgQp0J7
fJCjoBKAG2jDQMmG4HYSJ2CpZBgrOrBx+unC7qjJJ2OfPL1UGUc=
=9cO6
-----END PGP SIGNATURE-----

--4xw4nt5yqsgu3tab--
