Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792449710;
	b=Emx0zLYvfyT9hROdUN15Rn+FrwdajRlY9H97pP5B+CmV8tbPd1aGWsRXgaKg8IO/E3t3
	 u/nhOyPkMsuo0OmJn+5D6nMJKvg3Als3/vo/j7X5aFGzd2eyjNDyk9L+qAxTv3YnB2Dqj
	 3CE9BKamzx8ZSC9c/BjZdjp0lrgx+hm9QhmJn4hJdb7zz+8wCsVI7Cka7KjA3hivC4lUP
	 Vu+1ieuPkjhnU4rc1yV98/dt9azb02iRf0N7UFiv1xTqwPQawT42fGX4H8hsW13KWyUj+
	 cXDSfGFy6OpTZDiH8T+KoRoVUVWoJG0lrL8V9wcI8iYND2VOFPXQw1rSw9siH4L720g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792449710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=lu9Mjrd4E9H9gRVlKjLg72Htavu4LAr8WXAg+qApc8w=;
	b=EpW99sDAgp7bbghu2Kem7TSUcJ+gf0qorqP/1M6vEs8P+teN1LLXJ9m6UVjxowVvuYUW
	 tn8Heakq8FzFbTQ0U/RJHSSfvc22UhlGM4hpQkXc+M+NMEZSsDOHPSKACYPjuSEMdbQ6D
	 Kj9mUw8ok9ODpi0H+2glQBRwxhQGbI61eKdD+5aAo3YPROIFzSfGZAJrQtshb3F9U4EcB
	 Uj9nTUJHLZo9ApF5YzhjT3YhZ6U2RtREEf/of5RCsJGj3FR6M59CGCBu/ZyaB1AK/SqP1
	 qABNzbi1onlVqhefHz9qjg9UDhR7P4+i0ZCGf6ZkJ5wih4WsFYHYTgePmYOMVrQhBNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gWbAT6dv;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C792606A319
	for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 22:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C792606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gWbAT6dv
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67583c777abso173770d50.1
        for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 15:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792449709; x=1793054509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lu9Mjrd4E9H9gRVlKjLg72Htavu4LAr8WXAg+qApc8w=;
        b=gWbAT6dv/na7/szRBJoTfrK9SPadccojpNfzhGK0xa6vvU47SZrtXgLwSJFCo1x8RV
         4vzdwojeI4tKpjgKrOs3ROXellOM+nTWv/NLox+H1jcXZxKbtVeQlbWHAIRwzu/lFKSz
         D1SlH5MnhxVexIhSp1wopmeDd3tCzuZ5u/pUCLHWp7qI9FwZTfU39gXRTzwRhe7DBNqa
         ZcA5FxynJNHvVNXFtfcznzUX9IsJtlCoL+kptQrScbYf6K3ehPHAxvcJvy6Zk5tk8+Rj
         gVeEhG4ykld/XOQo+kZhc1ye0yM1L000IHnHwXIg8KpcrJpVwmMqOWfTUN1ILmuPDNLS
         P4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792449709; x=1793054509;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lu9Mjrd4E9H9gRVlKjLg72Htavu4LAr8WXAg+qApc8w=;
        b=E1MISETNmuf9EtgQI+FmpFoC4ur3vP52I/1elDZBojdSbnYNdtP330mKAdWC1Wcqxu
         ZOutAmQ7tdSIbK0lEwMlx8HdxcKQs4kaz48z1/J7kpXxv47FWeNvrdxefDAoEXw1PnpE
         cLvgaOapGNGkjYcDkCb0HQRgwa7ZgJ2QSLdZuh3s65do33OOktZPgE/crdzg3trJCzxn
         wH8egeXhMY5EQBt8qJ7jUyr5PHEr+J0q8tywtatIrfJtSw5fKWnEm2SQ6H6RJ7j7dvfc
         XKvFN1O4kImB3MMsRxKHrg55i4HRU8ZV9+Ih219Gm2FMuqSX5LbuOdYql1+SAqSLxSER
         SKag==
X-Gm-Message-State: AFq9FYIgyTq9eX0rdeR455rBR6C7LPZKhEsewn0rGYNLo3yuO1jiS/00
	tf+3Tfr9U/YLg605ElrUezIZetD43sO0oxqEAYS2+n6CjKtxUYQmdBv9dgT5wQ==
X-Gm-Gg: AYBFou1wRK6Y7ylQmEErjNKBpocq+9xQaRDgnUT7ahPssq23etiqhSucM+NuVFZ6X7h
	SCni0SNmFqbvbToGeawLpc/vyCp8XA0UNoJSssdGRV4j9m6e63nbu+PwVv1sYHvhnQIeYhrVcfO
	pMxhla3gLM2mZFSCs+UnwNpNQps4AFv77LBJ9Tu76fkqxB4FKD1dMO1rdN7nkXKFlKxBWqUlxzR
	F7PZXeKh2L2qwe5ioq3nYmAe+vpM6BEQSNSfV4oBLinxJgHEDalgDuH1SlLs+8afLtJpCEh2Crb
	+WdnaUAwfePWOGpHhNM+UD5pST0Kir6nDxCujjh1cp2l+7QUgi6LLahsJb/AVUn8/NvGkBVwAVT
	oytGlrfTJp5Ih9kfFO4auh+j1ziE/nFkeriARKi7slgFtVFPY3al2d0/kh8nFA71N0RfwVgkIZ+
	lAdK161HBJyX0hRQGf/vkihaIkSt8NSSRNTLBPDHUY6liSn2xLuLYFsj1COcxovmbhnluiyg==
X-Received: by 2002:a05:690e:13cf:b0:679:a1f6:2ea0 with SMTP id 956f58d0204a3-679fbce22e8mr175196d50.33.1792449708847;
        Mon, 19 Oct 2026 15:41:48 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::49])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1c98a1esm4501316d50.1.2026.10.19.15.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 15:41:47 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:41:45 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>,
	Hugo Buddelmeijer <hugo@buddelmeijer.nl>
Cc: linux-man@vger.kernel.org
Subject: Re: table layout in console_codes.4 (was: `make -R check` fails due
 to futex_waitv.2 and console_codes.4 being too wide)
Message-ID: <20261019224145.aovalqyh2fpcdzdk@illithid>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ur2asf2db5mfq3ns"
Content-Disposition: inline
In-Reply-To: <atZJ7QGljZ4K50wD@debian>
 <1e4d35e5-f8af-402b-9cdb-46a70f793b96@buddelmeijer.nl>


--ur2asf2db5mfq3ns
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="qgx2fa2bqc6arxmb"
Content-Disposition: inline
Subject: Re: table layout in console_codes.4 (was: `make -R check` fails due
 to futex_waitv.2 and console_codes.4 being too wide)
MIME-Version: 1.0


--qgx2fa2bqc6arxmb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alex & Hugo,

At 2026-10-19T18:55:32+0200, Alejandro Colomar wrote:
> > Date: 2026-10-19 08:02:35-0500
> > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > At 2026-10-19T08:20:29+0200, Alejandro Colomar wrote:
> > > > Date: 2026-10-17 21:19:22+0200
> > > > From: Hugo Buddelmeijer <hugo@buddelmeijer.nl>
> > > > Running `make -R check` fails because the text in futex_waitv.2
> > > > and console_codes.4 is too wide.
> > [...]
> >=20
> > I observe that the failure doesn't tell you why the "check" target
> > is failing.  It simply says "GREP" and then the output of grep
> > itself.  We are not informed what grep was looking for.
> >=20
> > I also observe that setting `V=3D1` is useless to get these Makefiles
> > to tell us what they're actually doing.
>=20
> Hmmm, this gave me a good idea.  I don't like this V variable, since
> it's unclear what it should do in each project, but I've played with
> this patch:
>=20
> 	diff --git i/GNUmakefile w/GNUmakefile
> 	index 9f3ced6f461b..9b480fe5e52c 100644
> 	--- i/GNUmakefile
> 	+++ w/GNUmakefile
> 	@@ -16,6 +16,7 @@ endif
> 	 MAKEFLAGS +=3D --no-builtin-rules
> 	 MAKEFLAGS +=3D --no-builtin-variables
> 	 MAKEFLAGS +=3D --warn-undefined-variables
> 	+MAKEFLAGS +=3D --silent
> 	=20
> 	=20
> 	 ifndef srcdir
> 	@@ -66,5 +67,4 @@ help:
> 	=20
> 	=20
> 	 .DELETE_ON_ERROR:
> 	-.SILENT:
> 	 FORCE:
>=20
> and it seems to work.  If you use --no-silent on the command line, it
> overrides the default.  I'll check better before committing.

Cool!

> > While attempting to reproduce Hugo's results, I also noticed the
> > following messages on stderr.
> >=20
> > TBL             .tmp/man/man3/matherr.3.eqn
> > tbl:".tmp/man/man3/matherr.3:204: warning: ignoring excess table entry =
at row 5, column 6: "\" retval is 0.0/0.0"
> > tbl:".tmp/man/man3/matherr.3:205: warning: ignoring excess table entry =
at row 6, column 6: "\" retval is 0.0/0.0"
> > tbl:".tmp/man/man3/matherr.3:206: warning: ignoring excess table entry =
at row 7, column 6: "\" retval is x/0.0"
> > tbl:".tmp/man/man3/matherr.3:241: warning: ignoring excess table entry =
at row 42, column 6: "\" different from log()"
> > tbl:".tmp/man/man3/matherr.3:242: warning: ignoring excess table entry =
at row 43, column 6: "\" different from log()"
> > tbl:".tmp/man/man3/matherr.3:249: warning: ignoring excess table entry =
at row 50, column 6: "\" +0 and -0"
> > tbl:".tmp/man/man3/matherr.3:257: warning: ignoring excess table entry =
at row 58, column 6: "\" retval is 0.0/0.0"
> >=20
> > (These diagnostic messages are new to the forthcoming groff 1.25.)
> >=20
> > Inspecting the file:
> >=20
> > $ sed -n 194,205p man/man3/matherr.3
> > .\" Details below from glibc 2.8's sysdeps/ieee754/k_standard.c
> > .\" A subset of cases were test by experimental programs.
> > .TS
> > lB lB lB cB lB
> > l l l c l.
> > Function        Type    Result  Msg?    errno
> > acos(|x|>1)     DOMAIN  HUGE    y       EDOM
> > asin(|x|>1)     DOMAIN  HUGE    y       EDOM
> > atan2(0,0)      DOMAIN  HUGE    y       EDOM
> > acosh(x<1)      DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
> > atanh(|x|>1)    DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
> > atanh(|x|=3D=3D1)   SING    (x>0.0)?        y       EDOM    \" retval i=
s x/0.0
> >=20
> > This seems like a straightforward case of someone forgetting to
> > update the table format--much easier to neglect before I added the
> > new tbl diagnostic.  In lieu of a formal patch, here are some
> > replacement lines.
>=20
> I'd love a formal patch, especially with a good commit message.  :)

I'm sure.  But I'm dealing with yet another late-release-cycle fire
drill in groff right now, unfortunately.

> > lB lB lB cB lB l
> > l  l  l  c  l  l.
> > Function	Type	Result	Msg?	errno	\&
[...]
> > > > Maybe you could device a better patch though, in particular for
> > > > console_codes.  The affected table is much narrower than similar
> > > > tables, so some lines that have to be truncated, would easily
> > > > fit in one of the other tables.  But I couldn't easily figure
> > > > out what determines the column widths, so I didn't fix that.
> > >=20
> > > I think Branden might be better at that; I've added him to CC.
[...]
> > The fix is straightforward: put the table cell in a text block.  But
> > there is one other entry in this table that is too wide.
> >=20
> > $ diff -u man/man4/console_codes.4{.old,}
>=20
> No git-diff(1)?  :D

Nope; see above.

And on second thought it occurs to me that you may not want that column
in the table after all, since they are all *roff comments intended (I
think) only for inspection by the document maintainer, not by the
reader.  In that case what you want to do is not add a column, but stop
supplying excess table entries--in other words, discard the tab
character before the `\"` comment escape sequence.

diff --git a/man/man3/matherr.3 b/man/man3/matherr.3
index 2e179e358..8711ee3cd 100644
--- a/man/man3/matherr.3
+++ b/man/man3/matherr.3
@@ -200,9 +200,9 @@ .SS Math functions that employ matherr()
 acos(|x|>1)    DOMAIN  HUGE    y       EDOM
 asin(|x|>1)    DOMAIN  HUGE    y       EDOM
 atan2(0,0)     DOMAIN  HUGE    y       EDOM
-acosh(x<1)     DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
-atanh(|x|>1)   DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
-atanh(|x|=3D=3D1)  SING    (x>0.0)?        y       EDOM    \" retval is x/=
0.0
+acosh(x<1)     DOMAIN  NAN     y       EDOM\" retval is 0.0/0.0
+atanh(|x|>1)   DOMAIN  NAN     y       EDOM\" retval is 0.0/0.0
+atanh(|x|=3D=3D1)  SING    (x>0.0)?        y       EDOM\" retval is x/0.0
 \      \       HUGE_VAL :
 \      \       \-HUGE_VAL
 cosh(fin) o/f  OVERFLOW        HUGE    n       ERANGE
@@ -237,15 +237,15 @@ .SS Math functions that employ matherr()
 \      \       HUGE_VAL,x)
 log(0) SING    \-HUGE  y       EDOM
 log(x<0)       DOMAIN  \-HUGE  y       EDOM
-log2(0)        SING    \-HUGE  n       EDOM    \" different from log()
-log2(x<0)      DOMAIN  \-HUGE  n       EDOM    \" different from log()
+log2(0)        SING    \-HUGE  n       EDOM\" different from log()
+log2(x<0)      DOMAIN  \-HUGE  n       EDOM\" different from log()
 log10(0)       SING    \-HUGE  y       EDOM
 log10(x<0)     DOMAIN  \-HUGE  y       EDOM
 pow(0.0,0.0)   DOMAIN  0.0     y       EDOM
 pow(x,y) o/f   OVERFLOW        HUGE    n       ERANGE
 pow(x,y) u/f   UNDERFLOW       0.0     n       ERANGE
 pow(NaN,0.0)   DOMAIN  x       n       EDOM
-0**neg DOMAIN  0.0     y       EDOM    \" +0 and -0
+0**neg DOMAIN  0.0     y       EDOM\" +0 and -0
 neg**non-int   DOMAIN  0.0     y       EDOM
 scalb() o/f    OVERFLOW        (x>0.0) ?       n       ERANGE
 \      \       HUGE_VAL :
@@ -253,7 +253,7 @@ .SS Math functions that employ matherr()
 scalb() u/f    UNDERFLOW       copysign(       n       ERANGE
 \      \       \ \ 0.0,x)
 fmod(x,0)      DOMAIN  x       y       EDOM
-remainder(x,0) DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
+remainder(x,0) DOMAIN  NAN     y       EDOM\" retval is 0.0/0.0
 .TE
 .SH ATTRIBUTES
 For an explanation of the terms used in this section, see

(Also attached.)

If the foregoing looks ugly, bear in mind that you're wandering a bit
off the path with these comments.

tbl(1):
Limitations
     Within a tbl region (except in text blocks or on roff control
     lines), avoid escape sequences that read the rest of the input
     line, as \" and \! do.

> > I was able to get a complete, successful check with the following
> > command.
> >=20
> > $ make -R check NROFF_LINE_LENGTH=3D80 NROFFFLAGS=3D-Wstyle
>=20
> Thanks!  Would you mind sending a formal patch set?  =3D)

I'll need a reminder when I feel less swamped (after groff 1.25.0,
likely), or someone else can steal my fixes.  :)

> > I needed to override `NROFFFLAGS` because of a new warning category
> > in the forthcoming groff 1.25.
> >=20
> > groff NEWS:
> > *  The formatter supports a new warning category, "style".  It is
> >    used to diagnose input that is non-idiomatic or likely to produce
> >    an unexpected result (or none at all), but is not invalid.
> >=20
> > One of the things it warns about is failure to break an input line
> > after the end of a sentence is detected.  The Linux man-pages may
> > want to disable that warning category by default until those have
> > been cleaned up.  Enabling it will, of course, permit machine-driven
> > identification of sites requiring such cleanup, which has to date
> > been tedious, requiring manual inspection or application of regexes
> > that can be thwarted by the *roff language's context-dependent
> > grammar.
>=20
> We'll see when it arrives.  :)

Yeah, I wouldn't want to fool with it before it lands in an official
release, either.  But this _does_ mean that the Linux man-pages
documents will appear to "regress" suddenly when the host system
upgrades to groff 1.25.0, because you use `-ww` to turn on all warnings.

$ git grep -n -B4 '[-]ww' share
share/mk/configure/build-depends/groff-base/nroff.mk-32-DEFAULT_NROFFFLAGS =
::=3D \
share/mk/configure/build-depends/groff-base/nroff.mk-33-        -T$(NROFF_O=
UT_DEVICE) \
share/mk/configure/build-depends/groff-base/nroff.mk-34-        -rLL=3D$(NR=
OFF_LINE_LENGTH)n \
share/mk/configure/build-depends/groff-base/nroff.mk-35-        -rCHECKSTYL=
E=3D$(NROFF_CHECKSTYLE_LVL) \
share/mk/configure/build-depends/groff-base/nroff.mk:36:        -ww

At 2026-10-19T20:32:27+0200, Hugo Buddelmeijer wrote:
> On 10/19/26 15:02, G. Branden Robinson wrote:
> > Hi Alex & Hugo,
> >=20
> > At 2026-10-19T08:20:29+0200, Alejandro Colomar wrote:
> > > > Date: 2026-10-17 21:19:22+0200
> > > > From: Hugo Buddelmeijer <hugo@buddelmeijer.nl>
> > > > Running `make -R check` fails because the text in futex_waitv.2
> > > > and console_codes.4 is too wide.
> > [...]
> > I observe that the failure doesn't tell you why the "check" target
> > is failing.  It simply says "GREP" and then the output of grep
> > itself.  We are not informed what grep was looking for.
>=20
> For me the output of `make -R check` was useful enough (using groff
> 1.24.0, should have included that):
>=20
> .tmp/man/man4/console_codes.4:750: warning: table wider than line
> length minus indentation
>=20
> It does not exactly say which line is too long, so I removed
> 'suspicious' lines until the test passed, then added them back one by
> one, adding a text block whenever TROFF complained.

That's a good approach.  Because of the way the tbl preprocessor and the
formatter (troff) interact, it's hard to emit a precise diagnostic here;
the information isn't just lying around to be abstracted.  There might
be a way we can enhance tbl to keep track of which table cell was
responsible for causing the table to extend to its maximum width,
however.[1]  That width _is_ tracked, in the register `TW`.

tbl(1):
   roff interface
     The register TW stores the width of the table region in basic
     units; it can=E2=80=99t be used within the region itself, but is defin=
ed
     before the .TE token is output so that a troff macro named TE can
     make use of it.  ...

> 5 lines were to wide for the table.
>=20
> The result looks rather unsatisfactory, see attached screenshot, which
> shows the affected table and the one above it.  The top one is much
> broader.

Yes.  tbl uses a formula to compute the default width of text blocks.

tbl(1):
   Text blocks
=2E..
     If w or x modifiers are not specified for all columns of a text
     block=E2=80=99s span, the default length of the text block (more preci=
sely,
     the line length used to process the text block=E2=80=99s diversion) is
     computed as L=C3=97C/(N+1), where L is the current line length, C the
     number of columns spanned by the text block, and N the number of
     columns in the table.  ...

> I investigated a bit deeper, and believe that the table is so narrow
> because it uses column specification "l l."; replacing that with "l
> lx." makes the table wider (probably requiring less text blocks).
> This was just cargo-culted from other tables though.

That's a good fix.  It's orthogonal to the use of text blocks, though;
on a wide terminal, applying the 'x' column modifier will quieten the
warning, but won't make the table format better on narrower terminals.
Those will still get the warning, and worse, the table will overset.

Regards,
Branden

[1] In fact, that's a good enough idea that I'll file a Savannah ticket
    for it after I have a URL for a publicly archived form of this
    message I can cross-reference.

--qgx2fa2bqc6arxmb
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="matherr.3.diff"

diff --git a/man/man3/matherr.3 b/man/man3/matherr.3
index 2e179e358..8711ee3cd 100644
--- a/man/man3/matherr.3
+++ b/man/man3/matherr.3
@@ -200,9 +200,9 @@ .SS Math functions that employ matherr()
 acos(|x|>1)	DOMAIN	HUGE	y	EDOM
 asin(|x|>1)	DOMAIN	HUGE	y	EDOM
 atan2(0,0)	DOMAIN	HUGE	y	EDOM
-acosh(x<1)	DOMAIN	NAN	y	EDOM	\" retval is 0.0/0.0
-atanh(|x|>1)	DOMAIN	NAN	y	EDOM	\" retval is 0.0/0.0
-atanh(|x|==1)	SING	(x>0.0)?	y	EDOM	\" retval is x/0.0
+acosh(x<1)	DOMAIN	NAN	y	EDOM\" retval is 0.0/0.0
+atanh(|x|>1)	DOMAIN	NAN	y	EDOM\" retval is 0.0/0.0
+atanh(|x|==1)	SING	(x>0.0)?	y	EDOM\" retval is x/0.0
 \ 	\ 	HUGE_VAL :
 \ 	\ 	\-HUGE_VAL
 cosh(fin) o/f	OVERFLOW	HUGE	n	ERANGE
@@ -237,15 +237,15 @@ .SS Math functions that employ matherr()
 \ 	\ 	HUGE_VAL,x)
 log(0)	SING	\-HUGE	y	EDOM
 log(x<0)	DOMAIN	\-HUGE	y	EDOM
-log2(0)	SING	\-HUGE	n	EDOM	\" different from log()
-log2(x<0)	DOMAIN	\-HUGE	n	EDOM	\" different from log()
+log2(0)	SING	\-HUGE	n	EDOM\" different from log()
+log2(x<0)	DOMAIN	\-HUGE	n	EDOM\" different from log()
 log10(0)	SING	\-HUGE	y	EDOM
 log10(x<0)	DOMAIN	\-HUGE	y	EDOM
 pow(0.0,0.0)	DOMAIN	0.0	y	EDOM
 pow(x,y) o/f	OVERFLOW	HUGE	n	ERANGE
 pow(x,y) u/f	UNDERFLOW	0.0	n	ERANGE
 pow(NaN,0.0)	DOMAIN	x	n	EDOM
-0**neg	DOMAIN	0.0	y	EDOM	\" +0 and -0
+0**neg	DOMAIN	0.0	y	EDOM\" +0 and -0
 neg**non-int	DOMAIN	0.0	y	EDOM
 scalb() o/f	OVERFLOW	(x>0.0) ?	n	ERANGE
 \ 	\ 	HUGE_VAL :
@@ -253,7 +253,7 @@ .SS Math functions that employ matherr()
 scalb() u/f	UNDERFLOW	copysign(	n	ERANGE
 \ 	\ 	\ \ 0.0,x)
 fmod(x,0)	DOMAIN	x	y	EDOM
-remainder(x,0)	DOMAIN	NAN	y	EDOM	\" retval is 0.0/0.0
+remainder(x,0)	DOMAIN	NAN	y	EDOM\" retval is 0.0/0.0
 .TE
 .SH ATTRIBUTES
 For an explanation of the terms used in this section, see

--qgx2fa2bqc6arxmb--

--ur2asf2db5mfq3ns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmrWnKIACgkQ0Z6cfXEm
bc6fgQ//RePcfUWkACBlxh2uI04xa/YIbLcx6kGlsBdDlQ+7DfnFssT7xQUQxdi6
uMFUQdmGY7de6jUVa8NHH6xTx9oLVKtgYS5p5tSK4ONz00OolnxSlfmPLcdjOHnw
D5KuplN8vvp/uPexquQPqvApLejCYLuW3k3uPl/trMaejh+rewOpLlXzUCBF8Rq4
TB2SpzMlj/+g2IeI6ml1NUpFxK9HvxFGgYFZRePMa/P7dohxveOijeubRM2vwfha
1G8LeESxoRWJ6t82PP1A3QKfjPbMKrUag++/+8n5LPuM3mA7r2bt/erkYTHH42hY
exHUwAtipjv9oj+tTBMnRGN0AIsIIgnTuMtvryKkYiLu8zuJ/Y/MY2YWx24kWz5K
YSKR8xY7qMxfthALpdwoz3+q83w8qQrTxNpK7YWcUqaeHZOJ7NmXcpkvxkRuYata
I3MT65FahV7dTNyxTLl4wV7ouM4WudUYdGb+OHX1eJWg+99587+DC/AeeUGncccK
YpR2FNaUslSp0XFd+WlKWnXZ4A8epFI6zdCGLQAdODO5qu6VMVsrjt/ZGzedzxlf
AlJEbFeiBSahJF+tzJx9ceDW16vyEsZDGAcdmpgv0C0czWhbhAX21K9U0GfD0siW
ro+EhJKXFSB2ZixuEntWJugxU3NHaah+GakKrc8M3Ue//GgOB7M=
=n78a
-----END PGP SIGNATURE-----

--ur2asf2db5mfq3ns--
