Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237FD4D4881
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 19:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672160; cv=none; b=AG6eFm/uG7d2Br471m0PrbMblZfHr/6+ICrYyG1kyKDcDzbZIdDRsxRsjbgxY/oy60wIWvfzy+2bjf1vfBlFHItMGFou7tftZ5FhejAL98+en+fr5kzWqJOLYjJ42MUMe/w8bRQt5vM61N53szxQ/6s5HGrNm3SHLeQWAKEsW9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672160; c=relaxed/simple;
	bh=K2G3FYxpy+Ae/4Xqee8Itwi3S9zgV4yK+4DoXKeqo3U=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=upgwVeiVq/uKwjWq5jdUxv+1ldeTUsPT3Agm6bpbDuUG2qmUGQQphhKuRvPO4jXsBaCgELSnHkdMgj8MjqF8mZyxK7skGVIPFKkXTxiz8zOp2aOAa16WPvunlZEQWfB5N/Tfxqn3avqvNsLWH2nBqQ6nIrQw/WBnB44pSjbuSXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=dNyDt0fX; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="dNyDt0fX"
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1789672150; bh=K2G3FYxpy+Ae/4Xqee8Itwi3S9zgV4yK+4DoXKeqo3U=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=dNyDt0fXbQQcqHCF8BHlJqj8IP0kGkvR0LhyC03229/DM0alO/q1eBrUBDyXfjCXp
	 BstbtvMxwPcyYABNnQ+J8TZVEGJYKcVJ/W6TRgC96YUjMPWUNQP0C3FZ8Vq1CX5M+u
	 Bn6t8Gh+jCFe01rp6jyKGMsoIVKZ4TWaRRMUKyoF1ucX7LMIixVRcyU1fi0Ih0Zd7n
	 mGxd2S9qktnAc+B4vDliBnuXZm0vjSNaQGRzphN0uCyAirvIvZiq6j+vccP/EOsShv
	 Zj6MUKEvlIjFvxvFu0eKkkwfnOsjLbyMH1Er1z02CRbzQZQNS+sOrgwN9FDuvAXtYW
	 NuCYWvUU02tKA==
Date: Thu, 17 Sep 2026 19:08:44 +0000
Message-Id: <DLHTTJ9FETPL.27KU2F08VUTLP@memeware.net>
Cc: "linux-man" <linux-man@vger.kernel.org>
Subject: Re: ioperm(2): confusing terminology
From: "astian" <astian@memeware.net>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>, "Alejandro
 Colomar" <alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <aqvHRZ7DfbdG5XBt@devuan> <aqvVeSW_dHnYbwca@devuan>
 <20260917123845.valu5ro5zur23o56@illithid>
In-Reply-To: <20260917123845.valu5ro5zur23o56@illithid>

On 17 Sep 2026 07:38 -0500, G. Branden Robinson wrote:
> Hi Alex,
>
> At 2026-09-17T13:00:30+0200, Alejandro Colomar wrote:
>> > Date: 2026-09-17 07:04:37+0000
>> > From: astian <astian@memeware.net>
>> > On 14 Sep 2026 14:56 +0200, Alejandro Colomar wrote:
>> > [...]
>> > > One thing that is very important is that we use semantic newlines.
>> > > That discards .md and .rst, since they are meant to be written
>> > > with paragraphs as they'd be read by humans.
>> >
>> > Sorry, I didn't read groff_man fully, but I'm curious: what is the
>> > meaning of newlines in man that gets lost in those other formats?
>>
>> They have no meaning.
>
> I wouldn't go that far.
>
> Like TeX, *roff uses newlines, _in context_, to help it automatically
> decide where sentence boundaries are.
>
> Because the formatter, not the macro package, makes that decision, the
> rules are documented not in groff_man_(7), but roff(7) and groff's
> Texinfo manual.  If a person follows the "semantic newline" guidance
> from man-pages(7), they can worry less often about what the rules for
> automatic sentence boundary detection are.
>
> roff(7):
>
> Input conventions
>      Since a roff formatter fills text automatically, its experienced
>      users tend to avoid visual composition of text in input files: the
>      esthetic appeal of the formatted output is what matters.
>      Therefore, roff input should be arranged such that it is easy for
>      authors and maintainers to compose and develop the document,
>      understand the syntax of roff requests, macro calls, and
>      preprocessor languages used, and predict the behavior of the
>      formatter.  Several traditions have accrued in service of these
>      goals.
>
>      =E2=80=A2  Follow sentence endings in the input with newlines to eas=
e their
>         recognition.  It is frequently convenient to end text lines
>         after colons and semicolons as well, as these typically precede
>         independent clauses.  Consider doing so after commas; they often
>         occur in lists that become easy to scan when itemized by line,
>         or constitute supplements to the sentence that are added,
>         deleted, or updated to clarify it.  Parenthetical and quoted
>         phrases are also good candidates for placement on text lines by
>         themselves.

Thanks.

So, if I'm understanding this right, the newlines are semantic only
insofar as letting the formatter know that it should insert an
additional space if the character before the newline is a dot.  Right?

(PS: More or less:
https://www.gnu.org/software/groff/manual/groff.html.node/Sentences.html)

> Following this practice also helps keep document revisions from
> "bleeding" into unaltered adjacent sentences in a diff.  (I think it's
> worth studying why the Markdown/AsciiDoc/"plain text markup" communities
> have not independently re-created this practice.)

I don't find this surprising.  The whole point of those formats is that
they look nice enough and read smoothly enough in their source form
(insert small-letter caveats here).  If we start putting in line breaks
for the purpose of nicer diffs we soon lose the smoothness and get some
of the *roff-like hairiness ;).

Regarding the delimiting of sentences, it doesn't seem like the most
typical rendered outputs for those formats (HTML, PDF) cares about
putting the correct number of spaces after a dot ;).

And yet it turns out this exists:

  https://asciidoctor.org/docs/asciidoc-recommended-practices/

  One Sentence Per Line

  Don't wrap text at a fixed column width.  Instead, put each sentence
  on its own line, a technique called sentence per line.  This technique
  is similar to how you write and organize source code.  The result can
  be spectacular.

Kinda defeats the goal of having a nicely formatted source, but if one
were to consistently use that convention, then whatever program is used
to turn adoc into man already has the sentence problem solved at the
source, and whatever program is used to turn adoc into final
presentation format can know where a double-space sentence separator
needs to go, if so desired.
