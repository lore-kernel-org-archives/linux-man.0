Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F3654705D
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 19:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672201; cv=none; b=mSv95sMvm+b8eLR8RuHMJIyhUbjAEDf6wIBT49rW5qxbtRQ15CLNcb5onSFzuBTeI8mdUEjmQWyt05pqAE0OHkK8rXqBV9p+BtcXiKYXGScxxxy651seib2HoWEplFB59CfpNE91yEWprmzExBTZjk9fP8iDxGO8PwnvSQJlxgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672201; c=relaxed/simple;
	bh=g3rY1vr8t5RebbgondbjAsmT65Pu8OqKLJ6FpfD7N/U=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 References:In-Reply-To; b=LEWnZYpRTKcshV2g/tJAuDVhTc4o1CgDIKDb9WK46E2dFejmIKHc8Rx2ed4z/Hao7WSnpP8FFMf5LzWhke9eadqEtL0yEZdVIHrqKNfHl00jorKr9cGedbZdE2c08WnOvhnWI7r1tFx9a7NkEHJPqImvX5puiTzCZSpC/+UbJME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=N3rJAufp; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="N3rJAufp"
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1789672193; bh=g3rY1vr8t5RebbgondbjAsmT65Pu8OqKLJ6FpfD7N/U=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=N3rJAufpvMYQ06UcFbqIruxkyq7nY2zR6U/xBfTWR7OLj6JQbxmiRZBdXtOX6lNFh
	 VyQ1kzOgVeZa0GnQq+YM1S1OAJyjdWAZeYMImdv/w4L8CZs3akjAz+d3Sm8sDOqtAW
	 hlomdrOl5GTWmG51NQeiX4+VqHGpCgSwZaPInnAe/nWFecoRFD9vBWOEb4MZD3CQol
	 AEVxyrZs8NJDMAineyOt0TLZPkEZHSZF61KKX9Tu0eno9i9JqEILb1H3vEt5jwKs9N
	 iVUEhzWGcFpzrlg/Kgi8It4zWBFa2FYS+99rpeLio8floH6Y2MkEOdTJ3OYv+32I4O
	 +2rL30mz+uAIA==
Date: Thu, 17 Sep 2026 19:09:41 +0000
Message-Id: <DLHTUAUL26OP.JKIAQT055DTD@memeware.net>
To: "Alejandro Colomar" <alx@kernel.org>, "G. Branden Robinson"
 <g.branden.robinson@gmail.com>
Cc: "linux-man" <linux-man@vger.kernel.org>
Subject: Re: ioperm(2): confusing terminology
From: "astian" <astian@memeware.net>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
 <aqXOgqne-v4GtglY@devuan> <DLDZ6A0QS5NY.E0Y1TPNME1IN@memeware.net>
 <aqfsMbQWdqq_TG_b@devuan> <DLHEF3KZF52V.2PBZHFYF7KPYO@memeware.net>
 <aqvHRZ7DfbdG5XBt@devuan>
In-Reply-To: <aqvHRZ7DfbdG5XBt@devuan>

On 17 Sep 2026 13:00 +0200, Alejandro Colomar wrote:
[...]
>> >> Which bring up the question, why not moving to a less hairy source
>> >> format?
>> >
>> > This question comes up every now and then.  TL;DR: other formats are
>> > worse.
>> >
>> > man(7) is pretty simple, and easy to learn exactly by editing words
>> > blindly.  There are very few macros, and their behavior is trivial onc=
e
>> > you use them a few times.
>> >
>> > One thing that is very important is that we use semantic newlines.
>> > That discards .md and .rst, since they are meant to be written with
>> > paragraphs as they'd be read by humans.
>>=20
>> Sorry, I didn't read groff_man fully, but I'm curious: what is the
>> meaning of newlines in man that gets lost in those other formats?
>
> They have no meaning.
>
>> Looking at some source pages now and it seems most newlines are about as
>> (non) meaningful as in those formats (i.e., the paragraph is reflowed
>> during rendering).
>
> I don't know how you read .md or .rst, but I read them in the terminal,
> usually with less(1), which doesn't reflow them.

But you read the rendered manpage, the output of running groff (and co.)
on the manpage source, right?  If you were to read manpage sources with
less in the terminal there wouldn't be reflowing either, naturally.

The point I was making is that newlines in groff_man pages did not seem
to be more semantic than those in adoc/md/rst/whatever.  Upon rendering,
paragraph lines are reflowed.  After Robinson's explanation I can see 1
bit of meaning to them (sentence delimiters).

> Is there any program for reading these in the terminal reflowed?

I guess there are although I don't personally use one (of course, that's
the point of these "light markup" formats: they mostly look like plain
text so you don't much need a renderer).  For example, there are plenty
of tools to convert these formats to HTML which can then be viewed in a
terminal browser.  Or one could use pandoc to convert them to *roff
and... haha ;).
