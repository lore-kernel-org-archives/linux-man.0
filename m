Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B699843F0BA
	for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 17:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784396821; cv=none; b=AnUi9W5oc+4us/gtbsG+hQGSG7fVJFTxLMwZ7/xCXleGIYqrmBk/T0td8uMjLFIU0mReqWqpgEt/e/jmubuXJIdHo7h8NqLg7rz5TL97d6GaURaaKBKZcDg6iagR4iierSKWfl6aQGovGrqfuFV6G54YWBaXguhJ90HhvAXr7WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784396821; c=relaxed/simple;
	bh=+giGM+jYl1r5u7AGci6V41pfqGNbneC1uj8NX8TrZlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awMmxU3kGSP5X7Z3Ud0IzrAK6egVajAsFu/ADjsGNQ7UQcB+ZJzit8HEgd2kCaGgl769Avl7ZvKSf7XD1IfUco1zk1I6g7DM6iD329jKYBJD1Z1WI4p2UY06s7RvYWVfeB15z4AEL11S+2//LdoZvy76gPZcvBGv1cmHD7cpkQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/tgx7VB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/tgx7VB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703C91F000E9;
	Sat, 18 Jul 2026 17:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784396820;
	bh=9xaiKWrKsnIsNSXEXL2CA8YcD2YEJuepqo/T55rQttk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l/tgx7VBuuUDCDh/TUKbSCwg9Y/GeXUuY8/Slafyssf4WRDcXh3lUmnLSmQvQrh9e
	 VWZIL5ziGybQRz94YHtV8Wk1yZRNbMR9O/3jQhCP3xZhGWhbXasSvs4/wUYvta6eZs
	 QZaU+y7ukGuHWbj8xwEmNEYYZEStEPcTuz8q3mm/yyQZ9EBigzQjVQIBEwAhxaPf60
	 kGECsn34eci1rWnACPFUamH0qqjV18O4nE4Oy8ZcTdyDIZbcTgm4U4dvGjWZTHVAHR
	 s3sNqLprRr3p4dozbIZTsQrP7i/NxrsibqHLQEWChx3D7YQHnpDZzGjj3DpoQWk13J
	 63W7YWT7S6tXQ==
Date: Sat, 18 Jul 2026 19:46:57 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?P=C3=A1draig?= Brady <P@draigbrady.com>
Cc: coreutils@gnu.org, linux-man@vger.kernel.org
Subject: Re: Hand-written manual pages for GNU coreutils
Message-ID: <alu6W-eLOScmLJ3p@devuan>
References: <aluIbrKBtAxweITC@devuan>
 <9d03b838-eec1-499b-a55f-047cc7e2ef92@draigBrady.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j2pn4ijxvelsxlzg"
Content-Disposition: inline
In-Reply-To: <9d03b838-eec1-499b-a55f-047cc7e2ef92@draigBrady.com>


--j2pn4ijxvelsxlzg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?P=C3=A1draig?= Brady <P@draigbrady.com>
Cc: coreutils@gnu.org, linux-man@vger.kernel.org
Subject: Re: Hand-written manual pages for GNU coreutils
Message-ID: <alu6W-eLOScmLJ3p@devuan>
References: <aluIbrKBtAxweITC@devuan>
 <9d03b838-eec1-499b-a55f-047cc7e2ef92@draigBrady.com>
MIME-Version: 1.0
In-Reply-To: <9d03b838-eec1-499b-a55f-047cc7e2ef92@draigBrady.com>

Hi P=C3=A1draig,

On 2026-07-18T18:02:43+0100, P=C3=A1draig Brady wrote:
> On 18/07/2026 16:13, Alejandro Colomar wrote:
> > Hi!
> >=20
> > I've started working on improving the quality of the manual pages for
> > coreutils, as I promised some time ago I'd do.  The work is --for the
> > moment-- in the 'coreutils' branch of the Linux man-pages repo.  Once
> > I finish, they won't be auto-generated from --help anymore.
> >=20
> > <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/log/?h=3Dc=
oreutils>
> >=20
> > We'll talk about incorporation to the coreutils.git repo later.
>=20
> For reference, it was previously discussed at:https://lists.gnu.org/archi=
ve/html/coreutils/2025-09/msg00151.html
> For clarifications on any details, please see the full documentation
> for any command at the link at the bottom of the coreutils man page.
>=20
> E.g. `man vdir` references https://www.gnu.org/software/coreutils/vdir

The link doesn't work for me at the moment, but I've found the
differences between ls/dir/vdir here:
<https://unix.stackexchange.com/a/344222/341413>.

>=20
> Also note that since v9.10 each coreutils man page has deep links
> from each option in the man page to the corresponding description
> in the full documentation.  That is something that could be maintained
> in any forked man pages.

Yup, I noticed that a moment ago.  I'll keep those links.  :)

I've done the initial import with this:

            $ dpkg -l coreutils \
                    | tail -n1;
            ii  coreutils      9.10-1devuan1 amd64        GNU core utilities
            $ apt-file show coreutils \
                    | grep man1/ \
                    | cut -f2 -d' ' \
                    | xargs -I{} find {} -type f
                    | xargs cp -t man1/;
            $ apt-file show coreutils \
                    | grep man8/ \
                    | cut -f2 -d' ' \
                    | xargs -I{} find {} -type f
                    | xargs cp -t man8/;
            $ find man -type f \
                    | grep '\.gz$' \
                    | xargs gunzip;

It's 9.10, so I guess it has everything.  If there's any page that is
not available in Devuan, or there's any change in git that you haven't
released yet and want to include, just let me know.


Have a lovely day!
Alex

> cheers,
> Padraig

--=20
<https://www.alejandro-colomar.es>

--j2pn4ijxvelsxlzg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpbvAoACgkQ64mZXMKQ
wqnbBxAAmQ5ecDcg24Y5AnYTsd1wVqV0GkJnyPwNVTjKB7LRwQa9I43OuVJq+n1b
wdzN3jlDa3fOWiV1J8JAhuSyXvOLHp6WjT919g0bqDi+GjNdbkTerE+crecWh2zi
6D3/Usns1lrDt4V9KLj5E819kKH+0QBo4+ztQOdY0JIxPhyapzPgCBWd/A6LRdC9
2KfehPcucKLA62EVuXNEpF7vsx3XZUhw7c/AHGNivjs2/kUnoTccAMZoxFHnweRa
eoJR5z1JAzRWzKNGlYsIm1OiMUjph9tc9RKWfyKMsHtj1/eNjZMKRwG8vNN4ooF/
hL2gePd9KWYdNxY7y07upQcns2xFsNP8DDSRI/NRadhqKtKSuauoeTi2iqkZ8fJ5
lvg25hj4om3+LTNVjw6ycTKAbgPLpLThKbaQUZWUc/CxJzyTJiP9zcL/HutXHoqB
jWnss64LnXBVGRixakzYOplGsHIAdZnjGQwQ0P9IjBs5K4U1TQrkL8HSOcCtuzD6
d+VBp52sr07Glf2BHkDAwx+Kr6ttA16xM1wg7A+sywa35aBMd+nXZnnZTmPNkTv/
MmrNk8FJFNa5EOe4W91hKIY6lUwBTZGclQFM+NpeQQazuWubQOxI4+PcmFzKmEed
47UP42JintSMQSIwUFz5pqVXSVz+XW1YmeZChnQforEbvol4Xg0=
=AtPn
-----END PGP SIGNATURE-----

--j2pn4ijxvelsxlzg--
