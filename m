Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F27E3603F7
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753028; cv=none; b=Zoh1HAmDuyAwlx0e8eu2HRtCWI7mvv0yMkGmNUQhH867Eh908XJnzOF76JXcULHxqPZWuaufpV8DMsy/N+Dq92UEZ0wZQIPEcIAm5OvVzd49jGSejFNsknov+eQd5uU70hkeiyo/gkkyHkxFzyBSB2qO08e8pxyLspmQiEIHYHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753028; c=relaxed/simple;
	bh=S/j6mLpCJaF71yfP0MDenKmMk0XNeUTVxDpkl1YeeGU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vj0KtvwG+d8WmSqd+NjW4RCtTkwu9Izy3aVqpcI6KSo0KIVd27H4/PTrDUUtipCE84erpnlOoAB0iUYNpJnsysFp96JU+wVCllxqx197FFqR/Fr9KMHadTL8HZHghLwswvFGPRVoSHd8jDqLhZYvMLxZmXPrlNOW6qAKgC6ObqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DW+/7dAg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DW+/7dAg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954afac04bso22688685e9.0
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 03:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785753024; x=1786357824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:date:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/j6mLpCJaF71yfP0MDenKmMk0XNeUTVxDpkl1YeeGU=;
        b=DW+/7dAgCvblNvzQgZLVRyjeXAKs5ACND8FClO9sJP74O3Qb4H1P9M+jVSWreQ+wmI
         1F6+U/ShHVCe5XNG8sa/nYZDv2MnDueoU+TrOR5XhhStDEiAHlUKHph2L0TqmTevFHOV
         LSRFsGWbHtfFav8XDthAkLxIijQ3/Dv141aqUVFSzN3HN96A1ogk0PywlpTSnKhO+D7D
         ZOyEU1BkTEUBeBG8wetaTwrYewszQ7uPWr1hE83jmbu8E7XrBm2pwtRH/63YQtt+EVsj
         aIG0/jY+KAVfXO9cW8FRooG6EZhktxN1mUtNg5OhotM8dZHw+LaiJ1Wyv/9t9qMHw3f1
         Yp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753024; x=1786357824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S/j6mLpCJaF71yfP0MDenKmMk0XNeUTVxDpkl1YeeGU=;
        b=MKHNbgtNqoqf/I3U6ufjoGCOxWfgaKP4zW/T/aaq+CDnIB8x7rejbY86+34arC8Ld2
         K9i0wfGQQg1GC9ag5g0W4oaPrzOBrNNEnZ22VIhmrD6NeqjBWV7RMql3afqXEK8KHOdI
         l0rS3dWpZA/K0s7UatAyggR0xhFksBWXPIbWr3Yowf0i7MlF7yXiwvU/af294AZitBqB
         gOmMeDgXhKGlJdOpVbS9zKoE9IOYl9bpZC8oap1Aa81pbwFFW0C46etuElBmIjYys+Cr
         HUaBR3Po+3LWMrY4itN9ROylKwXOl+ckuu7Ox+b2qCSBwOnl2KEmLbD1CAzA70rlH4m4
         7Z/w==
X-Forwarded-Encrypted: i=1; AHgh+Rr6mg1QyxpQjcCBQaKUMTI9SmjTCyUwJfhuMwRw9yr4W24DUbm9b9vU4MQY46fZ8M9Sp3l4ZYXif5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Mpt2bk83MZu1m7sqv9ezmAgMZ4gvOgdd594LEkQQoLO8dlTi
	xQdkM14le/pWzxPe9dcCUME67Wp3GT/f9h9N6ChIGKZDKgx1qT8cVyyS
X-Gm-Gg: AR+sD10+w8pONOvwDTZXSie1oLksMpAilgy9RppCWFItWdfgK8vLvF4SG6SFZOT6Ihf
	7lnrhCz3ScIUfPqjX9XANaytXXRE53dX9fvkWT2ZjnTIIZQnkSAiCpiDX7F75UmEeU5wmxuKJsO
	kb7khksJJ2B15v2npt9VByDDMWA55+yDMxc+9J9wPDZhHZhbDPiuDxm7neUaLczSTWd0G7CaTWB
	K5Y4fkLDwtDVeUjmcARgCcpPOukbWAhDcf6Ut3h7c/Bcno18QGd2iDe506nv7wQW0vFYYDL8/1y
	kcduW52ZJf6iM1R42t7peJZ00c0n0h6EMtwSpcZeiqS1vN/maO3hFY5hQaetqGkpMXdKcSTShmq
	jXyoC/8AYuhiNIuicn47rm2QasZw1wxV+wi3CiRSVBihMcOVHrwB1fNcO7QB38VjNHAHrNLn9FJ
	nOkUt6miwSYDHzV7tND1Lc8O8Re4PNu9pgbJUU4UvH8b9OHUPvVQt+U2u+kR2cRhpetUk=
X-Received: by 2002:a05:600c:314f:b0:495:4572:21af with SMTP id 5b1f17b1804b1-4980c673252mr171493245e9.9.1785753024166;
        Mon, 03 Aug 2026 03:30:24 -0700 (PDT)
Received: from localhost ([2a02:586:d80b:3fce:998f:a77:2a:cf12])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4980819a030sm228766395e9.6.2026.08.03.03.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:30:23 -0700 (PDT)
From: "=?utf-8?B?zpHOs86xzrjOv866zrvOrs+CIM6nzrHPhM62zrfOvM6xzr3Or866zrE=?==?utf-8?B?z4I=?=" <aga.chatzimanikas@gmail.com>
X-Google-Original-From: =?utf-8?B?zpHOs86xzrjOv866zrvOrs+CIM6nzrHPhM62zrfOvM6xzr3Or866zrE=?=
	=?utf-8?B?z4I=?= <a.hatzim@gmail.com>
Date: Mon, 3 Aug 2026 13:28:53 +0300
To: Alejandro Colomar <alx@kernel.org>
Cc: Collin Funk <collin.funk1@gmail.com>,
	"G. Branden Robinson" <g.branden.robinson@gmail.com>,
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
	Bruno Haible <bruno@clisp.org>, bug-gnulib@gnu.org,
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool... and a bit about C.
Message-ID: <anBtZdq5KH-O_Pqq@CHATZ>
Mail-Followup-To: Alejandro Colomar <alx@kernel.org>,
	Collin Funk <collin.funk1@gmail.com>,
	"G. Branden Robinson" <g.branden.robinson@gmail.com>,
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
	Bruno Haible <bruno@clisp.org>, bug-gnulib@gnu.org,
	libc-alpha@sourceware.org
References: <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <am_TTjDLlAI68zkp@devuan>

Hi Alex,

I want to start by saying, that I think your motivation is crystal clear to
any objective observer. And you are perfectly right!

Has anybody denied that those functions don't operate on strings? They don't
even know what is the '\0' byte so they don't care about it at all.
They operate on the memory region and they do it unmercifully.

Alex, there isn't any kind of mercy in the environment we breath. This is a
crucial point to realize.

Now, it doesn't really/really matters which is the right header. Of course
it is a header that exposes those functions. It isn't of course <string.h>
but again it doesn't really matters. It could be matter if [g]libc.so was
splitted in myriads of libraries, and the programmer [-l]inked with the
corresponded library. This is not the case here. As others have been said
you could just include <[g]libc.h> and been done with that.

Now, while you are perfectly right in principle, what it matters is exactly
what are you doing! Recording the CAVEATS, mentioning alternatives, exposing
deficiencies, etc. In other words being honest with what you are doing.
And you are and this is impressive and you deserve appreciation.

Man pages and without a second thought is the most valuable resource for any
C programmer, you don't even want to think C programming without them!
My opinion is that they are very well thought and constructed, with the usual
wisdom of our ancestors, without bells and whistles and undoubtedly one of
our precious jewels.

Alex:
They matter about the standards, please don't forget that. No matter if the
standard is right or wrong, this is what we have. Libc'es and compilers are
following them. That is not to say that we have to surrender and obey to them
as the ultimate truth, when it clearly is not. We still have to give our best
to fight for the evolution. But fighting for the header is a loosing battle.

Others:
And while we all love tersenes and compactness, I strongly believe that they
are also an educational tool. There is still a room for this. In my opinion
this is also a fair objective by Alex, so please encourage him, as it is for
our own good also and we've to feel lucky we've him in this position. Someone
is getting really serious with his role! And this is extraordinary in our current
time.

But and to be a bit cruel here. Does it really matters? Are going to be new
programmers? Who we'll taught?

At this point and generally speaking for our current environment and specifically
about C.

The C programming language it was the cornerstone of our programming universe.

But, today we live in the kindgom of Rust!

Coreutils were written in Rust and i think ubuntu adopted them.
A C compiler has been written in Rust. Bun is written in Rust. Claude writes
Rust!

Given those facts, programmers will be just reviewers! But you are some of
the best ever born programmers, and you should perfectly understand that:

How on earth a reviewer can understand the mistake, if she never codes?
And especially Rust which is zillion of times more complicated than C?

So in absence of logic in our world, C has an incalculable important role
to play in time (if of course we'll be blessed with time).

As a song with that same name says:
It takes an ocean of trust in the kingdom of rust...

So even if we paint a wall in the desert, and when we finish a car runs
fast and sand destroys the fine painting, there is no other thing to do
than to repaint the wall.

Given that we all have to ask by Alex, to continue with what he is doing,
as what he is doing is doing it with respect, and today this is precious.

Have a good afternoon,

p.s., i'm rather uneducated. But I started learn C in my 52 and I wrote
a libc. I believe that the standard should open some bits the horizons,
and be more open to higher abstractions, e.g.,

A copy/read/write/rm/rename file/dir (a good part of coreutils functionality)
can be part of the standard. C is about algorithms. If an algorithm works
once in C, it will work forever. If the C community consentrates to write
all the kind of algorithms with care and love) C will have a role. Otherwise
we should be prepared for the inevitable.
