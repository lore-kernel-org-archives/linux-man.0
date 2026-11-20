Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185755;
	b=OR81qa/VUI1OJ+rrzv3uPnaTq2cts+V8VrfcmxVUrPIJKFl6ZIK+czhjXccCPK3W5t9H
	 lAvfKNggL1mKXepHoIirP+1CKWb6kSgDtdcqXq+q+1Pv5z3VlvdEDaaygvptGVwXyWyTQ
	 IvFlvt9jdmK9zw9WK5lIrHNrdva4ElS24mLuR78pH1jpSZ5p4QQK9kak43gpg16MOj35a
	 yjgRVzihmoqTJ9NqWrU+mUIRoufB0l+Bhic+pLAgUfGN6eJA3CCGQ03vwo9Rtq8fw3kL5
	 DRIaAUt4X1u+WNxoWjVA5snLzsTeYYHWaywlm16oOMkUDAxsXQeIzYwpMYluj5YuYeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185755;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VI7mssE3j72oHSkn4+thl2yb7tgU3bhRzwVm7L1BBZY=;
	b=kX79Bu+x8frFqV2Nm9X18OfSMLoq4FAINAsSdNqKf3Ui2cUvhWwlyOFHi1++7mG0sRBD
	 2r2F46j/I75nY0L5gfd+SmdnbK/QMUP3YDnn2tWq/U+7MzU3n55UjGdICnyl6ks6dVqhI
	 7qzOAplX3n3vogpFpa5HarDgbIx4/jlmbCivP465Kmw9/va6IUAIY5OD1T2sCDKlYoT8Y
	 ustHs61Dgy3AwXaxdBUYgzqeNjfDR0TTZoyIZ6Emb1nlyqjlHiI67pTuOfavH8bEiiL9z
	 mXqFlFTXLidkCALBCY0IEwR8FEpqO47Tx65cn3vE8qYovBoIyb0XpR7AZd/62itEEgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HEydWSNJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A159A606A320
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HEydWSNJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B691F000D1;
	Fri, 20 Nov 2026 14:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185755;
	bh=VI7mssE3j72oHSkn4+thl2yb7tgU3bhRzwVm7L1BBZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HEydWSNJG47Q7H7Tydt89npBbYk9RmGIvMF0W1zxZKCHLqQlUbM7eC3ussf207ftu
	 no7FpNLjITxiIIf9s6lqCqRnqHeOGpgZ2Q8UhTD/jjOtfhkq6M/gkr9JVYYfczToYm
	 VGs+Jn2OCyxjuh7kpmnEkYv1XF42T1CfmQiMnNmfl2Zzd2IWyexYNVJ9uBhlTydByn
	 M3x8JVgPOCxI18/aYDVw3tNWXjPZ26eSBUmSb4SHT8JYyuciVxG9ZsFLspZ8oo67JD
	 C+NpY0z6IfyZvZsodKAegNxaMjJwAEZJzk+6tXCrE7fCcqaZJbzcWL6NSAbjbBUktd
	 QJjYimmzTInKg==
Date: Fri, 20 Nov 2026 15:42:31 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v2 4/8] man/man7/unix.7: SCM_SECURITY: Generalize to
 other LSMs, not just SELinux
Message-ID: <awBcLp1f5O660OTn@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-5-gnoack3000@gmail.com>
 <avz6f7OyIVCKusQ3@devuan>
 <20261120.790f70cab7b5@gnoack.org>
 <awBavx8g4q9pCZpZ@devuan>
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
	protocol="application/pgp-signature"; boundary="76lkj3zywylzt6vb"
Content-Disposition: inline
In-Reply-To: <awBavx8g4q9pCZpZ@devuan>


--76lkj3zywylzt6vb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v2 4/8] man/man7/unix.7: SCM_SECURITY: Generalize to
 other LSMs, not just SELinux
Message-ID: <awBcLp1f5O660OTn@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-5-gnoack3000@gmail.com>
 <avz6f7OyIVCKusQ3@devuan>
 <20261120.790f70cab7b5@gnoack.org>
 <awBavx8g4q9pCZpZ@devuan>
MIME-Version: 1.0
In-Reply-To: <awBavx8g4q9pCZpZ@devuan>

> Date: 2026-11-20 15:41:15+0100
> From: Alejandro Colomar <alx+linux-man@kernel.org>
>
> Hi G=C3=BCnther,
>=20
> > Date: 2026-11-20 15:17:46+0100
> > From: G=C3=BCnther Noack <gnoack3000@gmail.com>
> >
> > On Wed, Nov 18, 2026 at 02:13:40AM +0100, Alejandro Colomar wrote:
> > > Hi G=C3=BCnther,
> > >=20
> > > > Date: 2026-11-03 21:22:06+0100
> > > > From: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > > >
> > > > Reword the description of SCM_SECURITY to not be specific to SELinu=
x.
> > > >=20
> > > > The security context is populated in scm_passec() in linux.git
> > > > net/core/scm.c, through the security_secid_to_secctx() LSM hook, wh=
ich
> > > > is currently implemented by SELinux, Smack and AppArmor.
> > > >=20
> > > > As clarified in [1], the returned security context is in the general
> > > > case a byte buffer, not a null-terminated string.  The only LSM that
> > > > returns a buffer with trailing null byte is SELinux, but even that =
is
> > > > not guaranteed in case that the message is truncated.
> > > >=20
> > > > Link: [1] <https://lore.kernel.org/all/auZcwYWv0NeiIR8d@google.com/>
> > > > Fixes: ffad6a017f91 (2018-07-28; "unix.7: Document SCM_SECURITY anc=
illary data")
> > > > Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> > > > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > > > Cc: Eric Dumazet <edumazet@kernel.org>
> > > > Cc: Paolo Abeni <pabeni@redhat.com>
> > > > Cc: Willem de Bruijn <willemb@google.com>
> > > > Assisted-by: LLM
> > > > Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > > > ---
> > > >=20
> > > > Notes:
> > > >     This feature is also available in other LSMs.  Unfortunately, t=
hey
> > > >     implemented it inconsistently and that complicates the descript=
ion of
> > > >     how string boundaries are handled.  Linux does indeed neither
> > > >     guarantee that this terminates with a NUL byte, nor that NAME_M=
AX is
> > > >     large enough to hold it.
> > > >    =20
> > > >     After confirmation from Kuniyuki Iwashima, this documents it as
> > > >     returning a byte buffer.
> > > >    =20
> > > >     I prefer this variant over the previous longer one, also becaus=
e it
> > > >     refers to the individual LSMs for the exact format.  A reader o=
f the
> > > >     security context will require LSM-specific documentation anyway=
 to
> > > >     interpret the security context.
> > > >    =20
> > > >     This patch is still LLM-assisted, but at this point, since ever=
ything
> > > >     is rewritten now, the only LLM-assisted part is the discovery t=
hat
> > > >     this part of the documentation could be improved.
> > >=20
> > > You may use 'Reported-by: LLM' for distinguishing such cases.
> >=20
> > Thanks, done.
> >=20
> > (Minor remark, btw; I have carried the Assisted-by: LLM convention
> > over from the Linux kernel, but they have phased that practice out now
> > and removed that convention from the guidelines.)
>=20
> Yup; I'm aware.  We should still disclose it here.  I personally would
> prefer distinguishing Suggested-by from Co-authored-by, FWIW, but at the
> same time I refuse to say that an LLM has authored anything (rather, it
> has stolen it from someone else), so Assisted-by might be more
> appropriate.
>=20
> Perhaps, I'd distinguish Reported-by, Suggested-by, and then use
> Assisted-by for what a human would get Co-authored-by.

TBH, when I gave the exception, I was thinking you'd take the
suggestions, but completely write the text yourself.  I'm not too happy
with taking stolen text.


Cheers,
Alex

>=20
>=20
> Have a lovely day!
> Alex
>=20
> >=20
> >=20
> > > >  man/man7/unix.7 | 19 +++++++++++--------
> > > >  1 file changed, 11 insertions(+), 8 deletions(-)
> > > >=20
> > > > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > > > index 61f06a74359b..c0e2bdbacdd8 100644
> > > > --- a/man/man7/unix.7
> > > > +++ b/man/man7/unix.7
> > > > @@ -312,7 +312,7 @@ .SS Socket options
> > > >  is an integer boolean flag.
> > > >  .TP
> > > >  .B SO_PASSSEC
> > > > -Enables receiving of the SELinux security label of the peer socket
> > > > +Enables receiving of the security label of the peer socket
> > > >  in an ancillary message of type
> > > >  .B SCM_SECURITY
> > > >  (see below).
> > > > @@ -538,13 +538,16 @@ .SS Ancillary messages
> > > >  option must be enabled on the socket.
> > > >  .TP
> > > >  .B SCM_SECURITY
> > > > -Receive the SELinux security context (the security label)
> > > > -of the peer socket.
> > > > -The received ancillary data is a null-terminated string containing
> > > > -the security context.
> > > > -The receiver should allocate at least
> > > > -.B NAME_MAX
> > > > -bytes in the data portion of the ancillary message for this data.
> > > > +Receive the security context (the security label)
> > > > +of the peer socket,
> > > > +as provided by the active Linux Security Module (LSM).
> > > > +The received ancillary data is a byte buffer.
> > > > +.IP
> > > > +The exact format of the security context buffer
> > > > +is defined by the active major LSM.
> > > > +For example,
> > > > +SELinux returns a SELinux label as a string
> > > > +(including a terminating null byte).
> > >=20
> > > Considering that the interface doesn't promise to respect the null by=
te
> > > written by SELinux, I think I'd entirely remove this example, and
> > > instead focus on disclaiming that regardless of the format, the buffer
> > > is truncated in a way that destroys the format.
> > >=20
> > > I'm not an expert of this feature (actually, never used it at all), so
> > > maybe some silly question:
> > >=20
> > > How is a user supposed to know how much space to provide to prevent t=
his
> > > problematic truncation?  Is there a buffer size that will guarantee no
> > > truncation?  If so, we should instruct programmers to use it.  And if
> > > there's no possible size that fits all, we should probably warn about
> > > it.
> >=20
> > The required space for the buffers is again dependent on LSM; in some
> > LSMs, the buffer can (theoretically) be unbounded, but it's possible
> > that you can calculate a maximum size if you understand how these LSMs
> > are configured...
> >=20
> > I removed the example and will point out that truncation may happen in
> > a buffer-unaware format, if the caller-nprovided buffer is not large
> > enough.
> >=20
> > Thanks for the review!
> > =E2=80=93G=C3=BCnther
> >=20
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--76lkj3zywylzt6vb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsAXFcACgkQ64mZXMKQ
wqlpug/+OR7GTt9Q7LNt9nc9LHFDDq3tbPrqnAu3ELRU95Gr6Q/7zuRUUFj7a6OA
AvIW7Ik8OvIWZIUwXyWYJf+cILCdYJc+PWJU0/5VRmK+d+TCTDUiXnBJNdMlbUXQ
HJ8LPWm9o1/rBsOEB3vhBrXlVt0RgIrNrbqrHb+pbOuJT0AiUbn3MTXb+ctgcPaf
vNgr8U3vzDKECtQu0nUJibU+CatSPtVuZHIDFCIQxWtF0DOBsaxSatZ3fK49zOsh
iUcB+Auf5K1s0SWRDetjSZWr2WbM+s3E11+L/NOIJyCq8Vprp3AG1ABOPFZXIyjN
IAdNsEJ79dc+lpDzWSiG23vwt8y8C7CjrMroMAgIIjaJ2Pm2ePP6bMAa9SRFTbC9
ykvJ54COwcwcDMi7shNRAic/ghkLZdvQ4xQHNSJHtbQ/Hvy9xlQaxYjxwuth5U4W
tKOVAdi1Wgj9FQGpZ8kVQ5jo9TFdBder4jXdEX91AiwcuN4rNO7y6ErB6xhasmsB
vUuPt9qBtpzdCF7KPctSQhtpStAbTF+BX56/KIjeX+JrH04IDR6suy1OLhP/rPxA
9wwQJDk4krjNya5S/UqC2x+KxrgBSM5I7PiGJqzKz+DlMwMZIvpKmn2FUkLhtleM
J234PrfMFsj9ynnRlYAaI/c+Q+DqoD7MnrV0P3krIqNfh65k4m4=
=bgl+
-----END PGP SIGNATURE-----

--76lkj3zywylzt6vb--
