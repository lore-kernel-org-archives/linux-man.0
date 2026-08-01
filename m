Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA582E1F06
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 12:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785585700; cv=none; b=UyjYcGOVUbp5gSYCzp7PO0fIdlzTHZ7XOaKCiI3n4xBwLgkxRXayS2KtE+17BZv4d9eWTh/Mbiit7e4pggbdC7/vEDltNlOxeYCwnfJpJ1AsWUYVgavaOjeAwD9Qqrhybcr0b55ECshrrBBXZJgvcMFjZF4W8cqr8FBPo6xJyx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785585700; c=relaxed/simple;
	bh=iqWOfgXSOVjmhic73mFafr+SOixSCMHxlkzRvN8iRPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Br4G/4XTQ6HKLi7GBOHTwpzAieFM4w3Ej4vuxnw7MmNp4RsWyTflwbTJaTDkjQohP8zO2R6M97g1z2Ng0TXgyAnecwpb0xN4rHke/PuYG6jhvA3N6Y+Mzjwg5EF/xOwZlQTAZ1RUGdk7yjCE7rZZYRagDeHuYNVbORVv+PeSivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OU+y9PR5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OU+y9PR5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF161F00AC4;
	Sat,  1 Aug 2026 12:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785585698;
	bh=A400UfDCs85UdvQBq7Fc6ZOBiYnZqCfIamlfrPpoJ+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OU+y9PR5v73OfkD2X7lefLHBAHV86hrXGtHqTsDcweXa9nrdgtj/rYeG7C/Y8I8uh
	 zh0yFHjeeuRuH8nOxSl/VMOYYpb00lmpg042+mHtBHwtOADw+ItDhSDYAGck/PwPoP
	 mY8KQd9LFnF9I9Bd/O/bcgrmsIuIsQ+h5SomLCfntcLAzcU5z6oUBmL8ChyHudko5H
	 MZyWaju4l1PckpUdc9VSM/TCE+zBEk3Ui5heGrTRUCPSXVmRo3yd3oKBJMGHQnDFrf
	 74WHRHUKK2DYTyej0IqdpYycCqF02g3CvCaudCuoBB6HXL5NMTRINnmJky/IaFshOe
	 Vx1JtU5vrp5nA==
Date: Sat, 1 Aug 2026 14:01:33 +0200
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
Message-ID: <am3XeGZyi1Pvr77-@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c3bde7guneclziki"
Content-Disposition: inline
In-Reply-To: <87a4r6es6k.fsf@gentoo.org>


--c3bde7guneclziki
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
Message-ID: <am3XeGZyi1Pvr77-@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <87a4r6es6k.fsf@gentoo.org>

Hi Sam,

> Date: 2026-07-31 22:59:47+0100
> From: Sam James <sam@gentoo.org>
>
> (*) Alex has a history of making opinonated changes like this to
> man-pages, such as removing references to older standards, and using a
> somewhat novel (to many) syntax for prototypes.

I think this comment deserves a well thought response.

"Opinionated" is your subjective knee-jerk way of saying it.  I don't
agree with it.

I'd say I have a history of making changes based on thorough revision of
history and technical merits, even when that research is contrary to
decades (or half-centuries) of common practice, and possibly to
current or withdrawn standards.

In this case, and I don't mean this specific patch set, but the years-
long revision of string documentation that I've been carrying out, we
have a conflict between the design and correct use of string and memory
functions, and their common use today.

The functions that are most subject to this conflict are strncpy(3),
strncat(3), and memccpy(3).  But the rest of strn*() are also somewhat
affected, and the rest of mem*() minorly affected.

They were originally designed for a specific use case for which they
were great.  This knowledge has been lost in time, and I've been working
to recover that knowledge.

Precisely because of standards and other documentation that isn't
written with the level of care that I have, we have decades of misuses
of strncpy(3) and strncat(3).

Moreover, it's in other places that you should be complaining about.
GCC has a bogus set of diagnostics about strncpy(3) and strncat(3),
which we could very well call opinionated, and I haven't seen anyone
reporting them as bogus before I did.  Those diagnostics have not been
considered opinionated, just because they follow mainstream (bogus)
usage of these functions, but they are indeed forcing an opinion of how
these functions should be used over other uses that may be more uncommon
but which are actually the original and correct uses of these functions.
<https://inbox.sourceware.org/gcc/30a77019-ded0-fe3b-d0db-6c77842674db@gmai=
l.com/>
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D123024>
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D122963>

It's curious that you called the GCC diagnostic "heuristics" instead of
"opinionated".  There's nothing about heuristics there.  It's just an
enforcement of an (incorrect) opinion about how these functions should
be used.

And since C23, we're seeing that the same story is repeating with
memccpy(3), which was once a niche function that was great for
implementing fgets(3), and now is misused by everyone and their dog for
copying strings with truncation.

I have spent probably more time than anyone in the last 5 years
researching about string handling, and have proven the correctness of my
research in the shadow-utils project, where most of my work has been in
revising string and memory handling code.  I've fixed uncountable subtle
bugs in such code, and have made the resulting code actually readable.
And the number of accidental regressions is minimal (IIRC, one or two
regressions related to string and memory handling, in all that time, and
not too dangerous).

Thus, I think it is my responsibility, as maintainer of the
documentation project most read by C programmers, to let our audience
learn what I've learnt in these years, and allow them to write safe
string- and memory-handling code.

It is thanks to this years-long research that I've been able to gather
important knowledge from people like Mark Harris, Doug McIlroy, Branden,
and many others, who hold knowledge that few other programmers possess,
and spread it to the world.

I'd consider it a negligence to do the easy thing and follow what
standards say, or what most programmers do, because that's what has led
us to the well-known mistakes that C programmers make.

FWIW, regarding the possible conflict of interest that was mentioned
yesterday, I'll say that I don't get paid for my contributions to ISO C
as a member of WG14.  There's no benefit to me other than public
recognition.  I'll also disclose the exact quantity that I've been paid
for maintaining the Linux man-pages project:

	110 kUSD in 2025 (from 5 sponsors)
	75 kUSD in 2026 (from 3 sponsors)

I'm convinced that that doesn't have any effects in my decisions here,
as I've had a consistent record of decisions well before I had any
economic benefits from maintaining this project.  None of those sponsors
have expressed any interest in favour of these decisions (nor against).

I'll rumiate a bit more on these patches, and probably make minor
changes to them, but the essence of documenting <memory.h> for all of
mem*() and strn*() in SYNOPSIS is most likely to be eventually merged.
I'll be careful to document what the standards say in a way that isn't
confusing to users, and also in general will try to document it in a way
that is positive for our audience --even if some of that audience may
have knee-jerk reactions, like you are having at the moment--.  I have
also received very positive feedback for other changes for which some
people have noisily had knee-jerk reactions.  I believe it is my duty
as maintainer of this project to do this change.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--c3bde7guneclziki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpt4BcACgkQ64mZXMKQ
wqm9cQ//fe6IbTYSL3noVUzUotmmrhr5ZP2ZOChmcz1DuQgMh2zdSZha3R/Eds5u
Dx1SVNxo95qyMKklb9QQWYDoa/VJji0MVUC+HSs+HD0ovPAwq/Cg9WIX8D5OgTz1
bV+fu5b1bzzOZzQ96Utn7Nd3qWkvfg2hu8EjUqkjO3Xh67+FOwpC3yqtLhUAnDPK
ycN8Cohz/tyRIQBTURzYGa6OWolmeHUtBoWZH+RVLIXQ/aNbZ3tiX49LdX6vAeyZ
/TtJ9GDUNp7RvcaY3KzaQTSOK36cLTcO593Yb2vRLfGcnhSIqDGhiVWI2oTsSdrw
VMQTYjJlItIOmPXx7T2Q4/WeGvNMGcwNbyRc5dVv0t3KL1eOqUkUx/GWrqhFp7EA
bZIkhP9zOKw54EbdHvfKjOvASMxffxa+m6DIeOhKMYIPQxF9u7Cgfwn9u68suKwJ
SrCP6uLeERSqTs4oyn0zGjrNZU7Kl7+hR+gY+VDTBlcFcgqqe2JHvj1yp1sK7mkk
xNC+hYYntb3pFKJQkdsQL2OcApXQJjdeG6xEfxYXXnF45TzW0Xo8GPkBWojarROd
lLKfPxlI9kf0IfGRLeVw/op9g7HUCao4N0mDifATd4umiCwy/1SDY6YK4cZnWvln
z+Ig01hvQO+ofOGryhhSZy++TkLcPsBd/FkIdgUlipUM4efqjb4=
=tTWf
-----END PGP SIGNATURE-----

--c3bde7guneclziki--
