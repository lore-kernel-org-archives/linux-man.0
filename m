Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077460;
	b=5WXpftKR5Ispr+xmxZ1/kn9vKBuCJ2rD/2rOXvissGWyEP0Bc8BfLqBNMoNJyuysN5jp
	 3XE5wdKj4/tK0bQ4cg8EqPJiyrz9qa8Gz94IKpAQCVjzjeUpkZfaNUw43mKe0FhFbMJxX
	 A3yED/nKmnMlRTMNr0SRwZCdQV24lgeWW/9HxzkE5x9SO1Y+scmamaYtY7q68FazEw1eM
	 D4Dj+JNsNt+KVVylhlYARjy1sbBJWj3fdJtvdUltH0AbimPI5g8zyKXakiJ7UP3SnC1hm
	 hIC7WBl87ilb4sxx47fW5MFnPcFa9aja5A56++mXt/gX8WF17ns+qRYfK5zDTBaR3gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=y3vSd8HKXMIS6LRpG8Jqsr54VotEDcUQnGpOVlHk7NQ=;
	b=Mup9P4+sFNrnyG7cwZakSmjfLObCvuyVYXJiQpTd4cEtVRbHR3RDBYeJOPN1G40+Wshp
	 /37Ft3JNxriE6JLx5wbM3sPhrutQA/R5Zm4ZnXjotjw0Qypw13l6cGGlJo3m+/BkwMTRM
	 d/roGSiv4Ln48nvF3Fyly8mcB9wxZzuFRB+IPPGtALQT+hKunwIe67/qgN8PV4k4udY6t
	 z39P3DyMCZT7gKxi2u5cnTQtOhFJSUon0pCLw9PhFXYd1s8uanPDPwMbzVHrtMn5VTQge
	 zg/sCTZfynDEe1zP2UUEBH+WdnRrMtpfXKw/5zXNPJB8dfcGEWnwmrXdOHdynmXWlVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=v8h9o5GO;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F610606A31A
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 05:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F610606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=v8h9o5GO
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so1900606a12.2
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 22:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793077459; x=1793682259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y3vSd8HKXMIS6LRpG8Jqsr54VotEDcUQnGpOVlHk7NQ=;
        b=v8h9o5GOUvtuRCwaXjKx85+sbEZRdYMhZ1e+SXoPs17bR7AwrD+Oa1tSuNv12BKJQP
         lgJ306JKjhFmqO+3OEleld08cTOy12dnp2UISKq6MUWBCfEe+XrWaI8DpN2BLtc+nCun
         d0bcLfW4mIsilcSPNzQYtSJ6DuGo+MyJKLnwfS5CHS70BbC+iR/OIxF61f6FGwMZlTOp
         inc6SDCp9HZtHe3GFEBZdIVG0O6cW9KaVRC31qfO9ocOAyknMxi2z3mWZ9thAARjVUnY
         E8mXqkBBBuL46gwj2yE7hSVAhhs1q6+ft5DU46uRwRsC7mPIf9H5LuMMu4M3GbDCcKFs
         FL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793077459; x=1793682259;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3vSd8HKXMIS6LRpG8Jqsr54VotEDcUQnGpOVlHk7NQ=;
        b=NIRZKA8vhPAFtJQLZYgAcIqBNmHocRsBSdsWLjYQ2Asp91j/vTIdI3+EyD9xuq2S52
         elfTPaMm6tG+k76XzybYmyvNw7b3TEjSkBFqbbB+kDas5R88CKcqM7JD2+aLcPHFteoS
         JQI02SjOrAVJv35HgaD5i2J77dqCJPYq1w9aBmzsyE/2G7hUPGoetzQY8lCZQtwSG39X
         i4Bum2KDvccmo8m/jmsU5LXtW/F9ogM+bFYlAqCaf0GxsSg5uhHaLPzVxuNVGv2iW8cA
         8bEVrpVQ1uqviQcsaDRoyia/XEZYyeOC5mHFqnEP0hbJX5UUydTbw33bziD7neYeaT+p
         GHAg==
X-Forwarded-Encrypted: i=1; AKwUvBygdhrPey3RxE8pfnKxq91jqe3GoJBTsJ0D8fu2HVtJnHV0udhfxf2dcy/PKVigi4bjcXvZzoVR20Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTqklVwJrjOz3CdxpuvxI979dHi2y0Yh1PSQTquuWnU3nMZiet
	ZOQrGjqbwESUKfHzw9ykO7zxmVPhv3biUt8INOMYukj5SmKJU/uotRbSYaj1Y10L03i+Gq1iQju
	RobbH4w==
X-Received: from pgbda2-n1.prod.google.com ([2002:a05:6a02:2382:10b0:cd8:c484:3c40])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9c17:b0:3e1:885f:b4ab
 with SMTP id adf61e73a8af0-3e7af7e907fmr6056798637.8.1793077459082; Mon, 26
 Oct 2026 22:04:19 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:04:18 +0000
In-Reply-To: <20261026.92f659908546@gnoack.org>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021212256.27961-1-gnoack3000@gmail.com> <20261021212256.27961-4-gnoack3000@gmail.com>
 <atw5fW54s8R-5a-G@google.com> <20261026.92f659908546@gnoack.org>
Message-ID: <auAwphO8weLefY5H@google.com>
Subject: Re: [PATCH 3/7] man/man7/unix.7: Autobind: Clarify when it happens,
 and mention SO_PASSPIDFD
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2026 22:55:49 +0100, G=C3=BCnther Noack wrote:
> On Sat, Oct 24, 2026 at 04:57:58AM +0000, Kuniyuki Iwashima wrote:
> > On Wed, 21 Oct 2026 23:22:52 +0200, G=C3=BCnther Noack wrote:
> > > Autobind happens if either one of SO_PASSCRED/SO_PASSPIDFD is set and
> > > either connect() or sendmsg() happens.  Mention SO_PASSPIDFD and
> > > clarify that autobind does not happen immediately when setting these
> > > socket options.
> > >=20
> > > In linux.git net/unix/af_unix.c, unix_autobind() is called by
> > > unix_dgram_connect(), unix_stream_connect() and unix_dgram_sendmsg(),
> > > if the socket has no address and unix_may_passcred() is true.
> > >=20
> > > unix_may_passcred() is also true when SO_PASSPIDFD is set, which was
> > > added in linux.git 5e2ff6704a27 (2023-06-12; "scm: add SO_PASSPIDFD a=
nd
> > > SCM_PIDFD"), Linux 6.5.
> > >=20
> > > Also, the old text said "not yet connected", but the condition is
> > > about the socket not being bound.
> > >=20
> > > Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
> > > Fixes: 0cf2caa41ea6 (2010-10-10; "unix.7: Document the autobind featu=
re")
> > > Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> > > Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> > > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > > Assisted-by: LLM
> > > Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > > ---
> > >=20
> > > Notes:
> > >     Rephrased the LLM-generated text so that the canonical descriptio=
n is
> > >     in the "Autobind feature" section and the other place just refers=
 to
> > >     it.
> > >    =20
> > >     SO_PASSPIDFD is unfortunately not documented yet at this point in
> > >     time, but it's still correct to mention it here.
> > >=20
> > >  man/man7/unix.7 | 25 ++++++++++++++++++++-----
> > >  1 file changed, 20 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > > index a1dce8c47246..ded82768322b 100644
> > > --- a/man/man7/unix.7
> > > +++ b/man/man7/unix.7
> > > @@ -301,8 +301,14 @@ if the sender did not specify
> > >  .B SCM_CREDENTIALS
> > >  ancillary data.
> > >  .IP
> > > -When this option is set and the socket is not yet connected,
> > > -a unique name in the abstract namespace will be generated automatica=
lly.
> > > +When this option is set on a socket that is not bound to an address,
> > > +the socket is autobound to a unique name in the abstract namespace
> > > +when
> > > +.BR connect (2)
> > > +or
> > > +.BR sendmsg (2)
> > > +is called on it;
> > > +see "Autobind feature", below.
> > >  .IP
> > >  The value given as an argument to
> > >  .BR setsockopt (2)
> > > @@ -370,10 +376,19 @@ call specifies
> > >  as
> > >  .IR sizeof(sa_family_t) ,
> > >  .\" i.e., sizeof(short)
> > > -or the
> > > +or if
> > > +.BR connect (2)
> > > +or
> > > +.BR sendmsg (2)
> > > +is called on a socket that was
> > > +not explicitly bound to an address
> > > +and that has the
> > >  .B SO_PASSCRED
> > > -socket option was specified for a socket that was
> > > -not explicitly bound to an address,
> > > +or
> > > +.\" commit 5e2ff6704a275be009be8979af17c52361b79b89
> >=20
> > Do we really need this SHA1 here ?
>=20
> I'll drop it, since it's already pointed out in the commit message.
> It seemed like the convention in these man pages, but apparently it's
> not needed any more, as Alejandro also remarked in [1].
>=20
> [1] https://lore.kernel.org/all/atulJkR7fAgyKhPP@debian/
>=20
>=20
> > > +.B SO_PASSPIDFD
> > > +(since Linux 6.5)
> > > +socket option enabled,
> >=20
> > You will need to update here with SO_PASSPIDFD_THREAD,
> > https://lore.kernel.org/netdev/20261005-work-unix-passpidfd-v4-3-350183=
b6e02a@amutable.com/
>=20
> SO_PASSPIDFD_THREAD did not make it into Linux 7.3, and man pages
> document stable features only, so it will have to go separately at a
> later point in time.
>=20
>=20
> > but I'm not sure to what extent you want to clarify things.
> >=20
> > For example, is "the socket is autobound when it passes
> > credentials or pidfd but is not yet bound." too vague ?
>=20
> In my ears, "passing credentials" might as well mean that the current
> credentials are being *sent* over the socket, rather than received.
> We could maybe say "when it is configured to receive credentials or
> pidfd"?  (But at that point, it's similarly long and less precise than
> just listing the socket options.)  I'd keep it as is for now, if
> that's OK.

Fair enough :)
