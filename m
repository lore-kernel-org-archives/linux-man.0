Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206B5330B14;
	Wed, 22 Apr 2026 20:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776888303; cv=none; b=Kw7atRjQXxIq54D+Z4wosZ1OzQisKcU8gGT4zZfizFvSeCk2tK0I4R04QtxKwgMLydPu6RCxSlGkE397PbFXxtL1atKmEFDfI1rtLhumennnmo3ko/+Um3XUQGPmh7kMk8XHAbCJEAJZKjM0qc+AUY4gekCdYmrAq8d8rz8JE6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776888303; c=relaxed/simple;
	bh=wLvqoEm4PtAr+icPh3dgc2hv8RUzSjvHvFBqMMBrstY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jp2NGSZpmVosQwvPODxxYoTjkC90jdMlg8FaLg5KxJAijZA0D3Fljn2hzzsDEzSLlO2rvM6m+bxhVn7Q9E5m8mGb/+mIqceG1wva2jq4LQn/y7i+F0ttsn5RRun/MB/jbJCMWVW+gZMxaRjuOm4YkQh04VuI7gK1bseXn9S3XII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vjh9lxhv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vjh9lxhv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BCFC2BCB8;
	Wed, 22 Apr 2026 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776888303;
	bh=wLvqoEm4PtAr+icPh3dgc2hv8RUzSjvHvFBqMMBrstY=;
	h=Date:From:To:Cc:Subject:From;
	b=Vjh9lxhv2b8YgOF1Mzawvc48Fiq4fnMK2s2VExKE/0l2yeN73ZdVHcgZEJpNcJleI
	 0MbIqoFiVFimP2+2IcizBh6bZYcb0F83fOlsXg2orBX4XkV3Y+6xVC37HgGdh8kVzT
	 aF0LwKh9FbboACqlyfdq6HrWHvAuLIfRqa3/8wi+QhPkblPNIcOQ1qbBZQZoWO9iPL
	 uRrCALU29X11o+bK/acSEOIuEzFD6qIPZuXsM2JM7n56zq3QMlbRBEa9CQLPD5YAaj
	 ZURIn36ffayZAtXxT9DDrYu/w87uC4tQZbnpJ5vSU78CYL9swezXQ15Zeu6xRLLc+G
	 dNHqapNJXsFAw==
Date: Wed, 22 Apr 2026 22:04:52 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Subject: man-pages-6.18 released
Message-ID: <aekjQuAEaq1ILKAa@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4vd5mybzc3schzk5"
Content-Disposition: inline


--4vd5mybzc3schzk5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Subject: man-pages-6.18 released
Message-ID: <aekjQuAEaq1ILKAa@devuan>
MIME-Version: 1.0

Gidday!

I'm proud to announce:

	man-pages-6.18 - manual pages for GNU+Linux

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
	Hudson River Trading <https://www.hudsonrivertrading.com/>
	Google               <https://opensource.google/>

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

Not much in this release.  It's actually a quite boring release, which
is good for packagers.  Nothing they should care about.

BTW, distros have started packaging the scripts provided in the previous
release (Debian and Arch already provide manpages-bin).


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Linux Software=
 Map =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Begin4
Title:          Linux man-pages
Version:        6.18
Entered-date:   2026-04-22
Description:    Manual pages for GNU+Linux.  This package contains
                manual pages for sections 2, 3, 4, 5, and 7, and
                subsections of those.  Only a few pages are provided in
                sections 1, 6, and 8, and none in 9.
Keywords:       man pages
Maintained-by:  Alejandro Colomar <alx@kernel.org>
Primary-site:   http://www.kernel.org/pub/linux/docs/man-pages
                2.7M  man-pages-6.18.tar.gz
Copying-policy: several; the pages are all freely distributable as long as
                nroff source is provided
End


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in man=
-pages-6.18 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Released: 2026-04-22, Aldaya


New and rewritten pages
-----------------------

man2/
	futex_waitv.2

man3/
	aprintf.3
	io_destroy.3			(previously, io_destroy(2))
	io_setup.3			(previously, io_setup(2))
	rawmemchr.3			(previously, memchr(3))
	stpcpy.3			(previously, strcpy(3))
	strchrnul.3			(previously, strchr(3))
	strdupa.3			(previously, strdup(3))
	strnul.3
	strtok_r.3			(previously, strtok(3))


Newly documented interfaces in existing pages
---------------------------------------------

man2/
	landlock_create_ruleset.2
		struct landlock_ruleset_attr::scoped
		LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF
		LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF
		LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON
		LANDLOCK_CREATE_RULESET_ERRATA
	landlock_restrict_self.2
		LANDLOCK_RESTRICT_SELF_TSYNC
	statmount.2
		req.mnt_ns_id
		STATMOUNT_MNT_NS_ID
		STATMOUNT_MNT_OPTS
		STATMOUNT_FS_SUBTYPE
		STATMOUNT_SB_SOURCE
		STATMOUNT_OPT_ARRAY
		STATMOUNT_OPT_SEC_ARRAY
		STATMOUNT_{UIDMAP,GIDMAP}
		STATMOUNT_SUPPORTED_MASK
		req.mnt_ns_fd
		STATMOUNT_BY_FD
	truncate.2
		ENOSPC

man3/
	printf.3
	scanf.3
		%wN

man5/
	core.5
		%f
		FC

man7/
	landlock.7
		LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF
		LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF
		LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON
		LANDLOCK_CREATE_RULESET_ERRATA
		LANDLOCK_RESTRICT_SELF_TSYNC

New and changed links
---------------------

man3/
	strndupa.3			(strdupa(3))
	vaprintf.3			(aprintf(3))


Global changes
--------------

-  man/
   -  man3/
      -  Document how string functions relate to each other.
   -  Separate documentation of system calls and of libaio wrappers.


Changes to individual files
---------------------------

The manual pages and other files in the repository have been improved
beyond what this changelog covers.  To learn more about changes applied
to individual pages, or the authors of changes, use git(1).

--=20
<https://www.alejandro-colomar.es>

--4vd5mybzc3schzk5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmnpKdIACgkQ64mZXMKQ
wqlWtQ//QXXOLXbnnQ/TCgH/JraGYTsN+nQVUHssFt2xrtw6+28mUkDfVMMZP3ZJ
Aw95htNh3I/w5jFbJsmDwB6L54sVAMM+l00kPpHYFpDT+CiXxwkvAf2fepd3ykRK
6RaHvEOyQoeLakF2rnwQGlyc/kUgI3MUNXyrFampApNGLa/NfmmO57bITUOUyefb
Mi4k1yCXOiRvjS9GUguWtEOJslwcBRyW9rG1NgO+R4mMn/QvN0LtVg/zCLqcLWDn
hhxq2MZI/Vrr2Ktt8hhs6htdQJBZjLN9kkVgVH4KMSbBHPhdrFzCbNuxccnDLbY5
DTCgEevLdmK8OSNrYtBoiolFQB1gHY/u/wxkzas4yJXPgc1nVpFsJPBcuFec+4nz
ikHWaNqVJeoYhtAPgyfiylc46Lv3URNGKL0NE7RKZI/2UjBG0VBnpZT4sPmgll7u
4ehy/ayLtzG9Ql6yekvJ+XWTQL9KMhSEDOk9cZtkj41Dx4wm6H7c1c4lx+eRsny9
SqpTqB+14KmpkHnlHpsnH91g0fRXMPxQo0EtWJE7LTpvSbyou4GEj2l4pYNWG3+Q
ALuNgiN9RNffs3umSnbl2gY/kpfs18tJptrRa3l5R4UDAmaiC8Lszd8pRsGRkVRY
QrxGnHgyn1Vps7BN5Es1GRW4B1qJPegH13s8Iyp0SU7hwmEYw5k=
=Be46
-----END PGP SIGNATURE-----

--4vd5mybzc3schzk5--
