Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713E417A300
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 00:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785630465; cv=none; b=GrvVGEpmrSuPaNjQZoPDOkRV3U2X/WsAcFT/nSYIJyw3zRf2tKoKLnZXx8qb4qC7Ca98TeZLqj2GGqOzODMTzR9wEP/q3lcrjzLKuH70a5laOlTAC9jIs6I6qwa46szFRcaZ/O1cOrmz3wbzRFdA8e1N7erSCW2hfLpL9OwkGW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785630465; c=relaxed/simple;
	bh=tuaKxEj2Vf4H+L5tJXCzHbmPHgCKxdMi6egdZnWeStE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTsEbKC51FbfK7WwogZQb/wR6bDXCM4BNHlyolrA7HrQsDE1Fvg4LIszK36bXWozmr3UXcXXXO5dHtwo2A3H90Lxpxzy33X5DGZ50coVC94ieAmsH5XiiSefxSkakEZhNubm9Lf89RG2VgzMgkyYP+7kK10HKDSVxDKNkkP9qOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLXrZI30; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLXrZI30"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BDB1F00AC4;
	Sun,  2 Aug 2026 00:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785630464;
	bh=HHjX9Yovam+iwXFWPaQgpfLUP4ECUfvOV5MeA/A3vU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QLXrZI3043bmOnqCFPJplXESyxnYJUIp3mAQ2fB0N91l/vszKtVlWsBfsoRyy5koO
	 g4zadPBC8i3s5ZTDRB1y5HlxicWx3IB8//Dez9sfxgpe9Cc+EOjUlaLMaK94UwluDp
	 eEify7ZAOJwiaJe2V76Ghwl+qeX46Zcq2e9OPMmJDFQof5NNL7ZsweFuPfAeVTGjqB
	 pTcw/DrGgdCevO5FYjXPkgaRus2IlTQTwON0Zlcd/WN0xdrkSdnrgFCix1HMyek5mC
	 OjiTd8HHGTAk6SncGrrr4pR5lqVCqgerU63CoA5Dicd4FafYbZgSI3CfI4RblBP/rI
	 RnHB8T6baJI/Q==
Date: Sun, 2 Aug 2026 02:27:38 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Keith Bostic <keith@bostic.com>, Sam James <sam@gentoo.org>, 
	Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: proposed revision to memory.h(3head) (was: on the
 irresponsibility of pursuing C language reform)
Message-ID: <am6HTtAMkEEkWjfl@devuan>
References: <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <20260801235332.vc443gozbqkqdqm5@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iddgmdv22zn5p5ko"
Content-Disposition: inline
In-Reply-To: <20260801235332.vc443gozbqkqdqm5@illithid>


--iddgmdv22zn5p5ko
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Keith Bostic <keith@bostic.com>, Sam James <sam@gentoo.org>, 
	Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org, 
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: proposed revision to memory.h(3head) (was: on the
 irresponsibility of pursuing C language reform)
Message-ID: <am6HTtAMkEEkWjfl@devuan>
References: <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <20260801235332.vc443gozbqkqdqm5@illithid>
MIME-Version: 1.0
In-Reply-To: <20260801235332.vc443gozbqkqdqm5@illithid>

Hi Branden,

> Date: 2026-08-01 18:53:32-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> At 2026-08-02T01:24:28+0200, Alejandro Colomar wrote:
> > > Date: 2026-08-02 00:44:46+0200
> > > From: Alejandro Colomar <alx@kernel.org>
> > >
> > [...]
> > > > Advocating for better usage in the documentation is a different
> > > > thing, and a good thing. The man pages can even go pretty hard,
> > > > that=E2=80=99s their job: =E2=80=9CNotice the include file is strin=
g.h. That=E2=80=99s an
> > > > historic accident maintained for compatibility reasons; don=E2=80=
=99t let
> > > > that fool you, this function doesn=E2=80=99t operate on strings.=E2=
=80=9D
> > >=20
> > [...]
> > > I should probably expand the NOTES a little bit, to be more clear
> > > about why we ignore the standard in the SYNOPSIS.
> >=20
> > I've put that text in a centralized place, in the memory.h(3head)
> > manual page:
> >=20
> > 	$ MANWIDTH=3D64 diffman-git HEAD
> > 	--- HEAD^:man/man3head/memory.h.3
> > 	+++ HEAD:man/man3head/memory.h.3
> > 	@@ -10,6 +10,11 @@ SYNOPSIS
> > 	      #include <memory.h>
> > 	=20
> > 	 DESCRIPTION
> > 	+     These functions are also provided in <string.h>, as speci=E2=80=
=90
> > 	+     fied by ISO C.  This is a historic accident maintained for
> > 	+     compatibility reasons.  Don=E2=80=99t let that fool you; these
> > 	+     functions don=E2=80=99t necessarily operate on strings.
> > 	+
>=20
> That's a heavy editorial slant.  I don't think it was a historical
> accident; it was a historical "on purpose"[1], with which you disagree.

[pasted [1] here]
> [1] As one does with "all the glue", when one doesn't want a "major
>     award" to be readily repaired...

The C89 Rationale document doesn't document this as an intentional
change (or even as a change at all).
<https://www.open-std.org/jtc1/sc22/wg14/www/C89Rationale.pdf>

I'd certainly be interested in hearing first-hand information,
if anyone has it.  Maybe Keith would be the best candidate for that.

> Here's a revision that goes a little less hard, favors active voice over
> passive, and is shorter.
>=20
> 	+     ISO C mandates that <string.h> declare these functions.
> 	+     Be aware that they do not necessarily operate on strings.

I'll think about it.

>=20
> > 	+STANDARDS
> > 	+     BSD.
>=20
> If you're tracking SVID in the Linux man-pages project, I would guess
> that it was in the original SVID, which formalized/specified SVr2--but I
> can't find online any version of SVID older than its Fourth Edition.

Here's an online copy of SVID Issue 2:
<https://bitsavers.org/pdf/att/unix/SVID/System_V_Interface_Definition_Issu=
e_2_Volume_1_1986.pdf>
It does indeed standardize <memory.h>.

I don't know of any copy of SVID Issue 1.

SVID is a withdrawn standard (having been superseded by the SUS/POSIX
standards, Issue 8 in the most recent revision), and thus not
appropriate for STANDARDS.  It'd be however appropriate for HISTORY.
However, the SVID 1 corresponds to SVr2 (1985), so that's actually too
late for this.  In HISTORY, I've documented this as SysV (maybe we
should coin SVr1?  It doesn't exist in standards(7), but it'd be
reasonable).

At the moment, I have it as:

	STANDARDS
	     BSD.

	HISTORY
	     SysV, 4.3BSD.

		...

Also, we don't document the SVID documents in HISTORY, because we
document the corresponding revision of SysV.

Interestingly, POSIX.1-1988 already moved everything to <string.h>
(C89 was almost finalized by then) and doesn't contain any references to
<memory.h>, as if it had never existed.
<https://nvlpubs.nist.gov/nistpubs/Legacy/FIPS/fipspub151-1.pdf>
I'd be curious to see whether XPG Issue 3 still kept <memory.h> (but
I suspect it won't, since it derives from POSIX.1-1988).
SVID Third Edition curiously removed any mentions of <memory.h>, as if
it had never existed (just like POSIx.1-1988).
<https://archive.org/details/systemvinterface0001unse/page/n149/mode/1up?q=
=3Dmemory.h>

(For anyone reading and wondering about the incestuous relationship of
 these old standards, here's a useful rough sketch I did some time ago):
<https://lore.kernel.org/linux-man/aWwzhLaG_aehhWOG@devuan/>

> If you care about SVID, this point may bear further research.  Matt G.
> of TUHS might have a line on older editions of SVID.

I'd be interesting to have a copy of those, for sure.  I am aware of
the copies of Issue 2 and Third Edition I linked above, but I'd
certainly be interested in a copy of Issue 1.  XPG 3 would also be nice.

> > 	+HISTORY
> > 	+     The <memory.h> header file is the original one which was
> > 	+     added in System V (1983), and was later adopted by 4.3BSD
> > 	+     (1986).  It contained the original mem* functions.
> > 	+
> > 	+     C89 didn=E2=80=99t standardize this header file, and instead
> > 	+     crammed all these functions in <string.h>, resulting in
> > 	+     confusing programmers about the real purpose of these
> > 	+     functions.
>=20
> Again, you're going harder than you need to here.
>=20
> I propose:
>=20
> 	+HISTORY
> 	+     System V (1983) introduced an initial set of mem*
> 	+     functions in a <memory.h> file.  4.3BSD (1986) adopted
> 	+     them.  C89 specified them in <string.h>.

I like part of this paragraph.

> 	+     The programmer bears the burden of selecting appropriate
> 	+     functions for operations on memory buffers (which may
> 	+     contain any bytes, including nulls) versus strings (which
> 	+     null bytes terminate).

I'm not convinced.

>=20
> If you like the foregoing, consider it:
>=20
> Signed-off-by: G. Branden Robinson <g.branden.robinson@gmail.com>

I'll probably modify it and note it as

	Suggested-by: ...


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--iddgmdv22zn5p5ko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpujvIACgkQ64mZXMKQ
wqmB1w/+PlgIRYb+mohxVWhs3nEsZ33WX2hoCaafBLmAhQNasxAajdnx7UKiq+Dt
Q1gSokD3UCc9AVc/3wOCChMOQRpAGvrDJ609DKHDWJqX4SNuE4jn0YNKlSJiiSTa
1yTReBK4S1ivxSI6mj258BX1cewo8CxqgXGUdX9NmvKU6OazwTB7Xfe+3gPHX7Xu
xtWb2ZvmdBIBex5LSXYGDmnDnTN0qcxujlr3lj3g7QDgpRDkD33z6jV9sZxnjdK5
tPiMPTC0bz+wow7JBemE6hY3hNWA5TLDjcL6SV+abnG28hW+lIX9PrdUfdjuaZ2K
thwVkU1ZK0UYxI1aF2WzMjVDCwAXM84liM0HCRaGo3ed9W6iRvPouJtrMUwOG6yl
23o0u3pWvfByRW2YQePA4RDCuwHlut6cgehlQECF5msuHES9DioHPRMbdsNDU4sI
tAGoA8IagpM5KivhcAvqqJg6DBIlWIjSFzmrtyx2F1f6vG3Yt9qi9H4j9a3RZCTB
6UsoUPkzE3LoLoEGQo3l33TTdPdl7O1fxYrUJsy9Iqg6JezCAIsip0FVdUr8PXIe
MciHyrr2XlyWQ/i6Q+iTIqa6VvC0Xz/GpbtwKEScgfGGw8FzUgN4AJ9AT0RrZhzQ
Bnn1hfradjkP2T8ID3bAU0Sl3LZAMcCvLbzok6bmSEKhBSqocu4=
=4TVj
-----END PGP SIGNATURE-----

--iddgmdv22zn5p5ko--
