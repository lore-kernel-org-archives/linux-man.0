Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE2C2D3725
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 12:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785585894; cv=none; b=aPliPX31tCYMsFPvkrNpttfDdzRVqsrnpYQszXEYHtUB2XS0XXYmi8of0z+N9T1nLDU4IGGoSfJ6bz5fQIz2ZXSOJ5nOR8FHuIO644ZXZSW26T7nCRJTchGkAM0soNusN8qv75yTt4ROX+FHbERax3Q1oGwvMtWOnXpkiaSDOng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785585894; c=relaxed/simple;
	bh=EKKAq7WgtngscEunSt6entmpWRV2vdveR3EehIV0Uf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSdpCfBLBWDqyBZoGcKWf69m5KabZL8rqI4XRxLoguexLW4eHu5wt2HwO1MrHgfg/kE9kwpQ9W3J7cKob1DSJyoyF29OONvU5aru6jVMXnCnDZLPWznXQZH4Er4vO+fmVF1GmcboDjxh0j03S6yFvZ+HOIAu98l7pDGFPYDzk+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+s7qaB4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+s7qaB4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A871F00AC4;
	Sat,  1 Aug 2026 12:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785585892;
	bh=UgSt/OmHO1D48MYNN4rGEw0vfmJ0MR4+EWifT8Ci0qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B+s7qaB4JI3jwi3DuFnoYpsPJ6BRa9wRikKRxqKb53JIuaNNQEl5/iZVgUmZp+4Ih
	 TE2NkXxSrgZAnKXx5mycK5AGtvwVKhCbpa2HTWFy5RRHKimudwm+Yf/TPfg6S27mL4
	 +YmA9h24/NsR0dQjEprY86VhfXm4NDKCThmgmG70KM4nabb4AJ2GqGyQ3bq7hwBLzg
	 0wso8MlKvpwGV94zw+QaDG8tlhIJVVKJdq4KiDQYSwdQNFYjugkPxtdFQtsZw/alJC
	 wtpgJ2gDHpoIFnxWehogXCE84gSKMYy+pAVl/7Q6SGDvUpNwg+r0e1pXIiYyb3690O
	 ciNL7oiVpq3rA==
Date: Sat, 1 Aug 2026 14:04:47 +0200
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
Message-ID: <am3ghmLcSp0BQTf2@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yvue56tu46u2ewmq"
Content-Disposition: inline
In-Reply-To: <am3XeGZyi1Pvr77-@devuan>


--yvue56tu46u2ewmq
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
Message-ID: <am3ghmLcSp0BQTf2@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
MIME-Version: 1.0
In-Reply-To: <am3XeGZyi1Pvr77-@devuan>

> Date: 2026-08-01 14:01:39+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi Sam,
>=20
> > Date: 2026-07-31 22:59:47+0100
> > From: Sam James <sam@gentoo.org>
> >
> > (*) Alex has a history of making opinonated changes like this to
> > man-pages, such as removing references to older standards, and using a
> > somewhat novel (to many) syntax for prototypes.
>=20
> I think this comment deserves a well thought response.
>=20
> "Opinionated" is your subjective knee-jerk way of saying it.  I don't
> agree with it.
>=20
> I'd say I have a history of making changes based on thorough revision of
> history and technical merits, even when that research is contrary to
> decades (or half-centuries) of common practice, and possibly to
> current or withdrawn standards.
>=20
> In this case, and I don't mean this specific patch set, but the years-
> long revision of string documentation that I've been carrying out, we
> have a conflict between the design and correct use of string and memory
> functions, and their common use today.
>=20
> The functions that are most subject to this conflict are strncpy(3),
> strncat(3), and memccpy(3).  But the rest of strn*() are also somewhat
> affected, and the rest of mem*() minorly affected.
>=20
> They were originally designed for a specific use case for which they
> were great.  This knowledge has been lost in time, and I've been working
> to recover that knowledge.
>=20
> Precisely because of standards and other documentation that isn't
> written with the level of care that I have, we have decades of misuses
> of strncpy(3) and strncat(3).
>=20
> Moreover, it's in other places that you should be complaining about.
> GCC has a bogus set of diagnostics about strncpy(3) and strncat(3),
> which we could very well call opinionated, and I haven't seen anyone
> reporting them as bogus before I did.  Those diagnostics have not been
> considered opinionated, just because they follow mainstream (bogus)
> usage of these functions, but they are indeed forcing an opinion of how
> these functions should be used over other uses that may be more uncommon
> but which are actually the original and correct uses of these functions.
> <https://inbox.sourceware.org/gcc/30a77019-ded0-fe3b-d0db-6c77842674db@gm=
ail.com/>
> <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D123024>
> <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D122963>
>=20
> It's curious that you called the GCC diagnostic "heuristics" instead of
> "opinionated".  There's nothing about heuristics there.  It's just an
> enforcement of an (incorrect) opinion about how these functions should
> be used.
>=20
> And since C23, we're seeing that the same story is repeating with
> memccpy(3), which was once a niche function that was great for
> implementing fgets(3), and now is misused by everyone and their dog for
> copying strings with truncation.
>=20
> I have spent probably more time than anyone in the last 5 years
> researching about string handling, and have proven the correctness of my
> research in the shadow-utils project, where most of my work has been in
> revising string and memory handling code.  I've fixed uncountable subtle
> bugs in such code, and have made the resulting code actually readable.
> And the number of accidental regressions is minimal (IIRC, one or two
> regressions related to string and memory handling, in all that time, and
> not too dangerous).
>=20
> Thus, I think it is my responsibility, as maintainer of the
> documentation project most read by C programmers, to let our audience
> learn what I've learnt in these years, and allow them to write safe
> string- and memory-handling code.
>=20
> It is thanks to this years-long research that I've been able to gather
> important knowledge from people like Mark Harris, Doug McIlroy, Branden,
> and many others, who hold knowledge that few other programmers possess,
> and spread it to the world.
>=20
> I'd consider it a negligence to do the easy thing and follow what
> standards say, or what most programmers do, because that's what has led
> us to the well-known mistakes that C programmers make.
>=20
> FWIW, regarding the possible conflict of interest that was mentioned
> yesterday, I'll say that I don't get paid for my contributions to ISO C
> as a member of WG14.  There's no benefit to me other than public
> recognition.  I'll also disclose the exact quantity that I've been paid
> for maintaining the Linux man-pages project:
>=20
> 	110 kUSD in 2025 (from 5 sponsors)
> 	75 kUSD in 2026 (from 3 sponsors)
>=20
> I'm convinced that that doesn't have any effects in my decisions here,
> as I've had a consistent record of decisions well before I had any
> economic benefits from maintaining this project.  None of those sponsors
> have expressed any interest in favour of these decisions (nor against).
>=20
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
>=20
>=20
> Have a lovely day!
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es>

And of course, I'm not dismissing that I may make mistakes in early
drafts of decisions, and sometimes take decisions before thinking
enough, but I have a good record of revising my own decisions when they
were mistaken.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--yvue56tu46u2ewmq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpt4N4ACgkQ64mZXMKQ
wqnNoQ//bB3usvwsegkwoAv5+QPW9URP4tklsK9DQ4tvN/SA2uHaJzDwyJK0QkN2
mBNQ6DMp+4PTAmXKShPRX5KepPH1IqI5+dbGMpZed75pQFGOvEyPCDdI8mvDGWQH
zq+2AIh8NZUJAaWKzWy0YslbyJ9Gd2lElFBznPIniXiH8O8xxsxZ7Ut1mRFZZJ+F
q7yoz+sVQzS4oM6w+ewqF208Z5QgdzKBQL7Q1ySWg1sa91N1g2z0x710SFFCdvcz
p51LcbaGMpLV9QQNOv82qjuPuEGtf1V0NkqjrhktOJhCoWPPJlGVozPoie4VIimM
U5JvwcsQM7z7shrViGUntN/YYMLnN/2mGN7AywRbJjJybenDvwsKVWP99RnG95Em
AhMqFzgeovV0b60gvg1jkSvafA5XhhiiqbMGexbnBmPaYNU66TXgy4uPF10zz3Mg
Rx0jiPiMLQpZ+MVv8Oga1DJwQ/OcbPEbf3bd5baF2xaRS/c3qSShXgtwk4PFDMcJ
cEsjR3kdG/hefftKYuB2zh7MaDQC3bFhM9/g8j9hd07+IPBTPJUdNzxOe0To30Ve
h3cRyKzbZHb4qcTHIJ5h+cc8P9e/cgzbxACDzL08ZBKvS+oSOxB/6Ehm7SUQ0F46
fLpjA8+23q3tDZOFdWbOfluDCZiAX8/PuUqEac6Km0hDXCa4vnM=
=PXeI
-----END PGP SIGNATURE-----

--yvue56tu46u2ewmq--
