Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5502645629E
	for <linux-man@vger.kernel.org>; Tue,  4 Aug 2026 21:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785878766; cv=none; b=I0S1GlStZ99IMeQs2gB8u8sqgxjE9YFtxbUWD9p9YumxCZA+9Hv5rXPPKDGEJ0Lyz+55FKOt3KatDPZHmI5k2enDx2QJ7tmmErgqkFa8N59pnuVulj625oQOGCruon/IJVeagaf0D6KUzYc3C0ODIUphXSt+n7asCFmJEzANfrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785878766; c=relaxed/simple;
	bh=nNltvdCCkaAXl+FQ1aIG/1MM1Fb/rTDNGz+mXf2IZLs=;
	h=From:Date:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVcmS2Y0bMV7CrSyDdNZiXAvEyH9bss88H0s8qecWD82+5XmekkJPzt2xnY4F73UKj5VOt+QsB/5OROisVeD4nT/hshnPipjx/cRyjld7UXEWxyFPUwTsV7t8S5mFV702oPZkgr5CGl7H9ar2G4+qGdYzyQTkrCvIgZKBA8JIZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ah0Stbfw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ah0Stbfw"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954afac04bso2905885e9.0
        for <linux-man@vger.kernel.org>; Tue, 04 Aug 2026 14:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785878762; x=1786483562; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:to:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NM7GysBd4SdD+ZY/sq9A3PYlUglzsZxMJb2kXObcQI=;
        b=Ah0Stbfwt6HXb1hzfLmuhF2Haw//QQ/+H87O4WvSP4VJDy0fdDeyYy1gWsBPZ5Ov88
         Hfc7MbIGOXsOpPljHicghGOjEzbyUTZ2DFb1RQDqgT8m5uKQYQ3DPHSr+AK6tYyUmkSM
         j6p9tarIbJABWZpbveAD43w4h+LA/IO7PKtjbaEu+swdDvHxk4Zed+xKzF1FtOs/6nsW
         MLK5ksefA5podYuMI1rmMnGr9lwnRv3I8ZLZBMVhNNvUfKl1ll1RmM+ygkIkwv0oALgH
         rfY1g0uvO/8j1CcmWZ4K1MWzUvF1xxsDgLb7ViipExozgBVgMZGNJIaVaqz13y16l1Ew
         QawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878762; x=1786483562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0NM7GysBd4SdD+ZY/sq9A3PYlUglzsZxMJb2kXObcQI=;
        b=mpXXluSZaUiFAMLFtACQQ/5PILiAY+7aW9I4KBxrVEfVapotl5ehxzI/SHixxkVN2h
         VSkeEOL8O3ffFLtNVHGv75sFDSz2C0EQaqiNnREdGgIejRclApQ+71h69fYZT4gl5kpw
         ErXi//gwdylYqPsXme/SToUKmmMTZMrBLKurUKxKuW7P/6cwMMFsyj+BltsMAWIyGXe6
         6+gM7L203MSnf77YE9EYhgawUGgl3EH0vdhrADoeNv96d67vTvdMGxCShR59fyd1uh3h
         Qhghp+OtWlE4g5M6GLrtU/LxfcCzDnae2UTsjDvvIoibIYrgS+Qk+9jP/8aZ+YexQFtm
         ZtgQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7BwxcDmqzr6zGO11hE1Q4O2tv7qWSbCD77o/AgB2VJQZT7N/9oFLM+lJ3X2LwW9mpPEJ6JgFWPbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5tofuf2y2AOfI9YhO3MXBKw83GQ0NN/65KcPS3kto7Ub6m2H9
	pR4EndbuC+Vx2EMYfo1iPRhRQAdS5hJ98k4FUraVSpVhkC+apk1nuRSf
X-Gm-Gg: AR+sD10VoGl9GViw6aRuNNBN9QVn82IQ6yczXLZooRmTvm3JUgzQkctJc8efw0jXcHf
	dYj9UtafaZ9A07LK/TpcSuz7YjRM1lGoX4M2zp/zBdrJAUvjDzee4zdjRyHzLy58GbEv+YcPzOm
	+PT9lKmO53SuSdszLI7QFF8LjKbygMu5lFT+DbWg+FAHGPJ0WZiJ9M+mfsVkO+w+o94gCRR3RyR
	4sHFq8qCoGxs55PPTLdvMBb2kFH2tMW1nN9Z2shNSErKg4qbnt7hZJxiGPCBrG+9HfwbuSvHS88
	ROcQeUGY8FREueN3YeKzwz1dYVHcw8ah5TcZ4d57jrbEuowO+nrwOWjNtxIQYBfp/cCFEsn4Rmg
	UEnCbkPaekwHkTUBN8zrs+Cvqw2w59sEBqoip46SiUecGjvs8V1EiLjZWKAFdwgn0fJEIFxUxsY
	BV6iU7lVqI8Ggh92w5JD4BN7/Ng52WEsUkeV60GMn+Dzp33BFZKhi+ha6kUwDl4KQcYRU=
X-Received: by 2002:a05:600c:a47:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-4994e718f78mr16031775e9.5.1785878761808;
        Tue, 04 Aug 2026 14:26:01 -0700 (PDT)
Received: from localhost ([2a02:586:d80b:3fce:998f:a77:2a:cf12])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm138898175e9.0.2026.08.04.14.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:26:01 -0700 (PDT)
From: "=?utf-8?B?zpHOs86xzrjOv866zrvOrs+CIM6nzrHPhM62zrfOvM6xzr3Or866zrE=?==?utf-8?B?z4I=?=" <aga.chatzimanikas@gmail.com>
X-Google-Original-From: =?utf-8?B?zpHOs86xzrjOv866zrvOrs+CIM6nzrHPhM62zrfOvM6xzr3Or866zrE=?=
	=?utf-8?B?z4I=?= <a.hatzim@gmail.com>
Date: Wed, 5 Aug 2026 00:24:30 +0300
To: Alejandro Colomar <alx@kernel.org>,
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>,
	Collin Funk <collin.funk1@gmail.com>, Sam James <sam@gentoo.org>,
	"G. Branden Robinson" <g.branden.robinson@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [GNULIB] The goal of the Linux man-pages project
Message-ID: <anJYjgMPl4jNUgNv@CHATZ>
Mail-Followup-To: Alejandro Colomar <alx@kernel.org>,
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>,
	Collin Funk <collin.funk1@gmail.com>, Sam James <sam@gentoo.org>,
	"G. Branden Robinson" <g.branden.robinson@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
References: <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <87h5lb9u8d.fsf@gentoo.org>
 <8733wusj68.fsf@gmail.com>
 <anHVx-xWLmL7SPyM@devuan>
 <8633wtnaw8.fsf@aarsen.me>
 <anIaZ8X_73ZjmYtR@devuan>
 <anJIHzkK68R5KAgH@CHATZ>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anJIHzkK68R5KAgH@CHATZ>

Sorry and be precise:

On Tue, Aug 04, at 11:14 Αγαθοκλής Χατζημανίκας wrote:
> 
> Look, there is this one special thing that can characterize a programmer, and
> this is preciseness! Based on that, i really believe that every sane C programmer
> in this planet, would be voting for a header like memory.h, because that is the
kind
> of their operation. End of story.

> Judging from the current glorious! circumstances we live, to ask from old
> dogd
  dogs
> to make such trycks is unreasonable.

And I said old just because i'm almost sure there will be no new. We are the
last of at least __this__ kind.

Hopefully this email is the end of this kind of discussion, though he made us
to realize a couple of really important things. So at the end might give us
a fresh start. What a situation!
