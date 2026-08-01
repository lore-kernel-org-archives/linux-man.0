Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E411FF7C7
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 16:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785600641; cv=none; b=AdJq7YlQnN8ICK7xf2Y3GeSLnA+eocnshJhVHv6S0tJIqqF4uq+llO/0OOWAFdYft2yvjPvsGTFey6YjmFKwm7HP4e36UqEDTNr0EMInPwpKQYGGBmaqQuO1vM6N6UjHZJ06RadN0Oh5RF9M65eiIiqtPkkqlOaqw7XNlTj9Q3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785600641; c=relaxed/simple;
	bh=1mACiitd9dGONGXa8f/PjQXcxUk9yeIhpbijip6Et+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sDRpS/qZnQQTXRr7A3h9INozeNPYTRaCXm3Mh9zH/pwu0LGpCzCXobyyFlfVeyQa2DaYcYx7Q185buJhguTIekzCkwNaUYelJD/izgcX+6ybgzNbeLNS8ElasyryRwZ/nSpvS2B5RFne9WsPtcjzX7PxSOqJLnrdfZatvSzbYoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (c.1.a.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::a1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0F92F335C2E;
	Sat, 01 Aug 2026 16:10:35 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>,  Joseph Myers
 <josmyers@redhat.com>,  linux-man@vger.kernel.org,  Keith Bostic
 <keith@bostic.com>,  Mark Harris <mark.hsj@gmail.com>,  Nevin Liber
 <nevin@cplusplusguy.com>,  JeanHeyd Meneide <phdofthehouse@gmail.com>,
  Christopher Bazley <chris.bazley.wg14@gmail.com>,  "Serge E. Hallyn"
 <serge@hallyn.com>,  Iker Pedrosa <ipedrosa@redhat.com>,  "Evgeny Grin
 (Karlson2k)" <k2k@drgrin.dev>,  Kees Cook <keescook@chromium.org>,
  bug-gnulib@gnu.org,  libc-alpha@sourceware.org,  Douglas McIlroy
 <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
In-Reply-To: <am4GT1OkqNZD9FF9@devuan>
Organization: Gentoo
References: <cover.1785532392.git.alx@kernel.org>
	<784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
	<e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
	<20260731215122.4p4aepsbgeoibx74@illithid> <87a4r6es6k.fsf@gentoo.org>
	<am3XeGZyi1Pvr77-@devuan> <87y0epdhxp.fsf@gentoo.org>
	<am4GT1OkqNZD9FF9@devuan>
User-Agent: mu4e 1.14.2; emacs 31.0.91
Date: Sat, 01 Aug 2026 17:10:30 +0100
Message-ID: <87zez5bz49.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alejandro Colomar <alx@kernel.org> writes:

> Hi Sam,
>
>> Date: 2026-08-01 15:38:42+0100
>> From: Sam James <sam@gentoo.org>
>>
> [...]
>> >
>> > I'd say I have a history of making changes based on thorough revision =
of
>> > history and technical merits, even when that research is contrary to
>> > decades (or half-centuries) of common practice, and possibly to
>> > current or withdrawn standards.
>>=20
>> The primary issue I have is that I don't often see you change your mind
>
> I do quite frequently, actually.  Most recently, this week:
>
> <https://lore.kernel.org/linux-man/CAMdZqKEEncWS64BUL1qa0SfcNUaNA9XRBPWTp=
HPB=3D=3DN3VV_Nzg@mail.gmail.com/>
> <https://lore.kernel.org/linux-man/amupqzN_X57Du4AJ@devuan/>

OK, I don't frequently see you change your mind on any of these big
contentious threads we have every so often.

>
> 	> Date: Thu, 30 Jul 2026 21:51:16 +0200
> 	> From: Alejandro Colomar <alx@kernel.org>
> 	>
> 	> > Date: Thu, 30 Jul 2026 10:58:26 -0700
> 	> > From: Mark Harris <mark.hsj@gmail.com>
> 	> >
> 	> > It seems like you've already made up your mind that memccpy()
> 	> > is bad and are now just looking to justify that decision.
> 	>
> 	> Not necessarily.  I can be convinced with good arguments.  :-)
> 	>
> 	...
> 	> Agreed; there are use cases where memccpy(3) is preferrable.
> 	> You've convinced me.  :)
>
> There are many other cases about cases where I had a strong opinion, and
> people that are currently in CC have changed my mind.
>
> Even you've changed my mind a few times, even if you don't remember or
> didn't realize.

OK.

>
>> or acknowledge that being the man-pages maintainer is a privileged
>> position,
>
> It's certainly a privileged position.  Just like maintainer of GCC, or
> of Clang, or any other core project of most systems.  I acknowledge
> this, and I believe I've acknowledged this before, implicitly and
> explicitly.
>
>> or separate your desires from the maintainership role.
>
> My only desires are making it easy to allow programmers to write good
> programs.  I believe that's my main responsibility as maintainer of this
> project, and in general, the task of any good documentation.

I think the previous man-pages maintainer behaved differently and people
have come to expect that style of management over the years.

>
>> When I'm acting in a maintainer role, I often take changes I don't
>> particularly agree with if they're technically sound and there's broad
>> consensus for them. I think many do.
>
> I also do often (and you probably don't notice, because you're not part
> of this project, and are not here to observe every change).  But
> sometimes, I must make decisions that some people --no matter how
> important-- may disagree with.  I might be wrong, and I'll certainly
> re-think about them after-the-fact, but this is one of them.
>

I'm saying that you seem to be in the position of making such changes
more than many.

>> > In this case, and I don't mean this specific patch set, but the years-
>> > long revision of string documentation that I've been carrying out, we
>> > have a conflict between the design and correct use of string and memory
>> > functions, and their common use today.
>> >
>>=20
>> Yes, I don't dispute that the terminology is poor.
>
> It's not only a matter of terminology.  And in fact, I thing the
> terminology could be acceptable (not ideal, though).
>

OK, I'm saying I don't disagree that strings vs memory is a mess in C.

>> > The functions that are most subject to this conflict are strncpy(3),
>> > strncat(3), and memccpy(3).  But the rest of strn*() are also somewhat
>> > affected, and the rest of mem*() minorly affected.
>> >
>> > They were originally designed for a specific use case for which they
>> > were great.  This knowledge has been lost in time, and I've been worki=
ng
>> > to recover that knowledge.
>> >
>> > Precisely because of standards and other documentation that isn't
>> > written with the level of care that I have, we have decades of misuses
>> > of strncpy(3) and strncat(3).
>> >
>> > Moreover, it's in other places that you should be complaining about.
>>=20
>> I do complain about those, and we finally got some consensus on the GCC
>> side on not warning about a bunch of them by default, even.
>
> What do you mean?  And why have I not been CCed in such discussions,
> after being the original reporter of the problems?  That kind of issue
> management is certainly worse than what we're discussing here.
>

???

First, it wouldn't make sense to CC every reporter of such a bug
involving middle-end warnings on such a thread.

Second, there have been several such discussions on the ML and at the
GNU Cauldron, the most recent one I'm referring to being
https://inbox.sourceware.org/gcc/CAH6eHdRfEVsGjbJ__kU5AR9BfVdLQZ_iGGDZa=3Dy=
QnT4fgG2P6w@mail.gmail.com/.

There have been (many) others regarding both the FP nature of the
warnings and also growing consensus on IRC and the MLs when these issues
come up that some of them are too opinionated in addition to being
heuristics-based. Some of them are based on style that shouldn't really
be in the warnings (or at least not on by default if so), and some of it
is inherently prone to false-positives, some both.

> I believe that even though I may disagree with others, it's good to hear
> their opinions, no matter how convinced I am that they're wrong, and no
> matter how much they'll blame me for taking bad decisions.  Feedback is
> (almost) always good, even when it's negative.
>
> What exact changes have consensus in GCC?  How can there be consensus if
> you haven't CCed the relevant people (including me)?
>

See above.

> In any case, I guess it's good if GCC will improve.
>
>> > GCC has a bogus set of diagnostics about strncpy(3) and strncat(3),
>> > which we could very well call opinionated, and I haven't seen anyone
>> > reporting them as bogus before I did.  Those diagnostics have not been
>> > considered opinionated, just because they follow mainstream (bogus)
>> > usage of these functions, but they are indeed forcing an opinion of how
>> > these functions should be used over other uses that may be more uncomm=
on
>> > but which are actually the original and correct uses of these function=
s.
>> > <https://inbox.sourceware.org/gcc/30a77019-ded0-fe3b-d0db-6c77842674db=
@gmail.com/>
>> > <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D123024>
>> > <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D122963>
>> >
>> > It's curious that you called the GCC diagnostic "heuristics" instead of
>> > "opinionated".  There's nothing about heuristics there.  It's just an
>> > enforcement of an (incorrect) opinion about how these functions should
>> > be used.
>>=20
>> The warnings are both opinionated
>
> Thanks!
>
>> and heuristics-based. I'm not sure how
>> you could read the comment you linked to as somehow an endorsement of
>> the status quo,
>
> I don't read it as an endorsement of the status-quo.  Just a diminishing
> of the fact that GCC maintainers, just like every other project, have
> opinions --sometimes, like here, wrong opinions--, and they affect
> other programmers that try to write good code.
>
>> I've been quite vocal about changing it elsewhere too?
>
> I'm not aware of anything that has not me in CC; sorry.

I wasn't in CC yet I came across this thread. Should you have CCed me?

(No, I don't believe you should have; this is what mailing lists are
for.)

>
>> > And since C23, we're seeing that the same story is repeating with
>> > memccpy(3), which was once a niche function that was great for
>> > implementing fgets(3), and now is misused by everyone and their dog for
>> > copying strings with truncation.
>> >
>> > I have spent probably more time than anyone in the last 5 years
>> > researching about string handling, and have proven the correctness of =
my
>> > research in the shadow-utils project, where most of my work has been in
>> > revising string and memory handling code.  I've fixed uncountable subt=
le
>> > bugs in such code, and have made the resulting code actually readable.
>> > And the number of accidental regressions is minimal (IIRC, one or two
>> > regressions related to string and memory handling, in all that time, a=
nd
>> > not too dangerous).
>> >
>> > Thus, I think it is my responsibility, as maintainer of the
>> > documentation project most read by C programmers, to let our audience
>> > learn what I've learnt in these years, and allow them to write safe
>> > string- and memory-handling code.
>> >
>> > It is thanks to this years-long research that I've been able to gather
>> > important knowledge from people like Mark Harris, Doug McIlroy, Brande=
n,
>> > and many others, who hold knowledge that few other programmers possess,
>> > and spread it to the world.
>> >
>> > I'd consider it a negligence to do the easy thing and follow what
>> > standards say, or what most programmers do, because that's what has led
>> > us to the well-known mistakes that C programmers make.
>> >
>> > FWIW, regarding the possible conflict of interest that was mentioned
>> > yesterday, I'll say that I don't get paid for my contributions to ISO C
>> > as a member of WG14.  There's no benefit to me other than public
>> > recognition.  I'll also disclose the exact quantity that I've been paid
>> > for maintaining the Linux man-pages project:
> [...]
>> In fact, I have never believed you were influenced by
>> money,
>
> Thanks!
>
>> just that you let your personal opinions unduly influence your
>> decisions in modifying man-pages,
>
> I've done a lot of research and hearing experts to reach this
> decision(s).  I believe it's not just an opinion, but a technical
> decision even if a controversial one.
>
> [reordered]
>> You can have a conflict of interest in responsibliity without money
>> being involved.
>
> I'll continue to think about this and other concerns, and may change my
> mind later.  At this moment, I believe I'm taking a technical decision
> after hearing enough experts and researching the topic more than anyone
> for several years.
>
>> even when consensus seems against it.
>
> I wouldn't say consensus against; just a vocal number of people that
> disagree.  I wouldn't say there's consensus in favour, of course, but
> when there's no consensus, I have to take the last decision.  Most of
> the time, that last decision means not doing anything, but in this case,
> it's different.

What would real consensus against look like?

>
>
> Cheers,
> Alex

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmpuGnYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkJTf
AQDdIxo6gzINdS/O84yhWcGMP5TMnZcjHupGMjR0EZTFwwD7B6XpJMZ9Cc91DgIb
7ZJwRahNlYm2xdqcm0A4C3BD9Qw=
=h0f8
-----END PGP SIGNATURE-----
--=-=-=--
