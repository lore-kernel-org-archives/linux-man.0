Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AABF42901E
	for <linux-man@vger.kernel.org>; Tue, 15 Sep 2026 16:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490899; cv=none; b=Gi9pDjD84NtlpkZV9zRLas4NyUVlbKOomSYixjH/xA1wT8tL5+0ZlMQOU8boRChJadmkaOJFVW3YBhbL2JHOcA7AApn57QO743sNQF641bI7g3XOSHnotP8UGWwPx1UhgG67JPDBxk9rQoSnx5qRG97WwVS4TBiipRRxICSf500=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490899; c=relaxed/simple;
	bh=soORPHHBGUnQV3Hqv1qhBo+ancobvGxu69PPS2nOzLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBk/uvI53BFERaaqSWv5Eaed5jY0EqJl+0KTqP1Rnnku3zrRZyJDgH5s3jrMQxWmyqdZija1LCs/jO4M3dGiUiq+fQBto7/8wdAsK3tDas/sOWM++ey0Zb7EvHmp2Un3jBDlp3+7dqCpyssKYBSXSQgB2JnDTQRdSdfkxvh6z1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnIR6CQD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnIR6CQD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B571F00893;
	Tue, 15 Sep 2026 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789490884;
	bh=hZSUEXz7B9fAEz4rXG4rwFZrBUcDiyEuM8mMGwn89J8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JnIR6CQDIRm/Z7XNIqwrrUpmLKPF/yBOaxbUKjh5s25qSAtiqlqcOLPXKXmULOE2f
	 Hi70eTSYywy8l1obyQMHZVMBRy5CzuPVBl+z+38R1QNMAH7OYdvOPG0MyfwW587aa0
	 szD0nv5jsHUWz3DW9Yjfp9N5khB6nD13iMTiYoV62SNfq1AjEE3tB6Qa5y4TnNSSdW
	 iqcWDJiL5W1Wus/dXtPf4V1i/clH94lyE5JDed/5sM3c7cnBKrh9SW5xGHSAF7huH+
	 VCMtdBEVOtkDu2mXEF4yGHeDh5XaQ3KBkdxHslq+hG9Dl3L0rXmGdnRMxY4fj4qPXo
	 0BNEW2b1AX+5A==
Date: Tue, 15 Sep 2026 17:47:59 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH v1] share/mk/: Use suffix rules where possible
Message-ID: <aqlyACy8rjSC2GiI@gremlin>
References: <9a74fe43cf61f80f253e1401b547296b6f97c44a.1788101363.git.alx@kernel.org>
 <apRfmYBBPy0S8IAI@devuan>
 <aqQ1tJR43K-72xMV@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqQ1tJR43K-72xMV@devuan>

On Fri, Sep 11, 2026 at 07:54:34PM +0200, Alejandro Colomar wrote:
> [CC trimmed; To = Lorenzo]
>
> Hi Lorenzo,
>
> I've seen the news from <https://lwn.net/Articles/1093398/>, and thought
> this recent experiment in the build system of the Linux man-pages
> project might seem relevant to you.
>
> > Date: 2026-08-30 18:55:19+0200
> > From: Alejandro Colomar <alx@kernel.org>
> >
> > Hi Ingo,
> >
> > > Date: 2026-08-30 16:51:24+0200
> > > From: Alejandro Colomar <alx@kernel.org>
> > >
> > > Ingo complained that the size of the database is huge.  We can't make it
> > > much smaller than this, but at least we can shrink it to one third.
> > >
> > > Using suffix rules, we avoid having an explicit copy of the file list
> > > in the rules, and thus optimizes the makefiles so that make(1)'s
> > > database shrinks to around 1/3rd of the size.  The time for running
> > > 'make nothing' also improves from ~ 0.45 s to ~ 0.33 s in my computer.
> >
> > While this optimizes the size of make(1)'s database, and the run-time
> > of the configuration part (everything before the targets start running),
> > the actual work of the build is slowed down by orders of magnitude
> > (I suspect associating targets with suffix rules is more expensive than
> >  explicit rules).  Thus, I've dropped this change.  I can live with a
> > somewhat-larger database, and make(1) seems to be fast with it.
>
> The Linux man-pages Makefile-only build system uses explicit rules
> everywhere, listing all target files in our makefile rules.  We use
> 'static pattern rules' almost everywhere.
> <https://www.gnu.org/software/make/manual/html_node/Static-Pattern.html>
>
> Here's for example the rule we use to build the C programs in the
> EXAMPLES sections of manual pages:
>
> 	ext ::= .o
> 	xfail ::= $(MAKEFILEDIR)/build/examples/cc.xfail
>
> 	tgts ::= $(patsubst %.c, %$(ext), $(_EX_TU_c))
> 	ifeq ($(SKIP_XFAIL),yes)
> 	tgts ::= $(filter-out $(patsubst %.c, $(_MANDIR)/%$(ext), $(file < $(xfail))), $(tgts))
> 	endif
>
>
> 	_EX_TU_o ::= $(tgts)
>
>
> 	$(_EX_TU_o): %$(ext): %.c $(MK)
> 		$(info	$(INFO_)CC		$@)
> 		$(CC) -c $(CFLAGS_) $(CPPFLAGS_) -o $@ $<
>
> Recently (as shown in the quoted text above), I thought using regular
> 'pattern rules' might improve the build times, as the database used by
> make(1) wouldn't need expanding all that text at once when defining the
> rules, and indeed reduces that database to 1/3rd of the original size.
> However, after trying it, the build times of a full build worsened by
> orders of magnitude, and the time of a no-op build was only reduced by
> fractions of a second (since it only takes a fraction of a second in the
> first place).
>
> I believe 'static pattern rules' go through simpler decision paths
> within make(1), which might be the reason for the performance
> differences I've experimented.
>
> From what I've seen, the kernel seems to use regular 'pattern rules'
> extensively.  I wonder if moving to 'static pattern rules' would bring
> a benefit similar to the one we experience in the Linux man-pages
> project.

Hmm intersting :)

I think the kernel is complicated by a lot of 'flexibility' in the build
process.

And probably simplifying it is difficult in some cases.

>
> Another important thing is that the build system of the Linux man-pages
> uses a single make(1) process to build (i.e., we don't use recursive
> make(1)).  That makes it parallelize better.  I'm not sure whether the
> kernel makefiles are recursive (for the main build) and how much that
> affects the kernel build.  It might be something to check too, as I
> remember it was very impactful.  Recursive make(1) is considered harmful
> by some (I agree, IME).

Yeah I don't think that's at all feasible for the kernel :)

Ideally we'd use something other than GNU make honestly.

But it's a step at a time based on what's actually feasible I think, so
low-hanging fruit first!

>
>
> Have a lovely day!
> Alex
>
> > Cheers,
> > Alex
> >
> > >
> > > Reported-by: Ingo Schwarze <schwarze@openbsd.org>
> > > Message-ID: <apL7VAruk1bIOr1M@isnote.usta.de>
> > > Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > > ---
> > >
> > > Hi Ingo,
> > >
> > > Here's an optimization for the man-pages' build system.  Would you mind
> > > checking if this also shows similar improvements in your system?
> > >
> > >
> > > Have a lovely day!
> > > Alex
> > >
> > >  share/mk/build/catman/eqn.mk        |  2 +-
> > >  share/mk/build/catman/grotty.mk     |  2 +-
> > >  share/mk/build/catman/troff.mk      |  2 +-
> > >  share/mk/build/examples/cc.mk       |  2 +-
> > >  share/mk/build/examples/dir.mk      |  2 +-
> > >  share/mk/build/html/post-grohtml.mk |  2 +-
> > >  share/mk/build/html/troff.mk        |  2 +-
> > >  share/mk/build/pdf/pages/eqn.mk     |  2 +-
> > >  share/mk/build/pdf/pages/troff.mk   |  2 +-
> > >  share/mk/build/pre/preconv.mk       |  2 +-
> > >  share/mk/build/pre/tbl.mk           |  2 +-
> > >  share/mk/build/ps/eqn.mk            |  2 +-
> > >  share/mk/build/ps/grops.mk          |  2 +-
> > >  share/mk/build/ps/troff.mk          |  2 +-
> > >  share/mk/check/catman/col.mk        |  2 +-
> > >  share/mk/check/catman/grep.mk       |  2 +-
> > >  share/mk/lint/c/clang-tidy.mk       | 11 ++---------
> > >  share/mk/lint/c/cppcheck.mk         | 11 ++---------
> > >  share/mk/lint/c/cpplint.mk          | 10 ++--------
> > >  share/mk/lint/c/iwyu.mk             | 11 ++---------
> > >  share/mk/lint/man/blank.mk          |  2 +-
> > >  share/mk/lint/man/dash.mk           |  2 +-
> > >  share/mk/lint/man/mandoc.mk         |  2 +-
> > >  share/mk/lint/man/poems.mk          |  2 +-
> > >  share/mk/lint/man/quote.mk          |  2 +-
> > >  share/mk/lint/man/so.mk             |  2 +-
> > >  share/mk/lint/man/ws.mk             |  2 +-
> > >  27 files changed, 31 insertions(+), 58 deletions(-)
> > >
> > > diff --git a/share/mk/build/catman/eqn.mk b/share/mk/build/catman/eqn.mk
> > > index 895662ac3710..e2830dab53ac 100644
> > > --- a/share/mk/build/catman/eqn.mk
> > > +++ b/share/mk/build/catman/eqn.mk
> > > @@ -18,7 +18,7 @@ ext ::= .cat.troff
> > >  _CATMAN_troff ::= $(patsubst %.eqn, %$(ext), $(_MAN_eqn))
> > >
> > >
> > > -$(_CATMAN_troff): %$(ext): %.eqn $(MK) | $$(@D)/
> > > +%$(ext): %.eqn $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)EQN		$@)
> > >  	! ($(EQN) -T$(NROFF_OUT_DEVICE) $(EQNFLAGS_) <$< 2>&1 >$@) \
> > >  	| $(GREP) ^ >&2
> > > diff --git a/share/mk/build/catman/grotty.mk b/share/mk/build/catman/grotty.mk
> > > index 66151b6cee93..a578edbeb191 100644
> > > --- a/share/mk/build/catman/grotty.mk
> > > +++ b/share/mk/build/catman/grotty.mk
> > > @@ -16,7 +16,7 @@ ext ::= .cat
> > >  _CATMAN ::= $(patsubst %.cat.set, %$(ext), $(_CATMAN_set))
> > >
> > >
> > > -$(_CATMAN): %$(ext): %.cat.set $(MK) | $$(@D)/
> > > +%$(ext): %.cat.set $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)GROTTY		$@)
> > >  	$(GROTTY) $(GROTTYFLAGS_) <$< >$@
> > >
> > > diff --git a/share/mk/build/catman/troff.mk b/share/mk/build/catman/troff.mk
> > > index 07e315327278..fc5bf0c18de8 100644
> > > --- a/share/mk/build/catman/troff.mk
> > > +++ b/share/mk/build/catman/troff.mk
> > > @@ -28,7 +28,7 @@ endif
> > >  _CATMAN_set ::= $(tgts)
> > >
> > >
> > > -$(_CATMAN_set): %$(ext): %.cat.troff $(regexf) $(MK) | $$(@D)/
> > > +%$(ext): %.cat.troff $(regexf) $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)TROFF		$@)
> > >  	! ($(TROFF) -mandoc $(TROFFFLAGS_) $(NROFFFLAGS_) <$< 2>&1 >$@ \
> > >  	   | $(GREP) -v -f '$(filter %.grep, $^)' \
> > > diff --git a/share/mk/build/examples/cc.mk b/share/mk/build/examples/cc.mk
> > > index 680b80f3e832..5806d8de0118 100644
> > > --- a/share/mk/build/examples/cc.mk
> > > +++ b/share/mk/build/examples/cc.mk
> > > @@ -25,7 +25,7 @@ endif
> > >  _EX_TU_o ::= $(tgts)
> > >
> > >
> > > -$(_EX_TU_o): %$(ext): %.c $(MK)
> > > +%$(ext): %.c $(MK)
> > >  	$(info	$(INFO_)CC		$@)
> > >  	$(CC) -c $(CFLAGS_) $(CPPFLAGS_) -o $@ $<
> > >
> > > diff --git a/share/mk/build/examples/dir.mk b/share/mk/build/examples/dir.mk
> > > index 10286c73bc0c..9782ad300193 100644
> > > --- a/share/mk/build/examples/dir.mk
> > > +++ b/share/mk/build/examples/dir.mk
> > > @@ -14,7 +14,7 @@ include $(MAKEFILEDIR)/configure/build-depends/coreutils/touch.mk
> > >  _PAGEEXDIRS ::= $(patsubst %, %.d/, $(_NONSO))
> > >
> > >
> > > -$(_PAGEEXDIRS):
> > > +%.d/:
> > >  	+$(info	$(INFO_)MKDIR		$@)
> > >  	+$(MKDIR) -p $@
> > >  	+$(TOUCH) $@
> > > diff --git a/share/mk/build/html/post-grohtml.mk b/share/mk/build/html/post-grohtml.mk
> > > index 0c96a78609d8..fa886f09d0d8 100644
> > > --- a/share/mk/build/html/post-grohtml.mk
> > > +++ b/share/mk/build/html/post-grohtml.mk
> > > @@ -16,7 +16,7 @@ ext ::= .html
> > >  _HTMLMAN ::= $(patsubst %.html.set, %$(ext), $(_HTMLMAN_set))
> > >
> > >
> > > -$(_HTMLMAN): %$(ext): %.html.set $(MK) | $$(@D)/
> > > +%$(ext): %.html.set $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)POST_GROHTML	$@)
> > >  	$(POST_GROHTML) $(POST_GROHTMLFLAGS_) <$< >$@
> > >
> > > diff --git a/share/mk/build/html/troff.mk b/share/mk/build/html/troff.mk
> > > index b6c1e659b7e4..6bdf9db1dbfa 100644
> > > --- a/share/mk/build/html/troff.mk
> > > +++ b/share/mk/build/html/troff.mk
> > > @@ -25,7 +25,7 @@ endif
> > >  _HTMLMAN_set ::= $(tgts)
> > >
> > >
> > > -$(_HTMLMAN_set): %$(ext): %.eqn $(MK) | $$(@D)/
> > > +%$(ext): %.eqn $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)TROFF		$@)
> > >  	! ($(TROFF) -mandoc -Thtml $(TROFFFLAGS_) <$< 2>&1 >$@) \
> > >  	| $(GREP) ^ >&2
> > > diff --git a/share/mk/build/pdf/pages/eqn.mk b/share/mk/build/pdf/pages/eqn.mk
> > > index 6ef945af3e10..49b1a72c6b08 100644
> > > --- a/share/mk/build/pdf/pages/eqn.mk
> > > +++ b/share/mk/build/pdf/pages/eqn.mk
> > > @@ -17,7 +17,7 @@ ext ::= .pdf.troff
> > >  _PDFMAN_troff ::= $(patsubst %.eqn, %$(ext), $(_MAN_eqn))
> > >
> > >
> > > -$(_PDFMAN_troff): %$(ext): %.eqn $(MK) | $$(@D)/
> > > +%$(ext): %.eqn $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)EQN		$@)
> > >  	! ($(EQN) -Tpdf $(EQNFLAGS_) <$< 2>&1 >$@) \
> > >  	| $(GREP) ^ >&2
> > > diff --git a/share/mk/build/pdf/pages/troff.mk b/share/mk/build/pdf/pages/troff.mk
> > > index e4c4d347fe6c..550168646d5b 100644
> > > --- a/share/mk/build/pdf/pages/troff.mk
> > > +++ b/share/mk/build/pdf/pages/troff.mk
> > > @@ -25,7 +25,7 @@ endif
> > >  _PDFMAN_set ::= $(tgts)
> > >
> > >
> > > -$(_PDFMAN_set): %$(ext): %.pdf.troff $(MK) | $$(@D)/
> > > +%$(ext): %.pdf.troff $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)TROFF		$@)
> > >  	! ($(TROFF) -mandoc -Tpdf $(TROFFFLAGS_) <$< 2>&1 >$@) \
> > >  	| $(GREP) ^ >&2
> > > diff --git a/share/mk/build/pre/preconv.mk b/share/mk/build/pre/preconv.mk
> > > index d19d12d261d7..e3dde5981949 100644
> > > --- a/share/mk/build/pre/preconv.mk
> > > +++ b/share/mk/build/pre/preconv.mk
> > > @@ -16,7 +16,7 @@ ext ::= .tbl
> > >  _MAN_tbl ::= $(patsubst %, %$(ext), $(_NONSO))
> > >
> > >
> > > -$(_MAN_tbl): %$(ext): % $(MK) | $$(@D)/
> > > +%$(ext): % $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)PRECONV		$@)
> > >  	$(PRECONV) $(PRECONVFLAGS_) $< >$@
> > >
> > > diff --git a/share/mk/build/pre/tbl.mk b/share/mk/build/pre/tbl.mk
> > > index 5883b6ec0c80..0375b958ff05 100644
> > > --- a/share/mk/build/pre/tbl.mk
> > > +++ b/share/mk/build/pre/tbl.mk
> > > @@ -16,7 +16,7 @@ ext ::= .eqn
> > >  _MAN_eqn ::= $(patsubst %.tbl, %$(ext), $(_MAN_tbl))
> > >
> > >
> > > -$(_MAN_eqn): %$(ext): %.tbl $(MK) | $$(@D)/
> > > +%$(ext): %.tbl $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)TBL		$@)
> > >  	$(TBL) <$< >$@
> > >
> > > diff --git a/share/mk/build/ps/eqn.mk b/share/mk/build/ps/eqn.mk
> > > index 315bed0e4cde..18c885655c99 100644
> > > --- a/share/mk/build/ps/eqn.mk
> > > +++ b/share/mk/build/ps/eqn.mk
> > > @@ -17,7 +17,7 @@ ext ::= .ps.troff
> > >  _PSMAN_troff ::= $(patsubst %.eqn, %$(ext), $(_MAN_eqn))
> > >
> > >
> > > -$(_PSMAN_troff): %$(ext): %.eqn $(MK) | $$(@D)/
> > > +%$(ext): %.eqn $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)EQN		$@)
> > >  	! ($(EQN) -Tps $(EQNFLAGS_) <$< 2>&1 >$@) \
> > >  	| $(GREP) ^ >&2
> > > diff --git a/share/mk/build/ps/grops.mk b/share/mk/build/ps/grops.mk
> > > index 463c7bac6f08..4b85b6a96854 100644
> > > --- a/share/mk/build/ps/grops.mk
> > > +++ b/share/mk/build/ps/grops.mk
> > > @@ -16,7 +16,7 @@ ext ::= .ps
> > >  _PSMAN ::= $(patsubst %.ps.set, %$(ext), $(_PSMAN_set))
> > >
> > >
> > > -$(_PSMAN): %$(ext): %.ps.set $(MK) | $$(@D)/
> > > +%$(ext): %.ps.set $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)GROPS		$@)
> > >  	$(GROPS) $(GROPSFLAGS_) <$< >$@
> > >
> > > diff --git a/share/mk/build/ps/troff.mk b/share/mk/build/ps/troff.mk
> > > index 851fb971faf3..8137014fe9e9 100644
> > > --- a/share/mk/build/ps/troff.mk
> > > +++ b/share/mk/build/ps/troff.mk
> > > @@ -25,7 +25,7 @@ endif
> > >  _PSMAN_set ::= $(tgts)
> > >
> > >
> > > -$(_PSMAN_set): %$(ext): %.ps.troff $(MK) | $$(@D)/
> > > +%$(ext): %.ps.troff $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)TROFF		$@)
> > >  	! ($(TROFF) -mandoc -Tps $(TROFFFLAGS_) <$< 2>&1 >$@) \
> > >  	| $(GREP) ^ >&2
> > > diff --git a/share/mk/check/catman/col.mk b/share/mk/check/catman/col.mk
> > > index 25b8b6e154a6..de326d989183 100644
> > > --- a/share/mk/check/catman/col.mk
> > > +++ b/share/mk/check/catman/col.mk
> > > @@ -16,7 +16,7 @@ ext ::= .cat.grep
> > >  _CHECK_catman_grep ::= $(patsubst %.cat, %$(ext), $(_CATMAN))
> > >
> > >
> > > -$(_CHECK_catman_grep): %$(ext): %.cat $(MK) | $$(@D)/
> > > +%$(ext): %.cat $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)COL		$@)
> > >  	$(COL) $(COLFLAGS_) <$< >$@
> > >
> > > diff --git a/share/mk/check/catman/grep.mk b/share/mk/check/catman/grep.mk
> > > index bcfa1a134459..2fce886ae920 100644
> > > --- a/share/mk/check/catman/grep.mk
> > > +++ b/share/mk/check/catman/grep.mk
> > > @@ -25,7 +25,7 @@ endif
> > >  _CHECK_catman ::= $(tgts)
> > >
> > >
> > > -$(_CHECK_catman): %.check-catman.touch: %.cat.grep $(MK) | $$(@D)/
> > > +%.check-catman.touch: %.cat.grep $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)GREP		$@)
> > >  	! $(GREP) -n '.\{$(MANWIDTH)\}.' $< /dev/null >&2
> > >  	$(TOUCH) $@
> > > diff --git a/share/mk/lint/c/clang-tidy.mk b/share/mk/lint/c/clang-tidy.mk
> > > index 8333c8ace12c..d992b956baf3 100644
> > > --- a/share/mk/lint/c/clang-tidy.mk
> > > +++ b/share/mk/lint/c/clang-tidy.mk
> > > @@ -24,14 +24,8 @@ ifeq ($(SKIP_XFAIL),yes)
> > >  tgts_EX ::= $(filter-out $(patsubst %, $(_MANDIR)/%$(ext), $(file < $(xfail))), $(tgts_EX))
> > >  endif
> > >
> > > -tgts ::= $(tgts_EX)
> > >
> > > -
> > > -$(tgts_EX): %$(ext): %
> > > -$(tgts): $(CLANG_TIDY_CONF) $(MK) | $$(@D)/
> > > -
> > > -
> > > -$(tgts):
> > > +%$(ext): % $(CLANG_TIDY_CONF) $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)CLANG_TIDY	$@)
> > >  	$(CLANG_TIDY) $(CLANG_TIDYFLAGS_) $< -- $(CLANGFLAGS_) $(CPPFLAGS_) 2>&1 \
> > >  	| $(SED) '/generated\.$$/d' >&2
> > > @@ -39,13 +33,12 @@ $(tgts):
> > >
> > >
> > >  .PHONY: lint-c-clang-tidy
> > > -lint-c-clang-tidy: $(tgts);
> > > +lint-c-clang-tidy: $(tgts_EX);
> > >
> > >
> > >  undefine ext
> > >  undefine xfail
> > >  undefine tgts_EX
> > > -undefine tgts
> > >
> > >
> > >  endif  # include guard
> > > diff --git a/share/mk/lint/c/cppcheck.mk b/share/mk/lint/c/cppcheck.mk
> > > index c377120e4fa1..3952414c9cfd 100644
> > > --- a/share/mk/lint/c/cppcheck.mk
> > > +++ b/share/mk/lint/c/cppcheck.mk
> > > @@ -21,27 +21,20 @@ ifeq ($(SKIP_XFAIL),yes)
> > >  tgts_EX ::= $(filter-out $(patsubst %, $(_MANDIR)/%$(ext), $(file < $(xfail))), $(tgts_EX))
> > >  endif
> > >
> > > -tgts ::= $(tgts_EX)
> > >
> > > -
> > > -$(tgts_EX): %$(ext): %
> > > -$(tgts): $(CPPCHECK_SUPPRESS) $(MK) | $$(@D)/
> > > -
> > > -
> > > -$(tgts):
> > > +%$(ext): % $(CPPCHECK_SUPPRESS) $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)CPPCHECK	$@)
> > >  	$(CPPCHECK) $(CPPCHECKFLAGS_) $<
> > >  	$(TOUCH) $@
> > >
> > >
> > >  .PHONY: lint-c-cppcheck
> > > -lint-c-cppcheck: $(tgts);
> > > +lint-c-cppcheck: $(tgts_EX);
> > >
> > >
> > >  undefine ext
> > >  undefine xfail
> > >  undefine tgts_EX
> > > -undefine tgts
> > >
> > >
> > >  endif  # include guard
> > > diff --git a/share/mk/lint/c/cpplint.mk b/share/mk/lint/c/cpplint.mk
> > > index 6a714bc315ad..9ecef7f45553 100644
> > > --- a/share/mk/lint/c/cpplint.mk
> > > +++ b/share/mk/lint/c/cpplint.mk
> > > @@ -13,26 +13,20 @@ include $(MAKEFILEDIR)/configure/build-depends/cpplint/cpplint.mk
> > >
> > >  ext ::= .lint-c.cpplint.touch
> > >  tgts_EX ::= $(patsubst %, %$(ext), $(_EX_TU_src))
> > > -tgts    ::= $(tgts_EX)
> > >
> > >
> > > -$(tgts_EX): %$(ext): %
> > > -$(tgts): $(CPPLINT_CONF) $(MK) | $$(@D)/
> > > -
> > > -
> > > -$(tgts):
> > > +%$(ext): % $(CPPLINT_CONF) $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)CPPLINT		$@)
> > >  	$(CPPLINT) $(CPPLINTFLAGS_) $< >/dev/null
> > >  	$(TOUCH) $@
> > >
> > >
> > >  .PHONY: lint-c-cpplint
> > > -lint-c-cpplint: $(tgts);
> > > +lint-c-cpplint: $(tgts_EX);
> > >
> > >
> > >  undefine ext
> > >  undefine tgts_EX
> > > -undefine tgts
> > >
> > >
> > >  endif  # include guard
> > > diff --git a/share/mk/lint/c/iwyu.mk b/share/mk/lint/c/iwyu.mk
> > > index e4477dbfac58..03bc68f55546 100644
> > > --- a/share/mk/lint/c/iwyu.mk
> > > +++ b/share/mk/lint/c/iwyu.mk
> > > @@ -27,14 +27,8 @@ ifeq ($(SKIP_XFAIL),yes)
> > >  tgts_EX ::= $(filter-out $(patsubst %, $(_MANDIR)/%$(ext), $(file < $(xfail))), $(tgts_EX))
> > >  endif
> > >
> > > -tgts ::= $(tgts_EX)
> > >
> > > -
> > > -$(tgts_EX): %$(ext): %
> > > -$(tgts): $(MK) | $$(@D)/
> > > -
> > > -
> > > -$(tgts):
> > > +%$(ext): % $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)IWYU		$@)
> > >  	! ($(IWYU) $(IWYUFLAGS_) $(CLANGFLAGS_) $(CPPFLAGS_) $< 2>&1 \
> > >  	   | $(SED) -n '/should add these lines:/,$$p' \
> > > @@ -48,13 +42,12 @@ $(tgts):
> > >
> > >
> > >  .PHONY: lint-c-iwyu
> > > -lint-c-iwyu: $(tgts);
> > > +lint-c-iwyu: $(tgts_EX);
> > >
> > >
> > >  undefine ext
> > >  undefine xfail
> > >  undefine tgts_EX
> > > -undefine tgts
> > >
> > >
> > >  endif  # include guard
> > > diff --git a/share/mk/lint/man/blank.mk b/share/mk/lint/man/blank.mk
> > > index f8eca7ac86b7..8fc7ad4be0a8 100644
> > > --- a/share/mk/lint/man/blank.mk
> > > +++ b/share/mk/lint/man/blank.mk
> > > @@ -22,7 +22,7 @@ tgts ::= $(filter-out $(patsubst %, $(_MANDIR)/%$(ext), $(file < $(xfail))), $(t
> > >  endif
> > >
> > >
> > > -$(tgts): %$(ext): % $(MK) | $$(@D)/
> > > +%$(ext): % $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)GREP		$@)
> > >  	$(CAT) <$< \
> > >  	| if $(GREP) '^$$' >/dev/null; then \
> > > diff --git a/share/mk/lint/man/dash.mk b/share/mk/lint/man/dash.mk
> > > index 85307af0e449..d82ac734880d 100644
> > > --- a/share/mk/lint/man/dash.mk
> > > +++ b/share/mk/lint/man/dash.mk
> > > @@ -21,7 +21,7 @@ regexf ::= $(MAKEFILEDIR)/lint/man/dash.pcre2grep
> > >  tgts ::= $(patsubst %, %$(ext), $(_NONSO))
> > >
> > >
> > > -$(tgts): %$(ext): % $(regexf) $(MK) | $$(@D)/
> > > +%$(ext): % $(regexf) $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)PCRE2GREP	$@)
> > >  	$(CAT) <$< \
> > >  	| if $(PCRE2GREP) -f '$(filter %.pcre2grep, $^)' >/dev/null; then \
> > > diff --git a/share/mk/lint/man/mandoc.mk b/share/mk/lint/man/mandoc.mk
> > > index 5c24ca66ee7a..d96f94439933 100644
> > > --- a/share/mk/lint/man/mandoc.mk
> > > +++ b/share/mk/lint/man/mandoc.mk
> > > @@ -25,7 +25,7 @@ tgts ::= $(filter-out $(patsubst %, $(_MANDIR)/%$(ext), $(file < $(xfail))), $(t
> > >  endif
> > >
> > >
> > > -$(tgts): %$(ext): % $(regexf) $(MK) | $$(@D)/
> > > +%$(ext): % $(regexf) $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)MANDOC		$@)
> > >  	! ($(MANDOC) $(MANDOCFLAGS_) $< 2>&1 \
> > >  	   | $(GREP) -v -f '$(filter %.grep, $^)' \
> > > diff --git a/share/mk/lint/man/poems.mk b/share/mk/lint/man/poems.mk
> > > index b7ee792f346c..b0e799d2997a 100644
> > > --- a/share/mk/lint/man/poems.mk
> > > +++ b/share/mk/lint/man/poems.mk
> > > @@ -25,7 +25,7 @@ tgts ::= $(filter-out $(patsubst %, $(_MANDIR)/%$(ext), $(file < $(xfail))), $(t
> > >  endif
> > >
> > >
> > > -$(tgts): %$(ext): % $(regexf) $(MK) | $$(@D)/
> > > +%$(ext): % $(regexf) $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)PCRE2GREP	$@)
> > >  	$(CAT) <$< \
> > >  	| if $(PCRE2GREP) -f '$(filter %.pcre2grep, $^)' >/dev/null; then \
> > > diff --git a/share/mk/lint/man/quote.mk b/share/mk/lint/man/quote.mk
> > > index 3aca334967c0..86bc397c1d2b 100644
> > > --- a/share/mk/lint/man/quote.mk
> > > +++ b/share/mk/lint/man/quote.mk
> > > @@ -23,7 +23,7 @@ tgts ::= $(filter-out $(patsubst %, $(_MANDIR)/%$(ext), $(file < $(xfail))), $(t
> > >  endif
> > >
> > >
> > > -$(tgts): %$(ext): % $(regexf) $(MK) | $$(@D)/
> > > +%$(ext): % $(regexf) $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)GREP		$@)
> > >  	$(CAT) <$< \
> > >  	| if $(GREP) -Pf $(filter %.Pgrep, $^) >/dev/null; then \
> > > diff --git a/share/mk/lint/man/so.mk b/share/mk/lint/man/so.mk
> > > index 09b7816ae38f..cf8d6776e15d 100644
> > > --- a/share/mk/lint/man/so.mk
> > > +++ b/share/mk/lint/man/so.mk
> > > @@ -24,7 +24,7 @@ tgts ::= $(filter-out $(patsubst %, $(_MANDIR)/%$(ext), $(file < $(xfail))), $(t
> > >  endif
> > >
> > >
> > > -$(tgts): %$(ext): % $(MK) | $$(@D)/
> > > +%$(ext): % $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)FIND		$@)
> > >  	$(GREP) '^\.so ' <$< \
> > >  	| $(CUT) -f2 -d' ' \
> > > diff --git a/share/mk/lint/man/ws.mk b/share/mk/lint/man/ws.mk
> > > index 7fd3bb69361d..2f587fc4e6ea 100644
> > > --- a/share/mk/lint/man/ws.mk
> > > +++ b/share/mk/lint/man/ws.mk
> > > @@ -23,7 +23,7 @@ tgts ::= $(filter-out $(patsubst %, $(_MANDIR)/%$(ext), $(file < $(xfail))), $(t
> > >  endif
> > >
> > >
> > > -$(tgts): %$(ext): % $(regexf) $(MK) | $$(@D)/
> > > +%$(ext): % $(regexf) $(MK) | $$(@D)/
> > >  	$(info	$(INFO_)GREP		$@)
> > >  	$(CAT) <$< \
> > >  	| if $(GREP) -Ef $(filter %.egrep, $^) >/dev/null; then \
> > >
> > > Range-diff against v0:
> > > -:  ------------ > 1:  9a74fe43cf61 share/mk/: Use suffix rules where possible
> > > --
> > > 2.53.0
> > >
> >
> >
> >
> > --
> > <https://www.alejandro-colomar.es>
>
>
>
> --
> <https://www.alejandro-colomar.es>



--
Cheers, Lorenzo
