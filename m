Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837C6257824
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 16:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773348; cv=none; b=IrL0M7u9xVs4nAUxpHmMSrevH0znnbHPeQQUYVH6DoraDpabIbl0Yw8gWOl4T4Lw28oVBBn2LEJyNrB2FiHpm8MKOBhaTqM2cUWXWebvjgdOuky9sT8mBdP7VAIh8WLk85WfmMG6VuH50rM1t0Xwok3ggAD7C5HAg9b3lQw/cho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773348; c=relaxed/simple;
	bh=rRGjSbsKYJLzG0pj5fPwQGRs15qWdpjytgN3Ej2Z/gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRgnV+QVeKAZBPtK75qvKibZOQpGvAyQAJGLObWgSh01yZem37QkR/4rh7lE1C9LkLj6OhzBgdnuoncEUZCVC9XgR0f2iyLAQs6fi787bWawJeB9jTlUdo/8X14+w+VK5I73NM/46FwbBuCLJBV/dy3nNEQp8lo1HV5H0ZYMY48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pz6BIzMd; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pz6BIzMd"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66893db7bccso5185424d50.1
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 09:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773345; x=1786378145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rh/KiUtTDEQym2IwxOYB1aI2ktCHRlXvM/mUmyvTw6Y=;
        b=pz6BIzMdmiYsdxMaQ8/l9a5NtNxC/ZcExjr5ZY6F+r4iI2SnHG59sxv1HJSrBVg+EU
         C/fMICyagvxFkfSo7M7cT+8x8RSQxARDRxFPNcsC12Tb/YgPJ5G/jfc5+heNqpUYNcJ3
         LdCJaWbAEc5nmASPQOI/eQAHvOGZRDFsHH10hboD43vykRDhAhLh2JuCCSFfBKV9RZdZ
         egpXHgrj1q7Fx+VnShoxgetW2xQLMx77gZqw1LXVHbBt+6i6hf/WGclP0zFvVI90z/Xz
         o7Q8cMrgl3pS+CPc0xMWPJK9oo+T1AE4YQHkv2Lye6dKvl/OTPRWTrcfVI2S8DaeVxIH
         JJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773345; x=1786378145;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rh/KiUtTDEQym2IwxOYB1aI2ktCHRlXvM/mUmyvTw6Y=;
        b=jyA/2F0OonOt8R7H4qLumSrWa1rQBPCMGvni8DgxIfSxs9HWT5MOnhm/lE4NC/557J
         sJYkm9SjLlVnq1D0bnRdR7f38W5koYpmeORUTOVsgcZuN8NA5XrSiH8RR5Tf39jLyY/K
         bVR8C2xmhCIQII1v+piwCe6Ds2WrxgZfEqfHjBfRJr+QZqy+68HxVGdB+KLp7WDW9oru
         EHWpaK4a8hK3tFzGSJkk4K+wGB/cIW9gf5Jmmtx5cFFGL+HGKPodJGo+WNXYCilXcGqJ
         Q2NCoTvCWDQ3Lk5nBNI/bWXbJCgDowXe+q6CCeyIYM5rmw+P4TUtSQwcSxO3t1y3TXDN
         ikMw==
X-Forwarded-Encrypted: i=1; AHgh+RqXNmNUzt+8qIfRlxIjjV+c8Dv3AQkKSGz0Jz9sl4t9wc8lh9LNud9n4ep0ljk40JgRYmlEz54yCDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCEBgLUZzFTBMju1eHxba5omksq1A3ofR9hGP2iUZ2bYXHveQv
	myZh3196z4Xr9P/bXTiDJtw6QxDowbgn6gzjCTafi8H2qQUzZVd4S5jV
X-Gm-Gg: AR+sD10eWDX/88XmmcaXVu9IPdiWb43xkunOSFwIGgOHXTAWt3COtFWlxdfLZEagvHs
	FgGf+PULGVH94pE7ZLuqXMlRmG3wcf7LACXfZl75dRcys8BWAIQC4WbqeFyh85nbP3fmAu3DS4h
	sqSrbUlbLZWfyWIYvm4B/rD4VUVQ0XzD3hKaurV5wmV9XonD/75m0KIzshwu01zyHa4Fc1J9RzJ
	dHQ4orY7PkBmtM5mtfC07jr04LymnKMhu6XLfi9/3ByuAI20MqZXnbgCmpR+CJTg1Jj5AG3SqoN
	8A2Zgb5cxfcgd2LpnfOiCl/7Ez6hZRTCMuxC7uT4jTA27QIAk1RtkD9RYLspACP+rHQIixs/LX8
	tk8gt6cU42fW53JT+PtDtC8BcwMw7TOedPsFkFkdEml+wIEPkAtpcavfI/zV4WP0PT+Q40vrsfP
	JQrv6MHxuZ85NA+UlzAauoz642wIyb5TCrvwqeemZ1PKniR0gT8Q==
X-Received: by 2002:a53:d94d:0:b0:668:6c92:dfc2 with SMTP id 956f58d0204a3-6694efb890bmr9618835d50.5.1785773345234;
        Mon, 03 Aug 2026 09:09:05 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948e5ee60sm5818999d50.8.2026.08.03.09.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:09:04 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:09:02 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Collin Funk <collin.funk1@gmail.com>,
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
	bug-gnulib@gnu.org, libc-alpha@sourceware.org, groff@gnu.org
Subject: on project management (was: the Linux man-pages as an educational
 tool)
Message-ID: <20260803160902.5edjmpxaqr5uudbu@illithid>
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
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2zd34qebojhttaqc"
Content-Disposition: inline
In-Reply-To: <am_TTjDLlAI68zkp@devuan>


--2zd34qebojhttaqc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: on project management (was: the Linux man-pages as an educational
 tool)
MIME-Version: 1.0

[looping in groff list because toward the end of this mail I present
some philosophy that I have applied to my work on that project]

Hi Alex,

At 2026-08-03T01:37:26+0200, Alejandro Colomar wrote:
> > Date: 2026-08-02 16:27:21-0700
> > From: Collin Funk <collin.funk1@gmail.com>
> > I can't help but wonder of what happens in WG 14 rejects this
> > controversial, as obvious by this thread, change. Will the man-pages
> > changes be reverted? Or will we slowly watch them document personal
> > preferences instead of existing standards?
>=20
> This patch set is quite independent of the standard.  It documents a
> header file that has been provided since forever in glibc and most
> other POSIX-ish systems,

Just yesterday while watching an ncurses build scroll by on my tablet, I
had occasion to notice that Bionic libc provides a "memory.h" header.
Curious, I checked it out.

It's a thin wrapper for <string.h>.

I endorse your reformist attitude because every technological success
story begins ossifying as soon as its market position can be milked for
economic rent.  As the old Demotivator poster said of consulting: "If
you're not a part of the solution, there's good money to be made in
prolonging the problem."[1]

Thus trigraphs.  Thus K&R function declarations.  Thus "wastebasket
taxon" header files.

> so changes to the standard are unlikely to have any effects.  I've
> clarified this extensively.  If you want to discourage me from
> applying the change, you should rather bring up technical reasons.

I don't think Collin's totally off base.

What is the overall mission of the Linux man-pages project as you
conceive it?

Take some time to draft one, if you haven't already and I missed it.
Here are some points you might consider.

*  Is delivery of factual information more or less important than
   advocacy of correct methods and accepted idioms?

*  If the foregoing are equally important, are you _sure_ they need to
   be?  Can you escape dilemmas that frustrate day-to-day stewardship
   work by favoring one over the other?

*  If you maintain that the two are equally important, nevertheless, how
   do you resolve conflict?  Disclose the principles you employ to
   decide such issues, and write them down where people can find them.
   That way they can better understand why you reason the way you do,
   and you bind yourself to those principles, so that you and others are
   less seduced by the urge to "shift the goalposts" in a dispute.

> This passive-aggressive message is not something that will have the
> desired effects you could possibly reach with technical arguments.

I'd say less that it was a passive-aggressive message than that it was a
deployment of a slippery-slope argument.  Fallaciously?  I don't know.

But it is also true that people are pushing back on your proposals
regarding re=EBnvisioning of libc's memory buffer and string APIs from two
fronts.  Only one is technical.  The other is managerial.

As a maintainer, your role is to serve your community.  This is a
privilege and a responsibility.  Generally, one is accepted in that role
because one has demonstrated a high level of expertise and sufficient
resources to carry out the tasks the role requires.

Someone earlier in the thread made reference to the personage of past
glibc maintainer Ulrich Drepper, whose maintainership of glibc came to
an unhappy end.  Anyone who'd deny that Drepper was a world-class domain
expert or diligently applied himself to his work, I would not take
seriously.  Apart from glibc maintenance, he wrote some excellent papers
on dynamic shared objects and on the nature of the memory abstraction in
Unix and Unix-like systems.  (Since the latter paper got so deep into
the topic of cache memory architecture, I'd venture it applies more
broadly still.)

I reiterate: world-class.  Any engineer in this space who doesn't read
Drepper disserves themselves professionally.  His stuff is up there with
Goldberg's 1991 paper on floating-point arithmetic, in my opinion.  Even
if you don't 100% digest what these people have to say, they'll improve
your thinking, because you'll become more familiar with the problem
domain.  (And if you disagree with them and can back up your claims,
start writing a paper of your own.  That's where the confidence one
manifests in the Google interview or break room evaporates.)

So how does a guy like that get himself into trouble as a maintainer?

By persistently failing to attend to the demands/needs of the community
they serve.

Listen to your users.  Even if they're "wrong".

Here's how I apply the foregoing mode of analysis to my own work.

I've occasionally ruffled feathers by changing defaults in groff.[2]  I
_think_ that I have kept myself from being deposed by the sans-culottes
by going well out of my way to ensure that configuration knobs are
available to override those defaults, to document not just their
substance but their rationale, and to present examples in a
configuration file in /etc/groff so that all people have to do is
uncomment something to override my contemptible idiocy.  (Eventually,
some learn the hard way why I made my choice.)

Frequently, I pitch potentially disruptive changes--stuff that we'd
report in the "NEWS" file--as an email to the groff list with
"Proposed:" in the Subject line.  More often than not, what I suggest
involves such an esoteric detail of formatter behavior that I get no
feedback at all.  Few have mastered such oddities as diversion trap
management, to name an example of something that's moving a little bit
in groff 1.25 and might, theoretically,[3] break some old AT&T troff
documents (but none written targeting GNU troff itself).

But I also have a counterexample.

2 release cycles in a row, in anticipation of groff 1.24 and 1.25, I've
pitched a small redesign of GNU troff such that the configured
hyphenation language--basically, the set of patterns used for automatic
hyphenation of words, which are locale-specific (English, French,
German)--is a property of the environment, like all other hyphenation
configuration parameters, rather than a global one.

Twice in a row, one person has spoken against the change--it _would_
require changes to some macro packages.  That person is Peter Schaffter,
author of mom(7), a macro package that shows off GNU troff's
capabilities as a typesetting system better than any other.

I haven't yet managed to make a concrete case to him strongly enough to
persuade him that the objective is worth the candle.

Now, I'm dead certain that my proposal is the correct course from a
software design perspective.  It's a Yourdon/Constantine "cohesion"
no-brainer.

But, because environments are formatter-level objects, such a change's
impact is not limited to internal data design.  It affects the language,
and I have users.  So, I've interpreted Peter's objection as a
procedural veto.  Rhetorically, he hasn't been so strident.  What I
infer is that I need to spend time coming up with one or more concrete
exhibits to establish the benefit of the change.  I have an idea for
what would do it: a multi-lingual document, say an mm(7) document where
most of the body text is in English but the document uses the package's
"bottom block" `BS` and `BE` macros to present at the foot of every page
some kind of disclaimer in, for instance, French.

Just articulating the idea isn't enough.  Given the unusual resistance
on this point, and recognizing the general indulgence shown by the
community toward my madcap reformist schemes as something I'd be wise
not to squander, I've decided what I need to do is build a real document
with a real macro package, and illustrate what changes to that package
would be necessary to fulfill the promise of the redesign.

I expect the disruption level to be low and the benefit to be high--for
its applicable problem domain.  The potential impact either way is
limited because multilingual documents are simply not common.

Because groff's community is small, I interpret a single dissenting
voice as putting consensus out of reach.  It helps in this case that the
single dissenting voice is a known member of the community.  If our
mailing list suffered from anonymous drive-by trolls, I'd be in the
perilous position of bifurcating participants into a class that gets
"taken seriously" and a class that does not.  I spoke earlier in this
thread of "moral hazard".  I feel there is significant moral hazard in
making such classifications.  For one thing, sometimes anonymous
contributors make cogent points, and for another, temptation is
ever present to make the class of "people to be taken seriously"
coextensive with those who agree with, flatter, or indulge you.

Kings, presidents, executives, generals, and "BDFL"s express
mystification and confusion regarding their failures because they
mistake sycophancy for objective judgment.

Regards,
Branden

[1] https://www.reddit.com/r/Demotivational/comments/1fdyxe/consulting/

[2] The most famous example is the great hyphen-minus debacle of 2023.
    https://lwn.net/Articles/947941/

[3] And I do mean theoretically.  I surveyed a large corpus of
    historical Unix troff documents and could not find _any_ that came
    close to slipping through the "hole in the grammar" that I
    identified and closed.
    https://savannah.gnu.org/bugs/?68357#comment1

--2zd34qebojhttaqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpwvRYACgkQ0Z6cfXEm
bc5ShRAAjLfzg/gCEXnkEq9/Lfu2GcK2IWhewY2GcFCT0EuPmmtDVWQeK4S5fr4f
8qJgZWKsTuUXrvAClDhxazRh/XEkpjMDifKUWRb3rR0b5WKiP4QWI928oO5sTtIi
VDaCzCUBKI4ug6w5uqi9rG2TAAju3u9Iyx83VuJHStfTsch0IH4hsDIr/sDuAcLX
oIBcxS2y0mGnVoGv2Iu/IcmkJLa/oN5aZT+UdFcXJzcehA9Th7lkEeYiyQQFrjjZ
3g+FfDqgR7S9ajWaD+YOKjdo8efy+F85csBHMLG0AmfntBCTY+K5VDYjgao1jadu
UvdqrrUbvGy6uw3oWmPXkH5yj14C5qP91tusaCFrYLZkSNKDGIGfE3fTGxvtuKmM
8K5mSoJM8dGzOYe8vuCcvkHUdCjFfs9cEtJ8UsEJIn/21VK3kqPcjXKf1dL+92Sx
lgeTg6OkobRLybhm1v50fVZDXWcgYF875Oz4clvPqA17mCLlClP0d/M2fI50xtsZ
EjCn0rIOKpC7nOO7UHFE6EtFeieCGK275SpXABfzzsPB7l+93ZnUUXLbpYDt08bA
fs6qhttlxUjYP06euThjWb7vUd4/noO5YReT+9lZj0cXqBDbTfKR/CgZdlG2WKdc
F+7BWEUfI/WQ81gedphtW/n9ns/70yg+xUZPU6DfnIjJMefKCOQ=
=0DDT
-----END PGP SIGNATURE-----

--2zd34qebojhttaqc--
