Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BAA175A8D
	for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787497581; cv=none; b=o6vSD/l12xpFDbUc2ARytbjy/5ixD2SN6iHBaM4r2V9qy7uPStxJW19VHtRiJDQmE6s9z8fnT1XDXrtu0tvZuIv9EqDYQCM2qjujwl8KRF8ydQ7W7/NTYTXjmgoMTwiC9sR/k/bUUZkB0kHygW1dzzCmU14vGc6dfNh1/OuFlTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787497581; c=relaxed/simple;
	bh=yUXfgRF93Pbo+oLYo6L9imIkhQ0mtuiphbR8Ppum2dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0DPk2Xpbyd5yWJ178hkpfPI+eYmcTI4L6y/xoCtsL7HpToeGE38fMT52rHADdTA5GcWUgxSp1719BWaMDfyU98l4c4NDhVVzgMqL1Rkzw+lCHx1REs235Z+3AXhYGaUpdTb69+t9uVhct8SmKazJJomOo8t0GX2FQp5b/juQqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLPSYeby; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLPSYeby"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7231F000E9;
	Sun, 23 Aug 2026 15:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787497580;
	bh=yJ4ys4Cs24dBx+aFQXkX+8F+tNuQHldBYG9e7CFP180=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bLPSYebyVSefIr+/knJruNa1/zyAqheWWfJAPgdKSTo8CVdTl4a5vLEjT2TRQr3rO
	 zvaI1/B0PVNAfyhjitKlGjn6LdXUgC/jCk4PrTlkARXftabxMrqmYexA68v8tUlGLR
	 YuMDscFoS1hZacZi+CV7X+z51clJrLmREMTtqMSmcN7xM+VcZV3MuzD+r8jdz7+YU/
	 0VZX0aaWUrKM9F/CtIrB6pqcU9fpeW126vidg4qql6couTil1z1UBZ+sEV6OwuyhtN
	 Wbilnofk4iRg07e9dPmOLztFOzThIu0GvUUlggveDrXJC5ZBo7QKDDfnz0pwyZU5wu
	 uIFvGbQmJmgBw==
Date: Sun, 23 Aug 2026 17:06:16 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <aosHFaauEzKEFNpl@devuan>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yn5fwro57ezxpucf"
Content-Disposition: inline
In-Reply-To: <20260823141622.7vszwghxrxvkff4j@illithid>


--yn5fwro57ezxpucf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <aosHFaauEzKEFNpl@devuan>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
MIME-Version: 1.0
In-Reply-To: <20260823141622.7vszwghxrxvkff4j@illithid>

Hi Branden,

> Date: 2026-08-23 09:16:22-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> Hi Alex,
>=20
> At 2026-08-23T15:55:29+0200, Alejandro Colomar wrote:
> > > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > > > Do you know what's wrong?
> > >=20
> > > More or less. It turns out to be damned hard to balance the
> > > requirements of (1) Automake maintainer mode; (2) building from Git
> > > repository checkouts; and (3) building from distribution archives.
> > > Bruno Haible has been helpful in finding scenarios that don't work.
> > >=20
> > > https://lists.gnu.org/archive/html/groff/2026-08/msg00039.html
> >=20
> > Hmmmm, now it rings a bell.  bootstrap said something about configure
> > with maintainer mode, but I ignored that, since I had never used
> > maintainer mode.
>=20
> Right.  I introduced that very recently during the RCs for 1.25.0,
> because it seemed necessary.  But as shown, Bruno has proposed patches
> ripping it back out.
>=20
> I'm pretty frustrated with Automake's lack of explicit support for
> building from Git working copies.  Or maybe it's brilliantly documented
> somewhere I haven't seen yet...

I dislike autotools for that and other reasons.  For groff(1), writing
a portable hand-written Makefile might be too hard to write.  But for
the man-pages, I love the hand-written Makefile we have.  I'm still
waiting for GNU Make to make a new release, and then be able to get rid
of the mandatory -R, but other than that, it works quite nicely.

[...]
> I do _not_ get such errors.  Shell session attached.
>=20
> ...but I'm building _from the release candidate archive_, as I advised
> you to do.

Yup; I don't like using tarballs.  It's much easier to just check out
git HEAD.  :)

> > > Build finished successfully for me in about 60 seconds.
> >=20
> > Out of curiosity, where did you get those timestamps from?  Does your
> > history file store them?
>=20
> Yes.  That's simply the output of Bash's "history" built-in.  I chopped
> off the command numbers and removed irrelevancies like "ls".

Oh, I don't have that!

	$ history | tail -n1
	 1997  history | tail -n1

After checking `help history`, I now realize it has a HISTTIMEFORMAT
variable for doing that.

I've added it now to my bashrc:

	alx@devuan:~/src/alx/config/main$ git show -U0
	commit 9b64c78f797fc3abab83148b24143402a5d2a839 (HEAD -> main)
	Author: Alejandro Colomar <alx@kernel.org>
	Date:   2026-08-23 16:53:59 +0200

	    bash: HISTTIMEFORMAT: Add variable
	   =20
	    Signed-off-by: Alejandro Colomar <alx@kernel.org>

	diff --git a/etc/bash.bashrc b/etc/bash.bashrc
	index af974d211e14..f2f7772c8e51 100644
	--- a/etc/bash.bashrc
	+++ b/etc/bash.bashrc
	@@ -2,0 +3 @@ export GPG_TTY=3D"$(tty)";
	+export HISTTIMEFORMAT=3D"%F %T%z ";

I've been wanting that for a long long time!  It's good to know it
exists.  :)

> > Using groff from git HEAD, I see the list as this:
> >=20
> > 	$ cat ls.man=20
> > 	.TH a s d f
> > 	.SH test
> > 	foo
> > 	.LS
> > 	.IP \[bu] 3
> > 	bar
> > 	.IP \[bu]
> > 	baz
> > 	.LS
> > 	.P
> > 	qwe
> > 	$ /opt/local/gnu/groff/20260823_master/bin/groff -man -Tutf8 ./ls.man=
=20
> > 	a(s)                                                                  =
      a(s)
> >=20
> > 	test
> > 	     foo
> >=20
> > 	     =E2=80=A2  bar
> >=20
> > 	     =E2=80=A2  baz
> >=20
> > 	     qwe
> >=20
> > 	f                                       d                             =
      a(s)
> >=20
> > Is this intended?  I thought it would imply PD 0.
>=20
> Yes, it's intended.  If you want the list compact, you have to say so.
>=20
> Also, you need to say what kind of list you're presenting.
>=20
> groff_man(7):
>      .LS type [compactness [indentation]]
>             (since groff 1.25) Start (or open) a list.  type is one of
>             =E2=80=9Cdefinition=E2=80=9D, =E2=80=9Cenumerated=E2=80=9D, o=
r =E2=80=9Citemized=E2=80=9D.  compactness is a
>             Boolean value directing suppression of inter=E2=80=90paragraph
>             spacing between list items.  indentation specifies an
>             indentation amount for the body of each list item; it is
>             then unnecessary to specify this argument to the list item
>             macros.  Use IP with a mark argument to represent an
>             itemized or enumerated list item, and TP for a definition
>             list item.  Use IP without arguments to associate successive
>             paragraphs with an existing list item; to these, inter=E2=80=
=90
>             paragraph spacing applies even in compact lists.
>=20
>      .LE    (since groff 1.25) End (or close) the most recent open list.
>=20
> > 	.LS
>=20
> Say instead:
>=20
> .LS itemized 1

Oh, yeah, I forgot to RTFM.  :-)

Here's an interesting thing (it might be okay, just noting it):

	diff --git i/man/man5/tunables.conf.5 w/man/man5/tunables.conf.5
	index 91bb6b81cb85..835c409eb074 100644
	--- i/man/man5/tunables.conf.5
	+++ w/man/man5/tunables.conf.5
	@@ -89,9 +89,10 @@ .SS Filters
	 Filters limit the tunables following it.
	 The effects of a filter are terminated by
	 any of the following:
	+.P
	+.LS itemized 1
	 .IP \[bu] 3
	 The end of the file.
	-.PD 0
	 .IP \[bu]
	 The end of an included file.
	 .IP \[bu]
	@@ -100,7 +101,7 @@ .SS Filters
	 directive.
	 .IP \[bu]
	 A new (possibly empty) filter.
	-.PD
	+.LE
	 .P
	 The syntax is:
	 .P

I had to add that P paragraph so that there's a blank before the list.
That's a bit unusual, since that would technically be an empty
paragraph; or maybe we can consider that paragraph to be the entire
list, but that's unusual in man(7).  That said, I'm fine with that.

What do you think?


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--yn5fwro57ezxpucf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqLDGcACgkQ64mZXMKQ
wqkxJw//a2OAsCxPkh2wrNTPPbK09tPK9bUhekowTRwgf7sIwBt3+qKKwah8wQXH
+5rcXdAqpaa/GML0yFcTsvckQjJsthmYGNmB29R5ZBbXP6GubprHV73O/iCAMiPx
RTo/s8dsNEtmkoStQgbxGPF7tOeNbpL7320wQAt1Tblk25616TaDweTRgGfbKUjW
fX+oYuFmpH0Qu5plWxFOEt+Ga1uJZ420lwlpv1AO7xSCTPwPVaCJz4tHiVycDsNg
nyxFS9dDuzr9GeYD5DpeKrO6IS1rJKXuK/I+EcguJ+6TAXUh0t8UdzsMJQm34Xso
sLqpz1mljm0ZR0o6vqIt+LnQN+1/3RToiJ9FvV5d1CmR1ug5+8SKtUWT0mEyVEPN
SJUr7fuMguPt9T987i+Q3v873xQMPvcmnJ0rIj45ruQFklcckXbKJJUOLVTMVXjc
cZG38NRFgX/O3TGbMLmO0uzR5sq3W1vvQXxPs9StJUPjF4ZgfSvXCzqvRbeVElY3
7X31/M02CflhmApb1j32paQx1sN2kmXSeNe3J6nH2STh0yA3NtND20WULCB58EOz
sUHQ71EauPGs2NG13ZH/1hhhEtdNTN1azoRz3SSeVr4VYZ4IMpePc6/+8RhFORGu
oz4ghABWwGcBlltUcJ66GilBGy37ZUeLRsqddR39ucR1VkNdJvA=
=WBPA
-----END PGP SIGNATURE-----

--yn5fwro57ezxpucf--
