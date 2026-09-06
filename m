Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1999334F27F
	for <linux-man@vger.kernel.org>; Sun,  6 Sep 2026 08:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788683940; cv=none; b=Wa2j0OEKyU4EUD5C8vmlcw/qvclO1gPO6VAqsm4yMu7ARCr1Pv7ex05WKjB1pZ5cXrViwJS1SYJdPE018OQxyf9LY25Nj2xcTLjt5uORYZijTelzJE0VG+561uBNVzA0GMlzzZWLYHKN6ftUaAvSYywTytN4IUftY+fmnB/eCa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788683940; c=relaxed/simple;
	bh=gR2IxZ5juv4tNx++86ktwezu28aMwqT5ZWi/LTAYas8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiwlJ7PZhx11q3ynrknXkXdGQDK6bAAPGz8UJG8CI2e/SULxqEWFpObs1E01q1azBmPGjyplKNBp9uTVY7vwGEV/PhLiPXv1spnuzahTj1qhNKWFFPSADvloSCh8+IdBDwfntrmVnwYIwNQbPRpWgHLCBx9bscTLH+q4izhw+is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJQqpkKj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJQqpkKj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B726B1F00A3A;
	Sun,  6 Sep 2026 08:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788683938;
	bh=eG841upAxaKWTz+9YoXTZ/ed9Ye30Yk/DeU7StkFC0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cJQqpkKj65bwQ3Aflnd3XG6BzJZoFVTfbHLkSVho7d8Oog+0h8fAWfOnfNN8rUvyH
	 FtA75hJ6Zxf7CHIzuG54nHYlHkGdMZ97cRN4kbb2hl88vpjVqzWdojUKcZrpk3aUrR
	 AvKxUguAjkFUkEynEQPFJ7D0EXZBoMiCNZ4Fnnf2Bn95l79um5Bzd9Yc3l5oEeHRKl
	 H01ihyTGBaTmeYnSd+WnGDGxxAwpkNKYXou1VlJcrtO29BVPSPP2E9KOV+Ax1kRTaP
	 gD1An+dvCG6DGkF3h3ZVyGD5s1fu+y43PaPALYV8T1UDR94g4dSOWXJuoJS3lwRj2j
	 v7eYyA02ODkTQ==
Date: Sun, 6 Sep 2026 10:38:55 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it, 
	linux-man@vger.kernel.org
Subject: Re: [LTP] [PATCH v3 00/31] Add sysfs sanity tests
Message-ID: <ap0lzsqRF8Qaaio2@devuan>
References: <20260827112157.1748734-1-chrubis@suse.cz>
 <20260903172419.GL1107507@pevik>
 <20260904084438.GA1189532@pevik>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bpgfap5i7nedvwlq"
Content-Disposition: inline
In-Reply-To: <20260904084438.GA1189532@pevik>


--bpgfap5i7nedvwlq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it, 
	linux-man@vger.kernel.org
Subject: Re: [LTP] [PATCH v3 00/31] Add sysfs sanity tests
Message-ID: <ap0lzsqRF8Qaaio2@devuan>
References: <20260827112157.1748734-1-chrubis@suse.cz>
 <20260903172419.GL1107507@pevik>
 <20260904084438.GA1189532@pevik>
MIME-Version: 1.0
In-Reply-To: <20260904084438.GA1189532@pevik>

Hi Petr,

> Date: 2026-09-04 10:44:38+0200
> From: Petr Vorel <pvorel@suse.cz>
> In-Reply-To: <20260904084438.GA1189532@pevik>
>
> Hi Cyril, Alejandro,
>=20
> also, its nice that only /sys/fs/smackfs and /sys/kernel/cgroup/ are not

This message seems to be in reply to another one, but that other one
isn't quoted, and I can't find it in either mailing list archives.

> covered (both are subsystems are at least somehow covered in LTP).
> =3D> very good test coverage.
>=20
> $ for i in $(grep -h '.I /sys' ../man-pages.git/man/man5/sysfs.5 | cut -d=
  ' ' -f2); do git grep -q $i || echo "$i is missing"; done
> /sys/fs/smackfs is missing
> /sys/kernel/cgroup/ is missing
>=20
> @Alejandro FYI man/man5/sysfs.5 (or other man pages) could be updated, few
> /sys/ directories are missing:

Sure!  Feel free to send patches documenting those, if you know their
interfaces.  (If you start working on that, please let me know, just to
avoid doing stuff that might cause conflicts with your work.)


Have a lovely day!
Alex

> man/man5/sysfs.5 (I haven't found more specific man page)
> /sys/class/ata_device
> /sys/class/bdi
> /sys/class/hwmon
> /sys/class/leds
> /sys/class/thermal
> /sys/class/wakeup
> /sys/devices/system/cpu/vulnerabilities
>=20
> man/man4/loop.4
> /sys/block/loop
>=20
> man/man4/rtc.4
> /sys/class/rtc
>=20
> I'm not sure if these should be documented in man page:
>=20
> /sys/devices/system
> /sys/devices/system/clockevents
> /sys/devices/system/clocksource
> /sys/kernel/mm/ksm
> /sys/kernel/mm/swap
>=20
> Kind regards,
> Petr

--=20
<https://www.alejandro-colomar.es>

--bpgfap5i7nedvwlq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqdJp8ACgkQ64mZXMKQ
wqmlwA/+Kprh2JS7wkiLMG/x1Uc0/+W+QKCmIKSjE5wBgnFuKdM1TJerlbCjkS/3
SnWbd4xiCIpso+UiWYaC8VfWulypjGv9J/3UKvNxaoNTc+3uWHanb6ZEjrruoJgp
xvB4l+rV6HicAjKcLvgJDxCSyEQaZ4uNAAYISoa1pwtSjp06OrbYSq5rT24LAh1q
cqqhJIP0xkkDpl/Vw17Sah90Sc0pOzX1jVV7rkRiKP2G62giK/zVuymSrN4Uu0F+
PJ8Yc6XRC339FeVs0yuU9FLeFpwx3lcr3fNqDvEsX4zRpY34kWAytXiGEO05unyZ
VmJoDRFW800gQ4zTyRgLmZ8udBKRrahEJ9QxZo+RYulcGH/mpgv7N9HMizdK3zMX
ZlYXvyt3dDmGFXwZrn2mWwVM3g5zIu8zfpTXTK/bgqJ8LJxfRqu9L5aadpvw2VA1
8VCT+iUb82vCxoSmVDVFqvBrcL8H5KDNJG82aTR7WgHvQAm/zcAWztATEMCDsy9a
V8loT/ewoq8cvz8XFKIPFbCHIE0PstiTVlFwHBxZj4XEuw2cBOiGnlx/uSoB+zJk
MvoLkW1IPRnDqzIF5bWR2G0JSkvZ0cS+Rh1js2bISqylvXh8OYzNfE0onHoKSivv
+isqhugrY+j30y1Z4xuyLt7antTF20rXpN18EU0e8UESaWNYm+0=
=B/XY
-----END PGP SIGNATURE-----

--bpgfap5i7nedvwlq--
