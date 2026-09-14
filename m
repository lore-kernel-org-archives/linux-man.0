Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1D939A06A
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 18:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411086; cv=none; b=oxk+gPzV5s2kDU+/STuxG/kVIaXr9y5/jSEx/OPE+4BN+yBJfoeGodMp7Ue0KL9K59onP4Uvnfk/zoAggtcdsm6CjQ3vaEuFAarU3Fqq6ja+7hyRYiIp46dMelHfqR7umNSkHic3icV6/qjLeeK/+XAAAR7mlJwrThDwPa3iWMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411086; c=relaxed/simple;
	bh=B52C/zSVX+bWim+q3NfFsYtYwbMJIspKz8MtOrDPFnc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIUZlnuyYVfILrBZiPCI80Bwtj0Ib6gw5VUMnsMApE6hjBcGEDqqH52cG9jtajTcwrc9BeSkwadKk2dcVxNIXT1iiL4uqk2b0PJ1P9/O0di5JjGwHr46Mjb62dGZL0kNf0rhvpPFl7rxQqymEwPK2QfO2qvpNp0HdEpKFzGRpE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnMxCFJm; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnMxCFJm"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e50968489so1837001d50.0
        for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 11:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789411078; x=1790015878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EboBGCGaT45IwkjWNDN9n6KRDcDfAdw0/pnvybKVuKc=;
        b=rnMxCFJmDRAmy2xaUrVhQRlK4e+y9VLdh1W0F6BIz+/TXUuWGZTmK/WRRS88+t/rF5
         jzjn8zbfZGzyYLX8QOf1oVVEtppv418CG1ka/r9Ib/EOGzWRXqxYdfAeDOn1ACeosSL9
         St5glDRxyZytiuYxyFEJ24qyGSH3v1kkJahy3kaxSJNjoGREaowDoePqBOZaQ1HvZX8a
         iUhXQcunOj5xDOX0ns2HYmge09u8hV1tICNARWwd38Cd11+XOcOQzK+++SGOiJV6TS0d
         tYd8WR6fkbfRincTNPwaF9LUjI0JEsbl+FwZ54aKC4L1lLY2nptSAjqxduQukvNYpITu
         1cUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411078; x=1790015878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EboBGCGaT45IwkjWNDN9n6KRDcDfAdw0/pnvybKVuKc=;
        b=JWw6zcvf+M4hVFlGpu4Hadm8hRCMHypbFDnp92ygdu5xneLaBmHYwUw2+fccwNESKE
         Ko9Tf03sAFMWs5Y+/ZLzAy8gP1lWPesuOt99eKEjrNXZx0DRAGfcWDkUD1mlzM2+ZYFn
         BAQg7WWPHhbtRNV38puovr1ZLL3wB/6uICGSE1E+8IGWzIGIXIWMwpTqVFIhBZ8/PCsm
         fktB3bObNKy3nQUVCDMRYPVkEpolm+cu0gpbzScuj14LxgSscylv1nrhycN5viIwg+mm
         +7SR3Wz/bFcgUf2SG9YF+tvgzA2etazsx3m823hvwta0uTtGOuzwJoD61XjFbQiX55Hq
         64Hw==
X-Gm-Message-State: AFuF++kS+lvXIzmvtX6RcrRfBupvudLk6r17W+ejYXN+4acOkKwqB6/B
	vcI3wHkcQmxToYiVZ5kMxvzNx6VgpPd9162MfAAv28FioijS+l5lkBflQ9+kkA==
X-Gm-Gg: AYBFou01lhqrfcpzSc9xy5kxvRbGwgFbQzIDuYR+le1t9I1KLE0QUli0y9Id1hDyEz6
	E8KBkQaSA1P+oQ5CmHa5e7CK3PEmhfxE3bXbPUwKAM3PMltw1bJqRcfLp4aLZi8cThotdQ1O5PT
	0qM3vM+8KBJqipnzkt/xkczOxfvWOiqubqwDW8T3UDXKo4A0DyHHjPmZKAt7BmhQXzSfXsAJP6M
	RE/vt9AUXAv4zho/MojizpIqQs3+7YEp5rJV/7te2YrGaki8Uajpgz0fdwizIDLwp0+IvF3BjsB
	vQRplHm88V70dhwMDB3xt6Jp58ksXLvHwGPZhxZmLtzI/r0G/Zy0RNxpAe/hp3dL5s+6Jbk6/Qq
	N/2wTc31bYLFveiePR4b4xw3DwPuJE7SvZtfjPI3S32zZ+kTos0KI9lmbgKnnPR0pFm+pRBmH7A
	9Q534ER7j9c2bTSwW1WGZ8TjLrQisiwL0HQ5gp0gRxC23ryaThuG/2mByBvwv7O8XA92qxVpLgZ
	ZLqkXF+qw0=
X-Received: by 2002:a05:690e:4847:b0:671:3036:42d8 with SMTP id 956f58d0204a3-6714e195eefmr1061031d50.45.1789411072691;
        Mon, 14 Sep 2026 11:37:52 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980:4f4c:9d3d:ae83:2fcc])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125db3459sm4961569d50.6.2026.09.14.11.37.51
        for <linux-man@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:37:51 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:37:50 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: linux-man@vger.kernel.org
Subject: status of C forward declarations (was: [PATCH 1/1]
 man/man2/request_key.2: Add missing GNU size forward-declarations)
Message-ID: <20260914183750.cpvfbblgoegjlo2f@illithid>
References: <20260914111511.1610878-1-pvorel@suse.cz>
 <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik>
 <aqf1jJ1qxsTdw6kE@devuan>
 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pffi7euchmbtgkq2"
Content-Disposition: inline
In-Reply-To: <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>


--pffi7euchmbtgkq2
Content-Type: text/plain; charset=us-ascii; protected-headers=v1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: status of C forward declarations (was: [PATCH 1/1]
 man/man2/request_key.2: Add missing GNU size forward-declarations)
MIME-Version: 1.0

At 2026-09-14T10:19:13-0700, Mark Harris wrote:
> Alejandro Colomar wrote:
> > > Anyway N3207 (spec mentioned in d2c2db883) is something I'll need
> > > to get used to :).
> >
> > There's a more recent paper with a slightly better spec (also
> > compatible with GCC): N3681.
> > <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3681.pdf>
>=20
> There is an even more recent paper addressing this subject, N3923
> <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3923.pdf>, and the
> outcome from the last WG14 meeting was strong direction to proceed
> along these lines.  Hopefully this much more human-readable approach
> will prevail and we can do away with these confusing forward
> declarations in parameter lists.

This sort of naked triumphalism when reporting on working group
deliberations would be better replaced by a citation of the minutes of
the WG14 meeting in question.  Since you didn't do that, I will, and
further will quote the relevant portion.

At this point, the meeting minutes for summer 2026 are available in
draft form only.

https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3953.htm

---snip---
Na/, Forward Parameter References through Retroactive Scoping, v2
(Updates N3830) [N3923]

Celeste: I like this. But I am worried that "constraint" is too strong.
Unrelated libraries can collide with each other. I would recommended
practice be strong enough.

Bhakta: I like the changes. I also like that there is no new syntax for
it. Some compilers still have issues with far-enough look-ahead; that is
my only concern.

Gustedt: I am sympathetic to this approach; we need a solution. I am
still baffled that we did not get any other solutions. I am scared of
the complexity. I would still prefer forward declarations.

Celeste: This is similar for pre-C90 where you had to hook up with a
declaration later.

Adams: How does this integrate with the type system? Is it separated?

Na: Your question is about the attributes, right? This is not about
attributes. We have other proposals about intended attributes. What is
your proposal number?

Adams: My example is for the noreturn attribute. What is the current
status for the C type system?

Na: This proposal is for core language array size.

Bazley: SDCC already supports forward parameter declarations, but is
more limited than GCC. I wonder if this is an over-engineered solution
for a problem that does not need to exist at all?

Celeste: Is this ready for the Wording Group?

Gustedt: No, there are too many unanswered questions.

Columnar: I strongly prefer forward declarations. I like this proposal
more. Given that small implementors cannot implement this, I am not
comfortable accepting this.

Uecker: The SlimCC developer and another compiler developer wrote in a
discussion about general features that they are worried about parameters
for active declaration scoping. It is difficult for them to implement
this. They would rather implement template C++ functions.

Na: I need to discuss with that person offline the nature of their
problem.

Colomar: Would it be acceptable for Clang to propose forward
declarations, and then allow compilers to decide whether they want to do
this retroactive parsing?

Tarditi: You could use that rationale to deny many changes. I do not
think this is a serious issue. We could add implementation-defined
limits if forward tokens is an issue.

Celeste: This could potentially be optional. I do not think that is
possible. It does not give any cues to the compiler. Which bits would be
optional? If the expression in the array bounds is limited to an
identifier, there is no parsing problem.

Meneide: We do have an "implementation limit" section in the standard
for such things. Limits on look-ahead for this feature can go there.

Straw Poll: Would WG14 like to adopt something along the lines of N3923
for C2y? 3-0-0+12-7-4=3D15-7-4 strong direction to proceed

Gustedt: If we want this into C2y, we should have a paper with the
semantics cleared by November, so it can go to the Wording Group.
---end snip---

I assume the "Columnar" listed above is a typo for "Colomar".

Regards,
Branden

--pffi7euchmbtgkq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmqoPvYACgkQ0Z6cfXEm
bc5d8w/+PETRuP5qr86KyJmKioATSK76by767Qpdqxzm0MeXIK24qmk2Q1hhwMXo
+syJSwIUe1buuCI++nzTljwBTE+9eeFZ5gIXOyWMxTysMOIH7BB9qZ6oiBDR42KJ
RREgUKGqtjiS6A22Qa7S83md+w6YXFCRjNxT7L59LOTN6xuApJPXdzkr+fVnGHwt
WrzCxPzCm59mGR2bao37/NsNMkPGAb7Bq8RU6Fc9fL50nOouqU6923MSumLRmtn8
iwOuJFgVcXGUgTyOaCZr75lV2BhSdnklxqHeLjOvQrGrTpY/KPqtoC7rrRrEnBGk
UpeYLsYvIJXseqk6/aNMQXdqi97diehjkayFo+inhSEPk76yXxtRpIqr9rr2CJxB
6Q7n9iCn+mJjG76UZMsunwQgN0D7Y+NKx0RxqKIfOP1bZaOOQUvuKDB7CCTwS4Yc
UGgMbnb79fQmaMIYs/jrQD/DBbf97L3ptZdca79KW8qKwvR23Xl3WBD5RUrzd+ZS
Kp747Zv3L4BDgZ4AyZfOH0s2xnDWSiLQ1XIa1/98FZFdc9ECTdshqHLqgyPwXlF0
r0x7B7Swfzb/+alAVbCLKlPAJ02zoDouB4uXzk2seSHAh2pQQ3lJpmTSbF+EE45A
zKKRRJ/ZwZ+Y3shzhUqDxMb3aRaajGhiaH6+zZxLL1dhryBWJ88=
=xP6d
-----END PGP SIGNATURE-----

--pffi7euchmbtgkq2--
