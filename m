Received: from scc-mailout-kit-02-level5.scc.kit.edu (scc-mailout-kit-02-level5.scc.kit.edu [129.13.231.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4433F2836A6
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.13.231.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788003998; cv=none; b=OG4iY0eX5YRs49cQGAvk4YBXrn5I+bZSo0SLn5fuMn9VMgeEzsoQLnxgJb2voT964G382tKTvlH6EgyaAO9oeH4n5Jv9FA7Q6fWhui5yw1DpP6pENw9eNnihzQcMJH9QyxXQ474mFhRG7/9gL08LFpQ0yP3NBHklf8D7ypWUOsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788003998; c=relaxed/simple;
	bh=YS/Vht9xP3V/UhIlnK8+/8n8oP3hyO9XDGPe3cO+ECg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwjgksVdVLD+IcxGdgINVDZ8fS7lGmzmMNPZw5AWu7G+wawit0MlSLXltodFccAeYZ/LZBRWTmqc6qxykdEQyTHA3ZAPBTqYE8CLzQOE700ZbHjdHuqH/pUkL/6LBfp6lEPWxMeVg1wSleRmiyrKwynOWKXQQtStl4/4paeVYuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=usta.de; spf=pass smtp.mailfrom=usta.de; arc=none smtp.client-ip=129.13.231.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=usta.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usta.de
Received: from hekate.asta.kit.edu ([2a00:1398:5:f401::77])
	by scc-mailout-kit-02.scc.kit.edu with esmtps (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(envelope-from <schwarze@usta.de>)
	id 1x0HKr-00000008OUN-1Vox;
	Sat, 29 Aug 2026 13:34:58 +0200
Received: from imap-2.asta.kit.edu ([2a00:1398:5:f400::36])
	by hekate.asta.kit.edu with esmtp (Exim 4.98.2)
	(envelope-from <schwarze@usta.de>)
	id 1x0HKq-00000000F4U-462e;
	Sat, 29 Aug 2026 13:34:57 +0200
Received: from isnote.usta.de ([84.177.233.30])
	by imap-2.asta.kit.edu with ESMTPSA
	id CL9rEOHDkmr6GigA4A1LTA
	(envelope-from <schwarze@usta.de>); Sat, 29 Aug 2026 13:34:57 +0200
Date: Sat, 29 Aug 2026 13:34:55 +0200
From: Ingo Schwarze <schwarze@usta.de>
To: g.branden.robinson@gmail.com
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	groff@gnu.org
Subject: Re: Using LS/LE
Message-ID: <apLD35LsoOqX6fK1@isnote.usta.de>
References: <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <aot0q9iCIXOJf8Kk@isnote.usta.de>
 <20260829043615.vuh3idp3a7if4vnm@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260829043615.vuh3idp3a7if4vnm@illithid>

Hi Branden,

G. Branden Robinson wrote on Fri, Aug 28, 2026 at 11:36:15PM -0500:
> At 2026-08-24T00:31:07+0200, Ingo Schwarze wrote:

>> I don't yet understand what the point of .LS is

> I have articulated clearly several specific points about it.  I
> initially had the idea for LS/LE as early as December 2022.
> 
> https://lists.gnu.org/archive/html/groff/2022-12/msg00075.html
> 
> At that time, I got no feedback on my proposal,

If i remember correctly, i read that message as "i don't have clear
goals, i don't have clear plans, and i don't see much need",
so i saw no need to respond.

> which I interpreted as indifference.
> That's the usual fate of my proposals.  ;-)

Well, sometimes some people (including myself) do consider your proposals.  :)

> For example:
> https://lists.gnu.org/archive/html/groff/2026-07/msg00096.html

I missed that one, i wasn't around much in July.
Not sure whether that's needed from a general-purpose typesetting
perspective, i would have to think about that.

For manual pages, that .ref proposal sounds like massive overengineering.
It's simply not needed because almost all such information can be
derived directly from the semantic manual page macros - and that's
not theoretical speculation, mandoc(1) contains a mature implementation
that is several years old by now.  While mdoc(7) in mandoc does provide
the .Tg macro, it is very rarely needed: currently, there are 214
instances of .Tg in OpenBSD /usr/share/man/, even though that directory
contains 4635 manual pages, that's one instance in over 20 manual pages
on average.  Only 9 out of 4635 manualpages use the .Tg macro at all,
which is less than two permille.

> Earlier this year, after list nesting caused Alex pain again,

Oh yes, that is true.  The man(7) language doesn't really support
nested lists well.

> and having gotten more familiar with the bash(1) man page source,
> I consulted with Alex, Pádraig Brady (GNU coreutils),
> Stephen Gildea (help2man), and Chet Ramey (GNU Bash) regarding
> its interface, semantics, and goals.

>> - in my experience, assembling items from .IP and .TP blocks to form
>> lists is *not* among the problems the man(7) language causes - quite
>> to the contrary,

> Assembling a list is not difficult.   Exercising control over
> indentation and inter-paragraph spacing (even just to turn it on and
> shut it off) as they apply to the items of lists, especially when
> nested, can get quite tedious.

Again, that is true.

The mandoc(1) -T man output mode uses .RS at the beginning and .RE
at the end of each list to set up the indentation, and in nested
lists, it uses .RS after the end of an inner list to get back to
the indentation of the outer list.  It uses .PD 0 whenever
following paragraph(s) want no leading vertical space and .PD with
no arguments whenever following paragraphs want normal vertical
spacing again.

That being tedious is a direct consequence of man(7) being more of
a presentational than semantic language.

>> even though HTML is a strongly structural and semantic language,
>> assembling even HTML code from .IP and .TP is a almost never a
>> problem, and i don't see which other target format could possibly
>> be harder to handle than HTML.

> I don't disagree there.  To get groff man(7) to generate <ol>, <ul>, and
> <dl> elements as desired, I'm going to have to make

Well, mandoc -man -T html already generates (see man_html.c) <dl>
or <ul> from .IP and .TP, since 2019:

  date: 2019/03/02 16:29:49;  author: schwarze;  lines: +68 -16
  Represent multiple subsequent .IP blocks having a consistent
  head argument of *, \-, or \(bu as <ul> rather than as <dl>,
  using a bit of heuristics.

  Basic idea suggested by Dagfinn Ilmari Mannsaker <ilmari at github>
  in https://github.com/Debian/debiman/issues/67 and independently by
  <Pali dot Rohar at gmail dot com> on <discuss at mandoc dot bsd dot lv>.

> other revisions to
> grohtml(1) first, because it insists on using HTML tables to mock up
> indentation.[1]  I don't want that.  So unfortunately I don't expect
> that improvement to element tagging in HTML output in groff 1.25, though
> I hope to get that done for 1.26.  (All the other features of LS/LE are,
> and Alex just this week helped ensure that some bugs in it got stomped.)
> 
> That's not really HTML's fault, but arises from groff's long tradition
> of swinging a Mario mallet to force its stream-based paradigmatic
> processing peg into HTML's block-structured hole.

>> I would probably have to read up on prior discussions, but the topic
>> feels unrelated and i won't mix it into this mail.

> groff's documentation attempts to motivate the macros' presence.
> 
> groff_man(7):
>    List enclosure macros
>      Enclose paragraphing macros between LS and LE to identify them as
>      list items.  Doing so can mark them as "compact", ease management
>      of their indentation, and supply hints to the output driver to
>      improve their rendering (as with HTML).  Lists can be nested.
>      (Sub)sectioning macro calls, and the end of the document, close all
>      open lists.

Do you recommend closing open lists before ending the section,
or do you recommend dropping the .LE if it happens to be at the end
of a section?  This sentence sounds like the latter.

I would probably strongly recommend the former and have the macro set
warn about missing .LE because many years of experience show that
forgotten list end macros are a widespread oversight among manual page
authors, often causing the list to run further than intended.
For that reason, having the warning about missing .LE seems
important.

>      These macros are GNU extensions.

Using these macros is probably less disruptive than using .MR,
because lack of support in the formatter will only ruin spacing
and indentation but not corrupt the text.  Considering that the
benefit of .LS/.LE is relatively minor, it was indeed important
to choose such a conservative design.

>      .LS type [compactness [indentation]]

What is the logical reason for requiring that, to specify the
indentation, you also need to specify the compactness?

>             (since groff 1.25) Start (or open) a list.  type is one of
>             "definition", "enumerated", or "itemized".  compactness is a
>             Boolean value directing suppression of inter-paragraph
>             spacing between list items.

That sounds very confusing.  Does "Boolean" mean: either the string "0"
or the string "1"?  Or what would "true" or "false" mean?
Then, "Boolean value directing suppression" sounds vaguely as if "1"
might mean "suppress", but that's not expressed unambiguously.

Finally, why only *between* list items?  Why not *before each*
list item?  Would suppressing the vertical spacing before the first
list item still require .PD 0 *in addition* to "compact"?

>             indentation specifies an
>             indentation amount for the body of each list item; it is
>             then unnecessary to specify this argument to the list item
>             macros.

That sounds as if the syntax of "indentation" is probably the same
as for the .IP and .TP "width" argument, but that is not clearly
stated.  So, what is the syntax?

>             Use IP with a mark argument to represent an
>             itemized or enumerated list item, and TP for a definition
>             list item.  Use IP without arguments to associate
>             successive paragraphs with an existing list item; to these,
>             inter-paragraph spacing applies even in compact lists.

Not sure the phrase staring with "to these" should be advertised
so prominently.  *If* an author chooses to make a list "compact"
but then kind of contradicts themselves by inserting paragraph
breaks into individual list items, the behaviour you describe is
probably what the formatter should do.

But authors ought to be strongly discouraged from doing that.
When one or more items of your list are so complicated that they
require more than one paragraph of text, making your list "compact"
makes no sense in the first place and will result in ugly and
confusing typography.


To summarize, after reviewing the design of .LS/.LE, my first
impression is that it is likely a small-value, small-harm
addition.  I think i will support them in mandoc(1) -man when
i find the time, but not emit them from mandoc(1) -T man, at least
not for many years to come, because the whole point of that output
mode is dealing with operating systems that use ancient
manual page formatters, and those are unlikely to support .LS/.LE.

Chances are the the deeper scrutiny that will be necessary to
implement .LS/.LE in mandoc(1) may lead to additional criticism;
or if we are lucky, it may not.

Yours,
  Ingo
