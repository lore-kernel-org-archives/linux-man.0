Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7492F83B5
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 19:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786375; cv=pass; b=IcADByzAJs89j3oPW9+2ZAEAIFXk5B0wn9v8WlAkFkUb8M/JI5lm9Bf3P9S7qeCKwWDDgpKMX9e999l1HR63ofoC2wlL0N0+TkwCy03RGHWzzlDOUMiaecjrw3JmI9VP7nDG277AJJxW54VBAulAVbIsuhJt6pZpsSWTIrzVcTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786375; c=relaxed/simple;
	bh=z2xAz9i51UJmbPY+jqT7b0DY32f/QufDtzvA8ughxDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJu/ks/an4epU+Fc/dpHUulzLveQiCS6YXhlKfzr+W+WPdkUECX55HhcJr0hYlO0xWf+R5ln9aXJMpApyU1ZP24kk34Kfoikx2Pimtm2iYm/o0/VNQ2nf7ljscHZ6+1ngye45yOWXq+nz4XLcEvLVqrsh3LfqSXPRLNv1t0vHnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=as56qLlD; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="as56qLlD"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6aae90e595fso1664821eaf.1
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 12:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785786373; cv=none;
        d=google.com; s=arc-20260327;
        b=RQsxQIbQg8t49uKlcOZOIqLjSFHF78EuiCNebJcNhx2+H7ge/d76bV6Q80OYyvnW25
         VFtQSHeIqAFQx8Mb2sXARzqVffOf/Q5LM4DqQtlKGNnIYbXqAODQ2fUtmuRqVp6SExp6
         /XRUnLDLrcjh7B/7AoixcgfP9ZQH03f21yaHBdNXJNbRPXjUPCNQbnSJqoerwwpbi1K3
         WRVBdDl9QG/CX7Z7eTA6Yx3K0jBc84T3EPlE47jvUJuYHK8/GkBY8OUpG5aKfCIgM236
         lTDCo5Fvi6JRlUHc9CcBI0StuuQUN9HLQeNOC5/t8djHZ7ogUxVytXwybdlkIdEliD3b
         bG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LyE6L1DAweWUzSqLK9sCh0jfOtiqtL8K+XO8UgPCi5M=;
        fh=lLuQzFsrl3QmzRNFjzt/68om1j8O6E0QGYT2YRBu7Ag=;
        b=ocooLjAb/ZvMIyGvIBobX7wSjyjf+Mevyp7CoiusCipnU7OmajPLUG2c2Gz7Vh8+m8
         2qS7MTGYQ8HSBcqviivTK9K2nbEck/ypftHrQ//rY5hqMhKB8lIbI+0POVsZNS/ZMTkj
         SIsSv9S18ntZsQ+8WGiSb3zTBMrHBrvQHwgNWafPIWy1ovwgNrXeS/nwcOI/qOgHoc2j
         Q1OUBz69W3YDkDwncfM7k7R4qTYiRSmXPPOkNcNb+HxheBL7otIfOptimlScBYUchedd
         x5wXXg7lObK1lPPsk7YFaCLK5vjQFsy4UnDZ2Ubzq5+w+Npun9ItJXl+8q0602WlXgS8
         OhUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785786373; x=1786391173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LyE6L1DAweWUzSqLK9sCh0jfOtiqtL8K+XO8UgPCi5M=;
        b=as56qLlDq8zb9IEUjomMcLJ94gf2GODdSE8ntmfO3cGo8SsSzDugbcyt2CIZqrATXU
         9j6//lABFoqIJod824oBLO1Hp6hnCZJ52OIvnRUQAy66qRP2MKKvG4ni3aJFOoz37Ylj
         7Je/rSalKFF/3SLhnWpqxU2I12ldAljHOaBgMEymr+kQDbCy2/iF8SP3sYX8RBfe/xer
         s/ycqYHnN5AUWWz4Cs2IyFYVFkYzzejaL2HrEnED+gSHyGohnoVSgsmHKYP2i29tZEbb
         4PSQpMhAPVcUqdswE5IwtndKMgcNxRkOqVEVwIMiK+j6qU2n9SD7xDiPYDQal68tapp6
         t1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785786373; x=1786391173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LyE6L1DAweWUzSqLK9sCh0jfOtiqtL8K+XO8UgPCi5M=;
        b=llp1Wp+aWDLt/TKYXmmyV3N8FJ45rzVvuorkqUevswETmWCYymBNExCXpz03YI3Ul0
         r5gXKedn0RxFrVZlWJpjd2UXZnAfRghFgf+X7JFTDhxSM7rhYzc1NwVP17jvaGYLHbpk
         eMXlogt4vEx15xVebTHpRHhUL5TVYp6QD3hAdCvJOVfB6C3FQL2jZypJaaM0vI5weJwt
         sBDugrG/Pb99NzgjxuFFY/6YuccEmD01SRXT984r0hsd94A9LQE/ckRgOFcTplNYi2nr
         9tXyG4aZRknIkhPS9JVqsqpJ24dpAJTnrrPg7tLIIJY1jASau49WNTEEIt2g8nSQOjwb
         N44g==
X-Forwarded-Encrypted: i=1; AHgh+Rp9Y1FbJZnCGkErvc6l/zRXH2/wMjDrdp2yvFgU1D1JwbkcH8k2L04/i+Pxlu9KevwC5rOvB39ex8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG2YmdS8vOq2W8sjEP4iXFLkSXYrhrDYRaDHsUTo9Wr+tHfUBc
	MgNPqSypt7P73zDhjem1inBErorcNNg+rB8Bv7dooLnrzqm5eCgsFdUSkWm6kGta/RpefNRPKun
	4DQNsTgBo37hbKgvY9Zqs+Kl6D88HG0QqcNvivpTt
X-Gm-Gg: AR+sD13CRuKnz8GE80wTrKU2laEBxK0xIiRKBKt0L+CtZWawccMUZVRVN+JX1nD5qGM
	7pdSvVOmhVxtK3RUXUzg05flNM8fAHvOtZ2acjPh8BVBjy7C4QGwNwL4bdiZIBQfAApehhVkatK
	ILmwoiEJbpf4/OViu9IjxvBZ212Wvtct0sjt7OTpTB+T9kaFhLCusZResWRjucC3hc8v+P8aCPY
	C1RMDSmkACst36C3GOA8GFUwbopd9ERB67OmCB1Diki0C23OCW4l+Xv9lWlTuH7tmegzumD8TA5
	kd9JXCoSOD2SR8joy3UQZpmSfFCjbGd1b05W+0IF4MvI6oy9ynvpaw==
X-Received: by 2002:a05:6820:4dc4:b0:69e:b8:ffe4 with SMTP id
 006d021491bc7-6ae433bd1bemr16401563eaf.32.1785786372062; Mon, 03 Aug 2026
 12:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802000833.zpu27l7ibvrbouna@illithid> <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com> <am6X32HkGdm2xTd7@devuan> <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me> <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com> <am_TTjDLlAI68zkp@devuan> <20260803160902.5edjmpxaqr5uudbu@illithid>
In-Reply-To: <20260803160902.5edjmpxaqr5uudbu@illithid>
From: enh <enh@google.com>
Date: Mon, 3 Aug 2026 15:46:00 -0400
X-Gm-Features: AUfX_mwb-3cGpwXG6AZ8tM7kUuSfYsHShmo23Lu9-XJYLZTugP0t4JHqxnSQdoQ
Message-ID: <CAJgzZorzA1f+KNAj0m56nXxoKywY_pCj2pX3Rg-CgP1P8TnZuA@mail.gmail.com>
Subject: Re: on project management (was: the Linux man-pages as an educational tool)
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, Collin Funk <collin.funk1@gmail.com>, 
	=?UTF-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org, groff@gnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 12:09=E2=80=AFPM G. Branden Robinson
<g.branden.robinson@gmail.com> wrote:
>
> [looping in groff list because toward the end of this mail I present
> some philosophy that I have applied to my work on that project]
>
> Hi Alex,
>
> At 2026-08-03T01:37:26+0200, Alejandro Colomar wrote:
> > > Date: 2026-08-02 16:27:21-0700
> > > From: Collin Funk <collin.funk1@gmail.com>
> > > I can't help but wonder of what happens in WG 14 rejects this
> > > controversial, as obvious by this thread, change. Will the man-pages
> > > changes be reverted? Or will we slowly watch them document personal
> > > preferences instead of existing standards?
> >
> > This patch set is quite independent of the standard.  It documents a
> > header file that has been provided since forever in glibc and most
> > other POSIX-ish systems,
>
> Just yesterday while watching an ncurses build scroll by on my tablet, I
> had occasion to notice that Bionic libc provides a "memory.h" header.
> Curious, I checked it out.
>
> It's a thin wrapper for <string.h>.

the crazy part is that it was an _empty_ file until i made it just
#include <string.h>:
https://android-review.googlesource.com/c/platform/bionic/+/52171

i can't explain that (it was originally checked in as an empty file,
so the history is no help).

i _can_ explain why i made it match glibc rather than just deleting it
though: i didn't want to break existing code that was [harmlessly]
including an empty file, and i wanted to increase the amount of the
code from other libcs that would "just work". (and note that ios/macos
have a <memory.h> that's just a #include <string.h> too.)

> I endorse your reformist attitude because every technological success
> story begins ossifying as soon as its market position can be milked for
> economic rent.  As the old Demotivator poster said of consulting: "If
> you're not a part of the solution, there's good money to be made in
> prolonging the problem."[1]
>
> Thus trigraphs.  Thus K&R function declarations.  Thus "wastebasket
> taxon" header files.
>
> > so changes to the standard are unlikely to have any effects.  I've
> > clarified this extensively.  If you want to discourage me from
> > applying the change, you should rather bring up technical reasons.
>
> I don't think Collin's totally off base.
>
> What is the overall mission of the Linux man-pages project as you
> conceive it?
>
> Take some time to draft one, if you haven't already and I missed it.
> Here are some points you might consider.
>
> *  Is delivery of factual information more or less important than
>    advocacy of correct methods and accepted idioms?
>
> *  If the foregoing are equally important, are you _sure_ they need to
>    be?  Can you escape dilemmas that frustrate day-to-day stewardship
>    work by favoring one over the other?
>
> *  If you maintain that the two are equally important, nevertheless, how
>    do you resolve conflict?  Disclose the principles you employ to
>    decide such issues, and write them down where people can find them.
>    That way they can better understand why you reason the way you do,
>    and you bind yourself to those principles, so that you and others are
>    less seduced by the urge to "shift the goalposts" in a dispute.
>
> > This passive-aggressive message is not something that will have the
> > desired effects you could possibly reach with technical arguments.
>
> I'd say less that it was a passive-aggressive message than that it was a
> deployment of a slippery-slope argument.  Fallaciously?  I don't know.
>
> But it is also true that people are pushing back on your proposals
> regarding re=C3=ABnvisioning of libc's memory buffer and string APIs from=
 two
> fronts.  Only one is technical.  The other is managerial.
>
> As a maintainer, your role is to serve your community.  This is a
> privilege and a responsibility.  Generally, one is accepted in that role
> because one has demonstrated a high level of expertise and sufficient
> resources to carry out the tasks the role requires.
>
> Someone earlier in the thread made reference to the personage of past
> glibc maintainer Ulrich Drepper, whose maintainership of glibc came to
> an unhappy end.  Anyone who'd deny that Drepper was a world-class domain
> expert or diligently applied himself to his work, I would not take
> seriously.  Apart from glibc maintenance, he wrote some excellent papers
> on dynamic shared objects and on the nature of the memory abstraction in
> Unix and Unix-like systems.  (Since the latter paper got so deep into
> the topic of cache memory architecture, I'd venture it applies more
> broadly still.)
>
> I reiterate: world-class.  Any engineer in this space who doesn't read
> Drepper disserves themselves professionally.  His stuff is up there with
> Goldberg's 1991 paper on floating-point arithmetic, in my opinion.  Even
> if you don't 100% digest what these people have to say, they'll improve
> your thinking, because you'll become more familiar with the problem
> domain.  (And if you disagree with them and can back up your claims,
> start writing a paper of your own.  That's where the confidence one
> manifests in the Google interview or break room evaporates.)
>
> So how does a guy like that get himself into trouble as a maintainer?
>
> By persistently failing to attend to the demands/needs of the community
> they serve.
>
> Listen to your users.  Even if they're "wrong".
>
> Here's how I apply the foregoing mode of analysis to my own work.
>
> I've occasionally ruffled feathers by changing defaults in groff.[2]  I
> _think_ that I have kept myself from being deposed by the sans-culottes
> by going well out of my way to ensure that configuration knobs are
> available to override those defaults, to document not just their
> substance but their rationale, and to present examples in a
> configuration file in /etc/groff so that all people have to do is
> uncomment something to override my contemptible idiocy.  (Eventually,
> some learn the hard way why I made my choice.)
>
> Frequently, I pitch potentially disruptive changes--stuff that we'd
> report in the "NEWS" file--as an email to the groff list with
> "Proposed:" in the Subject line.  More often than not, what I suggest
> involves such an esoteric detail of formatter behavior that I get no
> feedback at all.  Few have mastered such oddities as diversion trap
> management, to name an example of something that's moving a little bit
> in groff 1.25 and might, theoretically,[3] break some old AT&T troff
> documents (but none written targeting GNU troff itself).
>
> But I also have a counterexample.
>
> 2 release cycles in a row, in anticipation of groff 1.24 and 1.25, I've
> pitched a small redesign of GNU troff such that the configured
> hyphenation language--basically, the set of patterns used for automatic
> hyphenation of words, which are locale-specific (English, French,
> German)--is a property of the environment, like all other hyphenation
> configuration parameters, rather than a global one.
>
> Twice in a row, one person has spoken against the change--it _would_
> require changes to some macro packages.  That person is Peter Schaffter,
> author of mom(7), a macro package that shows off GNU troff's
> capabilities as a typesetting system better than any other.
>
> I haven't yet managed to make a concrete case to him strongly enough to
> persuade him that the objective is worth the candle.
>
> Now, I'm dead certain that my proposal is the correct course from a
> software design perspective.  It's a Yourdon/Constantine "cohesion"
> no-brainer.
>
> But, because environments are formatter-level objects, such a change's
> impact is not limited to internal data design.  It affects the language,
> and I have users.  So, I've interpreted Peter's objection as a
> procedural veto.  Rhetorically, he hasn't been so strident.  What I
> infer is that I need to spend time coming up with one or more concrete
> exhibits to establish the benefit of the change.  I have an idea for
> what would do it: a multi-lingual document, say an mm(7) document where
> most of the body text is in English but the document uses the package's
> "bottom block" `BS` and `BE` macros to present at the foot of every page
> some kind of disclaimer in, for instance, French.
>
> Just articulating the idea isn't enough.  Given the unusual resistance
> on this point, and recognizing the general indulgence shown by the
> community toward my madcap reformist schemes as something I'd be wise
> not to squander, I've decided what I need to do is build a real document
> with a real macro package, and illustrate what changes to that package
> would be necessary to fulfill the promise of the redesign.
>
> I expect the disruption level to be low and the benefit to be high--for
> its applicable problem domain.  The potential impact either way is
> limited because multilingual documents are simply not common.
>
> Because groff's community is small, I interpret a single dissenting
> voice as putting consensus out of reach.  It helps in this case that the
> single dissenting voice is a known member of the community.  If our
> mailing list suffered from anonymous drive-by trolls, I'd be in the
> perilous position of bifurcating participants into a class that gets
> "taken seriously" and a class that does not.  I spoke earlier in this
> thread of "moral hazard".  I feel there is significant moral hazard in
> making such classifications.  For one thing, sometimes anonymous
> contributors make cogent points, and for another, temptation is
> ever present to make the class of "people to be taken seriously"
> coextensive with those who agree with, flatter, or indulge you.
>
> Kings, presidents, executives, generals, and "BDFL"s express
> mystification and confusion regarding their failures because they
> mistake sycophancy for objective judgment.
>
> Regards,
> Branden
>
> [1] https://www.reddit.com/r/Demotivational/comments/1fdyxe/consulting/
>
> [2] The most famous example is the great hyphen-minus debacle of 2023.
>     https://lwn.net/Articles/947941/
>
> [3] And I do mean theoretically.  I surveyed a large corpus of
>     historical Unix troff documents and could not find _any_ that came
>     close to slipping through the "hole in the grammar" that I
>     identified and closed.
>     https://savannah.gnu.org/bugs/?68357#comment1
