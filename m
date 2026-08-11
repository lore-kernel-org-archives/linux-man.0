Received: from snips.stderr.spb.ru (snips.stderr.spb.ru [212.113.105.144])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92BE42D75E
	for <linux-man@vger.kernel.org>; Tue, 11 Aug 2026 11:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.113.105.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786449127; cv=none; b=c9Dv5UZgx1xrGVdyUxn+39zgiCAXzMObfX49XqFOH+HVVULUzvUXlvwk41wKDqXMvZorYjJcilryc0g5R+P0R4gSoiTkCUdx4KJUqpg/NXAL8ag7Ue0KUkDpFVzAZ6bqdatYb6+Mp2+9SUAJFdVqyfl5M38jeG5lO1b796lft8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786449127; c=relaxed/simple;
	bh=PTC3IiqCXKRxhzZxRj8/KMNk5bammbXOPg84w0GdTXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtPc1xxcJ6llQ4l7fm79K1N3UonbVl/0mSC1uk30oOPOHoT+rNFw6cBfHKmm6wVaTaiZDRkCrzwqoa4bw1nAz7GGI8UC1GaBKGy4oApNZPHOW0FVfb6XYyy5H+cnfgIHJYdKFvnM7WNtnSpkgVZMw+DQ1UHGVSdBsel7Luu8Neo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stderr.spb.ru; spf=pass smtp.mailfrom=stderr.spb.ru; arc=none smtp.client-ip=212.113.105.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stderr.spb.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stderr.spb.ru
Received: by snips.stderr.spb.ru (Postfix, from userid 1000)
	id E2FDC488538; Tue, 11 Aug 2026 14:43:56 +0300 (MSK)
Date: Tue, 11 Aug 2026 14:43:56 +0300
From: Valery Ushakov <uwe@stderr.spb.ru>
To: Ingo Schwarze <schwarze@usta.de>
Cc: Robert Elz <kre@munnari.OZ.AU>,
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, enh@google.com,
	"G. Branden Robinson" <g.branden.robinson@gmail.com>,
	Alejandro Colomar <alx@kernel.org>,
	Collin Funk <collin.funk1@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
	bug-gnulib@gnu.org, libc-alpha@sourceware.org, groff@gnu.org
Subject: Re: on project management
Message-ID: <ansK_CbsT9JFaOrS@snips.stderr.spb.ru>
References: <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <20260803160902.5edjmpxaqr5uudbu@illithid>
 <CAJgzZorzA1f+KNAj0m56nXxoKywY_pCj2pX3Rg-CgP1P8TnZuA@mail.gmail.com>
 <86a4r2oqqz.fsf@aarsen.me>
 <annM6oGYVgXByI5i@isnote.usta.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <annM6oGYVgXByI5i@isnote.usta.de>

[cc'ing kre@ for the first hand information]

On Mon, Aug 10, 2026 at 15:06:50 +0200, Ingo Schwarze wrote:

> Arsen Arsenovic wrote on Mon, Aug 03, 2026 at 11:09:40PM +0200:
> > enh <enh@google.com> writes:
> 
> >> the crazy part is that it was an _empty_ file until i made it just
> >> #include <string.h>:
> >> https://android-review.googlesource.com/c/platform/bionic/+/52171
> >>
> >> i can't explain that (it was originally checked in as an empty file,
> >> so the history is no help).
> >>
> >> i _can_ explain why i made it match glibc rather than just deleting it
> >> though: i didn't want to break existing code that was [harmlessly]
> >> including an empty file, and i wanted to increase the amount of the
> >> code from other libcs that would "just work". (and note that ios/macos
> >> have a <memory.h> that's just a #include <string.h> too.)
> 
> > I think this partially confirms my suspicion earlier, that the only
> > reason anyone ever included <memory.h> is because on some system stuff
> > they wanted was not in <string.h> (but was only in the latter on some).
> > So the former tends to be included only when the latter is also, to
> > cover both cases.
> 
> I think i can improve this understanding by providing some historical
> facts.  While <memory.h> almost certainly did not originate in BSD,
> BSD history can still provide some hints how it came to be.
> 
> The earliest instance of <memory.h> i'm able to find in my private
> archives of free historical source code archives is this
> file include/memory.h from 4.3 BSD:
> 
>   /*
>    * Copyright (c) 1985 Regents of the University of California.
>    * All rights reserved.  The Berkeley software License Agreement
>    * specifies the terms and conditions for redistribution.
>    *
>    *      @(#)memory.h    5.1 (Berkeley) 85/08/05
>    */
> 
>   /*
>    * Definitions of the Sys5 compat memory manipulation routines
>    */
> 
>   extern char *memccpy();
>   extern char *memchr();
>   extern int memcmp();
>   extern char *memcpy();
>   extern char *memset();
...
> This comment appears to claim that <memory.h> along with these five
> functions came from AT&T System V UNIX, almost half a decade before
> ANSI C 89 standardized them to live in <string.h>.
> 
> While, as others observed, many systems still contain <memory.h>
> as a thin compatibility wrapper around <string.h>, having it doesn't
> seem particularly important at this point.  Who wants to really
> maintain compatibility with System V based systems that are about
> 35 to 40 years old and significantly predate ANSI C?
> 
> That said, i believe the reason most systems did not outright
> delete <memory.h> is that i fail to see an easy argument what
> benefit exactly that might provide, apart from general cleanliness.

ISTR (from the very early 90s) that memory.h was indeed the SysV
thing.  This was before autotools, so e.g. GNU programs shipped with a
bunch of config.h files in a subdirectory and you had to choose the
right one.  Our SysV was a weird cross-over that didn't quite match
anything, so that was ... a very valuable learning experience.

BSD and derivatives were still using <strings.h> at the time and
<string.h> and <memory.h> were a SysV thing.  When things settled in
favor of <string.h> that subsumed mem* functions, <memory.h> became
redundant, but for the sake of old programs it was logical to make it
just forward to <string.h>.

-uwe
