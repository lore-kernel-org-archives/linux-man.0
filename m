Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0184F4D1E
	for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 13:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414963; cv=none; b=GsruXs8nybbrRUkNCXSsNSO9TmorbowSGSAIqMdnoeUZxx3Y3HRoEmMW1SsXyNKqjpHxICJJHiA3jEEsGJq2EsiHbpdJL9/VccRws36HqMAbUFRN53tzZUKO+LI7/Zdg/PHg67o37wjWXJt/oZpoF51THQsdYVIr+Kt1DtMYpoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414963; c=relaxed/simple;
	bh=ZDS5PWl3KJRdD/ijOw5/PQJuhuArvaXU/ux5zIA3ojc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdzejPczh7df3uI7qCpPActWJgpWlLwyLf8DsGtILqc8xIcVZNofaO2yZK5VnQNAVlhOkc4UKt6wKTqQLywI7U48/E9wEg1bgYMHycRT2KPOhyn1Nf35k52HHHPyWvAHHgL8tHkQu3iATt7ivlbkJ00rhX6MCBWwSMlZqrkipjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8UDeatN; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8UDeatN"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b06c0794cfso16649537b3.0
        for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414960; x=1793019760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSTBOmZ1lIQWdb5gOb23giFTDAHPLy27vCKQvfDG9m0=;
        b=s8UDeatNQ2nsypJ71MUSa+gBjs9p15mdaRQ09gZAVwWeQHXJ255B1jdKRctA1TKPTc
         Rz4fA6HY7ThsK++jn66x7xaQq3vYp2K87MOmzVum+FddogD2Faln+ufHzCzNJyWwf+M9
         HaQcRyyf6mQzKNUSzu9usrdISK1rEboJn3eBRcEKGaR1jXM7tOejOiH9dLljMADQt2GI
         mgLInkyEQ/OVznzsE+bH16G978tvxEvIjKMmTtbI5jO5IvY7WDzjEVcl5x4Aqq52z+S/
         o/NQ+NEoiEmBWgClml0vD01lzp77VLA9B+ynBWoFoyPrd2R+t12AkVan3/EDtPie5nLX
         A1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414960; x=1793019760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSTBOmZ1lIQWdb5gOb23giFTDAHPLy27vCKQvfDG9m0=;
        b=fW+qMVQPVsHYSa3sOSZqXAhyMZAaMVKcNtleMUCy8LtMsEoi4Is4qXPPPnMNG3Wp34
         FS1Mtv4btQ92QQtRVR8sjI0UuA7nzHZ0CZjvwphTvK2L8ZDHs+PGjl/MqKLzX+k3gDHr
         ZLplK//9st10UCkippwxOqjDXCbZOCsRuqRBjak2wyFWoELLXEGfXL+VDCW3YRt6S5n7
         cGaAPJ6PB+09pRaTmRbOoJhvjxa/yVtDDXyghCyvbo1KnmcBchYA/Jw8Ru0P/AxH2ePM
         PeJrWhlfR/LfgoBFgAKfi/AwssbQoxC3S/tzl42g6duXG8G2Wa3/Qz/H4+DrqjZKDbqh
         jTgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvIKx2VR6V9QVHfxLGc8jc3Cn8jUAmhZd1j04pph16vpg25kp3DWZNh+9/X1Zg5zn1DEbpL02H8CY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTBibeAXU+npOnDWVOnaL+JERP0snHbKXB2fArqcaCt9LNN4Sk
	AFn28ZypHr3IUkE1+THOvjYUCVx8PhGvtr3iGOtipCZkDhI01DLXcU6hZGSeaQ==
X-Gm-Gg: AYBFou3EXkx0F3h4mauaJXsSx5d0ktUeo9M5Xb/dH6ywr82LTO6eOU05dE2UbPdpsbJ
	uNakyphUtz0SpbUiZ7ACqbPPxSFMMQuCvtPucsmQ+k/2kkDdTd/nIlzBJHRnNmOlrW0lqd5kAql
	lcwI6R2WREye8MEFvKCezemOWBGTxuGPLMUTNoa6GdPo+YmzX/9B9A1hcBTg38ZVqlTwATaKmVE
	ghlEyIPdyzBslmvyzLaajflfA2/05R3pBu3FF6K81qT6U9H6Ddbk7f49dYaAUP0UJo9f6xtphaz
	LqAxyA/aY+PgGkH8tDJJmJuOrCNbdur6X+17L2PZmvV9Bii4Qy+xEg8lfS6rUuCcS4Itt+ZuP8c
	u1mcseYTuXvZRApIpSlUIdqO3CyOKyuOZXJeyMAtfQ7QpQmvIvM8O2kDPamX59v2XVciPVnbOS5
	TmmTZV7nvQH+VnngFpIwaj9pfupOqk/QZRaYe9qI87YGJmhD9rWYmmVWWDM6o=
X-Received: by 2002:a05:690c:6604:b0:88a:4770:c2e9 with SMTP id 00721157ae682-8b0f214735dmr34372777b3.14.1792414959336;
        Mon, 19 Oct 2026 06:02:39 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b11b699151sm274577b3.5.2026.10.19.06.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:02:37 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:02:35 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Hugo Buddelmeijer <hugo@buddelmeijer.nl>, linux-man@vger.kernel.org
Subject: table layout in console_codes.4 (was: `make -R check` fails due to
 futex_waitv.2 and console_codes.4 being too wide)
Message-ID: <20261019130235.ehdncu4zh4mm2h3o@illithid>
References: <448efb68-e2ff-41d8-a575-97da30e293ff@buddelmeijer.nl>
 <atW2F1hvJPm2WV5y@debian>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fftofz5tkudf7c45"
Content-Disposition: inline
In-Reply-To: <atW2F1hvJPm2WV5y@debian>


--fftofz5tkudf7c45
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: table layout in console_codes.4 (was: `make -R check` fails due to
 futex_waitv.2 and console_codes.4 being too wide)
MIME-Version: 1.0

Hi Alex & Hugo,

At 2026-10-19T08:20:29+0200, Alejandro Colomar wrote:
> > Date: 2026-10-17 21:19:22+0200
> > From: Hugo Buddelmeijer <hugo@buddelmeijer.nl>
> > Running `make -R check` fails because the text in futex_waitv.2 and
> > console_codes.4 is too wide.
[...]

I observe that the failure doesn't tell you why the "check" target is
failing.  It simply says "GREP" and then the output of grep itself.  We
are not informed what grep was looking for.

I also observe that setting `V=3D1` is useless to get these Makefiles to
tell us what they're actually doing.

While attempting to reproduce Hugo's results, I also noticed the
following messages on stderr.

TBL             .tmp/man/man3/matherr.3.eqn
tbl:".tmp/man/man3/matherr.3:204: warning: ignoring excess table entry at r=
ow 5, column 6: "\" retval is 0.0/0.0"
tbl:".tmp/man/man3/matherr.3:205: warning: ignoring excess table entry at r=
ow 6, column 6: "\" retval is 0.0/0.0"
tbl:".tmp/man/man3/matherr.3:206: warning: ignoring excess table entry at r=
ow 7, column 6: "\" retval is x/0.0"
tbl:".tmp/man/man3/matherr.3:241: warning: ignoring excess table entry at r=
ow 42, column 6: "\" different from log()"
tbl:".tmp/man/man3/matherr.3:242: warning: ignoring excess table entry at r=
ow 43, column 6: "\" different from log()"
tbl:".tmp/man/man3/matherr.3:249: warning: ignoring excess table entry at r=
ow 50, column 6: "\" +0 and -0"
tbl:".tmp/man/man3/matherr.3:257: warning: ignoring excess table entry at r=
ow 58, column 6: "\" retval is 0.0/0.0"

(These diagnostic messages are new to the forthcoming groff 1.25.)

Inspecting the file:

$ sed -n 194,205p man/man3/matherr.3
=2E\" Details below from glibc 2.8's sysdeps/ieee754/k_standard.c
=2E\" A subset of cases were test by experimental programs.
=2ETS
lB lB lB cB lB
l l l c l.
Function        Type    Result  Msg?    errno
acos(|x|>1)     DOMAIN  HUGE    y       EDOM
asin(|x|>1)     DOMAIN  HUGE    y       EDOM
atan2(0,0)      DOMAIN  HUGE    y       EDOM
acosh(x<1)      DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
atanh(|x|>1)    DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
atanh(|x|=3D=3D1)   SING    (x>0.0)?        y       EDOM    \" retval is x/=
0.0

This seems like a straightforward case of someone forgetting to update
the table format--much easier to neglect before I added the new tbl
diagnostic.  In lieu of a formal patch, here are some replacement lines.

lB lB lB cB lB l
l  l  l  c  l  l.
Function	Type	Result	Msg?	errno	\&

(In the meantime, I'll try and see if the leading double quote before
the file name in tbl(1)'s diagnostic is due to groff 1.24/1.25 version
skew in my environment, or a bug in 1.25 I need to fix before final
release.  It looks like the former.

$ ~/groff-HEAD/bin/groff -tz -man -T utf8 man/man3/matherr.3
tbl:man/man3/matherr.3:204: warning: ignoring excess table entry at row 5, =
column 6: "\" retval is 0.0/0.0"
tbl:man/man3/matherr.3:205: warning: ignoring excess table entry at row 6, =
column 6: "\" retval is 0.0/0.0"
tbl:man/man3/matherr.3:206: warning: ignoring excess table entry at row 7, =
column 6: "\" retval is x/0.0"
tbl:man/man3/matherr.3:241: warning: ignoring excess table entry at row 42,=
 column 6: "\" different from log()"
tbl:man/man3/matherr.3:242: warning: ignoring excess table entry at row 43,=
 column 6: "\" different from log()"
tbl:man/man3/matherr.3:249: warning: ignoring excess table entry at row 50,=
 column 6: "\" +0 and -0"
tbl:man/man3/matherr.3:257: warning: ignoring excess table entry at row 58,=
 column 6: "\" retval is 0.0/0.0"
)

> > Maybe you could device a better patch though, in particular for
> > console_codes.  The affected table is much narrower than similar
> > tables, so some lines that have to be truncated, would easily fit in
> > one of the other tables.  But I couldn't easily figure out what
> > determines the column widths, so I didn't fix that.
>=20
> I think Branden might be better at that; I've added him to CC.

Here's the table as formatted using groff 1.25 defaults (same as 1.24),
with the preceding paragraph for context and to make the location of the
right margin clear.

     It accepts ESC ] (OSC) for the setting of certain resources.   In  add=
ition
     to  the ECMA=E2=80=9048 string terminator (ST), xterm(1) accepts a BEL=
 to terminate
     an OSC string.  These are a few of the OSC control sequences recognize=
d  by
     xterm(1):

     ESC ] 0 ; txt ST           Set icon name and window title to txt.
     ESC ] 1 ; txt ST           Set icon name to txt.
     ESC ] 2 ; txt ST           Set window title to txt.
     ESC ] 4 ; num ; txt ST     Set color num (0=E2=80=90255) to txt.
     ESC ] 5 ; 0 ; txt ST       Set the color for bold substitution to txt.
     ESC ] 5 ; 1 ; txt ST       Set the color for underline substitution to=
 txt.
     ESC ] 5 ; 2 ; txt ST       Set the color for blinking substitution to =
txt.
     ESC ] 5 ; 3 ; txt ST       Set the color for reverse substitution to t=
xt.
     ESC ] 5 ; 4 ; txt ST       Set the color for italic substitution to tx=
t.
     ESC ] 6 ; 0 ; val ST       Toggle bold rendition: 0=3Dbold, 1=3Dsubsti=
tute by color.
     ESC ] 6 ; 1 ; val ST       Toggle underscore rendition: 0=3Dunderscore=
, 1=3Dcolor.
     ESC ] 6 ; 2 ; val ST       Toggle blinking rendition: 0=3Dblinking, 1=
=3Dcolor.
     ESC ] 6 ; 3 ; val ST       Toggle reverse rendition: 0=3Dreverse, 1=3D=
color.
     ESC ] 6 ; 4 ; val ST       Toggle italic rendition: 0=3Ditalic, 1=3Dco=
lor.
     ESC ] 10 ; txt ST          Set the foreground text color to txt.
     ESC ] 11 ; txt ST          Set the background color to txt.
     ESC ] 12 ; txt ST          Set the text cursor color to txt.
     ESC ] 13 ; txt ST          Set the mouse cursor foreground color to tx=
t.
     ESC ] 14 ; txt ST          Set the mouse cursor background color to tx=
t.
     ESC ] 15 ; txt ST          Set the Tektronix foreground color to txt.
     ESC ] 16 ; txt ST          Set the Tektronix background color to txt.
     ESC ] 17 ; txt ST          Set  the  background  text color for highli=
ghted (se=E2=80=90
                                lected) text to txt.
     ESC ] 18 ; txt ST          Set the Tektronix cursor color to txt.
     ESC ] 19 ; txt ST          Set the foreground text color  for  highlig=
hted  (se=E2=80=90
                                lected) text to txt.
     ESC ] 46 ; name ST         Change  log file to name (normally disabled=
 by a com=E2=80=90
                                pile=E2=80=90time option).
     ESC ] 50 ; fn ST           Set font to fn (the escape code is normally=
 disabled;
                                see "allowFontOps" in xterm(1)).
     ESC ] 104 ; num ST         Reset color for mode 4;num
     ESC ] 105 ; num ST         Reset color for mode 5;num
     ESC ] 106 ; num ; val ST   Exactly equal to 6;num;val.  (no "reset" lo=
gic)
     ESC ] 110 ST               Reset color for mode 10.  Codes 111=E2=80=
=90119 map to reset=E2=80=90
                                ting modes 11=E2=80=9019, respectively.
     ESC ] mode ; ? ST          Query  the  respective  property/color/etc.=
    (modes
                                4,5,10=E2=80=9019,50)

We can see that this line is troublesome:

     ESC ] 6 ; 0 ; val ST       Toggle bold rendition: 0=3Dbold, 1=3Dsubsti=
tute by color.

My hunch is that the rightmost column is not set in a text block when it
should be.  What's a text block, you ask?

tbl(1):
   Text blocks
     An ordinary table entry=E2=80=99s contents can make a column, and ther=
efore
     the table, too wide; the table then exceeds the line length of the
     page, and becomes ugly or is exposed to truncation by the output
     device.  When a table entry requires more conventional typesetting,
     breaking across more than one output line (and thereby increasing
     the height of its row), it can be placed within a text block.

     tbl interprets a table entry of =E2=80=9CT{=E2=80=9D at the end of an =
input line
     specially, as a token starting a text block.  Similarly, an entry
     =E2=80=9CT}=E2=80=9D at the start of an input line ends a text block. =
 Text block
     tokens can share an input line with other table data (preceding T{
     and following T}).  Input lines between these tokens are formatted
     in a diversion by troff.  Text blocks cannot be nested.  Multiple
     text blocks can occur in a table row.
=2E..

So let's check the page source.

$ sed -n 748,762p man/man4/console_codes.4
=2ETS
l l.
ESC ] 0 ; \f[I]txt\f[] ST       T{
Set icon name and window title to
=2EIR txt .
T}
ESC ] 1 ; \f[I]txt\f[] ST       Set icon name to \f[I]txt\f[].
ESC ] 2 ; \f[I]txt\f[] ST       Set window title to \f[I]txt\f[].
ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST        Set color \f[I]num\f[] (0-2=
55) to \f[I]txt\f[].
ESC ] 5 ; 0 ; \f[I]txt\f[] ST   Set the color for bold substitution to \f[I=
]txt\f[].
ESC ] 5 ; 1 ; \f[I]txt\f[] ST   Set the color for underline substitution to=
 \f[I]txt\f[].
ESC ] 5 ; 2 ; \f[I]txt\f[] ST   Set the color for blinking substitution to =
\f[I]txt\f[].
ESC ] 5 ; 3 ; \f[I]txt\f[] ST   Set the color for reverse substitution to \=
f[I]txt\f[].
ESC ] 5 ; 4 ; \f[I]txt\f[] ST   Set the color for italic substitution to \f=
[I]txt\f[].
ESC ] 6 ; 0 ; \f[I]val\f[] ST   Toggle bold rendition: 0=3Dbold, 1=3Dsubsti=
tute by color.

Yup.

The fix is straightforward: put the table cell in a text block.  But
there is one other entry in this table that is too wide.

$ diff -u man/man4/console_codes.4{.old,}
--- man/man4/console_codes.4.old        2026-10-19 07:40:06.562768271 -0500
+++ man/man4/console_codes.4    2026-10-19 07:44:11.729514217 -0500
@@ -759,8 +759,12 @@
 ESC ] 5 ; 2 ; \f[I]txt\f[] ST  Set the color for blinking substitution to =
\f[I]txt\f[].
 ESC ] 5 ; 3 ; \f[I]txt\f[] ST  Set the color for reverse substitution to \=
f[I]txt\f[].
 ESC ] 5 ; 4 ; \f[I]txt\f[] ST  Set the color for italic substitution to \f=
[I]txt\f[].
-ESC ] 6 ; 0 ; \f[I]val\f[] ST  Toggle bold rendition: 0=3Dbold, 1=3Dsubsti=
tute by color.
-ESC ] 6 ; 1 ; \f[I]val\f[] ST  Toggle underscore rendition: 0=3Dunderscore=
, 1=3Dcolor.
+ESC ] 6 ; 0 ; \f[I]val\f[] ST  T{
+Toggle bold rendition: 0=3Dbold, 1=3Dsubstitute by color.
+T}
+ESC ] 6 ; 1 ; \f[I]val\f[] ST  T{
+Toggle underscore rendition: 0=3Dunderscore, 1=3Dcolor.
+T}
 ESC ] 6 ; 2 ; \f[I]val\f[] ST  Toggle blinking rendition: 0=3Dblinking, 1=
=3Dcolor.
 ESC ] 6 ; 3 ; \f[I]val\f[] ST  Toggle reverse rendition: 0=3Dreverse, 1=3D=
color.
 ESC ] 6 ; 4 ; \f[I]val\f[] ST  Toggle italic rendition: 0=3Ditalic, 1=3Dco=
lor.

I still got the warning about the table being too wide, spuriously.
That appears to be due a workaround for old bugs in GNU tbl.[1]

$ git grep NROFF_LINE_LENGTH
share/mk/configure/build-depends/groff-base/nroff.mk:ifndef NROFF_LINE_LENG=
TH
share/mk/configure/build-depends/groff-base/nroff.mk:NROFF_LINE_LENGTH    :=
:=3D $(shell $(EXPR) $(MANWIDTH) - 2)
share/mk/configure/build-depends/groff-base/nroff.mk:   -rLL=3D$(NROFF_LINE=
_LENGTH)n \

I was able to get a complete, successful check with the following
command.

$ make -R check NROFF_LINE_LENGTH=3D80 NROFFFLAGS=3D-Wstyle

I needed to override `NROFFFLAGS` because of a new warning category in
the forthcoming groff 1.25.

groff NEWS:
*  The formatter supports a new warning category, "style".  It is used
   to diagnose input that is non-idiomatic or likely to produce an
   unexpected result (or none at all), but is not invalid.

One of the things it warns about is failure to break an input line after
the end of a sentence is detected.  The Linux man-pages may want to
disable that warning category by default until those have been cleaned
up.  Enabling it will, of course, permit machine-driven identification
of sites requiring such cleanup, which has to date been tedious,
requiring manual inspection or application of regexes that can be
thwarted by the *roff language's context-dependent grammar.

Regards,
Branden

[1] https://savannah.gnu.org/bugs/?63749
    https://savannah.gnu.org/bugs/?63640
    https://savannah.gnu.org/bugs/?62471

--fftofz5tkudf7c45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmrWFN0ACgkQ0Z6cfXEm
bc6/ABAArdEwr7kSHedVcezEmMPhfgx00drO3gU8R6zRxrASHiO9nWu7e3nWTbKL
3bjMsdg+y8d16c1qHxxRJB/pCTtlpU7SeM/NcelaPNq+/C0N6/Y+iE33s8KSvpNE
e3HGZhL9XsRB7jQgXNgzifa4tzuf5u+E2Thvb5lNqFGXAMywyi9szHC3goh92Bpo
LSpHKtFCaXJAJpB0mkL9wbnYX74OPGjLK7khYrpCYWJeBkqQ9shnC7pBHi+Y+STY
1HIaIaA7CW1kIzxbh0bHr1ABac9vHFF5sUVP3kjouoJmVrSjCsJtbU4Qaq5FU7Rs
lof15ZKqRSDqi9vwsYopXk1p7r9YJ59coPV0YTfFUbZTihLqLfFcNlfGUMCqLMy0
xz8koXIz21nHhgWIYS0TU2fnXd6MuhleDXq1f5QYzIE9ecl5WTedgJtLXHkWNL3C
pRuSXh0GzsFN+dwDnsxg3n5ATkKa3I2bqHUgEG9pf+z+pXWSuDqWKsIg+37NSBDy
e3EHQ6HT3Txe06WVwEIYatqMlkYf2overOVGKZOYamuCJVJXY/FZ00J3Iu4UQHk+
pzVP29Vsa2mhCHdLTLNfJpL/vRQOq2EGV5IVqnp7rbt4+cwtUV62gSXA0iAOKM2g
zBtOqOQnSYn1PjZMlnpuRb8QqHNXEU4r8dlAlLYRaIqwdawsukE=
=8JSf
-----END PGP SIGNATURE-----

--fftofz5tkudf7c45--
