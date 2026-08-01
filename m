Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7021A6834
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 17:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785604184; cv=none; b=msbr2EgZaVWJ5GMbmI5kY0O6zYFk8A8QsMRN042u1qqvHkd8awMIuaFUjYaVVkYvrB+19WNw0T1KnswZ9ouEq4zLayM854V2IXRZwcYGA/GE0LfuIvrLgvyklRrOiQgGjMiZU4X6IUXuRQbzMhkrJ4qm1QT0iKOQT+3U6CZY0ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785604184; c=relaxed/simple;
	bh=oi+v4Pi/inxCw0nUs2l0ax8Xh6LxU6MnC0I3z/5IwNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hemMZBeUYHGOK0AAuu1w8E1riQJvJzqf8TH71zLItPfdvQSg0Y8zLhLRpCCscAyyvsmnN/SZW+bNHm2a+wBZwYEutnVvJ0h4IlivfZN2PqJoSSCRaDJa1W/6AxXHU2hYXQ8U6CO4EkqdT9Efig2VPnV0IaKTsn8L2AQjjxrQPNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAmP1B+3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAmP1B+3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1D41F00AC4;
	Sat,  1 Aug 2026 17:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785604182;
	bh=t1bTW4rlh9IdByWSDSwWoHecp50HZIdkwbePShau1Hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NAmP1B+393G6rx+86wv5OSwoXE8kF8P+OGIsayAFQ5zGXK805MawBcYWs13ZyftDr
	 ZWgrvjtCMcAKNUGjDnV4/Lu0g0b423YdqhODGA0HtnwubjK7KQO993cJ2DmEY/mCzC
	 HpN3uIaz2fkjrMEMHxDqn2b4IJ6pd78G+gihFthyGDqQN2ntndQZ0JfS9JB1ZJgvfk
	 33C6tPts9RZWEAe5ii2TzXrpKXFge/w8mnRfmg2stTxwaF+DTUfNT39KZ5fBH0G4tN
	 RK6J9FHbBCpliys/Krjl/HCmpWWtXJgNf3kzb9XrTwOkej+/lI2D7jxjhASNlk6TRp
	 YB0TDE/4Psacg==
Date: Sat, 1 Aug 2026 19:09:36 +0200
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
Message-ID: <am4jxBOh_VRvhCQw@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v65stnq7chdvcaaa"
Content-Disposition: inline
In-Reply-To: <87zez5bz49.fsf@gentoo.org>


--v65stnq7chdvcaaa
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
Message-ID: <am4jxBOh_VRvhCQw@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <87zez5bz49.fsf@gentoo.org>

Hi Sam,

> Date: 2026-08-01 17:10:30+0100
> From: Sam James <sam@gentoo.org>
>
[...]
>=20
> I think the previous man-pages maintainer behaved differently and people
> have come to expect that style of management over the years.

I know Michael, and still have regular contact with him.  We have
a sligthly different management style in some topics, indeed.  Not
saying any of them is better or worse, though.

[...]
> >> I do complain about those, and we finally got some consensus on the GCC
> >> side on not warning about a bunch of them by default, even.
> >
> > What do you mean?  And why have I not been CCed in such discussions,
> > after being the original reporter of the problems?  That kind of issue
> > management is certainly worse than what we're discussing here.
> >
>=20
> ???
>=20
> First, it wouldn't make sense to CC every reporter of such a bug
> involving middle-end warnings on such a thread.

I'm not a random one-time reporter.

> Second, there have been several such discussions on the ML and at the
> GNU Cauldron, the most recent one I'm referring to being
> https://inbox.sourceware.org/gcc/CAH6eHdRfEVsGjbJ__kU5AR9BfVdLQZ_iGGDZa=
=3DyQnT4fgG2P6w@mail.gmail.com/.

I'm not subscribed to gcc's mailing list.

> There have been (many) others regarding both the FP nature of the
> warnings and also growing consensus on IRC and the MLs when these issues
> come up that some of them are too opinionated in addition to being
> heuristics-based. Some of them are based on style that shouldn't really
> be in the warnings (or at least not on by default if so), and some of it
> is inherently prone to false-positives, some both.

Attributing those diagnostics to style is wrong.  They are based on an
incorrect understanding of these functions.  Style is whether to add
spaces after a function identifier or not.

It's not a matter of false-positives either.  The entire diagnostic is
*always* unconditionally wrong.

> > I believe that even though I may disagree with others, it's good to hear
> > their opinions, no matter how convinced I am that they're wrong, and no
> > matter how much they'll blame me for taking bad decisions.  Feedback is
> > (almost) always good, even when it's negative.
> >
> > What exact changes have consensus in GCC?  How can there be consensus if
> > you haven't CCed the relevant people (including me)?
> >
>=20
> See above.
>=20
> > In any case, I guess it's good if GCC will improve.
> >
> >> > GCC has a bogus set of diagnostics about strncpy(3) and strncat(3),
> >> > which we could very well call opinionated, and I haven't seen anyone
> >> > reporting them as bogus before I did.  Those diagnostics have not be=
en
> >> > considered opinionated, just because they follow mainstream (bogus)
> >> > usage of these functions, but they are indeed forcing an opinion of =
how
> >> > these functions should be used over other uses that may be more unco=
mmon
> >> > but which are actually the original and correct uses of these functi=
ons.
> >> > <https://inbox.sourceware.org/gcc/30a77019-ded0-fe3b-d0db-6c77842674=
db@gmail.com/>
> >> > <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D123024>
> >> > <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D122963>
> >> >
> >> > It's curious that you called the GCC diagnostic "heuristics" instead=
 of
> >> > "opinionated".  There's nothing about heuristics there.  It's just an
> >> > enforcement of an (incorrect) opinion about how these functions shou=
ld
> >> > be used.
> >>=20
> >> The warnings are both opinionated
> >
> > Thanks!
> >
> >> and heuristics-based. I'm not sure how
> >> you could read the comment you linked to as somehow an endorsement of
> >> the status quo,
> >
> > I don't read it as an endorsement of the status-quo.  Just a diminishing
> > of the fact that GCC maintainers, just like every other project, have
> > opinions --sometimes, like here, wrong opinions--, and they affect
> > other programmers that try to write good code.
> >
> >> I've been quite vocal about changing it elsewhere too?
> >
> > I'm not aware of anything that has not me in CC; sorry.
>=20
> I wasn't in CC yet I came across this thread. Should you have CCed me?

I did indeed CC bug-gnulib@ and libc-alpha@.  I could have kept the
discussion in linux-man@, if I wasn't interested in hearing from you and
other people who are likely to be interested in being aware and sharing
their opinions.

And that's also why I CCed Joseph and other people explicitly, as they
have expressed opinions about this topic in previous discussions.

I think this is a good guideline:

       Please CC any relevant developers and mailing lists that may know
       about or be interested in the discussion.  If your email
       discusses a feature or change, and you know which developers
       added the feature or made the change that your email discusses,
       please CC them on the email; with luck they may review and
       comment on it.  If you don't know who the developers are, you may
       be able to discover that information from mailing list archives
       or from git(1) logs or logs in other version control systems.
       Obviously, if you are the developer of the feature being
       discussed in a man-pages email, please identify yourself as such.
       Relevant mailing lists may include:

> (No, I don't believe you should have; this is what mailing lists are
> for.)

I disagree.  But that might be a difference in project conventions.  The
guidelines we use here, which come from Michael, and are similar to the
kernel's ones, are to CC people explicitly when they might be
interested.  I'm aware that GCC has a different tradition in this
regard, though.

[...]
> >> You can have a conflict of interest in responsibliity without money
> >> being involved.
> >
> > I'll continue to think about this and other concerns, and may change my
> > mind later.  At this moment, I believe I'm taking a technical decision
> > after hearing enough experts and researching the topic more than anyone
> > for several years.
> >
> >> even when consensus seems against it.
> >
> > I wouldn't say consensus against; just a vocal number of people that
> > disagree.  I wouldn't say there's consensus in favour, of course, but
> > when there's no consensus, I have to take the last decision.  Most of
> > the time, that last decision means not doing anything, but in this case,
> > it's different.
>=20
> What would real consensus against look like?

Well, Keith Bostic wouldn't have suggested that I do this change, and
Branden wouldn't be defending that it might make sense to make this
change.

A vocal majority is not consensus.  Consensus would be if there were no
significantly different or strongly opposed opinions to those of the
majority.  Even my strong and sustained opposition against your opinion
already means there's no consensus against.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--v65stnq7chdvcaaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpuKEoACgkQ64mZXMKQ
wql7/RAAqqODmtSXEWhzGIOusAZYni3+3p80JL3vbMdH7PexSr8e5h9ZaNzYE3oD
+KRYQDPwuWf1AZPXzM31W2vHSNMT/CASHlWBOV3UY8qIO6frYcSWGU8mmooB59Ji
y/ibN/qynMY+SGoF7LgLsmT+T1x58wz4KsoQOYx3lDPavUvscLbe0TQUt6sKQQWq
TRXF6avnxBD6WS+tckbyUmgBQa0m0cR5kREBS7NViDD6QF9/Qy9K/xjDuoN3N1d4
aPpRvoB0uvFZyakNQN2v0qnHrr0kct4lVfyJCYdNssNRLD/w5Da3ZPVEYLDq1P6+
VwrLA93FM6MJPQCE1HBTSoSa9DRXBxea5mT//JVHXsR5GToXwfKAHOIlxqL6lqkw
gK9mMQvXilkXBhVGQOdBFDyf6gYtftfFfZgKYmCNzujNPhLWKgUxwUGpvD4ZN6X9
E8eGar3OxIRGeoiwnO+j58f+DvwIh3l1Ff32fEYmeWFZRYTUmzB111RFhsERfNG8
T8CPMX4pmxyWLS27+arw/WtIcDM04+Vl/+peRYBwxeWMH2XhfwgyPx75yi5If+Xd
aOS60l2QCepTifJuhC6pN0Ds7Ax8zxjACWETDjhSaVlAiO2gvVcWd7Cs3fcVEePz
yGJrH32VJW3cb35GXs1F2KCkqC/HC1ta2wkQSPDbogvIN7KSfMk=
=86Q0
-----END PGP SIGNATURE-----

--v65stnq7chdvcaaa--
