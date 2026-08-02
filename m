Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA162BE034
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 11:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785671279; cv=none; b=QZhVeAPMkDZHiv7vT3GFmhBVl8R3mXn75sUKgKSDWZ0YWiQnLn9B0LkuXeXEJjcMgJI3DSQNoxLlla6hLNSeOEBW7n2cQVp5reL44IfGor/aBLM1YqFqrHGPq5p4Pd8dp7ozY8C+Mw5ozGlHqk36lXgnQjGN5LiAAWlwiHqI5qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785671279; c=relaxed/simple;
	bh=E+2aINEHjbSCB+1dGB+Pcf6b0YfoVYbac8a0pyg89q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ou94zoGEppdP/nRmyoNKwza8vKlYE/zDxERWLCsQ+zk3wjUKy+3jUwDjhZLQHAqyUI2Kd3uHq+kHYNER8l2hAQ0XrhuyK8jiOGZAtfsfnvql9ukamNqtre8cDavoT1emu8DpgGrR41FAc9KRNVKQzbcr20hMfKiTFWyByYzF7RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWYQ+RHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWYQ+RHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C456F1F00A3A;
	Sun,  2 Aug 2026 11:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785671274;
	bh=9+s/sg+0AvUB8z22Qf0tP+I7T4SBGBqSK0RhiIP0EK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kWYQ+RHsXUvwAvNlEXcslVAqrDmByZp5gDfWI8L9/W1Adutk5doNNtBPUeYEVSGpO
	 G6i3v2BFb1+meq77AJ4rxIo3FLOi/gmPokw1ReVgUP9Wm9JP8eOaTKmhv72seayplR
	 YJ+o11bHA6o2xFFw/2JDFtR6GlAbkYuHD0f8Hb7n8K82QWM1ntvl5MnaJov3Ybxyam
	 i/ZxWtdAzx9E78wwvs7Ce1C6YGoWDcBtfaYnQZIS3GStpsYE7byur2UxVFlXQlgVb2
	 x6Fl1UX7D4QsP4449ijS58Jvno7piiBJdJd3M5hnyceGc4yeDHQjHnppyCO6NVTDfl
	 3LiVFicl9POpA==
Date: Sun, 2 Aug 2026 13:47:50 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am8tWQ4m2AsEudA_@devuan>
References: <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <87cxw1qokw.fsf@gmail.com>
 <am8nRpn_xeWoHxho@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="punvlblsc5eczsoc"
Content-Disposition: inline
In-Reply-To: <am8nRpn_xeWoHxho@devuan>


--punvlblsc5eczsoc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am8tWQ4m2AsEudA_@devuan>
References: <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <87cxw1qokw.fsf@gmail.com>
 <am8nRpn_xeWoHxho@devuan>
MIME-Version: 1.0
In-Reply-To: <am8nRpn_xeWoHxho@devuan>

Hi Collin,

> > Date: 2026-08-01 18:49:03-0700
> > From: Collin Funk <collin.funk1@gmail.com>
> >
> > But myself and likely many others who have commented on this thread do
> > not agree that strings.h is a bad name. Or that general memory related
> > functions, which are used on strings a large portion of the time, need a
> > separate header.

BTW, this typo reminds me that we have some more evidence.  <strings.h>
has existed for a long time in parallel to <string.h>, and some
functions are documented as being provided by it instead of by
<string.h>.  An example is strcasecmp(3).

In practice, both <string.h> and <strings.h> provide strcasecmp(3):

	alx@devuan:~/tmp$ cat s.c=20
	#include <string.h>

	int
	main(void)
	{
		void *p =3D strcasecmp;
	}
	alx@devuan:~/tmp$ gcc -Wall -Wextra -Wno-unused s.c=20
	alx@devuan:~/tmp$=20

Every now and then, people wonder about this non-standard header file,
but no cats were harmed by that.  Claiming that <memory.h> would be much
different is unreasonable, IMO.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--punvlblsc5eczsoc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpvLmAACgkQ64mZXMKQ
wqk9tA//VrgaF6dEYAAwlF165cstg8mIitHgP/0CM4aiCrSV4MuP5Siw4oGXOWWg
Gb4tKADuFufQTIrkm/gM0EQ4qFPyyzGeDoaoFsVvNcLnp8vocI5zuoHS0e8mWKR1
dNWFK8fb6MgZDDudWtntnnoWKUhzoNOAouzQCkQ5QJOuPe77RhzPiDVvo9ZwRMVo
nFcYSH3YY7Arap2oyy1hF8HEEZE/DJ2k5AhrUeMb0/o8dWFEMAzc9GxuCJLo2Pod
1RWh6KlCVRFJdUWpuu18Yu8Z9cImxyRLhf+36VWDd7V9JaUs2WE1pQjLh9KX5yb5
CWz0tzmHoTNL8zIl9a4OffJ1JkJAVDthgncrlpAhR5HLBmLKGSHyXlUUjK0q4ZEF
n7U0ntXN6S/O230+9WUzyAvmpDLZwG0qYtkPAAH+/1CVSCu4Z42aMRoJUxeiTUtl
B4IOu0MFB6QoVEYpdt/kcENaFdGHwfhfUt+a9PL8X5Vqq5859RxwEBwjRWvws+ua
kDvPQAkJukQ0WzYqvhnZ2vedS87UkZ4OmteGAkpXr2bl1JJlSrHr2h94WCtznu5a
rWcokNy2ROK3GZ3aJwzN9DS3sje5rHpnDTWwdgp9E+uX0WcPnoZGP0Qts1pjVGo2
UbreZ1Y5yVO1FqSa7SWtNe45tL4WQh6BU3AGtnyghidMpPvkPUo=
=8AHW
-----END PGP SIGNATURE-----

--punvlblsc5eczsoc--
