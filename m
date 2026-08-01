Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066D42E8B67
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785597327; cv=none; b=p4k2JiEGl617P1nC/2PtaURCEyOycwAYmAiX0h8fCrkh0wPYL988QC3NESRavcyourO4k850dhEfoP4+AM+Y8dECo4NepoqsYJ1arUXkxuzKYPxGztfZQlmZHpNjHjo5CAUvME832sAZgdpM5dI+sQbXkXoL1p5vVodTeXSw1T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785597327; c=relaxed/simple;
	bh=M4GQ2cdYHGid2NlBthFsFo4q94zvb8RB13EeC2AiE8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiImZpf1fvrwDbzyYQdHKeIhsebQhwh98ieNeRT+waDgTC7yHIPWkiOOTz50EQvDGgzo8k+FIpUz1g8El4jBKtjf7AAh7FplzbD2FbuNKUOT0VrjzuESoNdzhTdFN/qXcMqRK944O1vHnz+HwT4026vBu88iuGgFUuXYwNbjCk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2PykwOh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2PykwOh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EA51F00AC4;
	Sat,  1 Aug 2026 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785597325;
	bh=x9nYbq8Cv1d/McWEeAbr/uruUkJXBEFLRZywYOCt0eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R2PykwOhsIBazRVfSK0kLbEFxxcgBcIUh9M3MNpQZyyUDxPT2hgh4+y+ZPE2OezD/
	 xt/Q56FFIrH4mB7tsX5IuFD5sJ0LWzY2Ecg0KrHVdrDSZXlR/aJ2GwdTHI30+rQpzo
	 y+LcWvMTQFABo+qpYRMZK1qycUxtBqF0wURCN2Qln13zzy0BJ/1r3YQrH4MT377iET
	 p3bu/qYzPFnITbwLmbFMWgoRKPmqCVTgaLn+3A/IU2MM/+t3SomMlm6UNU1ZD2hpcY
	 GLuN9zdA5fsW/InvmLhnf9Ke4JUqant0qs0JdR/ieW64B1TmxwYLwcBXI+YJTwiPX9
	 OW1LonsodLJHA==
Date: Sat, 1 Aug 2026 17:15:19 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am4GT1OkqNZD9FF9@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yjokk5ssqiev3463"
Content-Disposition: inline
In-Reply-To: <87y0epdhxp.fsf@gentoo.org>


--yjokk5ssqiev3463
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am4GT1OkqNZD9FF9@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <87y0epdhxp.fsf@gentoo.org>

Hi Sam,

> Date: 2026-08-01 15:38:42+0100
> From: Sam James <sam@gentoo.org>
>
[...]
> >
> > I'd say I have a history of making changes based on thorough revision of
> > history and technical merits, even when that research is contrary to
> > decades (or half-centuries) of common practice, and possibly to
> > current or withdrawn standards.
>=20
> The primary issue I have is that I don't often see you change your mind

I do quite frequently, actually.  Most recently, this week:

<https://lore.kernel.org/linux-man/CAMdZqKEEncWS64BUL1qa0SfcNUaNA9XRBPWTpHP=
B=3D=3DN3VV_Nzg@mail.gmail.com/>
<https://lore.kernel.org/linux-man/amupqzN_X57Du4AJ@devuan/>

	> Date: Thu, 30 Jul 2026 21:51:16 +0200
	> From: Alejandro Colomar <alx@kernel.org>
	>
	> > Date: Thu, 30 Jul 2026 10:58:26 -0700
	> > From: Mark Harris <mark.hsj@gmail.com>
	> >
	> > It seems like you've already made up your mind that memccpy()
	> > is bad and are now just looking to justify that decision.
	>
	> Not necessarily.  I can be convinced with good arguments.  :-)
	>
	...
	> Agreed; there are use cases where memccpy(3) is preferrable.
	> You've convinced me.  :)

There are many other cases about cases where I had a strong opinion, and
people that are currently in CC have changed my mind.

Even you've changed my mind a few times, even if you don't remember or
didn't realize.

> or acknowledge that being the man-pages maintainer is a privileged
> position,

It's certainly a privileged position.  Just like maintainer of GCC, or
of Clang, or any other core project of most systems.  I acknowledge
this, and I believe I've acknowledged this before, implicitly and
explicitly.

> or separate your desires from the maintainership role.

My only desires are making it easy to allow programmers to write good
programs.  I believe that's my main responsibility as maintainer of this
project, and in general, the task of any good documentation.

> When I'm acting in a maintainer role, I often take changes I don't
> particularly agree with if they're technically sound and there's broad
> consensus for them. I think many do.

I also do often (and you probably don't notice, because you're not part
of this project, and are not here to observe every change).  But
sometimes, I must make decisions that some people --no matter how
important-- may disagree with.  I might be wrong, and I'll certainly
re-think about them after-the-fact, but this is one of them.

> > In this case, and I don't mean this specific patch set, but the years-
> > long revision of string documentation that I've been carrying out, we
> > have a conflict between the design and correct use of string and memory
> > functions, and their common use today.
> >
>=20
> Yes, I don't dispute that the terminology is poor.

It's not only a matter of terminology.  And in fact, I thing the
terminology could be acceptable (not ideal, though).

> > The functions that are most subject to this conflict are strncpy(3),
> > strncat(3), and memccpy(3).  But the rest of strn*() are also somewhat
> > affected, and the rest of mem*() minorly affected.
> >
> > They were originally designed for a specific use case for which they
> > were great.  This knowledge has been lost in time, and I've been working
> > to recover that knowledge.
> >
> > Precisely because of standards and other documentation that isn't
> > written with the level of care that I have, we have decades of misuses
> > of strncpy(3) and strncat(3).
> >
> > Moreover, it's in other places that you should be complaining about.
>=20
> I do complain about those, and we finally got some consensus on the GCC
> side on not warning about a bunch of them by default, even.

What do you mean?  And why have I not been CCed in such discussions,
after being the original reporter of the problems?  That kind of issue
management is certainly worse than what we're discussing here.

I believe that even though I may disagree with others, it's good to hear
their opinions, no matter how convinced I am that they're wrong, and no
matter how much they'll blame me for taking bad decisions.  Feedback is
(almost) always good, even when it's negative.

What exact changes have consensus in GCC?  How can there be consensus if
you haven't CCed the relevant people (including me)?

In any case, I guess it's good if GCC will improve.

> > GCC has a bogus set of diagnostics about strncpy(3) and strncat(3),
> > which we could very well call opinionated, and I haven't seen anyone
> > reporting them as bogus before I did.  Those diagnostics have not been
> > considered opinionated, just because they follow mainstream (bogus)
> > usage of these functions, but they are indeed forcing an opinion of how
> > these functions should be used over other uses that may be more uncommon
> > but which are actually the original and correct uses of these functions.
> > <https://inbox.sourceware.org/gcc/30a77019-ded0-fe3b-d0db-6c77842674db@=
gmail.com/>
> > <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D123024>
> > <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D122963>
> >
> > It's curious that you called the GCC diagnostic "heuristics" instead of
> > "opinionated".  There's nothing about heuristics there.  It's just an
> > enforcement of an (incorrect) opinion about how these functions should
> > be used.
>=20
> The warnings are both opinionated

Thanks!

> and heuristics-based. I'm not sure how
> you could read the comment you linked to as somehow an endorsement of
> the status quo,

I don't read it as an endorsement of the status-quo.  Just a diminishing
of the fact that GCC maintainers, just like every other project, have
opinions --sometimes, like here, wrong opinions--, and they affect
other programmers that try to write good code.

> I've been quite vocal about changing it elsewhere too?

I'm not aware of anything that has not me in CC; sorry.

> > And since C23, we're seeing that the same story is repeating with
> > memccpy(3), which was once a niche function that was great for
> > implementing fgets(3), and now is misused by everyone and their dog for
> > copying strings with truncation.
> >
> > I have spent probably more time than anyone in the last 5 years
> > researching about string handling, and have proven the correctness of my
> > research in the shadow-utils project, where most of my work has been in
> > revising string and memory handling code.  I've fixed uncountable subtle
> > bugs in such code, and have made the resulting code actually readable.
> > And the number of accidental regressions is minimal (IIRC, one or two
> > regressions related to string and memory handling, in all that time, and
> > not too dangerous).
> >
> > Thus, I think it is my responsibility, as maintainer of the
> > documentation project most read by C programmers, to let our audience
> > learn what I've learnt in these years, and allow them to write safe
> > string- and memory-handling code.
> >
> > It is thanks to this years-long research that I've been able to gather
> > important knowledge from people like Mark Harris, Doug McIlroy, Branden,
> > and many others, who hold knowledge that few other programmers possess,
> > and spread it to the world.
> >
> > I'd consider it a negligence to do the easy thing and follow what
> > standards say, or what most programmers do, because that's what has led
> > us to the well-known mistakes that C programmers make.
> >
> > FWIW, regarding the possible conflict of interest that was mentioned
> > yesterday, I'll say that I don't get paid for my contributions to ISO C
> > as a member of WG14.  There's no benefit to me other than public
> > recognition.  I'll also disclose the exact quantity that I've been paid
> > for maintaining the Linux man-pages project:
[...]
> In fact, I have never believed you were influenced by
> money,

Thanks!

> just that you let your personal opinions unduly influence your
> decisions in modifying man-pages,

I've done a lot of research and hearing experts to reach this
decision(s).  I believe it's not just an opinion, but a technical
decision even if a controversial one.

[reordered]
> You can have a conflict of interest in responsibliity without money
> being involved.

I'll continue to think about this and other concerns, and may change my
mind later.  At this moment, I believe I'm taking a technical decision
after hearing enough experts and researching the topic more than anyone
for several years.

> even when consensus seems against it.

I wouldn't say consensus against; just a vocal number of people that
disagree.  I wouldn't say there's consensus in favour, of course, but
when there's no consensus, I have to take the last decision.  Most of
the time, that last decision means not doing anything, but in this case,
it's different.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--yjokk5ssqiev3463
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpuDXwACgkQ64mZXMKQ
wqm+FBAAixjTiqe/Gc18IHwU3dpX6ZBGAvqIAGsoKO1uKkwx9UobutKJVOCH/3pN
RQkLvaMXFGuzkJpGEn/J1JXagvrewRDN2QVaPsgtJyv87ncv2UaGwrZkTwV6rAFw
9p7i6whj1RPSeZmQzjlSwJ0m0lfamkd2ytnacExJgwFNlF3lI/vTtogaoB02Eqz6
SkRWmOLE/dSOS7bCBmti6ccTqqFJqHiKYU8yzgj1MRb3srpVy1ozkQyTa2AqrZgN
IMTam2OsPvcqozdXBYGaRWpvplHTTqrK7SJAInYRnqH/Jr/dhXZWo/1z93OuwAjH
ukvTv1YKrUbQiNxXU6ouG31wcWIQ2OEiJDixI21b0SlCDM/DdScNvdMEeuXHbn3Z
RISoDAELFB6vaKL0CK30xLyutIqEwBbMStMZ1AM3XCXjgbYUGQ9c1jdqzggHBMZu
XCuVb7yJY00mdtuGjBJ78M6t1hRqrul4StkWTaaFpHixZfIGvtAaxTYegpvLZyhC
gIJ6x6msArxltESowM8RA4ROO/Zl/pCYehhBe/4YiBTm4OfGaZVZButjOmQo9kkW
HRZI9+Ih66naPVlqziXigVdl4QmtZRpNsOwbKmyOs+xOkWGSS9+8p0noiZ6OCJMz
IDTJaKZEdXo0TWm1KdZZY/RE/ay7SlXxMbkk9TzZz5C82leTZqQ=
=BJZ1
-----END PGP SIGNATURE-----

--yjokk5ssqiev3463--
