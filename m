Received: from mail.eskimo.com (mail.eskimo.com [66.114.134.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C281FC7C5
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.114.134.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785678326; cv=none; b=TKVEe/H3fcUPD63W9DKP7vxkUW+jkMdWXbtgjpmUrzElV+hJ5meiwCgpPrJdYos1+uJEBomSn2oZdU6EXymyDeejByK/ia7TLZQxsAvKPtK6Y2k9lClJK8ePPv6FzvUoaHEPrgXRNWJyVjhcduN9Uj5aGojFUu1pSGpcEsrpfeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785678326; c=relaxed/simple;
	bh=1MZidjnf1mV5Hi8Up5lSD/nIvRFBsNDPVVlSjGeb83c=;
	h=From:Date:Message-ID:To:Subject:In-Reply-To:References:Cc; b=tJQDa9H2i+jvKj9zgeGu/no/b5zmxIn+wyXvGzz+N4vEyqSyOkWUWcgmu6+8il/UbRVRt22ElgWzuoEDX5aJ9BCqf4lgIQ3p00hkEyHR9oK49oSdVy7W3C4VdkolQ0duR1rMgZKn82aNWlzTiK870DTC5SjI89ds7wfLA7cGhX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eskimo.com; spf=pass smtp.mailfrom=eskimo.com; arc=none smtp.client-ip=66.114.134.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eskimo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eskimo.com
Received: from debian.eskimo.com (debian.eskimo.com [66.114.134.203])
	by mail.eskimo.com (Postfix) with ESMTPS id 8D0453D31D0;
	Sun,  2 Aug 2026 06:45:21 -0700 (PDT)
Received: by debian.eskimo.com (Postfix, from userid 10926)
	id D0E0F1400FB; Sun, 02 Aug 2026 06:45:19 -0700 (PDT)
From: scs@eskimo.com (Steve Summit)
Date: Sun, 02 Aug 2026 09:45:17 -0400
Message-ID: <2026Aug02.0945.scs.0002@tanqueray.home>
To: alx@kernel.org (Alejandro Colomar)
Subject: Re: on the irresponsibility of pursuing C language reform
In-Reply-To: <am8_MfPmud43naU-@devuan>
References: <87a4r6es6k.fsf@gentoo.org>
	<am3XeGZyi1Pvr77-@devuan>
	<87y0epdhxp.fsf@gentoo.org>
	<am4GT1OkqNZD9FF9@devuan>
	<87zez5bz49.fsf@gentoo.org>
	<am4jxBOh_VRvhCQw@devuan>
	<CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
	<am51v4KmUmdzM-OT@devuan>
	<am5_uA4MSujYCS9X@devuan>
	<2026Aug02.0852.scs.0001@tanqueray.home>
	<am8_MfPmud43naU-@devuan>
Cc: bug-gnulib@gnu.org, libc-alpha@sourceware.org, linux-man@vger.kernel.org, scs@eskimo.com
X-Virus-Scanned: clamav-milter 1.4.4 at mail.eskimo.com
X-Virus-Status: Clean
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>

Alejandro wrote:
>> Certainly, today, strncpy and strncat are the new gets.
>
> This is deeply incorrect.

That was a side point, but to clarify what I meant:

Once upon a time (and still today), it's a reasonable thing to say:

	Never use gets.  Don't worry if you don't understand the
	issue, don't worry if you heard someone say there's an
	obscure circumstance under which it might be useful,
	just don't ever use it; pretend it doesn't exist.

Today I think it's equally reasonable to say:

	Never use strncpy and strncat.  Don't worry if you don't
	understand the issue, don't worry if you heard someone
	say there's an obscure circumstance under which they
	might be useful, just don't ever use them; pretend they
	don't exist.

Though perhaps not strictly true, this is good advice, because it
will never lead the average programmer astray.

strncpy is not a "fine function", because nobody is using
(or should be using) fixed-width string buffers any more.
(See, I can be opinionated, too! :-) )

But we don't need to argue about this.  I said "strncpy and
strncat are the new gets" to concede a point, to agree that
discouraging the use of formerly-acceptable interfaces --
a point that I thought you, and certainly that various people,
were trying to make -- might be reasonable, even though it's one
I often find myself disagreeing with.  But that's an opinion I
decided to leave out of my previous message, and I'm not going to
go down that road here, either.
