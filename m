Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792787541;
	b=YtZyNRE9e9Q5zSXpNlKo60JUBylAA4mtVt+NsU4nf8vl2ch2HmdzPDmbai8SEgg5Rru2
	 5ZCMxsQF36dxlIyVDP/PH+eC+iT6ViU6Uiiyya24kVVdABVT0xCxm2Et4CTqHVSWnNJY4
	 9aSXpAm20Fk3nh4y19ctqaIoOJdCzavQV4JCrnlvRndhUs6HaIDwaDELvCZtQxaC6fDdP
	 O2rzy4HwGnH95Ah6bAGfxXW1nLrho1tdda+LpJy2hsWrTP0qCyf4tZmkQ5SU7YQzt+cn+
	 sCq4z0WaEBBaA/V3lZCGrmzrzPPVtncFQUZXRCHTgGBqmIHKX3edd7Oew8ymXKg18wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=siLL8+sK/dtv6k4Mj9sMAMKwJkuqkAvkohP0hmYl458=;
	b=vfovGApVs3Nu5WwEpETsDeqxJecXINhSDrJly+sXCOMEeY44loZejCb9H7s/p2JedOWt
	 KXPD3ojkUbH3qs2CoP2dz5kTceKJOooOWW2JHD6UoTx/Euvz+FxpwBfd9+rts0TA/C2JJ
	 ez5PZJkXF9gEHXOZJtxU9nNjo1sfBttbjrwdcdK5AaiSlkoNebwae0yyM0Icqrtu1EnxM
	 BkwZGahY+l1SUwQsF1BnVeakQMASbnTLdWUY15/8dT+7HHJGQaXAGoPoWYMz5njrGj6O6
	 KBkzdXOA3V+3rhCHjr/lkpccwdaeMJRVuZ9gQr5tYAtY76q/9LxcR/MCpLfyPDyntdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bR+5oJz0;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D0B606A31A
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 20:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bR+5oJz0
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-679a2b5fe87so1247516d50.3
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 13:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792787539; x=1793392339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=siLL8+sK/dtv6k4Mj9sMAMKwJkuqkAvkohP0hmYl458=;
        b=bR+5oJz0/Fcb+ttqqvBnBKAk5RK+gdR6bY1V21atwXXAXt4pizf2QIJptvsB9yWv79
         wjPxUjFquQMfV3LNUjTHA4bIOa8bc4nimC5vj6+Aa3nbbmBv1bEbg1ScoA7KicUcZ19Q
         8HftpgPYVGvAZaFJUVGiD0dYFEPMOf8h2SO0Z3yh3sAhtIbLj4jBsNo7la6FeAkY8tQK
         oEw19tyWUlVPIaZQDwmeLXAhSuhO8bt8zW8ZT2/HVNR+N78QIVIg0D95IRmrpao2H3qN
         IS1uypm7sTxef4QWERxAhooMLDaZod1CUoyYgyH/crqz4aJZk9VmP9gCRgQiUamP6R5q
         T13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792787539; x=1793392339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siLL8+sK/dtv6k4Mj9sMAMKwJkuqkAvkohP0hmYl458=;
        b=1ugTl1f3OXqdYfwE9lllGfzrsCGU0sBDGeixlREzNR+dSoNe5PYXMrGZflOUUWibuS
         SlMc8zP70CKubhjyYpC7WhMS7+q1n9qyegcemky20EQz5690HgRVhrYt9OYlL8S/9pn0
         duSqTTG8dxNMinHNl6XLHSlSs+Ye4tC8FLXt6hY49MZD5CXYrC7E1FqPNAEJ9sUQ0/+L
         3niDh4ef3iOAu20XA8SYV1KZrBe8DjS4h8VnQ3GLtEOigpAGUPAkfXheVOMA3OFbacWJ
         Qq3bfz/nqumnUmrbFQYPQ/nbdgRuy5+b/tOE8IkVhkLDGhJfZTyqONBGBQLzrjRE7yPg
         mj/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxeWEDJg7JmPzO0pGd31PY/38tdLtccUeQzF2FpcOIJEnsTcKYgSJ7ea+QMGncY3CsFMA5fLNCzBvo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcFjqiW2kY2DSxz/sFbsjGM2uvYoo1UrSdne84Lz4tjQ2gFcXV
	eqOIvg54mt+REKn9RCJch93HSIfMhej8IvYtPk3y3HmDR7isU7zda2xM80QWiw==
X-Gm-Gg: AYBFou0b3n8uKUKqb+s71ARy9qjEMDsxyPtW+/bbnjwRkByeBfKNmRMncIAJ1bYUbIs
	W8YknZOEoVWAVUi3kSAcqEDfs0ze3l2U8vUfXA0o/oMieTNyNQ9QupP/YXTCCIS81blWqTEYqCb
	qwDKrHqqK/VyVC9CZuBGGJ7KG8ndlX1DTUGjzxEYl030FURyF28pk0WqgNKDZK//Bp5K5JS2NNC
	jvGFVqXJo0EObT0iw+JwWY+a8Dsefi93FeNO2lASvYmqtsY3jbIHa20mMU5CQ2aYJNBobDTchRw
	2LUOpuo0vmRYtfGDUXNIwuqPxyQ0epI1MjpApkj1ZpJlB+8FUmspwNXRYX/FMx7K+tfZC8hRJgZ
	rZ8gayHDYk4V7MEEgYumA3JPfKV6QUWZeFtRmAwpzadg1nM699WIra2+EpQqJCeIIzArwdhWTFV
	kdc9SWv73DcIsBHMJPI2hyb2nbCihw5NjKe2hizH0AhKuWZ6zPZevJNhGg3tHmJXR/WRQuAUdCo
	3zSgXeNAk5nop2cUK5JZa0oMqQXQ1ihPf9ywwPADHLW
X-Received: by 2002:a05:690e:4814:b0:679:a216:7aae with SMTP id 956f58d0204a3-67a45449175mr146020d50.111.1792787539406;
        Fri, 23 Oct 2026 13:32:19 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::49])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a45ff8d6dsm67914d50.1.2026.10.23.13.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 13:32:18 -0700 (PDT)
Date: Fri, 23 Oct 2026 15:32:16 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Hugo Buddelmeijer <hugo@buddelmeijer.nl>, linux-man@vger.kernel.org
Subject: Re: table layout in console_codes.4 (was: `make -R check` fails due
 to futex_waitv.2 and console_codes.4 being too wide)
Message-ID: <20261023203216.mfhfyadcesawur55@illithid>
References: <atZJ7QGljZ4K50wD@debian>
 <1e4d35e5-f8af-402b-9cdb-46a70f793b96@buddelmeijer.nl>
 <20261019224145.aovalqyh2fpcdzdk@illithid>
 <atugtpm0SfMnnTYj@debian>
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
	protocol="application/pgp-signature"; boundary="yzp3yo4vzrtffnsu"
Content-Disposition: inline
In-Reply-To: <atugtpm0SfMnnTYj@debian>


--yzp3yo4vzrtffnsu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: table layout in console_codes.4 (was: `make -R check` fails due
 to futex_waitv.2 and console_codes.4 being too wide)
MIME-Version: 1.0

Hi Alex,

At 2026-10-23T20:06:01+0200, Alejandro Colomar wrote:
> > Date: 2026-10-19 17:41:45-0500
> > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > > If you use --no-silent on the command line, it overrides the
> > > default.  I'll check better before committing.
> >=20
> > Cool!
>=20
> Committed and released.  :-)

Good stuff!

> > > I'd love a formal patch, especially with a good commit message.
> > > :)
> >=20
> > I'm sure.  But I'm dealing with yet another late-release-cycle fire
> > drill in groff right now, unfortunately.
>=20
> I'm patient.  MR.sed made me learn.  :p

I learned from it too.

Some news on that front.  Would you be willing to stage the roll-out
of this transition?  The syscalls(2) page is what broke us before--you
wanted extensive annotations to my sed scripts.  (Not unreasonable, but
demanding of further effort on my part.)  The rest seemed easy.  Maybe
if we can migrate:

1.  everything but syscalls(2) first; then
2.  migrate syscalls(2) in multiple passes, each of 1 sed script, each
    showing no change in the formatting of rendered text.

I think users and readers will enjoy (and could have been enjoying) a
major benefit to their man page browsing experience even with only step
1 done.  Now that GNU less has its own OSC 8 interpreter and
appropriately equipped versions are making it into distributions, the
power of man page hyperlinking is easy to see.  Literally, even, with
even more recent changes to apply underlining to hyperlinked character
cells.  The latest version of less, v712, released this past week, even
defaults to "less -R".[0]  A future I dreamed of in 2018 is finally
arriving.

In other news, Oracle finally did a thing I once thought they had done
in Solaris 11, then had to correct my understanding about, and then had
to re-correct myself again.

About 2=BD years ago, in SRU66 (a kind of service pack), an update to
Solaris 11.4, Oracle completely discarded their AT&T System V troff.
It's _gone_.  What replaced it?  groff 1.23.0--which supports groff
man's `MR` macro.[1]

They kept some auxiliary stuff like checkeq(1) and checkmm(1) (neither
of which GNU eqn or groff mm need, since they internally implement more
generous diagnostics than their AT&T implementations).  And they
implemented a bunch of wrappers to force preconv(1) into execution
pipelines.

So between groff >=3D 1.23.0 and, well, the _next_ release of mandoc(1)--
any day now, it's to be hoped--support for `MR` will be nearly
universal.

I didn't ever expect mandoc's release cadence to become slower than
groff's!

> > And on second thought it occurs to me that you may not want that
> > column in the table after all, since they are all *roff comments
> > intended (I think) only for inspection by the document maintainer,
> > not by the reader.  In that case what you want to do is not add a
> > column, but stop supplying excess table entries--in other words,
> > discard the tab character before the `\"` comment escape sequence.
>=20
> Yes, and no.
>=20
> > diff --git a/man/man3/matherr.3 b/man/man3/matherr.3
> > index 2e179e358..8711ee3cd 100644
> > --- a/man/man3/matherr.3
> > +++ b/man/man3/matherr.3
> > @@ -200,9 +200,9 @@ .SS Math functions that employ matherr()
> >  acos(|x|>1)    DOMAIN  HUGE    y       EDOM
> >  asin(|x|>1)    DOMAIN  HUGE    y       EDOM
> >  atan2(0,0)     DOMAIN  HUGE    y       EDOM
> > -acosh(x<1)     DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
> > -atanh(|x|>1)   DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
> > -atanh(|x|=3D=3D1)  SING    (x>0.0)?        y       EDOM    \" retval i=
s x/0.0
> > +acosh(x<1)     DOMAIN  NAN     y       EDOM\" retval is 0.0/0.0
> > +atanh(|x|>1)   DOMAIN  NAN     y       EDOM\" retval is 0.0/0.0
> > +atanh(|x|=3D=3D1)  SING    (x>0.0)?        y       EDOM\" retval is x/=
0.0
>=20
> It was certainly more readable with the tab.  Would a couple of spaces
> be okay?  Or will they produce spurious space too that might fail?

The problem is that you'll still have a comment escape sequence in a
table entry.  Since groff 1.24.0, GNU tbl warns about that (unless the
comment escape sequence occurs in a text block, where these escape
sequenced don't cause problems).  Unfortunately groff 1.24.x produce an
extra warning diagnostic in this case that is not helpful.  I just
discovered that while composing this email and have scheduled a fix for
groff 1.25.0.[2]

$ ./build/test-groff -tz -W style -m an -T utf8 ../man-pages/man3/matherr.3
tbl:../man-pages/man3/matherr.3:240: warning: comment escape sequence '\"' =
in entry "EDOM\" different from log()"
tbl:../man-pages/man3/matherr.3:241: warning: comment escape sequence '\"' =
in entry "EDOM\" different from log()"
tbl:../man-pages/man3/matherr.3:248: warning: comment escape sequence '\"' =
in entry "EDOM\" +0 and -0"
troff:../man-pages/man3/matherr.3:203: warning: missing closing delimiter i=
n width computation escape sequence; expected special character or class 't=
bl', got a newline [-w delim]
troff:../man-pages/man3/matherr.3:204: warning: missing closing delimiter i=
n width computation escape sequence; expected special character or class 't=
bl', got a newline [-w delim]
troff:../man-pages/man3/matherr.3:205: warning: missing closing delimiter i=
n width computation escape sequence; expected special character or class 't=
bl', got a newline [-w delim]
troff:../man-pages/man3/matherr.3:240: warning: missing closing delimiter i=
n width computation escape sequence; expected special character or class 't=
bl', got a newline [-w delim]
troff:../man-pages/man3/matherr.3:241: warning: missing closing delimiter i=
n width computation escape sequence; expected special character or class 't=
bl', got a newline [-w delim]
troff:../man-pages/man3/matherr.3:248: warning: missing closing delimiter i=
n width computation escape sequence; expected special character or class 't=
bl', got a newline [-w delim]
troff:../man-pages/man3/matherr.3:256: warning: missing closing delimiter i=
n width computation escape sequence; expected special character or class 't=
bl', got a newline [-w delim]
=2E./man-pages/man3/matherr.3:199: warning: table wider than line length mi=
nus indentation

The riot of delimiter warnings is the havoc that use of a comment escape
sequence in a (non-text-block) table entry creates.

I added that warning in groff 1.24.0 because without it, a user is
unlikely to comprehend what is supposed to be wrong with their table.

Or they would have been uncomprehending, had they enabled warnings in
category "delim", which were not on by default.  In groff 1.25.0, they
will be.

> [...]
> >=20
> > (Also attached.)
> >=20
> > If the foregoing looks ugly, bear in mind that you're wandering a
> > bit off the path with these comments.
> >=20
> > tbl(1):
> > Limitations
> >      Within a tbl region (except in text blocks or on roff control
> >      lines), avoid escape sequences that read the rest of the input
> >      line, as \" and \! do.
>=20
> Hmmm.

This is a consequence of how tbl works.  It generates *roff `\w` escape
sequences bracketing the table entry contents so that the formatter can
compute their rendered widths.  Without font metrics, tbl cannot do that
itself.

My recommendation is to move these "inline" comments to precede what
they document.

-acosh(x<1)     DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
+.\" retval is 0.0/0.0
+acosh(x<1)     DOMAIN  NAN     y       EDOM

> > > > I was able to get a complete, successful check with the
> > > > following command.
> > > >=20
> > > > $ make -R check NROFF_LINE_LENGTH=3D80 NROFFFLAGS=3D-Wstyle
> > >=20
> > > Thanks!  Would you mind sending a formal patch set?  =3D)
> >=20
> > I'll need a reminder when I feel less swamped (after groff 1.25.0,
> > likely), or someone else can steal my fixes.  :)
>=20
> Okay.  Do you have an estimate of when I should poke you?  As in maybe
> one month or two?

Say, two weeks after groff 1.25.0 final, which I'll announce here as
usual.  By then I should know if the release was a triumph, a disaster
(and therefore will be keeping me busy), or met with the usual stony
indifference.

> > Yeah, I wouldn't want to fool with it before it lands in an official
> > release, either.  But this _does_ mean that the Linux man-pages
> > documents will appear to "regress" suddenly when the host system
> > upgrades to groff 1.25.0, because you use `-ww` to turn on all
> > warnings.
>=20
> If you're willing to spend some time on helping me address the
> diagnostics by improving the pages, that's fine.  :)

I don't doubt it.  I have a lot of irons in man page fires!

Regards,
Branden

[0] https://github.com/gwsw/less/commit/7f46e9ff46216f3e560cd1f41ddf3b36b11=
eec0e
[1] https://blogs.oracle.com/solaris/whats-new-in-oracle-solaris-114-sru-66

    That blog entry doesn't make any _note_ of this change, but it's
    there.  I have been able to examine it at cfarm.net.

    Also, there's this evidence:

    http://pkg.oracle.com/solaris/release/en/search.shtml?token=3Dgroff&act=
ion=3DSearch

[2] https://savannah.gnu.org/bugs/?68825

--yzp3yo4vzrtffnsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmrbxEoACgkQ0Z6cfXEm
bc4UABAAp3x2N3GFClHWux1nWDhn7LBZROiS201fLV0y7+zygNsx6xEtGiQ6nr4y
cS9ckB3jqJZ9wNfeOpaprMC9aZEEmbKnz2xqgx8iOY9l3LwVvFQKUFc1POzUf0MX
0WHoLUJkllOoqRpf467anQYDfcv4R88iJdudFa/aNbjmSzzrPjTYgGiEzp/AqKFi
5fsE+CwJUTX+Yz0LwtUpHHis3mMMzdwMaYv3XYdd82dJD+eW4ophzDY9q+bB3iDD
KnLQ0GxO0QBksWMW/fWVWVWUetvvQPOeoXga0jrBIWV5YXdzMy1D1MxoCxHpHUFK
iZXOZinCWb3LRReH6EGc9GiPB+T236J1UtSW6cuhVjjVRXf0q/ELolW8poVGVzyp
7KKcAPIptFp0/D5bqyumDP/d4iOd7aqndtwb+zkc2fjYit/kHlZHaqk0PsgqBnnn
j/hsZc9D0oEHok2/45/YR1p0Hi5V3UfIHYg+BjivzFf9j3Q+beztVp8Y1ZL72JQW
NmZ/RouYHqxhOoQRQqdRGBEcmPTqx6a5/I2VDWn0xazQQELyRT7K5ausSEThM//p
ztAphcoFuWsyXKzolIrSd0qILoGDZ/eAlvgeJkMeTwGU4C35OLdEZhGpTJ8qt2Aq
jtuD6bBCr/0yNa+0sKR/AfPNXAd4WVR/UIid6MG0IrZ50bWIzl8=
=iOpR
-----END PGP SIGNATURE-----

--yzp3yo4vzrtffnsu--
