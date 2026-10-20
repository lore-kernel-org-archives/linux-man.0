Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792468051;
	b=nQxMEC7RpvR073IfZFEBJFow7m4QfAaBWs30fBXb7MLAilo0ayOMYK7ZxXc6yRrb2cZS
	 VPyuaZ49y+OburX1mmehVc5Pfiqr6W5o7yXuoEQ0+ovI3zBhoEWhzJoNtAQC6BsNpZgw7
	 h2bs0GACq65GRF2Hnujvk5+HkuGxbawUvfds4I7TMzCQ3SjVS/qbBptslTy8xdJbzZI0d
	 zvB8Zos5aFV4s3hJv9+xomcE3QYiXg2gkWOlgtLHIBoCc27KzIbRli3NBnf/pruZjFyrb
	 kjFGfUmfgH9+t6bxIsnUZKVoNPA69+awY7y1XvqnUwdUVLzPEwAFxgIr0OGUzmCbIYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792468051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QoDoEDlgoNrA4HtN4GBMSZBVnaBdsbLnMDtv9bP4z2U=;
	b=IB+8N2i2oL9rL5yl5jQ3LIMHCRFJjWBzAe4o5QdWw3xKqb3es1F6SGXUG3WdIc3l0VRS
	 jGNa4lqzAXC42NLPhEFrT2vVNtR4AOT4xlb9FHUpiQO5E95y2X7/ADeS70UsCgDYKGZle
	 ytgiRvf/BV7lsVooRBEHmXfmDNcWzofo8ncLDb1oTX1NykuOm4hxIB5NZoTGwkB9TdvBm
	 lfaVNFq7Ao4g5IEe8g0x6j1ZXyw8yDvviQl0/Y6YOpB90cGOvLRFdL7mZs5MkqeBkfLdb
	 PnQQoIvPdpe+2SEJHMRaLqhZKa8SwHOZYK00Yd9jpCu/rHzQFX6bxpUmyu/8haomo6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kIt9AFMq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA7B606A31A
	for <linux-man@vger.kernel.org>; Tue, 20 Oct 2026 03:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FA7B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kIt9AFMq
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35f1f76ea84so5116653eec.1
        for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 20:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792468050; cv=none;
        d=google.com; s=arc-20260327;
        b=EMnAjpMXOMvQHRN8T84bZilYKkgClynK60AuLdObX25qPxbkTYBqHKzq3i0mx9F4Gq
         fzJ/x3y+4IHYTlUWChTLUjzmXGAt3jAu6DtkHpM7D6HykleYTdRiwsiLbCSlQCaFSk13
         pJwya93+PTWYOB9TmvvsGOsYSSqID+PGOac6iNaMQh1MZ9vqhI++O1RXHk8W/fcE1QIA
         Upo9mSxiW7mpysKt18nq6NVvk76BCmZbzwiSiQIY3BaGOm91GU04L5YznHdiVg99/h7z
         nwIYp7/4J07bZKX+n3+4GAkfnvCNrEaQo99jJjAdwPLcwg+JDJNNv2WA/v+s0KGLLzdA
         uN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QoDoEDlgoNrA4HtN4GBMSZBVnaBdsbLnMDtv9bP4z2U=;
        fh=p9ixzLkljAy+/gkSjZ2AHEbjY0EKLxNqgjpNzprzscQ=;
        b=ooI49MsgZpwMxMPRkfFYttnhQ3sa+62O2bhv52knXRtgCWrpUfUSW3ucP9C+p07+aD
         HO/jb5HBWfFjQa1K8i/Gz7Uu3dZRlIQJThIbBXwMOeLNBtPS1G06kyPs55h2Gh8rgFYQ
         iSt9Ud7LU4oSaE5GbGZK3Kjw8ldpgL/RiXQ3HON4TL3mGyISaM/uHPgsScj/EQ6H5Pdw
         nz90MIpJQdSlm9n2f2owAav2a34cvyRQ/zMB90gsqKPtrzbYaNp3MUNVSaeU9jGbeIbY
         S1o67VnF2d0rUXgp37bh69y7FTsgeAqje40PtkTd8ixjPHnqrpDsfxxosBMuujPUpNEA
         wINw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792468050; x=1793072850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QoDoEDlgoNrA4HtN4GBMSZBVnaBdsbLnMDtv9bP4z2U=;
        b=kIt9AFMqyVndzCst1It6isUSmq9U30lWGAB8VPGkjwU8mnlqvlHtd1YNKBVa/LbzT0
         UTTIIoEdYAA8jBuZVYj13fln64cy5ZiP7FzKkpK/9HQwOzg6HQJ/IrwVyVTNcoeveYzf
         Wahz6ML9MnHG1lJGSjWUwL6QFe5+R3ZC64/PuHT1lJNL+nLBIFa+Z9rBLBh97hiHNaca
         hPnHhRaDHw7XlYtbRk1+3jalz8I0zXTDKay6chkof5ACsXVTZhU8ZdedH79EngY25WLM
         LZznzK++gv4NrhccQtKhDqpu6Jb9mxFUcd5g68SgRB77Bulf8gknkI0BQ7HPS7KjYtOO
         ALBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792468050; x=1793072850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QoDoEDlgoNrA4HtN4GBMSZBVnaBdsbLnMDtv9bP4z2U=;
        b=hEphbrdPh947AUQvnhNBVez7Bq9+pLw56rO+Z3T7UmzS70nFZ62/7y7YWEQUNVzKuH
         QQLza8aIaClBiq67RCj9GoLr3uQf8R0Cu95hVLsxRwLyP8t9LZrXZYMT6+7tZfBFM2Yi
         VqTE+CicTI2+exF9coANhX3g7T/z8raDv5x21aaGzU+IIoIZ0D8CakE0XqE2TBtr+xWk
         frOHqa7DJaUNeR6T+8XMo8kUaar9QwRC2Dj0eItMUSYeZdKuz6YUPjMfgrn3X2RPjwuN
         ylOY9eByD7nFoFO8+MK+VB9zg3JuAKe5aDItoDIXN3kaObD112e3X+Vc9XEcb0f+1AZ8
         Qzqw==
X-Forwarded-Encrypted: i=1; AKwUvBycx1/D5+A/peCICiYkpybrDdS2htJNsszceyGeFfLHQmcxHsTu1dXeh8ReE48hdq5Q7ZPhAS2onIw=@vger.kernel.org
X-Gm-Message-State: AFq9FYISxVr5fO/xlhr/SehM+j40dY/F8HCAMAFzhBPi7EG8g4yJJvPL
	Qyku9IMk+xpiK357/6QyLABUrkHbUspT9lVvec2RpEK2SVb+kXzk8QlaGQnJkBlyFDIl0dVl3ya
	oaY7xuzqbtomO2vHGu3RysLpuKMiovpzODqbk+WOk
X-Gm-Gg: AYBFou2n3BBjIV6ITKhn8yE9mNBZhUgk62cLKSHUlUqAKINOa+8Xpud8vW79kIt3SXB
	0L8VZ+jw5PCAZEAExnn1aNWTSyQ4kFCzlD9CuYb+8wp+Xs8VRwbbTyphqyPrqDDvHripSfvpH7w
	x12D5J8X51RpmQ1m9rZSsB2sUU1HqQYzzRn09QQhPMlzhTjyfWgIj6cu6/Fo+PnBsRDfOwHT1IP
	5L1lGbN5ll8mpofWn7KcXjqxLk0SDAUcJkQgtNiQjItZXZGspPx4qBmg+XUqEttKqBfECMCMRdM
	TVkk2bJ8CIxZVOeFLovg+qSVt+GZfVfJxh9snr3aSlNfzBVHBwypsCiljoAA0yP5bMA5ZMJ+KTP
	EmT/xAvq3SV/QqR1H5++aQIaI0DieFz1OIXFfe5gBXkN3G3rw4tzReEnx/tvFk1zlehujhL8UAP
	0wY8IJGMrpckoftORiCnOOKvRw
X-Received: by 2002:a05:701a:c951:b0:156:3684:96db with SMTP id
 a92af1059eb24-18515e402d1mr15762821c88.45.1792468049271; Mon, 19 Oct 2026
 20:47:29 -0700 (PDT)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018173712.27670-1-gnoack3000@gmail.com> <CAAVpQUCYaDWSeQormOH9SnJeiDnLanxvADGQ5WU7OkFN_zGzqA@mail.gmail.com>
 <atW_3kqU7KMcxHXp@debian> <20261019.e37ed940437d@gnoack.org>
In-Reply-To: <20261019.e37ed940437d@gnoack.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 19 Oct 2026 20:47:17 -0700
X-Gm-Features: AclHuK_DND4Th4kJXtJZMKoe2mOv7CE9KAXGS5lxB6uIrl3tOI6zxXzfkainP5M
Message-ID: <CAAVpQUBh+J-aBLbkpzT7qmt7B714O529HWcTuQsVLT4wLBnDJA@mail.gmail.com>
Subject: Re: [PATCH v2 00/24] Documentation fixes in unix(7)
To: =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 1:48=E2=80=AFAM G=C3=BCnther Noack <gnoack3000@gmai=
l.com> wrote:
>
> Hello Alejandro and Kuniyuki!
>
> On Mon, Oct 19, 2026 at 09:05:21AM +0200, Alejandro Colomar wrote:
> > > Date: 2026-10-18 11:37:16-0700
> > > From: Kuniyuki Iwashima <kuniyu@google.com>
> > > On Sun, Oct 18, 2026 at 10:37=E2=80=AFAM G=C3=BCnther Noack <gnoack30=
00@gmail.com> wrote:
> > > > Alejandro, I am sorry that you don't want to review this any furthe=
r
> > > > due to LLM use.
> > >
> > > I understand the frustration since maintainers are getting
> > > overwhelmed by too many AI slops these days (I'm not saying
> > > this series is) and the review cost is way higher than before.
> > >
> > > I'm happy to review this series as a AF_UNIX maintainer to
> > > reduce Alejandro's cost, so please CC me on every patch, and
> > > CC each author of (relatively) new functionality.
> >
> > Thanks a lot!
>
> Thanks from me as well, I will happily take you up on that offer.
>
> Thanks to you as well Alejandro, for reconsidering in [1] and
> continuing the review!
>
> [1] https://lore.kernel.org/all/atW-XL6H72Nyy3N3@debian/
>
>
> > > Also, please split the series into 3, general part (socket, bind,
> > > protocol stuff, etc), socket diag part, and scm part (SCM_XXX,
> > > SO_PASSXXX, etc).
> > >
> > > It would be easier for us to review small series than a single
> > > large series. (fwiw, netdev mailing list has ~15 patch limit)
> >
> > I'm okay with a split.
>
> I agree, it is admittedly a large number of patches that I sent here,
> and I can understand that this is tedious.
>
> I'll have a look in the next days and split this patch set up into
> more digestible chunks.
>
> >
> > [...]
> > > > Some mentionworthy points about features that were missing or had o=
ut
> > > > of date documentation:
> > > >
> > > > * Out of band messaging support (MSG_OOB):
> > >
> > > Please drop these changes.  I planned to remove it in the next
> > > cycle since recent AI-driven security research targets the poor
> > > implementation, and even if the bug is trivial for the plain AF_UNIX,
> > > MSG_OOB tends to promote it to UAF (and thus LPE) and risks
> > > users for no good reason.
>
> Yes, OK.  To be clear, the man page currently just says that OOB is
> not supported for Unix Domain Sockets, and my plan was to remove that
> wording (because it's technically wrong), but to refrain from
> documenting it so that not even more people pick it up and so that
> that doesn't get into the way of your deprecation efforts.  (It's in
> commit 22/24.)
>
> If you are saying that the deprecation is close enough, I'll just
> leave it as is then, so that it keeps saying OOB is not supported.

Yes, I'm going to deprecate it in the coming v7.5 cycle, so please
leave it as it.


>
>
> > > > [1] https://lore.kernel.org/all/bef45d8e-35b7-42e4-bf6c-768da5b6d8f=
2@oracle.com/
> > > > [2] https://projectzero.google/2025/08/from-chrome-renderer-code-ex=
ec-to-kernel.html
> > > >
> > > > G=C3=BCnther Noack (24):
> > > >   man/man7/unix.7: ERRORS: EINVAL: The address field is sun_family,=
 not
> > > >     sun_type
> > >
> > > Correct the address field s/sun_family/sun_type/
> >
> > I think you meant s/sun_type/sun_family/?
> >
> > > It seems the subjects are not formatted well, which makes me
> > > feel AI cannot follow the standard and it is not worth reviewing :/
> >
> > The subjects seem okay to me.  In the man-pages, we use slightly
> > different conventions than in the kernel, so I guess that's why it seem=
s
> > strange to you.  :)

Oh okay, then it was me not following the standard :p

> >
> > >
> > > >   man/man7/unix.7: Socket options: SOL_SOCKET is a level, not a fam=
ily
> > >
> > > Describe SOL_SOCKET as socket level, not family
> >
> > To my own understanding, I'll ask: technically, SOL_SOCKET (like any
> > SOL_*) is a protocol level.  The socket level is just one of the many
> > protocol levels, right?
>
> In my interpretation (but this is also only gathered from the
> setsockopt(2) man page), the "level" option to setsockopt() and
> getsockopt() acts as a "namespace" for the actual option value, so
> that the unrelated socket options that are specific to the protocols
> don't all need to use the same enum space?

Yes, I agree just the "level" is more appropriate.

>
> I skimmed through Steven's "UNIX Network Programming Volume 1: The
> Sockets Networking API" looking for mentions of "level", but the only
> places where I found it was for getsockopt()/setsockopt() and in
> struct cmsghdr (see cmsg(3)), where it is also used to qualify a
> similar enum.
>
> About the getsockopt()/setsockopt() use, the book says:
>
>   "level" specifies the code in the system that interprets the option:
>   the general socket code or some protocol-specific code (e.g., IPv4,
>   IPv6, TCP, or SCTP).
>
> As valid level values that can be passed, the book lists SOL_SOCKET,
> IPPROTO_IP, IPPROTO_ICMPV6, IPPROTO_IPV6, IPPROTO_TCP and
> IPPROTO_SCTP.
>
>
> In any case, in the commit here, we are replacing a mention of
>
>   "...can be read with [...] getsockopt(2) by specifying SOL_SOCKET as
>   the socket family"
>
> with:
>
>   "...can be read with [...] getsockopt(2) by specifying SOL_SOCKET as
>   the level"

so this looks better to me.


>
> Independent of the exact terminology, that is still a good change to
> do because it identifies the name of the getsockopt(2) argument, which
> is "level".  (There are also some values which can be passed as level
> which correspond to socket families in the sense of socket(2), but
> SOL_SOCKET is not one of them.)
>
> > > >   man/man7/unix.7: SO_PASSCRED: ffix
> > >
> > > ??  This reminds me of Final Fantasy IX :p
> > >
> > > Please fix all of them.
> >
> > We use 'ffix' as a shorthand for 'formatting fix'.  Those patches
> > usually make something bold, or remove bold, but don't do anything
> > meaningful to the page.
>
> Hah, yes. :)  As documented in CONTRIBUTING.d/patches/subject
>
> Computer game references are unintended. ;-)
>
> =E2=80=93G=C3=BCnther
