Received: from mail.eskimo.com (mail.eskimo.com [66.114.134.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B89489865
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.114.134.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785675286; cv=none; b=u6u6AgK7WWQEZzch1HLlFyj3hTnAnirdHVsCLnx+XM7YJbSKapQ2mXjZV6VRj/o9mtoNjDrLsoywyKkkLxIXkALMMeBHdomJmLbAmJDyAPunkdSRtJy8/+qYiPOuYfAWATsFgk4kDChjO4NVbH3V2xHzOMGN9UBsNtU6FwPlXpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785675286; c=relaxed/simple;
	bh=eQT3L97pX6eXNEqh6kpidNppkm2TDN6I9B1NBuqq0LQ=;
	h=From:Date:Message-ID:To:Subject:In-Reply-To:References; b=t/FpAE+Q6P0BaeaJYmOBZYiYAZEUAoUSUNmNBpu8lUnF6oEUsA1N/LCAmKvVvlJpMYeldCJ9IW3DjfuvdqlO5ZA6xB6ZA15/uvE37d83duFtDnyiPD2iaRWcui7J/WYC0w1gHOvP6vND56RCQhkpKm7ML9CfYOB1uD7IWyEO68k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eskimo.com; spf=pass smtp.mailfrom=eskimo.com; arc=none smtp.client-ip=66.114.134.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eskimo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eskimo.com
Received: from debian.eskimo.com (debian.eskimo.com [IPv6:2001:560:4407:1::109])
	by mail.eskimo.com (Postfix) with ESMTPS id 9A4DE3D31CD;
	Sun,  2 Aug 2026 05:52:07 -0700 (PDT)
Received: by debian.eskimo.com (Postfix, from userid 10926)
	id CA9201400FB; Sun, 02 Aug 2026 05:52:06 -0700 (PDT)
From: scs@eskimo.com (Steve Summit)
Date: Sun, 02 Aug 2026 08:52:04 -0400
Message-ID: <2026Aug02.0852.scs.0001@tanqueray.home>
To: bug-gnulib@gnu.org, libc-alpha@sourceware.org, linux-man@vger.kernel.org
Subject: Re: on the irresponsibility of pursuing C language reform
In-Reply-To: <am5_uA4MSujYCS9X@devuan>
References: <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
	<20260731215122.4p4aepsbgeoibx74@illithid>
	<87a4r6es6k.fsf@gentoo.org>
	<am3XeGZyi1Pvr77-@devuan>
	<87y0epdhxp.fsf@gentoo.org>
	<am4GT1OkqNZD9FF9@devuan>
	<87zez5bz49.fsf@gentoo.org>
	<am4jxBOh_VRvhCQw@devuan>
	<CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
	<am51v4KmUmdzM-OT@devuan>
	<am5_uA4MSujYCS9X@devuan>
X-Virus-Scanned: clamav-milter 1.4.4 at mail.eskimo.com
X-Virus-Status: Clean
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>

I'm just a lurker, but let me offer my perspective on this.

Header files in C and C++ are in large part a nuisance and a
historical relic.  If I call function x, I must include header
<y.h>.  The mapping between x and y is partly sensible, but
partly arbitrary.

Since I program in C and/or C++ every day, I can usually remember
that mapping, but when I can't, I immediately check the man page,
and I'm glad that (unlike in the old days) the Synopsis section
always reminds me which header to include.

Although I said header files are a nuisance, in one key respect
they're less of a nuisance than they used to be, because *the C
and C++ standards standardize them*.  This is a huge, huge win.
Back in the day you never knew if you could or should use
reasonable-looking headers like <memory.h> or <malloc.h>.  But
today, it's a no-brainer.  There's one right answer.  If I use
the Standard header in my code, and my code fails to compile
under some brain-dead compiler tomorrow, it's that compiler's
fault, not mine.  I don't care a bit whether the Standard's
mappings do or don't make sense; the fact that they're standard
trumps anything else.

Now, this is one man's perspective, and I concede that I'm not
an average C or C++ programmer, either.  Me, I could check the
Standard, because I have PDF copies of every version of the C
Standard right here on my laptop, but for this sort of question I
typically don't, because typing "man memset" is so much quicker.
I don't know what the average programmer does, but I would
heartily advocate for a high-quality man page to give the Right
answer, where the Right answer for standard functions is
precisely what the Standard says.

Now, there are always interesting arguments to be had about which
of the library functions still hold their weight today, which of
them might be deprecated or replaced with something newer, and
how to educate users about evolving best practices.  Certainly,
today, strncpy and strncat are the new gets.  (As it happens,
I've been spending real time just in the past few weeks coping
with the fact that not every Linux C compiler I use ships with
a glibc that supports strlcpy and strlcat.)

But with that said, the place for those "interesting arguments"
is not a man page!  Man pages are supposed to be maximally
pithy.  Just the facts, ma'am.

Finally, I really don't think that the the mapping between
function x and header <y.h>, a mapping which I characterized as
somewhat arbitrary, is something that the average programmer pays
that much attention to.  If strncpy or memset is to be found in
a header called <string.h>, that doesn't tell us that these
functions operate on strings, any more than ssprintf appearing in
<stdio.h> implies that ssprintf does I/O.  So let's put the
arguing, and the opinionating, and the educating, somewhere else,
and have the man pages document (nay, recommend) precisely the
headers that the Standard(s) say are standard.

Steve Summit
