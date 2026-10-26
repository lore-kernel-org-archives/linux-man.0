Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051753;
	b=GA+Y6oYvXBtoYhTnHmrO+DssVT/EDHhmpcjCWwAnAI1XhisoZ/Lqh+So7m9Tebn8NQYU
	 tzsrfoXNwvUA4+0cIEPubVWQUVBT4yR/mHWefmlCVdLHlK7ZVCcm09XhUP2owuNgFOXms
	 Uf5+p0fsPZg2Y5Vp3Jk7TKGqZQuRhrtxcrAS231SWcSvXxQSAHRYQaQ3ULvH1s0f4aA6v
	 S5+gPsrWra7n45THv+MVDKfBuFWzek2fJn8Esg/YWuEPDCdLGPXRtGJTdFcJRZ5vbYaYF
	 vxNiNSS0hf+Gs1wpqZtJsfS60EebzGfqx2CGfeui+rm8CvIlz6BQ8U+Gwot2jkghFlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=H+fHCsIsBMzXytr2xZX4AHsSw0qM8WvZob/oLbDp+PU=;
	b=taesgvmVGL7udlV0dGHT2PRXkrtEhZvhoAWWbRXz0S/BXi9gpQYcGRAKnfjjT75IpGC4
	 PD2csr7Z6mxTm8z7ek2lb1exVjtAK3FuUktWpBxzgltW0wX7RdIr3O39H0wiGksqTxEnJ
	 XaDSxZOYwv3Wt3xYjrcyaRUpCyx4sKs44qFWj85QRpaP+yG/pz55QQqRpkXNLP7hC18rR
	 E1q7bBmnhkdEMj9UB868Yf3TadPjfuicoeIWBAM5FXKqcSKkzdiQTwSoRttTH8NU+gLIX
	 0B9Z3v9zCpVH1RBao0CP77MDxRRV8A3p5V60N5RufCu8tnR75KLHiFXlMTkFoVSKULg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YO5KLJLV;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560EC606A31F
	for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 21:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560EC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YO5KLJLV
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e00eee27dso2226132f8f.0
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 14:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793051752; x=1793656552; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+fHCsIsBMzXytr2xZX4AHsSw0qM8WvZob/oLbDp+PU=;
        b=YO5KLJLVgVgTiv2Er/qfoHF29Stc/BVjAi5SELDu8/4n97fdH4eOCvntpS8jyYnMyT
         PrLZbEN8uvTclGLPrWs8Na+9kYUW36sivTyIaAxxo5kXedylcTlPV2ZK8+bNTJtoCqU5
         EYwHZu0qBLvSVKXylICR1QV3uT+TZsxbwe8mRedBlJqQ0q+YeoZq/9+X+gv1VzTRBamX
         UJKrjUXtETRCAke/4CCqA9Q1Ab3jCegeq8qm2KKYcbhcMPA9YDTSX0t0t1WsOvbciFV9
         qlSj07VuSXTfTO/8BQ5tL69KIE/ZE1IyWTF4QXc6M8nWn4yhAqujL95dzKW244d2Z1LQ
         aNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051752; x=1793656552;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H+fHCsIsBMzXytr2xZX4AHsSw0qM8WvZob/oLbDp+PU=;
        b=sdYivEO8BIGf45JC/Sq+zAlCKfGHt5qkns3sTgV8URJYkB/VE57nrLrUcPbOvRad1L
         ROLjKsvF4NFVYJPDOYYWU4hWFkv1xNE9thGe8JZHWBihPCynwd3Bm/iBkQhjJbakopgv
         dArg26qp4vSRWOHfHdrCKjkbDufv59UZOMrXI9XhmD541O0vBszX0z1lSZHbnwjYcX6q
         deOrkA7tB51sJJ8G2zvlYwCbCbbNORQvXneKrsI0ijbpNDK4RcqjRLtDKO7yuypEfEez
         Kd8prg5D3qrYi1imaDzzA1XAguXhJ7rCZjKqF5gO9l6gLuW4AHiCkSuDzP8LYlokd5eL
         R5wQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8CaNmcmsw8v/mNBta74pHEibJWtYoA7T0ZQ2N6Wu+3ShufjnQiKOVbf9kLK5W26Qzf6A9R3KoTUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4S48Da3T3yHKrU/8DUc2WpEFbiwrNWn3SfooPUPAvJf0YMFSn
	eRsNtpAYU5XxQOOh2/wrbJ0D59nBm/qgAg/PZQW48j4DvEunVOOCswCH
X-Gm-Gg: AYBFou2qpqPFiYcwzuoEir1I9+5R5Q154qVkB1PnZ8uGS/pwzMTOjk1S/pk/HY7ERQd
	rUrvDVFlqV1uDir2jf9Wi7cDA3yQGqwYqeTUb28nunPsRyIwJJB0tIFUBN7vXfAvvDYTUr8JL/z
	VOiM0Ytk7wHAWVdHiZU6eMCt1sCac/JEAumef4EsMN6YSvlx0h57Ay1VEjwkyi/XPtIku9iGVcE
	Dn1STW6UipiqANAWfXGcUQ5yKhP7dqkGy8TrYa9ZakLrL6DJILrTxCBaMePBcMP38lV+fmMcccy
	DjhK6d9xH2O6RLb36lUKur+MpXVxPDtH7nQ+hdxpQR6VSIBu1DxaN0xODgJjIJNql1x5kEp3Gav
	xGDrR9Sx9c0f4n4KEntoK+oI04rYYFJkxJZNZecJZgwQxTML9t32riOZd8EZbVPOB8Qoemc/Z0l
	zw24Tu32wiGNnpX+RHLby3PSORo0eyF2dVO7sYpNjcPO3tLYY6quI2/4tc536ntEhg6eCdayj8z
	xt9Q8YIWhqte46N9OfI8QSKIkU/HCsoSnwXpNH6KVoHthLkdq5HlGrKxmDZObv4XuOyOwy0dtJ8
	BJh6
X-Received: by 2002:a05:6000:188b:b0:48d:f6d2:9c8d with SMTP id ffacd0b85a97d-48e3eba1212mr16202593f8f.46.1793051751417;
        Mon, 26 Oct 2026 14:55:51 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm20774747f8f.48.2026.10.26.14.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:55:51 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:55:49 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Subject: Re: [PATCH 3/7] man/man7/unix.7: Autobind: Clarify when it happens,
 and mention SO_PASSPIDFD
Message-ID: <20261026.92f659908546@gnoack.org>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-4-gnoack3000@gmail.com>
 <atw5fW54s8R-5a-G@google.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atw5fW54s8R-5a-G@google.com>

On Sat, Oct 24, 2026 at 04:57:58AM +0000, Kuniyuki Iwashima wrote:
> On Wed, 21 Oct 2026 23:22:52 +0200, Günther Noack wrote:
> > Autobind happens if either one of SO_PASSCRED/SO_PASSPIDFD is set and
> > either connect() or sendmsg() happens.  Mention SO_PASSPIDFD and
> > clarify that autobind does not happen immediately when setting these
> > socket options.
> > 
> > In linux.git net/unix/af_unix.c, unix_autobind() is called by
> > unix_dgram_connect(), unix_stream_connect() and unix_dgram_sendmsg(),
> > if the socket has no address and unix_may_passcred() is true.
> > 
> > unix_may_passcred() is also true when SO_PASSPIDFD is set, which was
> > added in linux.git 5e2ff6704a27 (2023-06-12; "scm: add SO_PASSPIDFD and
> > SCM_PIDFD"), Linux 6.5.
> > 
> > Also, the old text said "not yet connected", but the condition is
> > about the socket not being bound.
> > 
> > Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
> > Fixes: 0cf2caa41ea6 (2010-10-10; "unix.7: Document the autobind feature")
> > Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> > Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Assisted-by: LLM
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> > 
> > Notes:
> >     Rephrased the LLM-generated text so that the canonical description is
> >     in the "Autobind feature" section and the other place just refers to
> >     it.
> >     
> >     SO_PASSPIDFD is unfortunately not documented yet at this point in
> >     time, but it's still correct to mention it here.
> > 
> >  man/man7/unix.7 | 25 ++++++++++++++++++++-----
> >  1 file changed, 20 insertions(+), 5 deletions(-)
> > 
> > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > index a1dce8c47246..ded82768322b 100644
> > --- a/man/man7/unix.7
> > +++ b/man/man7/unix.7
> > @@ -301,8 +301,14 @@ if the sender did not specify
> >  .B SCM_CREDENTIALS
> >  ancillary data.
> >  .IP
> > -When this option is set and the socket is not yet connected,
> > -a unique name in the abstract namespace will be generated automatically.
> > +When this option is set on a socket that is not bound to an address,
> > +the socket is autobound to a unique name in the abstract namespace
> > +when
> > +.BR connect (2)
> > +or
> > +.BR sendmsg (2)
> > +is called on it;
> > +see "Autobind feature", below.
> >  .IP
> >  The value given as an argument to
> >  .BR setsockopt (2)
> > @@ -370,10 +376,19 @@ call specifies
> >  as
> >  .IR sizeof(sa_family_t) ,
> >  .\" i.e., sizeof(short)
> > -or the
> > +or if
> > +.BR connect (2)
> > +or
> > +.BR sendmsg (2)
> > +is called on a socket that was
> > +not explicitly bound to an address
> > +and that has the
> >  .B SO_PASSCRED
> > -socket option was specified for a socket that was
> > -not explicitly bound to an address,
> > +or
> > +.\" commit 5e2ff6704a275be009be8979af17c52361b79b89
> 
> Do we really need this SHA1 here ?

I'll drop it, since it's already pointed out in the commit message.
It seemed like the convention in these man pages, but apparently it's
not needed any more, as Alejandro also remarked in [1].

[1] https://lore.kernel.org/all/atulJkR7fAgyKhPP@debian/


> > +.B SO_PASSPIDFD
> > +(since Linux 6.5)
> > +socket option enabled,
> 
> You will need to update here with SO_PASSPIDFD_THREAD,
> https://lore.kernel.org/netdev/20261005-work-unix-passpidfd-v4-3-350183b6e02a@amutable.com/

SO_PASSPIDFD_THREAD did not make it into Linux 7.3, and man pages
document stable features only, so it will have to go separately at a
later point in time.


> but I'm not sure to what extent you want to clarify things.
> 
> For example, is "the socket is autobound when it passes
> credentials or pidfd but is not yet bound." too vague ?

In my ears, "passing credentials" might as well mean that the current
credentials are being *sent* over the socket, rather than received.
We could maybe say "when it is configured to receive credentials or
pidfd"?  (But at that point, it's similarly long and less precise than
just listing the socket options.)  I'd keep it as is for now, if
that's OK.

–Günther
