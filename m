Received: from mail.helgefjell.de (mail.helgefjell.de [142.132.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B73A25B662
	for <linux-man@vger.kernel.org>; Sun,  8 Feb 2026 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.132.201.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770575317; cv=none; b=JrNTplmSMz+kYa0Ncjjh7gW0KDHIsYgllh0lWCz6DuWQwi0xL3A6rRz1jQfrr1e+vUm7Zjv/Zj2Y3eoBpsQ08+kGmVT9B/9VXBLgRQocoHGeXplnYeaMgGxbZWDQgHgEQWXZFbHbhwxiqHQgY6OCLNbwaivbj/Ttor8ewoTuXd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770575317; c=relaxed/simple;
	bh=3B1Zr/UU1TArR1xzKAzFjpo+MEs5e3BJWx7wQGMB0mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmylxopBdtovWdgudDGcSnhUAXgw4gG46thZ72gTp0LWUxBtRyphjZRpW1VOOlnNb2nwGDBYP7zgortV0BHxzkB4IxBc/XljGQUysIfPgAAvzACNHSmOax3omi7Vm90sTRe6c5IxXF+gS0Jaocvk4RpseZW4OAZqicfNUZ7o4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helgefjell.de; spf=pass smtp.mailfrom=helgefjell.de; dkim=pass (2048-bit key) header.d=helgefjell.de header.i=@helgefjell.de header.b=DbnnTrvf; arc=none smtp.client-ip=142.132.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helgefjell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helgefjell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helgefjell.de header.i=@helgefjell.de header.b="DbnnTrvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helgefjell.de;
	s=selector.helgefjell; t=1770575314;
	bh=1xBkVrZ/OAqaUtwMNiplg6NZtWHW33eIDjC2XtttpAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DbnnTrvf3Rcq22KDeLzgzi8Gcho+hLAqmRSBfqdFV2+n2sPyjiXR090KqDjrWubcq
	 FfSiUD20WO1bBUztN72JSjuizgJcw6in4klNUnUU2DuHIqpZj28meExCb2PKd2ylky
	 dLmIRmlT1d8vvzIlK1q2o8hz6g1GGj9+j3kf8uRvMKhtkzp4W7Rk0bUbiaLBgzDryi
	 C+p+6U41tU3c/S+cnU6Lzh1U8CkHfxc5ywgQhKYw2k76ZF3pD7FlrJ68AdurjDZrGn
	 Ssyc9c2uZ50PqyrCV/qLQiaflemFSuFhreAjwh2ApeQtroOFO75T7d50P/IvEAevgd
	 utHLbZWwn8f2g==
Original-Subject: Re: Issue in man page sprof.1
Author: Helge Kreutzmann <debian@helgefjell.de>
Original-Cc: Alejandro Colomar <alx@kernel.org>, mario.blaettermann@gmail.com,
  linux-man@vger.kernel.org, libc-alpha@sourceware.org
Received: from localhost (localhost [127.0.0.1])
  (uid 1002)
  by mail.helgefjell.de with local
  id 000000000002004C.000000006988D5D2.0030A62D; Sun, 08 Feb 2026 18:28:34 +0000
Date: Sun, 8 Feb 2026 18:28:34 +0000
From: Helge Kreutzmann <debian@helgefjell.de>
To: Florian Weimer <fweimer@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, mario.blaettermann@gmail.com,
  linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: Issue in man page sprof.1
Message-ID: <aYjV0n96GmH-lZl-@meinfjell.helgefjelltest.de>
References: <ZznJf0DLo7CVHddl@meinfjell.helgefjelltest.de>
 <xdv6pfasrfbegf3pb34ktupjcjao7kunwj65zmmbgwt53jdy6x@fnarmmxyzgpr>
 <87mshxxyol.fsf@oldenburg.str.redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256; protocol="application/pgp-signature"; boundary="=_meinfjell-3188269-1770575314-0001-2"
Content-Disposition: inline
In-Reply-To: <87mshxxyol.fsf@oldenburg.str.redhat.com>
X-Public-Key-URL: http://www.helgefjell.de/data/debian_neu.asc
X-homepage: http://www.helgefjell.de/debian

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_meinfjell-3188269-1770575314-0001-2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Florian,
Am Sun, Nov 17, 2024 at 11:50:18PM +0100 schrieb Florian Weimer:
> * Alejandro Colomar:
>=20
> > Hi Helge,
> >
> > On Sun, Nov 17, 2024 at 10:46:23AM GMT, Helge Kreutzmann wrote:
> >> Without further ado, the following was found:
> >>=20
> >> Issue:    Inconsistency detected by ld.so: dl-open.c: 930: _dl_open: A=
ssertion `_dl_debug_update (args.nsid)->r_state =3D=3D RT_CONSISTENT' faile=
d!
> >
> > IIUC, this report is that running the example shell session resulted in
> > that problem.  I've CCed glibc in case they can help.
> >
> > It would be interesting to know if this can be reproduced, and a full
> > reproducer.
>=20
> Hasn't this been fixed in glibc 2.38?  Via:
>=20
> commit ab5aa2ee3d3f978e474803cbbc5fe805ad30e293
> Author: Andreas Schwab <schwab@suse.de>
> Date:   Thu Mar 23 16:46:20 2023 +0100
>=20
>     dlopen: skip debugger notification for DSO loaded from sprof (bug 302=
58)
>    =20
>     Avoid inconsistent state in the debugger interface.

Apologies that I missed that question.

In Debian stable (Trixie), glibc 2.41-12+deb13u1, this error is no
longer present.

I can run all commands of sprof(1), however none produces any content,
i.e. something beyond the header lines. As I'm not a programmer, I
don't know if this is something to worry about.

helge@twentytwo:/tmp$ sprof -p libdemo.so.1 $LD_PROFILE_OUTPUT/libdemo.so.1=
=2Eprofile
Flat profile:

Each sample counts as 0,01 seconds.
  %   cumulative   self              self     total
 time   seconds   seconds    calls  us/call  us/call  name

And no, I don't expect any of the output to be translated, I was just=20
curious to try this out.

If you need any further input from my side, please let me know,
otherwise I'm fine as well.

Greetings

        Helge

--=20
      Dr. Helge Kreutzmann                     debian@helgefjell.de
           Dipl.-Phys.                   http://www.helgefjell.de/debian.php
        64bit GNU powered                     gpg signed mail preferred
           Help keep free software "libre": http://www.ffii.de/

--=_meinfjell-3188269-1770575314-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEbZZfteMW0gNUynuwQbqlJmgq5nAFAmmI1dIACgkQQbqlJmgq
5nCfXQ/+K2y/nhaT3fRw7or6xeWCZneEgenihhLvy69RmvO+6E4PVIwOxnhLasod
+G+VlxohSbzZMxKSiNELeAuDeVI10QsArYhVarztMU7CC8qm31b25zj7LFMGLgV0
7TDQs/U4B9UJ+rJRxs7jhwh2TWSbPgRvTKtgng+umL174oIE0N3AXM3jshAo6vNJ
eU0hcLk0QqRRVBnQeeVnkUxDnboftFjPQyGSuarKMWJ+EZ4ctDfFW4zTSd7lJwJ5
iMPxaY3Wn9vEIIqNXCqMYamOTst5EzqF+PzV4P3mao9kwZ+v70YEnzZEd3n1DyQ7
3GCFtrwwKjUB+gAwlSnyU7+t3ka46CPYomPyzFgUaXZKZKBBj4SCelo2CrJzy3QL
P+BJFB8gE393OQkWkTHusF5wlDn+AM1OEWzhq1E8Wn+XsKXqwidJKR+eB6MyDIjW
85PtHn2vDy1cnzPmGy9/wD3yyVxsxcwPNhi6/HFt64H+8FXkQUeUqL8OL9YA9FTM
jLCLQfgrpU1rKunt/ZMu34MwMXpLDeHu4tV+AP+vMpZTyLcW1XYqOrRiQ6cCaxjS
mRGQEjGPcSFds6myhGc92hms4tMIB9x7kHbNR9uMUXgwkoeWvIL/8uXyBRPJaNyt
MEiQylTyknpDhKOafkD78FSRwWVIykVACEEJ3+Pq/IHy/jSZuNs=
=ciJc
-----END PGP SIGNATURE-----

--=_meinfjell-3188269-1770575314-0001-2--
