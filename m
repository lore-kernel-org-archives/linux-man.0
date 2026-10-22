Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687505;
	b=OZbVDBn93C3zR/ElJgDmfXLRbW+z//zhNMtXLdANRN3tjfBRiC4cbIa0yczdZJp8CQFH
	 NU019uGH2OfMtpSn2WmdBQ4aA2JLQnSogwNGYzOJ07sXPtffF9BBRWyxa/KO7SIEDAywH
	 ax33EtuM61BLtBjelGYK6AmyUQWdlfxpanE4BraJQDaKnuNExc95jmmEcRpLYfSkCwrQ7
	 hgIsFdepyK3Cqrsr9dBDNLDKExEz04O+hDMsmH+a+QU20d5z3leGK1ZpV0wtllTmO6D15
	 Dwnv8dmEDedPAHymXELok2xw1Hvic582xwg9lGCiLZHm3EVjAAiNc2Q2Z/CFpJ0tXtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687505;
	h=Received:DKIM-Signature:Date:From:To:List-Id:Cc:Subject:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Disposition;
	bh=m8V3e6wLA4KAIy+/cxpR6N2CHKY7pONmrrr+xl+Vwiw=;
	b=5JPi+VtU44297G4jUklzkrFdDPyJcyGMQ3PPn5fZsyWd0M2VamIP9uJDLxWM5Xenb8ZE
	 e2mEEurfTniOFZx/aXZg5h/brNV599z2HgOLPbe0Go5+aoe7R9OWwgpTsOhhJUt6MivRD
	 KOqiqv9mP2IHOXBb33WJOOwtTFI1d7a5Itzbzf9Fd2PjdOwpRZ8YE8z8GFCrPBREQ0Ls0
	 Hp68uktV7ndJU+SpeNynzPWF0j9EdS0MFcay2gO0o6eZJs4iUYvj+H6IIXVMe5F8kDAjq
	 pdSuncC6m3oDbbbWGLyRkJ7eD60tbrrj+Z/zPMrsJSUzpKI5yFLk3Drf3/cM/eAC1xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e79ICAiA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BE7606A31E
	for <linux-man@vger.kernel.org>; Thu, 22 Oct 2026 16:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e79ICAiA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBB61F01825;
	Thu, 22 Oct 2026 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792687504;
	bh=m8V3e6wLA4KAIy+/cxpR6N2CHKY7pONmrrr+xl+Vwiw=;
	h=Date:From:To:List-Id:Cc:Subject;
	b=e79ICAiATiL8wO12x5vyHO5UN1UIncoJ4xd+uQXZcn3MHy8QdoOnbwaWKbpEu64LM
	 a7HoreSBEZQgHJuxucTboGaWGzoQyMnTYWq89yGRZqz/61A/FOtrmx8yygymoeZNAl
	 6qw2Sdm+DSnD6LTvAvtvDx70L/3kNKWdosLdhMb2xFq1H8Gg6fLiTlsoIvS+Ui0Gmm
	 R/dXpqPDsxZFbZlEsm+hUafgFkpvL74cNS/gxQmMT1MKDRNFE+zkCkdnc8KtoUKdth
	 zPjXNzwhNy0kwa+tp/HMyTMhiGDubJq2shE4E1qNTQbNrY/on5BjkUN5qJ3rB5qKWz
	 Yh0VQC8Ya2lOw==
Date: Thu, 22 Oct 2026 18:44:55 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <jsm28@cam.ac.uk>, Martin Uecker <uecker@tugraz.at>, 
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z4rya2ejegoayq7o"
Content-Disposition: inline


--z4rya2ejegoayq7o
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
List-Id: <linux-man.lore.kernel.org>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <jsm28@cam.ac.uk>, Martin Uecker <uecker@tugraz.at>, 
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
MIME-Version: 1.0

=46rom: Alejandro Colomar <alx+linux-man@kernel.org>

=46rom: Alejandro Colomar <alx@kernel.org>

I'm not fully convinced of this patch.  But I'm open to being convinced.
I've written the patch, as Michael asked me to do, but am willing to
hear everyone's opinion before applying the patch.

As Michael reminded me recently, and as I've defended in other cases, it
is true that the SYNOPSIS of the manual pages does not need to be
strictly valid C.  It only needs to be useful enough for readers to
understand the interface.  Thus, if using lengths without declaring them
would improve the usefulness of the documentation, even if becoming
invalid C, it would be okay.

However, I still have doubts, because this change comes with risks:

Programmers might think it is valid C to refer to parameters that have
not been declared yet, and use that in their code, and if they are
unlucky, it might compile for them, which might result in UB at some
point.

One valid point is that this is rather unlikely to happen, and most of
the time it will just result in a compiler error, because no global
variables with the name of the parameter exist.

However, with local (nested) functions, this might be easier to happen,
as variables declared in the outer function are more likely to share a
name with a length parameter.  Given that the C Committee is working
hard to standardize local functions, it might be a very bad idea to have
this combination of events going on.

Concerns that have been raised against using the GNU C syntax in the
manual pages:

Very very few programmers know this syntax, and thus they are confused
when reading it for the first time.

This is obviously true.  However, this is true of any innovative syntax.
We should consider whether the confusion is dangerous or not, and
whether programmers can learn it easily or not.

I believe once you've been exposed to this syntax, after some research,
or asking the right people, one would easily learn to read it, and then
we'd have overcome the issue.  I don't think the syntax is inherently
difficult to understand once you've seen the documentation and seen it
a few times.

Also, this syntax is not very dangerous: a programmer thinking
that a forward declaration is actually a normal parameter will pass a
wrong number of arguments to the function, and thus will have compiler
errors.  This syntax is quite robust, as it requires several bugs to
happen in the same code to pass compilation silently.  If one replaces
';' with ',', the parameter will be declared twice, which is an error.
If one renames a forward declaration, it will not match a parameter, and
will result in a compiler error.  Only if both mistakes happen at once,
the compilation would pass, but then the call sites would also have to
match the bogus declaration.  And also, the function definition would
have unused parameters, which would trigger diagnostics.  So, concerning
safety, this feature is not very dangerous, even if used by someone who
is very confused.

Do we think programmers are unable to ever learn this new syntax?
Are we ready to accept the risks of using the dangerous invalid syntax,
but which is more intuitive to programmers?

Reported-by: Michael Kerrisk <mtk.manpages@gmail.com>
Not-yet-Signed-off-by: Alejandro Colomar <alx@kernel.org>
---

I've cut the diff below to just a single page, because this is just for
discussion; the actual diff is huge and uninteresting.  It's just a
removal of all uses of fwd decls of parameters in the manual pages.


Have a lovely day!
Alex

 man/man2/add_key.2                       |  2 +-
 man/man2/alloc_hugepages.2               |  2 +-
 man/man2/cacheflush.2                    |  2 +-
 man/man2/epoll_wait.2                    |  6 +++---
 man/man2/futex_waitv.2                   |  2 +-
 man/man2/get_mempolicy.2                 |  2 +-
 man/man2/getdents.2                      |  2 +-
 man/man2/getdomainname.2                 |  4 ++--
 man/man2/getrandom.2                     |  2 +-
 man/man2/getsockopt.2                    |  4 ++--
 man/man2/getunwind.2                     |  2 +-
 man/man2/getxattr.2                      |  6 +++---
 man/man2/init_module.2                   |  2 +-
 man/man2/listmount.2                     |  2 +-
 man/man2/lookup_dcookie.2                |  2 +-
 man/man2/madvise.2                       |  2 +-
 man/man2/mbind.2                         |  2 +-
 man/man2/mincore.2                       |  2 +-
 man/man2/mlock.2                         |  6 +++---
 man/man2/mmap.2                          |  4 ++--
 man/man2/modify_ldt.2                    |  2 +-
 man/man2/mprotect.2                      |  4 ++--
 man/man2/mremap.2                        |  2 +-
 man/man2/msgop.2                         |  4 ++--
 man/man2/msync.2                         |  2 +-
 man/man2/outb.2                          | 12 ++++++------
 man/man2/perfmonctl.2                    |  2 +-
 man/man2/pread.2                         |  4 ++--
 man/man2/query_module.2                  |  2 +-
 man/man2/read.2                          |  2 +-
 man/man2/readlink.2                      |  4 ++--
 man/man2/recv.2                          |  4 ++--
 man/man2/recvmmsg.2                      |  2 +-
 man/man2/remap_file_pages.2              |  2 +-
 man/man2/s390_pci_mmio_write.2           |  4 ++--
 man/man2/send.2                          |  4 ++--
 man/man2/sendmmsg.2                      |  2 +-
 man/man2/setxattr.2                      |  6 +++---
 man/man2/write.2                         |  2 +-
 man/man2const/KEYCTL_DESCRIBE.2const     |  2 +-
 man/man2const/KEYCTL_DH_COMPUTE.2const   |  2 +-
 man/man2const/KEYCTL_GET_SECURITY.2const |  2 +-
 man/man2const/KEYCTL_INSTANTIATE.2const  |  4 ++--
 man/man2const/KEYCTL_READ.2const         |  2 +-
 man/man2const/KEYCTL_UPDATE.2const       |  2 +-
 man/man2const/PR_GET_AUXV.2const         |  2 +-
 man/man3/aio_suspend.3                   |  2 +-
 man/man3/arc4random.3                    |  2 +-
 man/man3/backtrace.3                     |  6 +++---
 man/man3/bcmp.3                          |  2 +-
 man/man3/bcopy.3                         |  2 +-
 man/man3/bsearch.3                       |  2 +-
 man/man3/bzero.3                         |  2 +-
 man/man3/cfree.3                         |  4 ++--
 man/man3/confstr.3                       |  2 +-
 man/man3/des_crypt.3                     |  4 ++--
 man/man3/explicit_bzero.3                |  2 +-
 man/man3/fgets.3                         |  2 +-
 man/man3/fgetws.3                        |  2 +-
 man/man3/fmemopen.3                      |  2 +-
 man/man3/fread.3                         |  4 ++--
 man/man3/getcwd.3                        |  2 +-
 man/man3/getdirentries.3                 |  2 +-
 man/man3/getentropy.3                    |  2 +-
 man/man3/getgrent_r.3                    |  4 ++--
 man/man3/getgrnam.3                      |  4 ++--
 man/man3/gethostbyname.3                 | 10 +++++-----
 man/man3/getipnodebyname.3               |  2 +-
 man/man3/getlogin.3                      |  2 +-
 man/man3/getmntent.3                     |  2 +-
 man/man3/getnameinfo.3                   |  2 +-
 man/man3/getnetent_r.3                   |  6 +++---
 man/man3/getprotoent_r.3                 |  6 +++---
 man/man3/getpwent_r.3                    |  4 ++--
 man/man3/getpwnam.3                      |  4 ++--
 man/man3/getrpcent_r.3                   |  6 +++---
 man/man3/getservent_r.3                  |  6 +++---
 man/man3/getspnam.3                      |  8 ++++----
 man/man3/inet_net_pton.3                 |  4 ++--
 man/man3/inet_ntop.3                     |  2 +-
 man/man3/lio_listio.3                    |  2 +-
 man/man3/lsearch.3                       |  4 ++--
 man/man3/mblen.3                         |  2 +-
 man/man3/mbrlen.3                        |  2 +-
 man/man3/mbrtowc.3                       |  2 +-
 man/man3/mbsnrtowcs.3                    |  2 +-
 man/man3/mbsrtowcs.3                     |  2 +-
 man/man3/mbstowcs.3                      |  2 +-
 man/man3/mbtowc.3                        |  2 +-
 man/man3/memccpy.3                       |  2 +-
 man/man3/memchr.3                        |  2 +-
 man/man3/memcmp.3                        |  2 +-
 man/man3/memcpy.3                        |  2 +-
 man/man3/memfrob.3                       |  2 +-
 man/man3/memmem.3                        |  2 +-
 man/man3/memmove.3                       |  2 +-
 man/man3/mempcpy.3                       |  2 +-
 man/man3/memrchr.3                       |  2 +-
 man/man3/memset.3                        |  2 +-
 man/man3/memset_explicit.3               |  2 +-
 man/man3/mq_receive.3                    |  4 ++--
 man/man3/mq_send.3                       |  4 ++--
 man/man3/posix_madvise.3                 |  2 +-
 man/man3/pthread_attr_setstack.3         |  2 +-
 man/man3/pthread_setname_np.3            |  2 +-
 man/man3/ptsname.3                       |  2 +-
 man/man3/qsort.3                         |  4 ++--
 man/man3/random.3                        |  2 +-
 man/man3/regex.3                         |  2 +-
 man/man3/resolver.3                      | 24 ++++++++++++------------
 man/man3/setaliasent.3                   |  4 ++--
 man/man3/setbuf.3                        |  4 ++--
 man/man3/setnetgrent.3                   |  2 +-
 man/man3/snprintf.3                      |  4 ++--
 man/man3/stpncpy.3                       |  2 +-
 man/man3/strerror.3                      |  4 ++--
 man/man3/strfmon.3                       |  4 ++--
 man/man3/strfromd.3                      |  6 +++---
 man/man3/strftime.3                      |  4 ++--
 man/man3/strlcpy.3                       |  4 ++--
 man/man3/strncat.3                       |  2 +-
 man/man3/strncpy.3                       |  2 +-
 man/man3/strndup.3                       |  2 +-
 man/man3/strndupa.3                      |  2 +-
 man/man3/strxfrm.3                       |  2 +-
 man/man3/swab.3                          |  2 +-
 man/man3/ttyname.3                       |  2 +-
 man/man3/unlocked_stdio.3                |  8 ++++----
 man/man3/wcpncpy.3                       |  2 +-
 man/man3/wcsncat.3                       |  2 +-
 man/man3/wcsncpy.3                       |  2 +-
 man/man3/wcsnrtombs.3                    |  2 +-
 man/man3/wcsrtombs.3                     |  2 +-
 man/man3/wcstombs.3                      |  2 +-
 man/man3/wmemchr.3                       |  2 +-
 man/man3/wmemcmp.3                       |  2 +-
 man/man3/wmemcpy.3                       |  2 +-
 man/man3/wmemmove.3                      |  2 +-
 man/man3/wmempcpy.3                      |  2 +-
 man/man3/wmemset.3                       |  2 +-
 man/man3/wprintf.3                       |  4 ++--
 man/man7/man-pages.7                     |  2 +-
 man/man7/string_copying.7                | 16 ++++++++--------
 man/man9/strscpy.9                       |  2 +-
 144 files changed, 228 insertions(+), 228 deletions(-)

diff --git a/man/man2/add_key.2 b/man/man2/add_key.2
index 19bc5d40ae76..908c63a10fbb 100644
--- a/man/man2/add_key.2
+++ b/man/man2/add_key.2
@@ -14,7 +14,7 @@ .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
 .P
-.BR key_serial_t\~add_key( size_t\~size;
+.B key_serial_t\~add_key(
 .BI "                     const char *" type ", const char *" description ,
 .BI "                     const void " payload [ size "], size_t " size ,
 .BI "                     key_serial_t " keyring ");"
--=20
2.55.0


--z4rya2ejegoayq7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmraPYcACgkQ64mZXMKQ
wqlyXxAAlt4fgoYV7G+eCFw+XAfvhE6Dth8le0y5f5Y9qjL+l+HCJUTKJ27ZxZF/
TTeA9nK0YOf+nfW53i0mS/KoCifsj0puo2NkqM6zgu1T0OtL6/rmm89E19t/JiOB
lccrYIW7aaDSARFxeIiRfJ3qYcSCKTvOTaKXtIRFV2ymEDeeDvCvzcp0K7Y4DtmA
0u7jMiboMaxoEDmQz/qoutJInAkDAszJdx0wPn4d+8pYHhmW/42Bq97YrHJqzNpz
a0CuucGFyv5DhnScdGt1XyWBfW8TnIf5guB1h3MCkcyWq/Ysvo62adS+8t5e0YlE
Unb7yASUGk8NgCedhKncBtf9b3MslZxS80kr7eoSNwlZDV1kNIk3ac8vK68USifU
Uca0y2pf8M9Ao7fJg8XnmVUhAF/ybKak/TaqdfUDRE+clsieREI5iFPlXkj8z1fj
CDs0ZiknCJ+EMPfyhzuLdm03akSTHDWcDvIZvrBLileTEwJ61ruQkBgdCon/9dLW
kAEbjKO19ADI+1N2JNIlNN9p3zSeGC4ofr9LUwr/9N9Mh+xD9BrCvSE+7rgNzuqr
+8gSbiUjSq0ZuX54BHtAp7AeAPn4i+vNzoITsZpqPAwpCgGRyGPKiFT1wzHb7w49
LGy8foTNd6lVTScMlO1Q5htxNsASjtSJJRmZJYWYms4E2vFWpvQ=
=bZRQ
-----END PGP SIGNATURE-----

--z4rya2ejegoayq7o--
