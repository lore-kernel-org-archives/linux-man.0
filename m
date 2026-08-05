Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5256D420475
	for <linux-man@vger.kernel.org>; Wed,  5 Aug 2026 15:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785943144; cv=none; b=CJ/EK3YvFpXOzVy3loMR5ACd5g7z3d8CYNIH/p0DRqBOfb1bn0xjWzqiZEK8dQQw4o2OHLzuSGKmVSXexa9efKeE5Qx+OxZDdElIKa2zETuv8/xCBdJGGPU7dVpuPi+QGXv+J7FSsgN2NZcS8q8K8LmffRaw+TdW9xM8yqMm8QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785943144; c=relaxed/simple;
	bh=UZ75baQUPkHBh32lTFEJHI9Yu9U3VLHIRBFCM0Ik1/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9d7AW0wvJLSsCshBV64/kVjfvBH6WqzYtY/lCXuklz4b14/0AD2h6ybycKqZY7o39oJhCCwOA35BlfJTV37RM5ml7byTsQ5zWlop9goAhFdurT1pjutv6UclfWVAjz7xGPKCk2I4FYNyyKcElvA9IlOydSAWBBINsLEH3vNiVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOrvLKkK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOrvLKkK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88FD01F000E9;
	Wed,  5 Aug 2026 15:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785943134;
	bh=MtDr9nDzULdeMjxPtNDadeZzeVAwhS/QElU/OVI3g9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LOrvLKkKF38xW/gvXi8PDhYU8MNopAcg2zj+SoN920Lu+5+oSHoEVr50xJEODIoHg
	 X1iFkZE+rxXhOSSUl6wJY4zAGLpe3qr0849aM//QesQzWWgpWuWui8uplk+qVuldPV
	 E/pnFv1iLTOewIELLDT4yGoshhTTtJpL/wfQ/oP+NCaVzbv9MxBj8agujxl0hCqoW0
	 iFlfe4Bs0+2+Q2q/szTYkl/4YZ1RJ2dM5CWxloYPwh6aOPrc1KQDf5PhD3HXl6bbvM
	 nPMcKQXxI0RwyuYsDwenC1alGfB/cTtPBECXjjWVa+wHnnDHqzMwrfBlpwsauu/Je8
	 b4kA6uXrpa2gg==
Date: Wed, 5 Aug 2026 17:18:51 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: The goal of the Linux man-pages project
Message-ID: <anNPRCcQxdq7nfmh@devuan>
References: <anNBLjQj8-Eg1TUf@devuan>
 <xnik5o4o5l.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="edzxqxz4hlaldq2x"
Content-Disposition: inline
In-Reply-To: <xnik5o4o5l.fsf@greed.delorie.com>


--edzxqxz4hlaldq2x
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: The goal of the Linux man-pages project
Message-ID: <anNPRCcQxdq7nfmh@devuan>
References: <anNBLjQj8-Eg1TUf@devuan>
 <xnik5o4o5l.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xnik5o4o5l.fsf@greed.delorie.com>

Hi DJ,

Thanks a lot for this feedback!  I appreciate the constructive tone!  :)

> Date: 2026-08-05 10:50:30-0400
> From: DJ Delorie <dj@redhat.com>
>
> Alejandro Colomar <alx@kernel.org> writes:
> > 	SYNOPSIS
> > 	     #include <string.h>  // see memory.h(3head)
>=20
> This belongs in either SEE ALSO or FILES.

It's _also_ in SEE ALSO.

	$ MANWIDTH=3D64 man memcpy | grep -C1 memory.h
	SYNOPSIS
	     #include <string.h>  // see memory.h(3head)

	--
	SEE ALSO
	     memory.h(3head), bcopy(3),  memccpy(3),  memmove(3),  mem=E2=80=90
	     pcpy(3), strcpy(3), strncpy(3), wmemcpy(3)

FILES is rarely used in man3; when used, it's more about configuration
files, and not includes.  SYNOPSIS is the main place where we currently
specify files.

Actually, this reminds me again of the documentation of types, which are
often provided in several header files.  I used NOTES in those, because
I couldn't think of a good section for that.  See for example the NOTES
section of size_t(3type):

	NOTES
	     size_t
		    The following headers also provide size_t: <aio.h>,
		    <glob.h>,   <grp.h>,    <iconv.h>,    <monetary.h>,
		    <mqueue.h>,     <ndbm.h>,    <pwd.h>,    <regex.h>,
		    <search.h>,  <signal.h>,   <stdio.h>,   <stdlib.h>,
		    <string.h>, <strings.h>, <sys/mman.h>, <sys/msg.h>,
		    <sys/sem.h>,      <sys/shm.h>,      <sys/socket.h>,
		    <sys/types.h>, <sys/uio.h>,  <time.h>,  <unistd.h>,
		    <wchar.h>, and <wordexp.h>.

	     ssize_t
		    The   following   headers   also  provide  ssize_t:
		    <aio.h>,   <monetary.h>,   <mqueue.h>,   <stdio.h>,
		    <sys/msg.h>,   <sys/socket.h>,   <sys/uio.h>,   and
		    <unistd.h>.

I think it could make sense to move that to a FILES section.

About being in SYNOPSIS, I think I want it there, because it's not there
as documenting a header file that provides this function, but mainly as
documenting that while it's provided by <string.h> it's not a string
function.

> > 	STANDARDS
> > 	     BSD.
> >
> > 	     These functions are also provided in <string.h>, as speci=E2=80=90
> > 	     fied by ISO C.
>=20
> Ok so far
>=20
> >	     This is a historic mistake maintained  for
> > 	     compatibility  reasons.   Don=E2=80=99t  let  that fool you; these
> > 	     functions don=E2=80=99t necessarily operate on strings.
>=20
> This just doesn't fit, it's far too opinionated and personal.  It needs
> to be more neutral and standards-respecting.
>=20
>   "Historically, this file contained memory-related functions, while
>   string.h contained string-related functions, but currently these
>   functions are all in string.h, despite these not being string
>   functions, and typically memory.h just includes string.h for
>   compatibility across all the historic standards."
>=20
> I'm not arguing against the message here, just the tone.

I believe your suggestion removes the idea that the message intended to
give, but I concede that the tone was too harsh.

	Author: Alejandro Colomar <alx@kernel.org>
	Date:   2026-08-05 17:11:04 +0200

	    man/man3head/memory.h.3head: STANDARDS: Neutralize the tone
	   =20
	    Reported-by: DJ Delorie <dj@redhat.com>
	    Signed-off-by: Alejandro Colomar <alx@kernel.org>

	diff --git a/man/man3head/memory.h.3head b/man/man3head/memory.h.3head
	index 6c04722c4cf3..59f91e2ed023 100644
	--- a/man/man3head/memory.h.3head
	+++ b/man/man3head/memory.h.3head
	@@ -65,8 +65,7 @@ .SH STANDARDS
	 These functions are also provided in
	 .IR <string.h> ,
	 as specified by ISO C.
	-This is a historic mistake maintained for compatibility reasons.
	-Don't let that fool you;
	+This is a historic mistake maintained for compatibility reasons;
	 these functions don't necessarily operate on strings.
	 .SH HISTORY
	 SVr1, 4.3BSD.

Removing the "don't let that fool you" should neutralize the tone.
I prefer keeping the "historic mistake maintained for compatibility
reasons", because it really was a mistake, and I believe it is good to
acknowledge mistakes.  Documenting a mistake doesn't mean we're
disrespecting the authors; just that with the information we have today,
we wish it was different.

> As for the message...
>=20
> I think the only way we could be more persuasive is if we convinced the
> standards committees to actually segregate string and memory functions
> in the specifications, and tell you to ("shall") include string.h or
> memory.h accordingly, but that would break a lot of programs if it was
> actually required ("must").

Agreed.

> As an interim step, we could get the standards to specify string.h for
> string functions and memory.h for memory functions ("should"), knowing
> that either include gives you both,

That is more or less what my draft of the standards proposal says.

My proposal doesn't provide the str[^n]*() functions in <memory.h>,
though.  I think it's much better if that remains a vendor extension.

> and at a later date (after all the
> software is migrated) change to "shall" and start encouraging providers
> to actually segregate them.  Or offer a #define that strictly separates
> them to aid in migration, such as we do with other api-breaking
> standards changes.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--edzxqxz4hlaldq2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpzVFsACgkQ64mZXMKQ
wqkY3g/9GY7dlMydjAzaep+p7x3o6366oMQqhK6v/KcQzauQN40o2XHy5qRcAWbQ
BjWABYQXPzde+u4G2icAC9IHauAG2QMOk0EC3y58H59PfPYoJZ32TL1p7ilmzRoi
+BBirO5dQRas+FGVAxorhQYVbzFMR9lPW7BMrYQ8nW8nlZH7K21XcmHB94HHUZFi
csPdNC/cFuDFDTyLwVr424syzmFwGKu96Dv3X7Xh40mKR6mkdpXCnumc/67AKYpN
WE3wjC0PwRNjiHy2QsOGCMOJBsFlp9ormW3I0KXK73bU2XbaFymoYSnEt3tTKDf4
6NKLh2xLxf94qDf/Ic6ockhEuGq6FO3GahFXEyeN6C0S+w57fPyaqO8U8y3ekVsy
ot9F4j/FA/6OaSNIxSm2myvIE0612Rqz9OvsBuXytEOSND6MNwPHXfPU1AvwgdKU
dvFap6xEqBrHUdtFSJXzzwyTCGk0vwJ05jpZPcXQVqrRJDRcOb4oxheZ4u9rx/B3
oLV2mmgmWZREWcMc/vAsw09PrN51gcclFqFuocrv0R/OXDy2t0SUzJwnZi7x2KFe
r3dBM1GzYhqFRM/dPbqiCJrGGH0CJKx0bVPXPYRXpz/HJPaHJXV5j7xK2rmgi57p
zK9wXk4PHnrpMU7iukaLhhIHuTE/crrcaE63ZLckAvfmSYIpQJk=
=keLj
-----END PGP SIGNATURE-----

--edzxqxz4hlaldq2x--
