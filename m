Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59021524F
	for <linux-man@vger.kernel.org>; Sat, 25 Jul 2026 23:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785023397; cv=none; b=Pxqm00mcNMuT0V6dS2+A0zd1w0IGrgg5XZvtd0kf6ASVn6qaxEL8c4wD0b+jmEjc30tVayFLg4oSZBFksxQyoiB4uV4JO02S35gxImUWdduOffqoXM5Ei1bR8cO9yqshzjyOO4tG0YdH7Mf1AhjmL5hGliNgbVPeV7ov5HDNtXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785023397; c=relaxed/simple;
	bh=m5L1GvIKzEtZEBig/NsLcfcNiFdoGfv8qQkvHHTLZOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdjr6PyqrTsdUqTJPMZWHv1sfZhKcD+WAy58jglVVctgvqq7IgVbbedt5nsMmgBBAttP8+Vk4ij6ZBvsTgb1n4U13fbqpUI+fMxcP2N6pvfWG3e3+xF7i6HLmd574cmFL945IO9CNH61Sj77y5HWPQbBXPcYjnO4wZ80prDPrjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdTtLhVj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdTtLhVj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6871F000E9;
	Sat, 25 Jul 2026 23:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785023395;
	bh=Mk9gkhIgzQaWDR3fpf061yMrlVY08fBQeIEmw0dp5kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fdTtLhVjlllKabwAFtLqbBUuffaF4p2Czi/wcpeM4cE/b3RQJHfYQ8W8OR/NxHksz
	 RgIVQFsIHhIdXXjJQ67JnSgNSH5bXiZ8sbSXJkO4l8GgtjQJe4rO1V3PYtec8uCKqw
	 yNPtha7+qGVQCM50ql0JMx2KQFlq1pOi3TNqSDPI4zA8YGmQVb7AW2LEggdxNJDWow
	 HSWzEO4/H12nZdzDYnm+Cp7F9zGN+cgX1I6pBZzVBj1L6aqM4GZ+bPvXFlwHW63omd
	 BINuU8zsh1KKRYoAj72dHhT0Ai3ezi6J9Ej7sFAULmcr4QwkfUTjF97hm4bsy/cM6Z
	 5YOkt0MQ6qJ9g==
Date: Sun, 26 Jul 2026 01:49:50 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v3 0/4] str*.3, mem*.3: NAME: Explain the names
Message-ID: <cover.1785023118.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kb2cwcn64a6dmzbo"
Content-Disposition: inline
In-Reply-To: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>


--kb2cwcn64a6dmzbo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v3 0/4] str*.3, mem*.3: NAME: Explain the names
Message-ID: <cover.1785023118.git.alx@kernel.org>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>

Hi,

Here's v3 of this patch set.  Changes:

-  Move change that accidentally was in patch 2/4 into patch 1/4.
-  Also add strndup expansion in strdup/strndup(3)
-  Clarify what 'fry' means in strfry(3).
-  Add Acked-by Serge.


Have a lovely night!
Alex


Alejandro Colomar (4):
  man/man3/str*.3: NAME: Explain the names
  man/man3/strpbrk.3: BUGS: Clarify the NAME
  man/man3/mem*.3: NAME: Explain the names
  man/man3/[b]string.3: Rewrite and merge

 man/man3/bstring.3    |  81 +-------------
 man/man3/memalign.3   |   4 +-
 man/man3/memccpy.3    |   2 +-
 man/man3/memchr.3     |   2 +-
 man/man3/memcmp.3     |   2 +-
 man/man3/memcpy.3     |   2 +-
 man/man3/memfrob.3    |   2 +-
 man/man3/memmem.3     |   2 +-
 man/man3/memmove.3    |   2 +-
 man/man3/mempcpy.3    |   2 +-
 man/man3/memset.3     |   2 +-
 man/man3/strcasecmp.3 |   2 +-
 man/man3/strchr.3     |   2 +-
 man/man3/strcmp.3     |   2 +-
 man/man3/strcoll.3    |   2 +-
 man/man3/strcpy.3     |   2 +-
 man/man3/strdup.3     |   2 +-
 man/man3/strerror.3   |   5 +-
 man/man3/strfmon.3    |   2 +-
 man/man3/strfromd.3   |   3 +-
 man/man3/strfry.3     |   2 +-
 man/man3/strftime.3   |   2 +-
 man/man3/string.3     | 241 ++++++++++++++++++++++++------------------
 man/man3/strlen.3     |   2 +-
 man/man3/strncat.3    |   5 +-
 man/man3/strnlen.3    |   2 +-
 man/man3/strpbrk.3    |   6 +-
 man/man3/strptime.3   |   2 +-
 man/man3/strsep.3     |   2 +-
 man/man3/strsignal.3  |   2 +-
 man/man3/strspn.3     |   2 +-
 man/man3/strtod.3     |   2 +-
 man/man3/strtoimax.3  |   2 +-
 man/man3/strtok.3     |   2 +-
 man/man3/strtol.3     |   2 +-
 man/man3/strtoul.3    |   2 +-
 man/man3/strverscmp.3 |   2 +-
 man/man3/strxfrm.3    |   2 +-
 38 files changed, 179 insertions(+), 228 deletions(-)

Range-diff against v2:
1:  b17a1548f3ab ! 1:  b3feb733f5fd man/man3/str*.3: NAME: Explain the names
    @@ man/man3/strdup.3
      .TH strdup 3 (date) "Linux man-pages (unreleased)"
      .SH NAME
     -strdup, strndup \- duplicate a string
    -+strdup, strndup \- string duplicate
    ++strdup, strndup \- string/nonstring duplicate
      .SH LIBRARY
      Standard C library
      .RI ( libc ,\~ \-lc )
    @@ man/man3/strfry.3
      .TH strfry 3 (date) "Linux man-pages (unreleased)"
      .SH NAME
     -strfry \- randomize a string
    -+strfry \- string fry
    ++strfry \- string fry (obfuscate)
      .SH LIBRARY
      Standard C library
      .RI ( libc ,\~ \-lc )
2:  a7508ac0f477 ! 2:  7a06ee7f7e76 man/man3/strpbrk.3: BUGS: Clarify the N=
AME
    @@ Metadata
      ## Commit message ##
         man/man3/strpbrk.3: BUGS: Clarify the NAME
    =20
    -    Cc: "Serge E. Hallyn" <serge@hallyn.com>
         Cc: Mark Harris <mark.hsj@gmail.com>
         Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
         Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
    +    Acked-by: Serge Hallyn <sergeh@kernel.org>
         Signed-off-by: Alejandro Colomar <alx@kernel.org>
    =20
    - ## man/man3/strfry.3 ##
    -@@
    - .\"
    - .TH strfry 3 (date) "Linux man-pages (unreleased)"
    - .SH NAME
    --strfry \- string fry
    -+strfry \- string fry (obfuscate)
    - .SH LIBRARY
    - Standard C library
    - .RI ( libc ,\~ \-lc )
    -
      ## man/man3/strpbrk.3 ##
     @@ man/man3/strpbrk.3: .SH STANDARDS
      C11, POSIX.1-2008.
3:  dcc7a485cbe0 ! 3:  69f0c458bec5 man/man3/mem*.3: NAME: Explain the names
    @@ Commit message
         Cc: Mark Harris <mark.hsj@gmail.com>
         Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
         Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
    +    Acked-by: Serge Hallyn <sergeh@kernel.org>
         Signed-off-by: Alejandro Colomar <alx@kernel.org>
    =20
      ## man/man3/memalign.3 ##
4:  89d3fbe27c06 =3D 4:  dcd1507df29b man/man3/[b]string.3: Rewrite and mer=
ge
--=20
2.53.0


--kb2cwcn64a6dmzbo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmplS5cACgkQ64mZXMKQ
wqnC6g/+KPL0k1Qhf5Pz18UVRO/TiphDypOd6N46bQOj1XUHao1rwJhwXFbFcY2Y
9nZal9jngvmUEBQ825pI8LC1Qc66l9Uag2RsTe3SjBimDwGKGXEvzEdwqv5m321c
voAdm1jr64Cd5LHABoQuiXnQd8jZaGix4I6nwtH5hyqJPNez0LEqEIzdmr8igJxe
A00HF82wDxnNEUvajM2wwqJ57g0q6mXyhFdEYi1D2hA4Os9U4e4nnUYArVCQ2Jhj
x2QppDGLHE/CPSFdAyQOivy4PlJW056T0I3uYco4FDmsqAalPUwKY98mBISeLZA+
/bgh2HNEpXeJV4zmHYzwzdI4DsGRyPEYPmNratgfAM6AXnN7zXgblG7W2cCvfB9E
np/l/Z4cEFfWd9SnQ+k/cPy09iL9i33MNqM8+aS5otI6vZiSmxAzuiyiM8MzKNZx
LAy2uSNlYoHrwhIG/sqgRSs+NF+lbzEQ/uiIuGJFEsKuCvfI7JAdCQn0OTPwRzeW
O4BXGICVJO55v1Vt6RCS+RdvIatk2BIHyLL5rQSNwo9l9M0BQqs0LXQjTaee1Bh8
5+jeUmSKqrNM+XvQ3JgsKQXWGObg5hxQJlsWghwm+6PPRXt0KQ4Mhik+yB2vC/+U
IzwWaGggZJsDW1e82Y4Tezq64PJAQykKOUr97g/rbSAgbgXVlrk=
=8xc4
-----END PGP SIGNATURE-----

--kb2cwcn64a6dmzbo--
