Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF9038736F
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785595139; cv=none; b=aJ0udw6UpXwFdH3Iar1B+ORq3AIadYGMq0sg1gkMnIejRaxkxOM//CReK/Bo/ZQymzd+OkQRb56r1Uo2GpdiI+1kwDKdTUkEjbQCu4pf86Onq0fLqOGjNhK6dI0GDK9Dp3i7UmrsRo50/RHaWw4v4g2rc1uEtVtgbI/juJ63UCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785595139; c=relaxed/simple;
	bh=KB7xzdwgB0S+vL8DWLZrn6YPisMRfYLjqrl34cL0BSA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CZlc4eolsSB+huIGaJPVWoQ8JFvh52QIEl94Zupi3szbVaKYM/Puupf01qzQgdcfPNt4tmXHANC1ujiZiee3fwcgilVCalSzLLkP/IXhbzmGsnBnN0Nd9cJGw32LXGhIWdwgiYo0Xa/KhyVK+LEpRhOWg6nnJFgH+kfiDJ6tsW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (c.1.a.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::a1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 97717341EED;
	Sat, 01 Aug 2026 14:38:48 +0000 (UTC)
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
In-Reply-To: <am3XeGZyi1Pvr77-@devuan>
Organization: Gentoo
References: <cover.1785532392.git.alx@kernel.org>
	<784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
	<e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
	<20260731215122.4p4aepsbgeoibx74@illithid> <87a4r6es6k.fsf@gentoo.org>
	<am3XeGZyi1Pvr77-@devuan>
User-Agent: mu4e 1.14.2; emacs 31.0.91
Date: Sat, 01 Aug 2026 15:38:42 +0100
Message-ID: <87y0epdhxp.fsf@gentoo.org>
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

Alejandro Colomar <alx@kernel.org> writes:

> Hi Sam,
>
>> Date: 2026-07-31 22:59:47+0100
>> From: Sam James <sam@gentoo.org>
>>
>> (*) Alex has a history of making opinonated changes like this to
>> man-pages, such as removing references to older standards, and using a
>> somewhat novel (to many) syntax for prototypes.
>
> I think this comment deserves a well thought response.
>
> "Opinionated" is your subjective knee-jerk way of saying it.  I don't
> agree with it.

I don't consider it kneejerk. It's an opinion I've formed over the
years. You're of course free to disagre with it.

>
> I'd say I have a history of making changes based on thorough revision of
> history and technical merits, even when that research is contrary to
> decades (or half-centuries) of common practice, and possibly to
> current or withdrawn standards.

The primary issue I have is that I don't often see you change your mind
or acknowledge that being the man-pages maintainer is a privileged
position, or separate your desires from the maintainership role.

When I'm acting in a maintainer role, I often take changes I don't
particularly agree with if they're technically sound and there's broad
consensus for them. I think many do.

>
> In this case, and I don't mean this specific patch set, but the years-
> long revision of string documentation that I've been carrying out, we
> have a conflict between the design and correct use of string and memory
> functions, and their common use today.
>

Yes, I don't dispute that the terminology is poor.

> The functions that are most subject to this conflict are strncpy(3),
> strncat(3), and memccpy(3).  But the rest of strn*() are also somewhat
> affected, and the rest of mem*() minorly affected.
>
> They were originally designed for a specific use case for which they
> were great.  This knowledge has been lost in time, and I've been working
> to recover that knowledge.
>
> Precisely because of standards and other documentation that isn't
> written with the level of care that I have, we have decades of misuses
> of strncpy(3) and strncat(3).
>
> Moreover, it's in other places that you should be complaining about.

I do complain about those, and we finally got some consensus on the GCC
side on not warning about a bunch of them by default, even.

> GCC has a bogus set of diagnostics about strncpy(3) and strncat(3),
> which we could very well call opinionated, and I haven't seen anyone
> reporting them as bogus before I did.  Those diagnostics have not been
> considered opinionated, just because they follow mainstream (bogus)
> usage of these functions, but they are indeed forcing an opinion of how
> these functions should be used over other uses that may be more uncommon
> but which are actually the original and correct uses of these functions.
> <https://inbox.sourceware.org/gcc/30a77019-ded0-fe3b-d0db-6c77842674db@gmail.com/>
> <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=123024>
> <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=122963>
>
> It's curious that you called the GCC diagnostic "heuristics" instead of
> "opinionated".  There's nothing about heuristics there.  It's just an
> enforcement of an (incorrect) opinion about how these functions should
> be used.

The warnings are both opinionated and heuristics-based. I'm not sure how
you could read the comment you linked to as somehow an endorsement of
the status quo, I've been quite vocal about changing it elsewhere too?

>
> And since C23, we're seeing that the same story is repeating with
> memccpy(3), which was once a niche function that was great for
> implementing fgets(3), and now is misused by everyone and their dog for
> copying strings with truncation.
>
> I have spent probably more time than anyone in the last 5 years
> researching about string handling, and have proven the correctness of my
> research in the shadow-utils project, where most of my work has been in
> revising string and memory handling code.  I've fixed uncountable subtle
> bugs in such code, and have made the resulting code actually readable.
> And the number of accidental regressions is minimal (IIRC, one or two
> regressions related to string and memory handling, in all that time, and
> not too dangerous).
>
> Thus, I think it is my responsibility, as maintainer of the
> documentation project most read by C programmers, to let our audience
> learn what I've learnt in these years, and allow them to write safe
> string- and memory-handling code.
>
> It is thanks to this years-long research that I've been able to gather
> important knowledge from people like Mark Harris, Doug McIlroy, Branden,
> and many others, who hold knowledge that few other programmers possess,
> and spread it to the world.
>
> I'd consider it a negligence to do the easy thing and follow what
> standards say, or what most programmers do, because that's what has led
> us to the well-known mistakes that C programmers make.
>
> FWIW, regarding the possible conflict of interest that was mentioned
> yesterday, I'll say that I don't get paid for my contributions to ISO C
> as a member of WG14.  There's no benefit to me other than public
> recognition.  I'll also disclose the exact quantity that I've been paid
> for maintaining the Linux man-pages project:

You can have a conflict of interest in responsibliity without money
being involved. In fact, I have never believed you were influenced by
money, just that you let your personal opinions unduly influence your
decisions in modifying man-pages, even when consensus seems against it.

>
> 	110 kUSD in 2025 (from 5 sponsors)
> 	75 kUSD in 2026 (from 3 sponsors)
>
> I'm convinced that that doesn't have any effects in my decisions here,
> as I've had a consistent record of decisions well before I had any
> economic benefits from maintaining this project.  None of those sponsors
> have expressed any interest in favour of these decisions (nor against).
>
> I'll rumiate a bit more on these patches, and probably make minor
> changes to them, but the essence of documenting <memory.h> for all of
> mem*() and strn*() in SYNOPSIS is most likely to be eventually merged.
> I'll be careful to document what the standards say in a way that isn't
> confusing to users, and also in general will try to document it in a way
> that is positive for our audience --even if some of that audience may
> have knee-jerk reactions, like you are having at the moment--.  I have
> also received very positive feedback for other changes for which some
> people have noisily had knee-jerk reactions.  I believe it is my duty
> as maintainer of this project to do this change.
>

Please stop saying I'm having a kneejerk reaction. I haven't even yet
commented on the substance of the changes, I've just commented on how I
don't believe in making changes through man-pages like this.

>
> Have a lovely day!
> Alex

sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmpuBPMbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkJ1g
AQDoPyrOOOmbpekd58/tzjbzhRfw2VSGb5JxL6rNG5GDNAD/b6ilzcAB3IO9nW4V
TR+KqgDoz9g6VvIoPbsNWkg3uw4=
=Ohyr
-----END PGP SIGNATURE-----
--=-=-=--
