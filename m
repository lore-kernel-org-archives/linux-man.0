Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783982;
	b=aSdKicUp4YH5nVaBClyi0qjg3dYupWIeTeRp7LYXPR+6GHfsQUWoCvc1DNM9/4QUuP99
	 uM7OW2zdadIrYt1dM7HYrQ9xmCnrMJNZI2S0B91ioJTZ7ag5yVEDoxweAFIBOqn/mx/Of
	 dMosmJAwVwn7HxLqZPe3EERLFmP8RSiuf5sF1NeQyDcHQyKRlEviHVMFS8N6EURw5/Amj
	 JtUSBPfk/QjqDcKO5tukZtkzmjYrSILeSlrtEWZ2V3uNWaUDi7Rm3SxEnZYXSbcyWNxTN
	 GvSfJiXzMLmgH/CtYL9Fi07oYhA8x57HISXGfxrIqsY/0vk8g0UB9ZQ7UTPoYD/9D6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783982;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=DoKGKIS6/pTJ2We7jraoVFRWDf+84eTYwFF20FMgniU=;
	b=F8BmyLhtTyFDgYvnnz1u9HJmy6ZELQCVU6ltHt8ZOtN9DJpguzSCBmo9otsFY3b3UApq
	 2JWhRFzvJC9qkFL7m9H+RrJwkF/0bTnNJ8Ssc+V+U2VGc+mCiairRKDdkrVYn2otXP5qd
	 nYFwx9FrXGUN+HkgfSnPL/flkcMaTVIJncYQBf3pf2RksGmKX3U4H2ptYq5MPvUaxeQGw
	 nDMouw0oEUZm7l6dfk+wtjTDXsMxRUPSjkaifi55bb5VmHNOFCoeDf+YfMptqmGojwGzn
	 lWLyc7rM8PflG1e3MZFpiFj0z+0Pg9VLsV0RYEyEScaE0wUar13JfUoy4R9BA8xDz1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+cbPG8f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D710606A31A
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 19:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+cbPG8f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798021F01825;
	Fri, 23 Oct 2026 19:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792783982;
	bh=DoKGKIS6/pTJ2We7jraoVFRWDf+84eTYwFF20FMgniU=;
	h=Date:From:To:Cc:Subject;
	b=i+cbPG8fXkeAp6l2Tu6GUwKxos8wwbCj8AF5821cgQY6Fm8176Qp80xPncKcHUFIV
	 HkF/Mrm4tdKQt6KPguTUbGuY3C35VuHK8NwcPE2yvhWp8CYMNNBfm45juorAAeIW7N
	 FjvyEMQUGIEI179HKNOBbSjOeM5E9bRrMvjWvwRFUQC0Sl6yEp7pgW0wkumNUAsxbF
	 hmC7Ciaot2hpjFjly3AArcG/AAb+RLP6prsDFhvFUEQo3aWZUhMZi9mOATkoYZEgDd
	 oWhITbCIm+lRN8IqEXj6di85/YMA0/ZjNDZMDTQ8IhsA3HgbyJPey1Z4cCNeeudspD
	 ThsNTZ01L9H7A==
Date: Fri, 23 Oct 2026 21:32:54 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Enji Cooper <yaneurabeya@gmail.com>
Subject: [alx@kernel.org: Re: [Bug 222094] sched_setattr: bug in `ERRORS`
 section w.r.t. `attr.sched_flags contains a flag other than
 SCHED_FLAG_RESET_ON_FORK`]
Message-ID: <atu2ZjGrSZm8Nm9Z@debian>
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
	protocol="application/pgp-signature"; boundary="m0DoYDBMuKqJI5Oc"
Content-Disposition: inline

--m0DoYDBMuKqJI5Oc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 21:32:54 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Enji Cooper <yaneurabeya@gmail.com>
Subject: [alx@kernel.org: Re: [Bug 222094] sched_setattr: bug in `ERRORS`
 section w.r.t. `attr.sched_flags contains a flag other than
 SCHED_FLAG_RESET_ON_FORK`]

Ouch!  I forgot to send it to the list.  :)


Cheers,
Alex

----- Forwarded message from Alejandro Colomar <alx@kernel.org> -----

Date: Fri, 23 Oct 2026 21:27:52 +0200
=46rom: Alejandro Colomar <alx@kernel.org>
To: bugzilla-daemon@kernel.org
Cc: Enji Cooper <yaneurabeya@gmail.com>
Subject: Re: [Bug 222094] sched_setattr: bug in `ERRORS` section w.r.t. `at=
tr.sched_flags contains a flag other than
	SCHED_FLAG_RESET_ON_FORK`
Message-ID: <atu07uXukn8V_4YN@debian>
References: <bug-222094-216477@https.bugzilla.kernel.org/> <bug-222094-2164=
77-AkltlLpJO7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222094-216477-AkltlLpJO7@https.bugzilla.kernel.org/>

Hi,

> Date: 2026-10-23 18:47:22+0000
> From: bugzilla-daemon@kernel.org
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D222094
>=20
> --- Comment #2 from Enji Cooper (yaneurabeya@gmail.com) ---
> Created attachment 311258
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D311258&action=3Dedit
> Patch
>=20
> I've honestly never submitted a patch to the Linux mailing lists. There a=
re a
> lot of hoops to jump through in order to make a contribution... I'll try,=
 but
> please bear with me (I'll probably get something wrong).

Sure!  You're welcome to try.  :-)

I've forwarded your patch to the mailing list in this email.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

=46rom cfaef3da82a115fbce47dec58b458c6cfc439667 Mon Sep 17 00:00:00 2001
Message-ID: <cfaef3da82a115fbce47dec58b458c6cfc439667.1792780609.git.yaneur=
abeya@gmail.com>
=46rom: Enji Cooper <yaneurabeya@gmail.com>
Date: Fri, 23 Oct 2026 10:39:20 -0700
Subject: [PATCH] man/man2/sched_setattr.2: update `EINVAL` case with
 `.sched_flags`
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: <linux-man@vger.kernel.org>

In more recent versions of the kernel, `.sched_flags` is a treated as a
bitmask that supports values like `SCHED_FLAG_UTIL_CLAMP_MIN`, etc.

Account for the additional flags so the documentation is up to date with
the kernel implementation of `sched_setattr`.

Ref: linux.git 480a6ca2dc6e ("sched/uclamp: Allow to reset a task uclamp co=
nstraint value")

Signed-off-by: Enji Cooper <yaneurabeya@gmail.com>
---
 man/man2/sched_setattr.2 | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/man/man2/sched_setattr.2 b/man/man2/sched_setattr.2
index 80a0ac726dcf..b163ba482390 100644
--- a/man/man2/sched_setattr.2
+++ b/man/man2/sched_setattr.2
@@ -411,13 +411,16 @@ .SH ERRORS
 .BR sched (7).
 .TP
 .B EINVAL
-.I attr.sched_policy
-is not one of the recognized policies.
-.TP
-.B EINVAL
 .I attr.sched_flags
 contains a flag other than
-.BR SCHED_FLAG_RESET_ON_FORK .
+.BR SCHED_FLAG_RESET_ON_FORK ,
+.BR SCHED_FLAG_UTIL_CLAMP_MIN ,
+or
+.BR SCHED_FLAG_UTIL_CLAMP_MAX .
+.TP
+.B EINVAL
+.I attr.sched_policy
+is not one of the recognized policies.
 .TP
 .B EINVAL
 .I attr.sched_priority
--=20
2.50.1 (Apple Git-155)





----- End forwarded message -----

--=20
<https://www.alejandro-colomar.es>

--m0DoYDBMuKqJI5Oc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrbtmYACgkQ64mZXMKQ
wqmlpQ/+I3/y02VtJAntlyozd3CIr3w0t5vxQCkDzxc+fmDvwn/xU33y1ADlpPJA
peVSrVzn+H9+X1VKhziN5+4KM4BmIZo1Tobu8I3Ffj9EwyxLJqVIcuDx33rr9z2P
nzFbelQOOML+y3i1tfuscWrEePHHiL8ql2K1hML1yvk1xgCxqyKc1B3Qq9lWdzu6
REj/QM0NByejRJoQAKWazK82bx9cQ6CqOPVUQH+S3eLrOSGTE72Dt8ivjszzlvuq
5T/AA3r3/OspakzpU3uCgbKjCUNe9Ee3ZagLMa7jtKKCQGzAUMGu+qtdVxvTaeRs
xhgsfXjBD6yyxISkhEfy0ubDgczjHxvTR2dCnd6PtgDNOP9SCvxeejuxPCQhZPVa
s7hVd62sgj6rLvOzT2Tgcg8DOfvdktT0uNqo8gmm2A3tvRa+bIQbSUbeczs5vPp0
n8E1SGhSfVcCz4JU3aZ/5G0PkqH+sNEZv4bD3k8vOAQC2rFFJOGWPkBUFKE2/Hn2
+Hv1wB+i8oeT1ZkKOh2izxQZD+SLbTK/oc/hQGvPoFXR1SytEqCbsXmyP9M9dTZU
0avb6oJUP4iLKXBWtr3k8yTNDw4DWorPFtF92vDfTsuLOuEHcXPtjKA2If6cOS+H
p4ZWGo1Kt9cXOyrCd1kj6E3lbxlNlZuoS7KwFGgUidrYtXHhITQ=
=u7mq
-----END PGP SIGNATURE-----

--m0DoYDBMuKqJI5Oc--
