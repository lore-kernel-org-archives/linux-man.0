Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4AC3D5227
	for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399689; cv=none; b=axkOb0a039K/N6z8blTpHSWQud/nw0ky44W4cxas3H8KPVjGUyYxwlkfj6tp+4lIs+Jf4H42lJg4bkVzCRy5fMfHdqTL9f4CYOyf3c7oeKWiOxlV1+JNtpGq3jwmzjfAhPtuFxvaX1PCBPgIkDma8CAQsyZGUgdz5HV2cQxdlmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399689; c=relaxed/simple;
	bh=GFejSA3Ti5cjdt/2xlhHZic2KmVGoIwEhqbQIBcKRtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqHzYT4FtazvyIgN47ehkDsim7DbzrouxOIVw8jcMY2ykg2esebMSMQco7DVK1Sx+bjxZdDj+NXIDaZ0+wBLG8XpiKioIBT5PYEe3NSPSkTQd1BchFwV3rcwYvbIVnHMnGFMDaYGkuyGp6I4lXJ4whfI7B0YdwCdsW+/FI9hSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GROFH1T8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GROFH1T8"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso864668f8f.1
        for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 01:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792399686; x=1793004486; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eGnD8seGAmNs+gIz5QZe/oHoiU6stOsQvvdnoJMGgb4=;
        b=GROFH1T8BAv3qpkx5CBZk1WILkQWR50BZAw+H5JSL7qnM45KBdKT/4vIKZ86M+N5+I
         JO5FBdKUwV9gItyM3kXbvc7NFKQgzDS9YKIcncyoPsIN4mqvj0C8+UyG8E3d4FYxWz0B
         v+S32NyjtO8xTvYgM8Di0mMnr3iC6fA3kVfUr2x8qn/Pp39egQ0Ckt8az7CeNKLtcoKO
         3U/2zREDNUelCwBYciA/Mm2hyUC4ibg+cgwkDiaGVMfnS2zJmFseb+6DOTI6TtCI3sSB
         PVXDrDmJc/hEULmaTqA7dxl1xzvFdSz7g39gkKUX9cCRiL20PM3eZvzzaTmnqdk8iB8c
         rl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792399686; x=1793004486;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eGnD8seGAmNs+gIz5QZe/oHoiU6stOsQvvdnoJMGgb4=;
        b=Gz0WkDDdvkN0BAkLCTwiZForGZlaShC4qcs19RKJJ/Gyd+h638/sMw23B9bcMumzcK
         t4wQfYFhumnmFS0T+bfVwGE6IcWLs2+/KhyQwjjthQyFStuO52lQvmniPexwpWgl1WWO
         b6P8Kh1L+E5o5nPJFF6AM0qR7go/gnniEls1E7UTEyuf8CPNkUJwd7NBfFmnxBVMz3Ja
         T8lKY4kNAIbSTZgg4I3VrJFTZn9VuROWNDwloe3J0IzDalIT1C3af3ew3myPUaQcPWZR
         KDK1hBeZmf4elTJ4jHWgy//NpmLNF71J4YRszO6Fq5BYrYZt8OHF56iaoHAIqdJmQLFG
         BsWg==
X-Forwarded-Encrypted: i=1; AKwUvBydrPRpkfjOCrs9XoRoNSxt6xUDC/BFaTlujnfVPo19fraihkjk4IqVEe5Uct1Pzsh1FNSAlqo67RU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPbTdxrWsGIzkZktUbQPUjKIOSRYRZiRegg5yLgdgZt/I4KCkb
	ep1AtlG/vKNNNEyHfhj7hrVU+F1/0TTxYq3u0lK0ilZ2FtIbLaqBqeRQ
X-Gm-Gg: AYBFou0vhBAwj9W3tFf3BmIH1ItWpLq6igVVH6eX/RsZrzhkJqHIDcYI5CAhc+4Qsex
	Xu5dPX1ATkhRZbvtKUDKy/FkebbcMQhTu4JhODbW50IDc/GRDVV8OzBUX3P4arewh/+OCYg8GUf
	NOeZXa28D0USz9As50bZ+DshR6oXllRwcM9etAPQ0N7KR3GJr+EKYpF26Gypkcd9pIfGe4n0vdN
	80wPc35YsmbZEWHHvVx2lFpQC0OxV25oxpIcYStQobAp4D5d3k9ozKsU9bqXJtukPeA+u7BfZmn
	PGoPVu3ytTj62vPwYl2aRt2lfv3oA/jk7M0A653MDxRidjKrypb9YV58lyMzOU3dNWkyjAN5HsL
	TvudbxvLdnkXtm8vRsfHv4BpSXFrLM3/2MUV5YRhYRYgx9pE7KrqqU9DsWfZWooU6UqHk6Vl4c1
	+S/lCNHTG9/AGGcedZKqJVji2iv8Dt+hMCh211CEFmpybi+prMCzyKOtbxql1bXN62hM8+1ed9r
	LXgwrkFTrxGH60kvI4GsxE=
X-Received: by 2002:a5d:66c8:0:b0:48c:7caa:12cd with SMTP id ffacd0b85a97d-48e07fbbf74mr8508445f8f.22.1792399686199;
        Mon, 19 Oct 2026 01:48:06 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5813sm30178300f8f.17.2026.10.19.01.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:48:05 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:48:00 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 00/24] Documentation fixes in unix(7)
Message-ID: <20261019.e37ed940437d@gnoack.org>
References: <20261018173712.27670-1-gnoack3000@gmail.com>
 <CAAVpQUCYaDWSeQormOH9SnJeiDnLanxvADGQ5WU7OkFN_zGzqA@mail.gmail.com>
 <atW_3kqU7KMcxHXp@debian>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atW_3kqU7KMcxHXp@debian>

Hello Alejandro and Kuniyuki!

On Mon, Oct 19, 2026 at 09:05:21AM +0200, Alejandro Colomar wrote:
> > Date: 2026-10-18 11:37:16-0700
> > From: Kuniyuki Iwashima <kuniyu@google.com>
> > On Sun, Oct 18, 2026 at 10:37 AM Günther Noack <gnoack3000@gmail.com> wrote:
> > > Alejandro, I am sorry that you don't want to review this any further
> > > due to LLM use.
> > 
> > I understand the frustration since maintainers are getting
> > overwhelmed by too many AI slops these days (I'm not saying
> > this series is) and the review cost is way higher than before.
> > 
> > I'm happy to review this series as a AF_UNIX maintainer to
> > reduce Alejandro's cost, so please CC me on every patch, and
> > CC each author of (relatively) new functionality.
> 
> Thanks a lot!

Thanks from me as well, I will happily take you up on that offer.

Thanks to you as well Alejandro, for reconsidering in [1] and
continuing the review!

[1] https://lore.kernel.org/all/atW-XL6H72Nyy3N3@debian/


> > Also, please split the series into 3, general part (socket, bind,
> > protocol stuff, etc), socket diag part, and scm part (SCM_XXX,
> > SO_PASSXXX, etc).
> > 
> > It would be easier for us to review small series than a single
> > large series. (fwiw, netdev mailing list has ~15 patch limit)
> 
> I'm okay with a split.

I agree, it is admittedly a large number of patches that I sent here,
and I can understand that this is tedious.

I'll have a look in the next days and split this patch set up into
more digestible chunks.

> 
> [...]
> > > Some mentionworthy points about features that were missing or had out
> > > of date documentation:
> > >
> > > * Out of band messaging support (MSG_OOB):
> > 
> > Please drop these changes.  I planned to remove it in the next
> > cycle since recent AI-driven security research targets the poor
> > implementation, and even if the bug is trivial for the plain AF_UNIX,
> > MSG_OOB tends to promote it to UAF (and thus LPE) and risks
> > users for no good reason.

Yes, OK.  To be clear, the man page currently just says that OOB is
not supported for Unix Domain Sockets, and my plan was to remove that
wording (because it's technically wrong), but to refrain from
documenting it so that not even more people pick it up and so that
that doesn't get into the way of your deprecation efforts.  (It's in
commit 22/24.)

If you are saying that the deprecation is close enough, I'll just
leave it as is then, so that it keeps saying OOB is not supported.


> > > [1] https://lore.kernel.org/all/bef45d8e-35b7-42e4-bf6c-768da5b6d8f2@oracle.com/
> > > [2] https://projectzero.google/2025/08/from-chrome-renderer-code-exec-to-kernel.html
> > >
> > > Günther Noack (24):
> > >   man/man7/unix.7: ERRORS: EINVAL: The address field is sun_family, not
> > >     sun_type
> > 
> > Correct the address field s/sun_family/sun_type/
> 
> I think you meant s/sun_type/sun_family/?
> 
> > It seems the subjects are not formatted well, which makes me
> > feel AI cannot follow the standard and it is not worth reviewing :/
> 
> The subjects seem okay to me.  In the man-pages, we use slightly
> different conventions than in the kernel, so I guess that's why it seems
> strange to you.  :)
> 
> > 
> > >   man/man7/unix.7: Socket options: SOL_SOCKET is a level, not a family
> > 
> > Describe SOL_SOCKET as socket level, not family
> 
> To my own understanding, I'll ask: technically, SOL_SOCKET (like any
> SOL_*) is a protocol level.  The socket level is just one of the many
> protocol levels, right?

In my interpretation (but this is also only gathered from the
setsockopt(2) man page), the "level" option to setsockopt() and
getsockopt() acts as a "namespace" for the actual option value, so
that the unrelated socket options that are specific to the protocols
don't all need to use the same enum space?

I skimmed through Steven's "UNIX Network Programming Volume 1: The
Sockets Networking API" looking for mentions of "level", but the only
places where I found it was for getsockopt()/setsockopt() and in
struct cmsghdr (see cmsg(3)), where it is also used to qualify a
similar enum.

About the getsockopt()/setsockopt() use, the book says:

  "level" specifies the code in the system that interprets the option:
  the general socket code or some protocol-specific code (e.g., IPv4,
  IPv6, TCP, or SCTP).

As valid level values that can be passed, the book lists SOL_SOCKET,
IPPROTO_IP, IPPROTO_ICMPV6, IPPROTO_IPV6, IPPROTO_TCP and
IPPROTO_SCTP.


In any case, in the commit here, we are replacing a mention of

  "...can be read with [...] getsockopt(2) by specifying SOL_SOCKET as
  the socket family"

with:

  "...can be read with [...] getsockopt(2) by specifying SOL_SOCKET as
  the level"

Independent of the exact terminology, that is still a good change to
do because it identifies the name of the getsockopt(2) argument, which
is "level".  (There are also some values which can be passed as level
which correspond to socket families in the sense of socket(2), but
SOL_SOCKET is not one of them.)

> > >   man/man7/unix.7: SO_PASSCRED: ffix
> > 
> > ??  This reminds me of Final Fantasy IX :p
> > 
> > Please fix all of them.
> 
> We use 'ffix' as a shorthand for 'formatting fix'.  Those patches
> usually make something bold, or remove bold, but don't do anything
> meaningful to the page.

Hah, yes. :)  As documented in CONTRIBUTING.d/patches/subject

Computer game references are unintended. ;-)

–Günther
