Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428834AEBF7
	for <linux-man@vger.kernel.org>; Wed, 16 Sep 2026 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556384; cv=none; b=gsCqriyN7PY6L24/5I82vF4hqtxhHCZ0yX3wGjsz3/0r9toDYPdYaur7jOcL+YLEZm/2DUSusREMYdLTVpGW6Cq+JnuXn23XkrRwqX9AuIS2QLEr9u7fFwpWUiHC+9XdCGgb3gBSrlwSQHbvfENnbVVOp3YBu9ruMPNRgvpU3y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556384; c=relaxed/simple;
	bh=cITq/rvX5VhZALa65Ru74VkDeMZG4GtYpABJY94+NzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pt1kv0CRZLFZInX02OUCcLVcqitZvMd2Z3zdMlpQiRK/Wk8Jmo+tmtcs0+VSx5Umc3TqyKoemNk6NJgD3fK6ejt3WBJ1OADFlGBH4rAsggWps2ZwGz3p9uZ2QTTMNP9HK1XeOW9PFEMdPULk5JtIMVmYOrLd4fFi+zmnRXyaQGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUcQkjhc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUcQkjhc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0671F000FF;
	Wed, 16 Sep 2026 10:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789556351;
	bh=co04EkG/dxwUD4h+DoX05m18qm3fOFYt1iFaTVXvMmw=;
	h=Date:From:To:Cc:Subject;
	b=mUcQkjhcvob6F3R1AsvnMpvY2rXykXvIwnW73cP0zNG12IRgoIdeMZVHI7QBtD9XV
	 fFkbheFEbDWnuFgpoQJ+YbhgpWrN5wR2eWqzR5MbiXDwFuijHvF4/CUdhJX+P9kQLD
	 WC81kPu7MZDfZmtz1aJWgvCKpb7NqEHAseNTs6iPTo7rTrSR9f1+8dk3WSB1f0GoJ2
	 4PT8RNqsaO4qppvnce/NP8QE7rtfw+haRCGjkDFO1v9ejWQDy7saLN0ZmzkPfGDoCw
	 gCa+rviGQHXNlOFDf5YmE65Jzusek2FUydVTycJV+ZcPmWVh2GyVqMbnE5CQtYGSKw
	 FcREI/VhDIAuQ==
Date: Wed, 16 Sep 2026 12:59:07 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH] GNUmakefile, share/mk/: uninstall*: Remove targets
Message-ID: <46745655906de42e1f7a42a5dc0c1e5e3b78a2ef.1789556319.git.alx@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ebd6jgrgx5q5buk7"
Content-Disposition: inline


--ebd6jgrgx5q5buk7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH] GNUmakefile, share/mk/: uninstall*: Remove targets
Message-ID: <46745655906de42e1f7a42a5dc0c1e5e3b78a2ef.1789556319.git.alx@kernel.org>
MIME-Version: 1.0

These are quite unreliable.  They are only able to remove a file that
would be installed in the current version of the project, but some files
=66rom previous versions that don't exist anymore will not be uninstalled.

Users should install through their package manager, which allows easy
uninstallation, or if they install from source, they should install in
a directory that fully and exclusively contains the installation, so
that uninstalling is as easy as removing that directory (/opt/ is quite
suitable for this).

By removing this brittle set of targets, we don't give the false
impression that we can reliably unsinstall what we installed.

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 GNUmakefile                  |  1 -
 share/mk/install/_.mk        |  8 --------
 share/mk/install/bin.mk      |  4 ----
 share/mk/install/html.mk     |  4 ----
 share/mk/install/man.mk      | 16 ----------------
 share/mk/install/pdf/_.mk    |  3 ---
 share/mk/install/pdf/book.mk |  4 ----
 7 files changed, 40 deletions(-)

diff --git a/GNUmakefile b/GNUmakefile
index f8b3add5b325..9f3ced6f461b 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -62,7 +62,6 @@ help:
 	$(info	$(INFO_)	install-all		Install everything)
 	$(info	$(INFO_)	lint			Lint the source code)
 	$(info	$(INFO_)	nothing			Do nothing; useful for debugging)
-	$(info	$(INFO_)	uninstall		Uninstall everything (might leave traces))
 	$(info	)
=20
=20
diff --git a/share/mk/install/_.mk b/share/mk/install/_.mk
index 3e7fa2e523eb..82c0594e3a33 100644
--- a/share/mk/install/_.mk
+++ b/share/mk/install/_.mk
@@ -7,17 +7,12 @@ MAKEFILE_INSTALL_INCLUDED ::=3D 1
=20
=20
 include $(MAKEFILEDIR)/configure/build-depends/coreutils/install.mk
-include $(MAKEFILEDIR)/configure/build-depends/coreutils/rm.mk
=20
=20
 %/:
 	+$(info	$(INFO_)MKDIR		$@)
 	+$(INSTALL_DIR) $@
=20
-%-rm:
-	$(info	$(INFO_)RM		$*)
-	$(RM) $*
-
=20
 .PHONY: install-all
 install-all: install-man install-bin;
@@ -25,8 +20,5 @@ install-all: install-man install-bin;
 .PHONY: install
 install: install-man install-bin;
=20
-.PHONY: uninstall
-uninstall: uninstall-man;
-
=20
 endif  # include guard
diff --git a/share/mk/install/bin.mk b/share/mk/install/bin.mk
index 025cce3fb60d..8801a910318a 100644
--- a/share/mk/install/bin.mk
+++ b/share/mk/install/bin.mk
@@ -17,7 +17,6 @@ _bindir ::=3D $(DESTDIR)$(bindir)
=20
 _bin_sh ::=3D $(patsubst $(SRCBINDIR)/%, $(_bindir)/%, $(BIN_sh))
 _bin    ::=3D $(_bin_sh)
-_bin_rm ::=3D $(addsuffix -rm, $(wildcard $(_bin)))
=20
=20
 $(_bin_sh): $(_bindir)/%: $(SRCBINDIR)/%
@@ -32,8 +31,5 @@ $(_bin):
 .PHONY: install-bin
 install-bin: $(_bin);
=20
-.PHONY: uninstall-bin
-uninstall-bin: $(_bin_rm);
-
=20
 endif  # include guard
diff --git a/share/mk/install/html.mk b/share/mk/install/html.mk
index 60fe3c8b79e4..730a64ec6af5 100644
--- a/share/mk/install/html.mk
+++ b/share/mk/install/html.mk
@@ -17,7 +17,6 @@ _htmldir ::=3D $(DESTDIR)$(htmldir)
=20
=20
 _htmlpages    ::=3D $(patsubst $(_MANDIR)/%, $(_htmldir)/%, $(_HTMLMAN))
-_htmlpages_rm ::=3D $(addsuffix -rm, $(wildcard $(_htmlpages)))
=20
=20
 $(_htmlpages): $(_htmldir)/%: $(_MANDIR)/% $(MK) | $$(@D)/
@@ -28,8 +27,5 @@ $(_htmlpages): $(_htmldir)/%: $(_MANDIR)/% $(MK) | $$(@D)/
 .PHONY: install-html
 install-html: $(_htmlpages);
=20
-.PHONY: uninstall-html
-uninstall-html: $(_htmlpages_rm);
-
=20
 endif  # include guard
diff --git a/share/mk/install/man.mk b/share/mk/install/man.mk
index c40d52ae5f29..9d611132edd1 100644
--- a/share/mk/install/man.mk
+++ b/share/mk/install/man.mk
@@ -36,13 +36,6 @@ $(foreach s, $(MANSECTIONS),                            =
                      \
 _manintropages ::=3D $(foreach s, $(MANSECTIONS), $(_man$(s)intropage))
 _manpages ::=3D $(_manintropages) $(foreach s, $(MANSECTIONS), $(_man$(s)p=
ages))
=20
-_manintropages_rm ::=3D $(addsuffix -rm, $(wildcard $(_manintropages)))
-$(foreach s, $(MANSECTIONS),                                              =
    \
-	$(eval _man$(s)pages_rm ::=3D                                            \
-		$(addsuffix -rm,                                              \
-			$(subst :,\:,                                         \
-				$(wildcard $(_man$(s)pages))))))
-
=20
 $(foreach s, $(MANSECTIONS),                                              =
    \
 	$(eval $(_man$(s)pages) $(_man$(s)intropage):                         \
@@ -75,14 +68,5 @@ $(foreach s, $(MANSECTIONS),                            =
                      \
 .PHONY: install-man
 install-man: install-manintro $(foreach s, $(MANSECTIONS), install-man$(s)=
);
=20
-.PHONY: uninstall-manintro
-uninstall-manintro: $(_manintropages_rm);
-$(foreach s, $(MANSECTIONS),                                              =
    \
-	$(eval .PHONY: uninstall-man$(s)))
-$(foreach s, $(MANSECTIONS),                                              =
    \
-	$(eval uninstall-man$(s): $(_man$(s)pages_rm);))
-.PHONY: uninstall-man
-uninstall-man: uninstall-manintro $(foreach s, $(MANSECTIONS), uninstall-m=
an$(s));
-
=20
 endif  # include guard
diff --git a/share/mk/install/pdf/_.mk b/share/mk/install/pdf/_.mk
index 16a009c2ec99..3196f11dbf6f 100644
--- a/share/mk/install/pdf/_.mk
+++ b/share/mk/install/pdf/_.mk
@@ -9,8 +9,5 @@ MAKEFILE_INSTALL_PDF_INCLUDED ::=3D 1
 .PHONY: install-pdf
 install-pdf: install-pdf-book;
=20
-.PHONY: uninstall-pdf
-uninstall-pdf: uninstall-pdf-book;
-
=20
 endif  # include guard
diff --git a/share/mk/install/pdf/book.mk b/share/mk/install/pdf/book.mk
index 331f2d6e6119..1db24f2af3a1 100644
--- a/share/mk/install/pdf/book.mk
+++ b/share/mk/install/pdf/book.mk
@@ -15,7 +15,6 @@ _pdfdir ::=3D $(DESTDIR)$(pdfdir)
=20
=20
 _pdf_book    ::=3D $(patsubst $(_PDFDIR)/%, $(_pdfdir)/%, $(_PDF_BOOK))
-_pdf_book_rm ::=3D $(addsuffix -rm, $(wildcard $(_pdf_book)))
=20
=20
 $(_pdf_book): $(_pdfdir)/%: $(_PDFDIR)/% $(MK) | $$(@D)/
@@ -26,8 +25,5 @@ $(_pdf_book): $(_pdfdir)/%: $(_PDFDIR)/% $(MK) | $$(@D)/
 .PHONY: install-pdf-book
 install-pdf-book: $(_pdf_book);
=20
-.PHONY: uninstall-pdf-book
-uninstall-pdf-book: $(_pdf_book_rm);
-
=20
 endif  # include guard

base-commit: ceea4a6d8238e5bf6090586cafdf60de8dd247b9
--=20
2.55.0


--ebd6jgrgx5q5buk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqqdnsACgkQ64mZXMKQ
wqm7LA/8CUkLMYWh932jZxsiVrzVEptf2E0mYtm4rRjcr5ItO8vL7YPVsoFNq4Z1
xR3AUxItJPh9Xq6PAjX0a1elfKj/3Uz2ux9s4GDd6l6kojmgg5EBrRxoOV5MQUrg
nBtsE0ccPfpihSRlqDm6hCQBbYV+vLuzUx5/Wx30fpqMtWOTUR9lJob3bHwFU8bx
5RoeC4yDnOiR8h1YGsrhgYmNTOtls+SzfEqbJzhIsUKchp/CI8K/1bRJoXXrJh1Z
gyz4NsX6WUzRWf0TakHNc4kZAwSejzjovCGX+C4BlErQB/tRYI88+M6shRS6lI3V
p85WxkkEnv+gd5P5HsAMd+TXk6fcofDHIi1AoHbHFTKiUJScq8CpXZADavZZyP6f
943/sbPSYRbWIp/56oH/1stfDjVUNHj/7aJMPyLhvjrueO7OZqM0iSrCWvQtl1rc
UlzyUCYT7gjW/i02qGF3eTLKazw/ouWPbafwk11Enfr5tsiJ5sm4Gb4AvllrIry4
FNdgz2ILw8A7ARTQndxcDrZz5ZIacqWx29twB+pS7Bm44+zaoTSRN2QH99LIfptP
Sw5H7U2+Jzsoe7k22MQIO+q2hKdbj+Zvf1zCqgMLXQul2W2L82Rdqn7EiTmKEB6S
qUY1nv1Pkx1d3QhtcuPdRbwAbC8VS21jWBS1oMAMP2mWZrgcDg8=
=lLKf
-----END PGP SIGNATURE-----

--ebd6jgrgx5q5buk7--
