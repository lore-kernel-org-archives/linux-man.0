Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F6637C0E1
	for <linux-man@vger.kernel.org>; Mon, 18 May 2026 03:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779073999; cv=none; b=PhDjREkhEwB85yS7FjxMBlxqsSF5FJq6Va23n9wloltkFpKKaJs6ixjwLxBPkPgmjcHtbH0GSaG4UHp3wXtZYkmrQwSvQBHQTF6MW+NhUlT+7X1kTdQW48eKAp9wssxduVwQPfM37rM7OIMI9HcbPOv9QBMvYyEvhf9ecjPQWfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779073999; c=relaxed/simple;
	bh=6vGz/JUsmhEwqvvqjy6ghNauaH6x9GXhUaNfMmr/ht0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ibeY/WzrYJxOZH8a9QDmOBMEQKZYP8VTTzKlfsW/bU3o2doYbpLwAplmC0Ufo6NmOXcEsBzknXJ7Wj7o1coess+/rUPgewVEMTCpL/gonAL2EXul9I8yqlGZEE3iyNrYzuKRS/2IL2sr0tr1VbRf6twpxDXuO+8gJwqhRzS8vCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=disroot.org; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A9ACA270FA;
	Mon, 18 May 2026 05:13:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eo8p7Tp1pAw9; Mon, 18 May 2026 05:13:11 +0200 (CEST)
Date: Mon, 18 May 2026 04:13:08 +0100
From: funsafemath <funsafemath@proton.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v2 0/2] Document seccomp flags
Message-ID: <agqDvDQsWJG4Pw4q@nix-mail>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=funsafemath@proton.me; h=from:subject;
 bh=m5uHa/rAkd++KfDAnO9SGCE8ZYz2qenVqgY3tQjDT3A=;
 b=owGbwMvMwCV2QvA6L+scLT/G02pJDFlcFdtkn9T1TmhSXsPw3ud10dZZuvX7u9xvrTTM+aQXt
 nVNvty+jlIWBjEuBlkxRRaJhXd8pXTVP9t/TlWFmcPKBDKEgYtTACZywZeR4e3/WtZ1TwWPL9r3
 4v6hR2ZB12Zx+U1rKd7Bn7BhnY8DiwzD/9jGZo1jortnrSm6xljgMScswKztxBInpdmf3kg3NQT
 0MwAA
X-Developer-Key: i=funsafemath@proton.me; a=openpgp;
 fpr=B07EE98D22F23DFB077429C0DF66F4774CE714D5
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u4e7pd3fhzbxq7do"
Content-Disposition: inline
In-Reply-To: <agjZM97qL3w4JZBX@nix-mail>


--u4e7pd3fhzbxq7do
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH v2 0/2] Document seccomp flags
MIME-Version: 1.0

Hello,

Yes, a libc wrapper would return -1, I've changed the wording and applied o=
ther suggestions.

funsafemath (2):
  man/man2/seccomp.2: Document SECCOMP_FILTER_FLAG_TSYNC_ESRCH
  man/man2/seccomp.2: Document SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV

 man/man2/seccomp.2 | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

Range-diff against v1:
1:  c3c3b728b ! 1:  fec59f483 man/man2/seccomp.2: Document SECCOMP_FILTER_F=
LAG_TSYNC_ESRCH
    @@ Commit message
    =20
         <https://lore.kernel.org/r/20200304180517.23867-1-tycho@tycho.ws>
    =20
    +    Signed-off-by: funsafemath <funsafemath@proton.me>
    +
      ## man/man2/seccomp.2 ##
     @@ man/man2/seccomp.2: .SH DESCRIPTION
      .B SECCOMP_MODE_STRICT
    @@ man/man2/seccomp.2: .SH DESCRIPTION
     +.TP
     +.BR SECCOMP_FILTER_FLAG_TSYNC_ESRCH " (since Linux 5.7)"
     +.\" commit 51891498f2da78ee64dfad88fa53c9e85fb50abf
    -+Return
    ++Fail with
     +.B ESRCH
    -+instead of the thread ID on synchronization failure if
    -+.B  SECCOMP_FILTER_FLAG_TSYNC
    ++instead of returning the thread ID on synchronization failure if
    ++.B SECCOMP_FILTER_FLAG_TSYNC
     +was specified.
     +.IP
     +If this flag is not set, using
2:  423b0141b ! 2:  8ead033b8 man/man2/seccomp.2: Document SECCOMP_FILTER_F=
LAG_WAIT_KILLABLE_RECV
    @@ Commit message
    =20
         Relevant kernel documentation: <Documentation/userspace-api/seccom=
p_filter.rst>
    =20
    +    Signed-off-by: funsafemath <funsafemath@proton.me>
    +
      ## man/man2/seccomp.2 ##
     @@ man/man2/seccomp.2: .SH DESCRIPTION
      .B SECCOMP_FILTER_FLAG_TSYNC
    @@ man/man2/seccomp.2: .SH DESCRIPTION
     +.\" commit c2aa2dfef243efe213a480a1ee8566507a5152f4
     +Ignore non-fatal signals until the supervisor sends a response.
     +.IP
    ++The
     +.B SECCOMP_FILTER_FLAG_NEW_LISTENER
     +flag must be set.
      .RE
--=20
2.52.0


--u4e7pd3fhzbxq7do
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQYodxNGi0n8z/zZSXIEdcNBZwqTgUCagqDwgAKCRDIEdcNBZwq
TloPAQD0T6UMo23OAqClUl0/wOASIYjg4TtDJD5Qwp9zYEWZHgEAyXRE8Rzme3Xx
uKoxrcbl9DFQ+E+c0t0VX5G0X5pypgo=
=Q9iG
-----END PGP SIGNATURE-----

--u4e7pd3fhzbxq7do--
