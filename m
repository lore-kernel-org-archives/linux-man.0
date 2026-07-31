Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC82A48986D
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 21:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785532739; cv=none; b=LjaOsOnBGF9md2CH7jEuPkrbjn68fjJwxIMoi3YLS96G61E/AqB0o3HssWI+ZXDw8WpBcD32OO7RqT8XOzBru3XLzwOFnXf+RxKc2LX3cdSXTJ/dQ5vDgGMFL4EH8Iyt5dni6E8XbExaQ/6yffdUtJgmih1dN9OqFPwsqjNQfHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785532739; c=relaxed/simple;
	bh=bEbSjKo8sC98yVtKZP5ayC6ETelocE+4ezel/Et6SlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFjWCTvNSk3AKLJ2/3pF1Vzlp0xzjUKjoLyx8ZQredJHOCC19P+VX/tVl6voMTFaqD5Qg/K9aWVsfZ5mxTaSSA3fABEM9ZT6ln62J2JPmUTiDN/PSCR2aBl+kmQtzZdsbHbficaZoSF8YWyFeLz6CZi2gNNpzYwDeRhjgmo2TSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5J7NWxO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5J7NWxO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C420B1F00AC4;
	Fri, 31 Jul 2026 21:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785532738;
	bh=J1keRdHFFyCk0YYjVKOjhjaS+80IHD+CX6k/9QKK/oo=;
	h=Date:From:To:Cc:Subject;
	b=M5J7NWxOFAsGN0SG+LDiveGf9h/LuZpBhLOYe0HzubTUotC8N5yj21iZ4gN/+6bZX
	 idzskdyVB0j0LsRgAq9KDYdv22w+Uim03fgxakqSPX7A3XfL5ujViEH1VrP6xnMejx
	 KK5H7aApUzJgFGtasjYSfM9Y+OGIaPfQbrCLp2kvnLa9+P0dAb+tcrPwESTpR2JOvj
	 WDD7wsCMyoPd8x0iNzWgL/3gi2P2BKrRUIHrIETUxMOgfZS11URocqysYdpwZiwFBx
	 qkFAJWrW9HYJt9TYPASRMuufw9U9KwSZ+y16lzmtjwKjCaKaYtOp7zJmBn3f72zHdP
	 65IUmPC+idfvA==
Date: Fri, 31 Jul 2026 23:18:54 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Keith Bostic <keith@bostic.com>, Joseph Myers <josmyers@redhat.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Alejandro Colomar <alx@kernel.org>
Subject: [PATCH 0/2] alx-0097r1 - <memory.h>, the legitimate header for
 memcpy(3) et al.
Message-ID: <cover.1785532392.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="34ajgfzvfkd2yzlm"
Content-Disposition: inline


--34ajgfzvfkd2yzlm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Keith Bostic <keith@bostic.com>, Joseph Myers <josmyers@redhat.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Alejandro Colomar <alx@kernel.org>
Subject: [PATCH 0/2] alx-0097r1 - <memory.h>, the legitimate header for
 memcpy(3) et al.
Message-ID: <cover.1785532392.git.alx@kernel.org>
MIME-Version: 1.0

Hi!

Here's a patch set for documenting mem*(3) and strn*(3) functions as
provided in <memory.h>.  This should put a stop to the misunderstanding
and misuse of these functions as handling strings; they handle bytes and
nonstrings (and in some cases, strings can be used as nonstrings or as
byte arrays, but very carefully).

This header is quite portable: {Free,Net,Open}BSD, glibc, and musl, at
least and since forever.

The C Committee is discussing standardization of <memory.h>, so let's
give it a bump.


Have a lovely night!
Alex


Alejandro Colomar (2):
  man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
    provided by <memory.h>
  man/man*/{string.3,memory.h.3head}: Move functions to a new page
    memory.h(3head)

 man/man3/memccpy.3      |  5 ++-
 man/man3/memchr.3       |  5 ++-
 man/man3/memcmp.3       |  5 ++-
 man/man3/memcpy.3       |  5 ++-
 man/man3/memfrob.3      |  2 +-
 man/man3/memmem.3       |  2 +-
 man/man3/memmove.3      |  5 ++-
 man/man3/mempcpy.3      |  2 +-
 man/man3/memrchr.3      |  2 +-
 man/man3/memset.3       |  5 ++-
 man/man3/stpncpy.3      |  8 +++-
 man/man3/strcasecmp.3   |  6 +++
 man/man3/strcmp.3       |  6 +++
 man/man3/strdup.3       |  5 +++
 man/man3/strdupa.3      |  4 ++
 man/man3/string.3       | 95 +++--------------------------------------
 man/man3/strncat.3      |  5 ++-
 man/man3/strnlen.3      |  5 ++-
 man/man3head/memory.h.3 | 57 +++++++++++++++++++++++++
 19 files changed, 126 insertions(+), 103 deletions(-)
 create mode 100644 man/man3head/memory.h.3

Range-diff:
-:  ------------ > 1:  784288e70418 man/man3/{mem,strn}*(): SYNOPSIS, STAND=
ARDS: Document these as provided by <memory.h>
-:  ------------ > 2:  668ab8c64821 man/man*/{string.3,memory.h.3head}: Mov=
e functions to a new page memory.h(3head)

base-commit: 8152eb52d9a92f02c14e843545acec7ee1946479
--=20
2.53.0


--34ajgfzvfkd2yzlm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptET0ACgkQ64mZXMKQ
wqm10g//XKxdoEzAu87TmtSAGS5sddII3rp4UkXIVCdZPbFyROw86w7vtFtCZXAT
1Y5m/vG9yWB0IbstLzL4FuJVx688hv473jphe69qaOEIp7KxvMnkmm786VUGRtEG
HQH0QtxYyNnLVDdbqwCoOg5lKJ6n6E2BkExVevK5r/rapV7wfkhv7v2OB+wFuEkD
00cz5pf3QsD/rJh4XgpbHr0QYjo+96LvVK9/OxN3oWgRpU/UM8zQD5+g9GaF5Sr3
3qdMLwWhTPDBRsP1tc3LRQQdM7sL9ynWDCXekxsa7WJNwKojjCBmdeNfh1I5gdIc
Z74xEBUrQJIB2B6k8fV7u66xPdW75wbtvirUSxLgkiCD9P0f11uZI5Mj7yVb9ZjI
H5fL/iRVBa+S/Zgz6Y6IwakfI6WfDqZK3cVFPy/j2mAxxNRN5/3xPyggmK/Y+POJ
XSUkWLI8oZaoJTT1wF3kjfSfZIkLvaA40XAVYvzyywCvC9HSTB0ng5kOdkWGuk+O
bfC0Bmsyen7gH9JSHxxCfToP8LU1tcW8K3coPosLWBb9NFP74I+cWdVC7lGlcLc+
+GWlf4RUEiIsvlJNoHduFgfl+IrnbF4+H6oIpx5pbAXfNdSETeaCfjbYCzOs5EL8
1FUvh1RKZUtcRUIIIRfKNrAC0+LxD+pfo/2vCSkddEWYlH26Acs=
=7Uzu
-----END PGP SIGNATURE-----

--34ajgfzvfkd2yzlm--
