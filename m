Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4216129BDBB
	for <linux-man@vger.kernel.org>; Sun, 30 Aug 2026 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101489; cv=none; b=NwXdmAXbuKBmm/okpM60uWoHm7n+8totp9j7uzkSgg3EfVM2fHs+9Gz6jG2tzKMDi4iVn4lmA763AVraYWmjlemuk++BAruCCEoOH2pKxx4RZPL73JMmO5Cg7z0iw9PAuio2aSsFWU8WYoopfu0H0cLQubi0oJLuqR2zkjrpsDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101489; c=relaxed/simple;
	bh=ERA719d+yRTA+VMlgTWqmcDXHsAfcTfbSSIzC8rTbRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ClalIdaM0ExH/B/LwB0jn9y8u8zDaauVXHsGO/x/z2Lupf8Iw2Mp+IH3kfwk0t7gC4h8hLgS5YaVngH2fZDJC3vlTciEbfeuoWaFlFyaFruP9jz1bpUukiHrctZF7ndeEhWtdMgWZIdrkgao+8mKOB79p+tdIObc/6rMKqE0liM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGaA50Y6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGaA50Y6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D76A1F000E9;
	Sun, 30 Aug 2026 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788101486;
	bh=nycf5o3Qq6mWlcNbUOk7qFpQsTs+AH3bgci9jO8xoWg=;
	h=Date:From:To:Cc:Subject;
	b=IGaA50Y6Heu8iqB9rGXnJxlv/Gy/TwNsYi1Sj+Vt+kNRRW9lnBX7Iff49wtRV2W9s
	 z6i1ImZAa89K+otA/wWuGH/y53QSGEmpWoJZXHw4mwBypXp/SQuYLegfSEvK//EToB
	 TrTzFRny6SJCFXFp+OgBk9Uypdcu1k19B0lxfCtpc2sEO/I52ZTIjsbygpGHMQtP/H
	 ExJysyGADSAhyqo5ssTiOjvvEKQV4tcJ1L5zswYEpXQ58PJIBmtz6/M1fHiPubOabI
	 CZPhBAcjcJR//ntN7zc5EpUAu05T6srkzFd6yTSLlwTIHpvjAVbvPhYhnQzYtFqose
	 vOuLFbMpM7vAg==
Date: Sun, 30 Aug 2026 16:51:24 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, 
	Ingo Schwarze <schwarze@openbsd.org>
Subject: [PATCH v1] share/mk/: Use suffix rules where possible
Message-ID: <9a74fe43cf61f80f253e1401b547296b6f97c44a.1788101363.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zpr2x3lmuloqxfww"
Content-Disposition: inline


--zpr2x3lmuloqxfww
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, 
	Ingo Schwarze <schwarze@openbsd.org>
Subject: [PATCH v1] share/mk/: Use suffix rules where possible
Message-ID: <9a74fe43cf61f80f253e1401b547296b6f97c44a.1788101363.git.alx@kernel.org>
MIME-Version: 1.0

Ingo complained that the size of the database is huge.  We can't make it
much smaller than this, but at least we can shrink it to one third.

Using suffix rules, we avoid having an explicit copy of the file list
in the rules, and thus optimizes the makefiles so that make(1)'s
database shrinks to around 1/3rd of the size.  The time for running
'make nothing' also improves from ~ 0.45 s to ~ 0.33 s in my computer.

Reported-by: Ingo Schwarze <schwarze@openbsd.org>
Message-ID: <apL7VAruk1bIOr1M@isnote.usta.de>
Signed-off-by: Alejandro Colomar <alx@kernel.org>
---

Hi Ingo,

Here's an optimization for the man-pages' build system.  Would you mind
checking if this also shows similar improvements in your system?


Have a lovely day!
Alex

 share/mk/build/catman/eqn.mk        |  2 +-
 share/mk/build/catman/grotty.mk     |  2 +-
 share/mk/build/catman/troff.mk      |  2 +-
 share/mk/build/examples/cc.mk       |  2 +-
 share/mk/build/examples/dir.mk      |  2 +-
 share/mk/build/html/post-grohtml.mk |  2 +-
 share/mk/build/html/troff.mk        |  2 +-
 share/mk/build/pdf/pages/eqn.mk     |  2 +-
 share/mk/build/pdf/pages/troff.mk   |  2 +-
 share/mk/build/pre/preconv.mk       |  2 +-
 share/mk/build/pre/tbl.mk           |  2 +-
 share/mk/build/ps/eqn.mk            |  2 +-
 share/mk/build/ps/grops.mk          |  2 +-
 share/mk/build/ps/troff.mk          |  2 +-
 share/mk/check/catman/col.mk        |  2 +-
 share/mk/check/catman/grep.mk       |  2 +-
 share/mk/lint/c/clang-tidy.mk       | 11 ++---------
 share/mk/lint/c/cppcheck.mk         | 11 ++---------
 share/mk/lint/c/cpplint.mk          | 10 ++--------
 share/mk/lint/c/iwyu.mk             | 11 ++---------
 share/mk/lint/man/blank.mk          |  2 +-
 share/mk/lint/man/dash.mk           |  2 +-
 share/mk/lint/man/mandoc.mk         |  2 +-
 share/mk/lint/man/poems.mk          |  2 +-
 share/mk/lint/man/quote.mk          |  2 +-
 share/mk/lint/man/so.mk             |  2 +-
 share/mk/lint/man/ws.mk             |  2 +-
 27 files changed, 31 insertions(+), 58 deletions(-)

diff --git a/share/mk/build/catman/eqn.mk b/share/mk/build/catman/eqn.mk
index 895662ac3710..e2830dab53ac 100644
--- a/share/mk/build/catman/eqn.mk
+++ b/share/mk/build/catman/eqn.mk
@@ -18,7 +18,7 @@ ext ::=3D .cat.troff
 _CATMAN_troff ::=3D $(patsubst %.eqn, %$(ext), $(_MAN_eqn))
=20
=20
-$(_CATMAN_troff): %$(ext): %.eqn $(MK) | $$(@D)/
+%$(ext): %.eqn $(MK) | $$(@D)/
 	$(info	$(INFO_)EQN		$@)
 	! ($(EQN) -T$(NROFF_OUT_DEVICE) $(EQNFLAGS_) <$< 2>&1 >$@) \
 	| $(GREP) ^ >&2
diff --git a/share/mk/build/catman/grotty.mk b/share/mk/build/catman/grotty=
=2Emk
index 66151b6cee93..a578edbeb191 100644
--- a/share/mk/build/catman/grotty.mk
+++ b/share/mk/build/catman/grotty.mk
@@ -16,7 +16,7 @@ ext ::=3D .cat
 _CATMAN ::=3D $(patsubst %.cat.set, %$(ext), $(_CATMAN_set))
=20
=20
-$(_CATMAN): %$(ext): %.cat.set $(MK) | $$(@D)/
+%$(ext): %.cat.set $(MK) | $$(@D)/
 	$(info	$(INFO_)GROTTY		$@)
 	$(GROTTY) $(GROTTYFLAGS_) <$< >$@
=20
diff --git a/share/mk/build/catman/troff.mk b/share/mk/build/catman/troff.mk
index 07e315327278..fc5bf0c18de8 100644
--- a/share/mk/build/catman/troff.mk
+++ b/share/mk/build/catman/troff.mk
@@ -28,7 +28,7 @@ endif
 _CATMAN_set ::=3D $(tgts)
=20
=20
-$(_CATMAN_set): %$(ext): %.cat.troff $(regexf) $(MK) | $$(@D)/
+%$(ext): %.cat.troff $(regexf) $(MK) | $$(@D)/
 	$(info	$(INFO_)TROFF		$@)
 	! ($(TROFF) -mandoc $(TROFFFLAGS_) $(NROFFFLAGS_) <$< 2>&1 >$@ \
 	   | $(GREP) -v -f '$(filter %.grep, $^)' \
diff --git a/share/mk/build/examples/cc.mk b/share/mk/build/examples/cc.mk
index 680b80f3e832..5806d8de0118 100644
--- a/share/mk/build/examples/cc.mk
+++ b/share/mk/build/examples/cc.mk
@@ -25,7 +25,7 @@ endif
 _EX_TU_o ::=3D $(tgts)
=20
=20
-$(_EX_TU_o): %$(ext): %.c $(MK)
+%$(ext): %.c $(MK)
 	$(info	$(INFO_)CC		$@)
 	$(CC) -c $(CFLAGS_) $(CPPFLAGS_) -o $@ $<
=20
diff --git a/share/mk/build/examples/dir.mk b/share/mk/build/examples/dir.mk
index 10286c73bc0c..9782ad300193 100644
--- a/share/mk/build/examples/dir.mk
+++ b/share/mk/build/examples/dir.mk
@@ -14,7 +14,7 @@ include $(MAKEFILEDIR)/configure/build-depends/coreutils/=
touch.mk
 _PAGEEXDIRS ::=3D $(patsubst %, %.d/, $(_NONSO))
=20
=20
-$(_PAGEEXDIRS):
+%.d/:
 	+$(info	$(INFO_)MKDIR		$@)
 	+$(MKDIR) -p $@
 	+$(TOUCH) $@
diff --git a/share/mk/build/html/post-grohtml.mk b/share/mk/build/html/post=
-grohtml.mk
index 0c96a78609d8..fa886f09d0d8 100644
--- a/share/mk/build/html/post-grohtml.mk
+++ b/share/mk/build/html/post-grohtml.mk
@@ -16,7 +16,7 @@ ext ::=3D .html
 _HTMLMAN ::=3D $(patsubst %.html.set, %$(ext), $(_HTMLMAN_set))
=20
=20
-$(_HTMLMAN): %$(ext): %.html.set $(MK) | $$(@D)/
+%$(ext): %.html.set $(MK) | $$(@D)/
 	$(info	$(INFO_)POST_GROHTML	$@)
 	$(POST_GROHTML) $(POST_GROHTMLFLAGS_) <$< >$@
=20
diff --git a/share/mk/build/html/troff.mk b/share/mk/build/html/troff.mk
index b6c1e659b7e4..6bdf9db1dbfa 100644
--- a/share/mk/build/html/troff.mk
+++ b/share/mk/build/html/troff.mk
@@ -25,7 +25,7 @@ endif
 _HTMLMAN_set ::=3D $(tgts)
=20
=20
-$(_HTMLMAN_set): %$(ext): %.eqn $(MK) | $$(@D)/
+%$(ext): %.eqn $(MK) | $$(@D)/
 	$(info	$(INFO_)TROFF		$@)
 	! ($(TROFF) -mandoc -Thtml $(TROFFFLAGS_) <$< 2>&1 >$@) \
 	| $(GREP) ^ >&2
diff --git a/share/mk/build/pdf/pages/eqn.mk b/share/mk/build/pdf/pages/eqn=
=2Emk
index 6ef945af3e10..49b1a72c6b08 100644
--- a/share/mk/build/pdf/pages/eqn.mk
+++ b/share/mk/build/pdf/pages/eqn.mk
@@ -17,7 +17,7 @@ ext ::=3D .pdf.troff
 _PDFMAN_troff ::=3D $(patsubst %.eqn, %$(ext), $(_MAN_eqn))
=20
=20
-$(_PDFMAN_troff): %$(ext): %.eqn $(MK) | $$(@D)/
+%$(ext): %.eqn $(MK) | $$(@D)/
 	$(info	$(INFO_)EQN		$@)
 	! ($(EQN) -Tpdf $(EQNFLAGS_) <$< 2>&1 >$@) \
 	| $(GREP) ^ >&2
diff --git a/share/mk/build/pdf/pages/troff.mk b/share/mk/build/pdf/pages/t=
roff.mk
index e4c4d347fe6c..550168646d5b 100644
--- a/share/mk/build/pdf/pages/troff.mk
+++ b/share/mk/build/pdf/pages/troff.mk
@@ -25,7 +25,7 @@ endif
 _PDFMAN_set ::=3D $(tgts)
=20
=20
-$(_PDFMAN_set): %$(ext): %.pdf.troff $(MK) | $$(@D)/
+%$(ext): %.pdf.troff $(MK) | $$(@D)/
 	$(info	$(INFO_)TROFF		$@)
 	! ($(TROFF) -mandoc -Tpdf $(TROFFFLAGS_) <$< 2>&1 >$@) \
 	| $(GREP) ^ >&2
diff --git a/share/mk/build/pre/preconv.mk b/share/mk/build/pre/preconv.mk
index d19d12d261d7..e3dde5981949 100644
--- a/share/mk/build/pre/preconv.mk
+++ b/share/mk/build/pre/preconv.mk
@@ -16,7 +16,7 @@ ext ::=3D .tbl
 _MAN_tbl ::=3D $(patsubst %, %$(ext), $(_NONSO))
=20
=20
-$(_MAN_tbl): %$(ext): % $(MK) | $$(@D)/
+%$(ext): % $(MK) | $$(@D)/
 	$(info	$(INFO_)PRECONV		$@)
 	$(PRECONV) $(PRECONVFLAGS_) $< >$@
=20
diff --git a/share/mk/build/pre/tbl.mk b/share/mk/build/pre/tbl.mk
index 5883b6ec0c80..0375b958ff05 100644
--- a/share/mk/build/pre/tbl.mk
+++ b/share/mk/build/pre/tbl.mk
@@ -16,7 +16,7 @@ ext ::=3D .eqn
 _MAN_eqn ::=3D $(patsubst %.tbl, %$(ext), $(_MAN_tbl))
=20
=20
-$(_MAN_eqn): %$(ext): %.tbl $(MK) | $$(@D)/
+%$(ext): %.tbl $(MK) | $$(@D)/
 	$(info	$(INFO_)TBL		$@)
 	$(TBL) <$< >$@
=20
diff --git a/share/mk/build/ps/eqn.mk b/share/mk/build/ps/eqn.mk
index 315bed0e4cde..18c885655c99 100644
--- a/share/mk/build/ps/eqn.mk
+++ b/share/mk/build/ps/eqn.mk
@@ -17,7 +17,7 @@ ext ::=3D .ps.troff
 _PSMAN_troff ::=3D $(patsubst %.eqn, %$(ext), $(_MAN_eqn))
=20
=20
-$(_PSMAN_troff): %$(ext): %.eqn $(MK) | $$(@D)/
+%$(ext): %.eqn $(MK) | $$(@D)/
 	$(info	$(INFO_)EQN		$@)
 	! ($(EQN) -Tps $(EQNFLAGS_) <$< 2>&1 >$@) \
 	| $(GREP) ^ >&2
diff --git a/share/mk/build/ps/grops.mk b/share/mk/build/ps/grops.mk
index 463c7bac6f08..4b85b6a96854 100644
--- a/share/mk/build/ps/grops.mk
+++ b/share/mk/build/ps/grops.mk
@@ -16,7 +16,7 @@ ext ::=3D .ps
 _PSMAN ::=3D $(patsubst %.ps.set, %$(ext), $(_PSMAN_set))
=20
=20
-$(_PSMAN): %$(ext): %.ps.set $(MK) | $$(@D)/
+%$(ext): %.ps.set $(MK) | $$(@D)/
 	$(info	$(INFO_)GROPS		$@)
 	$(GROPS) $(GROPSFLAGS_) <$< >$@
=20
diff --git a/share/mk/build/ps/troff.mk b/share/mk/build/ps/troff.mk
index 851fb971faf3..8137014fe9e9 100644
--- a/share/mk/build/ps/troff.mk
+++ b/share/mk/build/ps/troff.mk
@@ -25,7 +25,7 @@ endif
 _PSMAN_set ::=3D $(tgts)
=20
=20
-$(_PSMAN_set): %$(ext): %.ps.troff $(MK) | $$(@D)/
+%$(ext): %.ps.troff $(MK) | $$(@D)/
 	$(info	$(INFO_)TROFF		$@)
 	! ($(TROFF) -mandoc -Tps $(TROFFFLAGS_) <$< 2>&1 >$@) \
 	| $(GREP) ^ >&2
diff --git a/share/mk/check/catman/col.mk b/share/mk/check/catman/col.mk
index 25b8b6e154a6..de326d989183 100644
--- a/share/mk/check/catman/col.mk
+++ b/share/mk/check/catman/col.mk
@@ -16,7 +16,7 @@ ext ::=3D .cat.grep
 _CHECK_catman_grep ::=3D $(patsubst %.cat, %$(ext), $(_CATMAN))
=20
=20
-$(_CHECK_catman_grep): %$(ext): %.cat $(MK) | $$(@D)/
+%$(ext): %.cat $(MK) | $$(@D)/
 	$(info	$(INFO_)COL		$@)
 	$(COL) $(COLFLAGS_) <$< >$@
=20
diff --git a/share/mk/check/catman/grep.mk b/share/mk/check/catman/grep.mk
index bcfa1a134459..2fce886ae920 100644
--- a/share/mk/check/catman/grep.mk
+++ b/share/mk/check/catman/grep.mk
@@ -25,7 +25,7 @@ endif
 _CHECK_catman ::=3D $(tgts)
=20
=20
-$(_CHECK_catman): %.check-catman.touch: %.cat.grep $(MK) | $$(@D)/
+%.check-catman.touch: %.cat.grep $(MK) | $$(@D)/
 	$(info	$(INFO_)GREP		$@)
 	! $(GREP) -n '.\{$(MANWIDTH)\}.' $< /dev/null >&2
 	$(TOUCH) $@
diff --git a/share/mk/lint/c/clang-tidy.mk b/share/mk/lint/c/clang-tidy.mk
index 8333c8ace12c..d992b956baf3 100644
--- a/share/mk/lint/c/clang-tidy.mk
+++ b/share/mk/lint/c/clang-tidy.mk
@@ -24,14 +24,8 @@ ifeq ($(SKIP_XFAIL),yes)
 tgts_EX ::=3D $(filter-out $(patsubst %, $(_MANDIR)/%$(ext), $(file < $(xf=
ail))), $(tgts_EX))
 endif
=20
-tgts ::=3D $(tgts_EX)
=20
-
-$(tgts_EX): %$(ext): %
-$(tgts): $(CLANG_TIDY_CONF) $(MK) | $$(@D)/
-
-
-$(tgts):
+%$(ext): % $(CLANG_TIDY_CONF) $(MK) | $$(@D)/
 	$(info	$(INFO_)CLANG_TIDY	$@)
 	$(CLANG_TIDY) $(CLANG_TIDYFLAGS_) $< -- $(CLANGFLAGS_) $(CPPFLAGS_) 2>&1 \
 	| $(SED) '/generated\.$$/d' >&2
@@ -39,13 +33,12 @@ $(tgts):
=20
=20
 .PHONY: lint-c-clang-tidy
-lint-c-clang-tidy: $(tgts);
+lint-c-clang-tidy: $(tgts_EX);
=20
=20
 undefine ext
 undefine xfail
 undefine tgts_EX
-undefine tgts
=20
=20
 endif  # include guard
diff --git a/share/mk/lint/c/cppcheck.mk b/share/mk/lint/c/cppcheck.mk
index c377120e4fa1..3952414c9cfd 100644
--- a/share/mk/lint/c/cppcheck.mk
+++ b/share/mk/lint/c/cppcheck.mk
@@ -21,27 +21,20 @@ ifeq ($(SKIP_XFAIL),yes)
 tgts_EX ::=3D $(filter-out $(patsubst %, $(_MANDIR)/%$(ext), $(file < $(xf=
ail))), $(tgts_EX))
 endif
=20
-tgts ::=3D $(tgts_EX)
=20
-
-$(tgts_EX): %$(ext): %
-$(tgts): $(CPPCHECK_SUPPRESS) $(MK) | $$(@D)/
-
-
-$(tgts):
+%$(ext): % $(CPPCHECK_SUPPRESS) $(MK) | $$(@D)/
 	$(info	$(INFO_)CPPCHECK	$@)
 	$(CPPCHECK) $(CPPCHECKFLAGS_) $<
 	$(TOUCH) $@
=20
=20
 .PHONY: lint-c-cppcheck
-lint-c-cppcheck: $(tgts);
+lint-c-cppcheck: $(tgts_EX);
=20
=20
 undefine ext
 undefine xfail
 undefine tgts_EX
-undefine tgts
=20
=20
 endif  # include guard
diff --git a/share/mk/lint/c/cpplint.mk b/share/mk/lint/c/cpplint.mk
index 6a714bc315ad..9ecef7f45553 100644
--- a/share/mk/lint/c/cpplint.mk
+++ b/share/mk/lint/c/cpplint.mk
@@ -13,26 +13,20 @@ include $(MAKEFILEDIR)/configure/build-depends/cpplint/=
cpplint.mk
=20
 ext ::=3D .lint-c.cpplint.touch
 tgts_EX ::=3D $(patsubst %, %$(ext), $(_EX_TU_src))
-tgts    ::=3D $(tgts_EX)
=20
=20
-$(tgts_EX): %$(ext): %
-$(tgts): $(CPPLINT_CONF) $(MK) | $$(@D)/
-
-
-$(tgts):
+%$(ext): % $(CPPLINT_CONF) $(MK) | $$(@D)/
 	$(info	$(INFO_)CPPLINT		$@)
 	$(CPPLINT) $(CPPLINTFLAGS_) $< >/dev/null
 	$(TOUCH) $@
=20
=20
 .PHONY: lint-c-cpplint
-lint-c-cpplint: $(tgts);
+lint-c-cpplint: $(tgts_EX);
=20
=20
 undefine ext
 undefine tgts_EX
-undefine tgts
=20
=20
 endif  # include guard
diff --git a/share/mk/lint/c/iwyu.mk b/share/mk/lint/c/iwyu.mk
index e4477dbfac58..03bc68f55546 100644
--- a/share/mk/lint/c/iwyu.mk
+++ b/share/mk/lint/c/iwyu.mk
@@ -27,14 +27,8 @@ ifeq ($(SKIP_XFAIL),yes)
 tgts_EX ::=3D $(filter-out $(patsubst %, $(_MANDIR)/%$(ext), $(file < $(xf=
ail))), $(tgts_EX))
 endif
=20
-tgts ::=3D $(tgts_EX)
=20
-
-$(tgts_EX): %$(ext): %
-$(tgts): $(MK) | $$(@D)/
-
-
-$(tgts):
+%$(ext): % $(MK) | $$(@D)/
 	$(info	$(INFO_)IWYU		$@)
 	! ($(IWYU) $(IWYUFLAGS_) $(CLANGFLAGS_) $(CPPFLAGS_) $< 2>&1 \
 	   | $(SED) -n '/should add these lines:/,$$p' \
@@ -48,13 +42,12 @@ $(tgts):
=20
=20
 .PHONY: lint-c-iwyu
-lint-c-iwyu: $(tgts);
+lint-c-iwyu: $(tgts_EX);
=20
=20
 undefine ext
 undefine xfail
 undefine tgts_EX
-undefine tgts
=20
=20
 endif  # include guard
diff --git a/share/mk/lint/man/blank.mk b/share/mk/lint/man/blank.mk
index f8eca7ac86b7..8fc7ad4be0a8 100644
--- a/share/mk/lint/man/blank.mk
+++ b/share/mk/lint/man/blank.mk
@@ -22,7 +22,7 @@ tgts ::=3D $(filter-out $(patsubst %, $(_MANDIR)/%$(ext),=
 $(file < $(xfail))), $(t
 endif
=20
=20
-$(tgts): %$(ext): % $(MK) | $$(@D)/
+%$(ext): % $(MK) | $$(@D)/
 	$(info	$(INFO_)GREP		$@)
 	$(CAT) <$< \
 	| if $(GREP) '^$$' >/dev/null; then \
diff --git a/share/mk/lint/man/dash.mk b/share/mk/lint/man/dash.mk
index 85307af0e449..d82ac734880d 100644
--- a/share/mk/lint/man/dash.mk
+++ b/share/mk/lint/man/dash.mk
@@ -21,7 +21,7 @@ regexf ::=3D $(MAKEFILEDIR)/lint/man/dash.pcre2grep
 tgts ::=3D $(patsubst %, %$(ext), $(_NONSO))
=20
=20
-$(tgts): %$(ext): % $(regexf) $(MK) | $$(@D)/
+%$(ext): % $(regexf) $(MK) | $$(@D)/
 	$(info	$(INFO_)PCRE2GREP	$@)
 	$(CAT) <$< \
 	| if $(PCRE2GREP) -f '$(filter %.pcre2grep, $^)' >/dev/null; then \
diff --git a/share/mk/lint/man/mandoc.mk b/share/mk/lint/man/mandoc.mk
index 5c24ca66ee7a..d96f94439933 100644
--- a/share/mk/lint/man/mandoc.mk
+++ b/share/mk/lint/man/mandoc.mk
@@ -25,7 +25,7 @@ tgts ::=3D $(filter-out $(patsubst %, $(_MANDIR)/%$(ext),=
 $(file < $(xfail))), $(t
 endif
=20
=20
-$(tgts): %$(ext): % $(regexf) $(MK) | $$(@D)/
+%$(ext): % $(regexf) $(MK) | $$(@D)/
 	$(info	$(INFO_)MANDOC		$@)
 	! ($(MANDOC) $(MANDOCFLAGS_) $< 2>&1 \
 	   | $(GREP) -v -f '$(filter %.grep, $^)' \
diff --git a/share/mk/lint/man/poems.mk b/share/mk/lint/man/poems.mk
index b7ee792f346c..b0e799d2997a 100644
--- a/share/mk/lint/man/poems.mk
+++ b/share/mk/lint/man/poems.mk
@@ -25,7 +25,7 @@ tgts ::=3D $(filter-out $(patsubst %, $(_MANDIR)/%$(ext),=
 $(file < $(xfail))), $(t
 endif
=20
=20
-$(tgts): %$(ext): % $(regexf) $(MK) | $$(@D)/
+%$(ext): % $(regexf) $(MK) | $$(@D)/
 	$(info	$(INFO_)PCRE2GREP	$@)
 	$(CAT) <$< \
 	| if $(PCRE2GREP) -f '$(filter %.pcre2grep, $^)' >/dev/null; then \
diff --git a/share/mk/lint/man/quote.mk b/share/mk/lint/man/quote.mk
index 3aca334967c0..86bc397c1d2b 100644
--- a/share/mk/lint/man/quote.mk
+++ b/share/mk/lint/man/quote.mk
@@ -23,7 +23,7 @@ tgts ::=3D $(filter-out $(patsubst %, $(_MANDIR)/%$(ext),=
 $(file < $(xfail))), $(t
 endif
=20
=20
-$(tgts): %$(ext): % $(regexf) $(MK) | $$(@D)/
+%$(ext): % $(regexf) $(MK) | $$(@D)/
 	$(info	$(INFO_)GREP		$@)
 	$(CAT) <$< \
 	| if $(GREP) -Pf $(filter %.Pgrep, $^) >/dev/null; then \
diff --git a/share/mk/lint/man/so.mk b/share/mk/lint/man/so.mk
index 09b7816ae38f..cf8d6776e15d 100644
--- a/share/mk/lint/man/so.mk
+++ b/share/mk/lint/man/so.mk
@@ -24,7 +24,7 @@ tgts ::=3D $(filter-out $(patsubst %, $(_MANDIR)/%$(ext),=
 $(file < $(xfail))), $(t
 endif
=20
=20
-$(tgts): %$(ext): % $(MK) | $$(@D)/
+%$(ext): % $(MK) | $$(@D)/
 	$(info	$(INFO_)FIND		$@)
 	$(GREP) '^\.so ' <$< \
 	| $(CUT) -f2 -d' ' \
diff --git a/share/mk/lint/man/ws.mk b/share/mk/lint/man/ws.mk
index 7fd3bb69361d..2f587fc4e6ea 100644
--- a/share/mk/lint/man/ws.mk
+++ b/share/mk/lint/man/ws.mk
@@ -23,7 +23,7 @@ tgts ::=3D $(filter-out $(patsubst %, $(_MANDIR)/%$(ext),=
 $(file < $(xfail))), $(t
 endif
=20
=20
-$(tgts): %$(ext): % $(regexf) $(MK) | $$(@D)/
+%$(ext): % $(regexf) $(MK) | $$(@D)/
 	$(info	$(INFO_)GREP		$@)
 	$(CAT) <$< \
 	| if $(GREP) -Ef $(filter %.egrep, $^) >/dev/null; then \

Range-diff against v0:
-:  ------------ > 1:  9a74fe43cf61 share/mk/: Use suffix rules where possi=
ble
--=20
2.53.0


--zpr2x3lmuloqxfww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqUQ2sACgkQ64mZXMKQ
wqkung/9FCLLAuydPLADwsFfVBILobCIJcXrAL5KCEYq+1HOWxiuBDFM3LEW1IGx
ls7473RSqR6UkenTNmPVLfqLyBqkQTsMbkFop0jtCLhMe7E8DwZGHugUWUr8epUF
3BY4ugKuXYoowbfB9v8ZOn5uoG8mSPnNeaxKbIrbbxc8LmMJDhq3YidixmWp9Nlr
N7fhUXJCM2K/sKaMLgk/I+/dUgLOmfzzkXrjKrAVi2QA/cHUiGmVwYy4SgGJ2a+5
htzRxOD/QcWw/gaZ6ld5BlCveBeP0h7Vh9U5nMO5HqrwGG2LOULKFSiipzD11K2/
WOhYwKoZO8tI6gXjtc60MkzTpx29K7KfAxMd3u6QCgLNKNsNXyLWpS7EdxB/CdJt
6HrbxSjKxZ/cegn24arvj+SLXbjKR1Vh93lp87qkJqNpEmTZEB67T6qPvxLvk6b4
f9h+XRxkzS3jHxGxW0X66lJxnkgKXotl8nbv4ktFjJtRcqUk9III7yp9+rEHiRTp
kXcoc2UUXLfsd+71geOH7gXpPgtwYg74e+gDvthu7KeIrhANPK3UAq2Z38VTRW5a
I+C/DUbUh1qH4N6iys8Fb8hvwKVIiKtcLZG2u7pj30BlHXVCWTp4/v1FHBWrS2wy
Dyp7F0Z2qPiBM0yqtoEDo6ElNLOYCwVzJ4z94L9rEj1fmmAo3o0=
=EWUM
-----END PGP SIGNATURE-----

--zpr2x3lmuloqxfww--
