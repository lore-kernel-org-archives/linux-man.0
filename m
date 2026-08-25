Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DFF3DD86A;
	Tue, 25 Aug 2026 21:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787692853; cv=none; b=bM1rcKGF+5ImiECwkgL2MRzGp3fsb17LotABHOeFCGbBio8B+SIMwoo+Y49UxF/T7uHymeN0kjXQM/IsvXk1eqlmI4PSw/+5nKWjvc/AMLo1eN+B6NuRWd7RuqTr46L7E5jOwc7ncUZNoxF1v7w6fXLpOeU30Ae96RTemwJnxBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787692853; c=relaxed/simple;
	bh=q8RyW/SKuhWy+5E8aF87RiBQLQOs+Ty4h6MIHPoNhTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UieZerDO4JcFIwlSYBumiteui5joaHwf4C/WCeokT2oo2jpNj169yU9WVRiyifxT5ONjW5ASzUpxeBbyMXdO1cqQ1ZO44H8ku2HxpxQDXooE/K0fHX6V7O6vXRg67Tx8WLJyW6lrbPrHyXiPSVj7bYlWps4B//Rls4tCw+qAh4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDXFWSSh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDXFWSSh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08731F00A3D;
	Tue, 25 Aug 2026 21:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787692851;
	bh=Qf8x6KDmM3+K3+5CEUtdeAA+WPz7bTwTCOxZFU6a1uE=;
	h=Date:From:To:Cc:Subject;
	b=GDXFWSShvnXz0Dh9B37cTjsOfu1yLP5gSHKm0ahIXwO/JLyxwgCRMO1USHlRTQWfj
	 9xQy7wH/YXw3JvDn1FAWftqUbxxdNnQ6znLkwvlWAvVlcCyx5EG/kYUB8qeRXFy6Nb
	 6/DhXRWXw69VzcV1j1zCcyT3UTFDbhG8TX4z5IJKeMaKlheKDdw1pSVQPb1UK65Q6p
	 LTo112SVm4kUZ6eilXcyIMTWaxSguDmAITURkcInbbJ/WgJY+f6jqcTxR1gshv8Cv3
	 /rVuSk+KJB/6qo1N06wS7wQPPZFcJowlb4odmjrQVFLgeLMdTV3j5Oq/czlf5NYpQp
	 jZ3gtBEYvee8w==
Date: Tue, 25 Aug 2026 23:20:33 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Subject: man-pages-6.19 released
Message-ID: <ao4EfePDkOlerRgV@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oxqyf3dmxil524bb"
Content-Disposition: inline


--oxqyf3dmxil524bb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Subject: man-pages-6.19 released
Message-ID: <ao4EfePDkOlerRgV@devuan>
MIME-Version: 1.0

Gidday!

I'm proud to announce:

	man-pages-6.19 - manual pages for GNU+Linux

Tarball download:
<https://www.kernel.org/pub/linux/docs/man-pages/>
Git repository:
<https://git.kernel.org/cgit/docs/man-pages/man-pages.git/>
Online PDF book:
<https://www.kernel.org/pub/linux/docs/man-pages/book/>

Thanks to all the contributors to this release (in BCC)!
And thanks to our sponsors!

	$ sort --random-sort <SPONSORS;
	Meta                 <https://www.meta.com/>
	Google               <https://opensource.google/>
	Hudson River Trading <https://www.hudsonrivertrading.com/>

You are receiving this message either because:

        a)  (BCC) You contributed to this release.

        b)  You are subscribed to <linux-man@vger.kernel.org>,
            <linux-kernel@vger.kernel.org>, or
            <libc-alpha@sourceware.org>.

        c)  (BCC) I have information (possibly inaccurate) that you are
            the maintainer of a translation of the manual pages, or are
            the maintainer of the manual pages set in a particular
            distribution, or have expressed interest in helping with
            man-pages maintenance, or have otherwise expressed interest
            in being notified about man-pages releases.
            If you don't want to receive such messages from me, or you
            know of some other translator or maintainer who may want to
            receive such notifications, send me a message.
            If you want to be added to this list (which I store
            encrypted), send me a message.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D NEWS =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

One manual page has been removed (see 'Removed pages' in the change log
below).

Also, we've changed the build system to use POSIX's '::=3D' instead of
GNU's ':=3D'.  Our build system is not portable to POSIX make(1), but this
difference was unnecessary and seemed easy to change.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Linux Software=
 Map =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Begin4
Title:          Linux man-pages
Version:        6.19
Entered-date:   2026-08-25
Description:    Manual pages for GNU+Linux.  This package contains
                manual pages for sections 2, 3, 4, 5, and 7, and
                subsections of those.  Only a few pages are provided in
                sections 1, 6, and 8, and none in 9.
Keywords:       man pages
Maintained-by:  Alejandro Colomar <alx@kernel.org>
Primary-site:   http://www.kernel.org/pub/linux/docs/man-pages
                2.7M  man-pages-6.19.tar.gz
Copying-policy: several; the pages are all freely distributable as long as
                nroff source is provided
End


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in man=
-pages-6.19 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Released: 2026-08-25, Aldaya


New and rewritten pages
-----------------------

man0/
	intro.0					(previously, intro(1))

man1/
	intro.1					(split into two pages)

man2/
	_llseek.2				(previously, llseek(2))
	clone2.2				(previously, clone(2))
	clone.2					(split into two pages)
	exit.2					(previously, _exit(2))
	llseek.2				(moved into _llseek(2))
	quotactl.2				(split into many pages)

man2const/
	Q_GETFMT.2const				(previously, quotactl(2))
	Q_GETINFO.2const			(previously, quotactl(2))
	Q_GETNEXTQUOTA.2const			(previously, quotactl(2))
	Q_GETQUOTA.2const			(previously, quotactl(2))
	Q_GETSTATS.2const			(previously, quotactl(2))
	Q_QUOTAOFF.2const			(previously, quotactl(2))
	Q_QUOTAON.2const			(previously, quotactl(2))
	Q_SETINFO.2const			(previously, quotactl(2))
	Q_SETQUOTA.2const			(previously, quotactl(2))
	Q_SYNC.2const				(previously, quotactl(2))
	Q_XGETNEXTQUOTA.2const			(previously, quotactl(2))
	Q_XGETQSTAT.2const			(previously, quotactl(2))
	Q_XGETQSTATV.2const			(previously, quotactl(2))
	Q_XGETQUOTA.2const			(previously, quotactl(2))
	Q_XQUOTAOFF.2const			(previously, quotactl(2))
	Q_XQUOTAON.2const			(previously, quotactl(2))
	Q_XQUOTARM.2const			(previously, quotactl(2))
	Q_XQUOTASYNC.2const			(previously, quotactl(2))
	Q_XSETQLIM.2const			(previously, quotactl(2))
	UFFDIO_RWPROTECT.2const
	UFFDIO_SET_MODE.2const

man2type/
	dqblk.2type				(previously, quotactl(2))
	dqinfo.2type				(previously, quotactl(2))
	fs_disk_quota.2type			(previously, quotactl(2))

man3/
	_exit.3					(previously, _exit(2)
	bstring.3				(now link to memory.h(3head))
	cfmakeraw.3				(previously, termios(3))
	cfsetspeed.3				(previously, termios(3))
	bzero.3					(split into two pages)
	explicit_bzero.3			(previously, bzero(3))
	fgetc.3					(split into two pages)
	fgets.3					(previously, fgetc(3))
	llseek.3				(previously, lseek64(3))
	lseek64.3				(split into two pages)
	memchr.3				(split into two pages)
	mempcpy.3				(split into two pages)
	memset_explicit.3
	memrchr.3				(previously, memchr(3))
	stpncpy.3				(split into two pages)
	strcasecmp.3				(split into two pages)
	strcasestr.3				(previously, strstr(3))
	strchr.3				(split into two pages)
	strcmp.3				(split into two pages)
	strdup.3				(split into two pages)
	strdupa.3				(split into two pages)
	string.3
	strncasecmp.3				(previously, strcasecmp(3))
	strncmp.3				(previously, strcmp(3))
	strncpy.3				(previously, stpncpy(3))
	strndup.3				(previously, strdupa(3))
	strndupa.3				(previously, strdupa(3))
	strlcpy.3
	strrchr.3				(previously, strchr(3))
	strstr.3				(split into two pages)
	tcdrain.3				(previously, termios(3))
	tcflow.3				(previously, termios(3))
	tcflush.3				(previously, termios(3))
	tcsendbreak.3				(previously, termios(3))
	tcsetattr.3				(previously, termios(3))
	termios.3				(split into many pages)
	wmempcpy.3				(previously, mempcpy(3))

man3head/
	memory.h.3head

man3type/
	termios.3type				(previously, termios(3))

man5/
	ld.so.conf.5
	tunables.conf.5

man7/
	termios.7

man9/
	strscpy.9


Newly documented interfaces in existing pages
---------------------------------------------

man2/
	openat2.2
		OPENAT2_REGULAR
	seccomp.2
		SECCOMP_FILTER_FLAG_TSYNC_ESRCH
		SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV
	userfaultfd.2
		UFFDIO_REGISTER_MODE_RWP
		UFFD_PAGEFAULT_FLAG_RWP

man2const/
	F_GET_SEALS.2const
		F_SEAL_EXEC
	UFFDIO_API.2const
		UFFD_FEATURE_RWP
		UFFD_FEATURE_RWP_ASYNC
		_UFFDIO_SET_MODE
	UFFDIO_REGISTER.2const
		UFFDIO_REGISTER_MODE_RWP
		_UFFDIO_RWPROTECT

man4/
	console_codes.4
		Several xterm(1) codes.

man5/
	proc_pid_fdinfo.5
		int

man7/
	suffixes.7
		.xz
		.zst

man8/
	ldconfig.8
		-t
		/etc/tunables.conf


New and changed links
---------------------

man2/
	__clone2.2				(clone2(2))
	llseek.2				(_llseek(2))

man3/
	_Exit.3					(_exit(3))
	bstring.3				(memory(h.3head))
	cfgetispeed.3				(cfsetspeed(3))
	cfgetospeed.3				(cfsetspeed(3))
	cfsetispeed.3				(cfsetspeed(3))
	cfsetospeed.3				(cfsetspeed(3))
	strlcat.3				(strlcpy(3))
	tcgetattr.3				(tcsetattr(3))


Removed pages
-------------

man2/
	_exit.2					(moved+split into two pages)


Removed links
-------------


Global changes
--------------

-  share/mk/
   -  Use POSIX.1-2008's '::=3D' instead of GNU's ':=3D'.
   -  The <string.h>- and <memory.h>-related manual pages have been
      significantly rewritten.


Changes to individual files
---------------------------

The manual pages and other files in the repository have been improved
beyond what this changelog covers.  To learn more about changes applied
to individual pages, or the authors of changes, use git(1).

--=20
<https://www.alejandro-colomar.es>

--oxqyf3dmxil524bb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqOByEACgkQ64mZXMKQ
wqnVyg//eA7D5KzRy67gi0xVYRzdhJNYwHlQiKb4UCe5cgrFkDiH2TePy9oxMP9k
r+y8AKgizMNuYHJFPiaID3FFQVUAooHxW+vfuI1JISxw39giVRDQIwrGPAsXbDQl
8mfkub6KADYLYbmGGfWPEzXDfdJ0DUWjDRlL0mdzftdds3Tui5TjAvFYwijHGNOa
4W1tSlartIh9BmPWoj00V5N10SVecVLTjqryyty3FQtkLfYj5KAX5F4q3xJJ/EKL
BdkSTtsMqrUPJVbh2ZJ84Wg7dWFeRp7VADK2PW8simhS0LeBUKuBk+xCtTVVr1lS
8LE6O4DsKrIW0GiKswnnx/xQPw8jBd3HH8khzCT/G1Vo9J3E1ACSUMAYvo8azNxx
ttcDizi9z7jGQSIvo3Hn7GIL9zlyFNIU0PKOvNsFiO6F9ka2wCA0NbWsBt7IugCc
wRTRo7Wz4Jzj5SIDUS8Eyv+qwMXnbZKSR3v+t+GZDYqAvjturyNipaMCwLvVAQWL
hSn16/eWSeA/W+NvORZAN9AOih2o0FzvZE3/Bdm7OG5+fOQycYt4go+qw7LNFJfb
MOJNA3ea33KiHiTwAfc9Q/T51dNyxd1eCiy/jKETyBY3o0CQXSU0vpWUFd9R6J82
Y44sKq/7tTaORPuXzjrer1sJwoDGyJM2KAitECzIKQnwVNyQTmk=
=lGTD
-----END PGP SIGNATURE-----

--oxqyf3dmxil524bb--
