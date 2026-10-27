Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793137927;
	b=C/x+iwUqujQcjJcKPjTlyFnSujK33JWgUEbsXgFVcrWu0wUZG+JI5ffiZlNPiOdKxtkj
	 TxcqXHU2Gc9+30peksOxtLBqbxgdQxbwReQglbi/vo68FOmQcDVVfGlOz6JR8Eg9Pj4cF
	 4/PbNx8pR1tlR8xVWV1WBMovdyUyJ3luqrOktBPF/3WpNnTs3cBnPEfzBn4djpF9wqyKi
	 Or/AU6iBydtX/fcHL3z3mP3vkP90FADYgdVKvAjoAO0FPJapYPYJ4Pw+FpXRvNO3rMie2
	 7jsa74pkoKRNJ2Q993Uv75Mo0Jc1om8QnZ7K38xU7zVszbun6G02VE+iyiGLEyUMJlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137927;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uh5N6NhlC06sDEEfcICYo7wCkcvSoKZkDLgIku6jKYA=;
	b=r/TS++szlhhMMfTp/gV2jKOsmzoUPH6HFXbZWz8bZozRJZI76+ikb5ci6fnuadojhgus
	 YtYD4VRufJfYbUAb4h7QiXdEZKtsybs6wljKKPzBRInAtH1/FKYzaZp6utYeGhcIdMA51
	 1hId7wKuiJ/E+Yfk8Rm7IQiUT6xK1DfOYCGs78moBl78PlArPsLnVw7PYzKHEuMn69hkV
	 sdrLCFYPwhMvFMOEdrVaQJhsv5uOPGdVjAA7/JA9OmwxMoi+uIqc9wn0lLslepqCep0xT
	 r2xqN08UJWoo/HIFwlEUNtyqp9q6rm1Y8ihfAeL31h6Emv/1tfJCaLPzGFHK5WrWQAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCkLrngG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70C606A31A
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 21:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCkLrngG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1AC1F01825;
	Tue, 27 Oct 2026 21:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793137926;
	bh=uh5N6NhlC06sDEEfcICYo7wCkcvSoKZkDLgIku6jKYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kCkLrngGkSRB/Fs/39wJMHBS2NfKi3KZaUSD95SWVcfahxkCOPVeY/gVJvcBD0OPz
	 I2So6B/FLZAjG5pn0cCDXWwhr0WnqZtXvUCpsPl83mCDNu4YeWZxQRxqPimCy3M1sz
	 5lDHnNbesXo8Mmht5KnmlB2s9OzkPcEcXmkTpRGmp5AF/anZCfzIip5ormkfMRdAh4
	 JSvI6TOObaOIoYBgBSnRww0Z9T1PeboR5IpFFAvwHsKuLXTz/h0xORk10Gyh90q5Fj
	 HgkipGRxUIiQWMC0jypHeP1iA7uXtXT1UWWWyKjg9A7ItfzCN5+bwBquqQ9Uf0hKa2
	 e/0Z46i1b25Cw==
Date: Tue, 27 Oct 2026 22:52:02 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <auEbrKeOiWeAS7D9@devuan>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
 <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
 <1bd4e8f9-28c5-4db8-bec6-35cd62643fda@schaufler-ca.com>
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
	protocol="application/pgp-signature"; boundary="lyjb7tikuptvubsc"
Content-Disposition: inline
In-Reply-To: <1bd4e8f9-28c5-4db8-bec6-35cd62643fda@schaufler-ca.com>


--lyjb7tikuptvubsc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <auEbrKeOiWeAS7D9@devuan>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
 <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
 <1bd4e8f9-28c5-4db8-bec6-35cd62643fda@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <1bd4e8f9-28c5-4db8-bec6-35cd62643fda@schaufler-ca.com>


Hi Casey,

> Date: 2026-10-27 09:32:57-0700
> From: Casey Schaufler <casey@schaufler-ca.com>
>
[...]
> >>>> This text, however, is saying that in some cases there might not be
> >>>> a '\0' at all.
> >>> The TL;DR is that the byte after the returned buffer's declared length
> >>> can't be trusted to be 0 - it is undefined and can be clobbered.
> >> Huh!  This is to me a bug.  Would you mind reporting them this as a bug
> >> and CCing me?  I'd rather get this fixed in the kernel than documented
> >> as broken.
> >>
> >> Especially, if they use strlen(3) internally, this sounds very much li=
ke
> >> a kernel bug, but even if not, it is clearly a kernel bug.
> >>
> >> In any case, if we were to document this bug, we should not use the te=
rm
> >> string, because anything not containing a '\0' is not a string, by
> >> definition.
> > Casey, would you be able to confirm whether this constitutes a Smack
> > bug or is intentional?
>=20
> Inclusion of a null byte for C string interfaces has been a topic of
> debate since about 1980. At the time this code was written my understandi=
ng
> was that the data SCM_SECURITY returned could not be assumed to be a
> C string. Hence, the size of the data, not the size of a string. The
> null byte isn't considered a part of the string, as reported by strlen().
>=20
> So, the existing behavior is intentional, but I'm willing to have it
> considered a bug if (as of today) everyone thinks the data should include
> a null byte.

Yup, I think the issue of strings has more or less settled towards using
C strings everywhere, with other formats --such as fixed-width buffers
=66rom utmp(5)-- being phased out.  Most of libc takes C strings, and so
using C strings everywhere is safer, as it avoids having to manually
handle the bytes.

> > The TL;DR is that we came across the function smack_to_secctx() in
> > smack_lsm.c, which passes a Smack label string in a buffer without a
> > terminating null byte.  This is inconsistent with what SELinux and
> > AppArmor do.
> >
> > Before we start explaining so many corner cases in the man pages, I
> > wanted to check -- is this something that Smack should fix, by
> > including the zero byte?
> >
> > I tried to double check the Smack userspace utilities but couldn't
> > find any use of SCM_SECURITY there.  (Is the feature unused?)
>=20
> The Smack userspace utilities (github.com://smackteam/smack.git)
> represent a limited Smack system implementation. SCM_SECURITY is
> used in at least a couple of important embedded and enterprise
> implementations.
>=20
> >>> I have not read the full kernel implementation now, but it can already
> >>> be seen in userspace that that adjacent byte can belong to a different
> >>> data structue:
> >>>
> >>>
> >>> ## How control messages are represented
> >>>
> >>> The security context is returned to user space as a cmsghdr structure,
> >>> as described in cmsg(3), where it is returned as a buffer of length
> >>> cmsg_len:
> >>>
> >>> struct cmsghdr {
> >>> 	size_t cmsg_len;  /* data byte count including header */
> >>>         /* some other fields */
> >>>
> >>> 	/* followed by
> >>>            unsigned char cmsg_data[]; */
> >>> };
> >>>
> >>> Reading beyond the declared cmsg_len is undefined, and callers don't
> >>> get any guarantees about the byte following the csmg_data[] buffer.
> >>>
> >>>
> >>> ## Iterating from userspace through multiple control messages
> >>>
> >>> Iterating through the cmsgs is done with the API described in cmsg(3),
> >>> CMSG_NXTHDR().  This is implemented as an inlined function in
> >>> /usr/include/bits/socket.h.  The function does a bunch of validation
> >>> logic and then ends in this rather simple advancement logic:
> >>>
> >>>   __cmsg =3D (struct cmsghdr *) ((unsigned char *) __cmsg
> >>>                                + CMSG_ALIGN (__cmsg->cmsg_len));
> >>>   return __cmsg;
> >>>
> >>> So, the cmsgs with their cmsg_data[] buffers are next to each other in
> >>> memory.  They are aligned, but that still means that the byte after
> >>> cmsg_data[] might be part of the next cmsg header or beyond the list
> >>> of control messages.
> >>>
> >>> ---
> >>>
> >>>
> >>> The more I think about this, the more unsure I am that this is even
> >>> worth documenting.  In the end, anyone reading and interpreting this
> >>> data probably needs to read the corresponding LSM anyway, and trailing
> >>> null bytes are probably the least of their worries...?
> >> Not only that it's worth documenting, but this might be a vulnerabilit=
y.
> >>> Maybe it would be better to just say something like "The format of the
> >>> security context is determined by the LSM responsible for it".  WDYT?
> >> I'm unwilling to accept a nonstring as a valid format, unless very good
> >> reasons are stated.  And if those reasons are stated as "that ship
> >> sailed long ago", the way to document this might very well be BUGS.
> > Point taken and agreed that it would be better to call it a "buffer"
> > rather than a "string" when it does not have the null terminator.
> >
> > It does seem that this is used also outside of UNIX Domain Sockets:
> > IP_PASSSEC(2const) says:
> >
> >   The security context returned in the SCM_SECURITY ancillary message
> >   is of the same format as the one described in SO_PEERSEC(2const).
> >
> > And looking this format up in SO_PEERSEC(2const), we find:
> >
> >   The security context string may include a terminating null character
> >   in the returned length, but is not guaranteed to do so: a security
> >   context "foo" might be represented as either {'f','o','o'} of length
> >   3 or {'f','o','o','\0'} of length 4, which are considered to be
> >   interchangeable.  The string is printable, does not contain non-
> >   terminating null characters, and is in an unspecified encoding (in
> >   particular, it is not guaranteed to be ASCII or UTF-8).
> >
> > So it seems that these "buffer" (not "string") semantics exist there
> > as well.  Maybe it is intentional then that it is treated as a buffer
> > rather than a string?
>=20
> I'm easy. If there is a strong desire to make SCM_SECURITY a string
> Smack can be changed easily enough.=20

Yup.  I think it'd be good to have guarantees that the label can be
passed to strlen(3).  Whether the reported size includes the '\0' or
not, that's less important, but being able to pass the buffer to
strlen(3) and any other string functions is essential for safety, IMO.

Thank you very much!


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--lyjb7tikuptvubsc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrhHQIACgkQ64mZXMKQ
wqlhww//cVY33nSSHDXmyW6w3uX25cCSSBtCZURFz+NcqPw2CbS9ZP7TZtVsECUD
3PStUOC/To39b8pliokJ492vjiP59pwXc3OvdYm/40iobLmHkI8CinOpgH/iIcRW
QsZ8MfxB0k/kfg4Laf7CrJjKIU6JSIxQPilI5HCx1EtCf9dAskSPyJC3wT2sOWQ5
9HLpzIRYs4bYdkfo90qH8Rk/cUe89emhlgpo6/lr8oJacTrDYlssqjLWB0XWC3P4
pGEnQxGj39/JBw8Hc+yia0AsI3rV3xdfqIpzoZMZsYg9b6M4H+gX6pR7jIePlCPN
4vKrWFHdg2zK3Ow40k+3ZFWruZSea7P1/Rz2iCzJrOqxHEx+LzsE2yyEvLyAviLP
8JeRPcO7uj0pe4FFmaunmQd1MTFWubOkh2PVimG1szJ0zUiy2ISd9kR5E82B+LV0
jMJ8M3BN0WyvReyC9csGr5gzsJ+fZFywpBsvSXqES5w5X91BTa49q1YAtS+e4K6I
7gFyG7NHKLVgLAEHj+9tAFJaKfXxaXIP8l55AXLVM3WqwbwNPxcjfAorJXmTzGt1
A0tsIlaTODeCuKwRsZxkjiNf9l7VWLU1op4Z3E66RvQCXYuy90av+q5lEp82TJh+
T6p1YYCnjErNmo681SHblHLcc8KlZTrE9vcL3xRtKkxYc4lZH0I=
=BPqv
-----END PGP SIGNATURE-----

--lyjb7tikuptvubsc--
