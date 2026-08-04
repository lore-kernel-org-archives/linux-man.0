Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37956390609
	for <linux-man@vger.kernel.org>; Tue,  4 Aug 2026 17:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785863792; cv=none; b=Gqdtw3wYx3mHerZGe2JPBk7yZMn/nk0IPcyNmr3B3vhqcqaWXnIk+aDNswSPHMYZ/vSyi5rZ6E00XnnrQP0U+LZCFTZlg7gznEd6QN0MHFfaT3YYINq2r6mgtcJkz0fbfsgz2sBtUk43v51V6bqcN+iFBa9V0626j9IWWxNhwTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785863792; c=relaxed/simple;
	bh=RzlawbkzjSYFPLs/+Lr3VkP4HuYq0QNyo3UjXQpfKzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UscPIaO+4FBXLe/AhlUAClezHuzETr9WJgZmuyoyLR9Iqijaa7J2j+hkVD61Y1d+QZ1aS1+bu5WLrpLV4HxjMRbIPFMQApeOVgMVOaqzh/F47FipfmCkb88TQPZw3Yuuw0IUZ0wf2Yd6BXxiJFRrxx8rhleFaiENuy7Fi1ZfGsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKhY7/w+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKhY7/w+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311171F000E9;
	Tue,  4 Aug 2026 17:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785863782;
	bh=NHX0O/lu/qRnC8WKppCWlRPoEk5eSYw5guzuvF1d6nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LKhY7/w+Li1tuFvJbY+HOiVRUTAG3VUqJeyNOG1BEo4zgDbeMccGbJ2wZ97959Uqq
	 1sKM7H+9uuv9WrhNlx/Nyodhbv00IPzQd3xtgYVNKPDLjR/TcFstw3Knpd9dVEubM1
	 7j9iZEAL+veW0hjE0ue8kd2AQN/7nSgjQfN8nCpki3FV2EpkX+ZyWWu+fpMRefMV+7
	 3KUo3ukjophE5wtuw+GwPSiWdxSLsHuh0KTgvwlMGboKp6WnFc8abQhRVrnRBJL7YK
	 VJLw3A7qBu28z9swg8nwOvmcR8Z82rF6m8yN5Zd2AYKelY+7GX5T3TNFGoW20AJNul
	 ulohYnFpr2wxw==
Date: Tue, 4 Aug 2026 19:16:17 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>
Cc: Collin Funk <collin.funk1@gmail.com>, Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: The goal of the Linux man-pages project
Message-ID: <anIaZ8X_73ZjmYtR@devuan>
References: <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <87h5lb9u8d.fsf@gentoo.org>
 <8733wusj68.fsf@gmail.com>
 <anHVx-xWLmL7SPyM@devuan>
 <8633wtnaw8.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gpuz3szwi3h65jnd"
Content-Disposition: inline
In-Reply-To: <8633wtnaw8.fsf@aarsen.me>


--gpuz3szwi3h65jnd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>
Cc: Collin Funk <collin.funk1@gmail.com>, Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: The goal of the Linux man-pages project
Message-ID: <anIaZ8X_73ZjmYtR@devuan>
References: <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <87h5lb9u8d.fsf@gentoo.org>
 <8733wusj68.fsf@gmail.com>
 <anHVx-xWLmL7SPyM@devuan>
 <8633wtnaw8.fsf@aarsen.me>
MIME-Version: 1.0
In-Reply-To: <8633wtnaw8.fsf@aarsen.me>

Hi Arsen,

> Date: 2026-08-04 17:49:43+0200
> From: Arsen Arsenovi=C4=87 <arsen@aarsen.me>
>
[...]
> >     man/man3/: Put first <string.h> in SYNOPSIS, then comment about <me=
mory.h>
> >    =20
> >     This is a compromise between the fact that <string.h> is the standa=
rd
> >     header and (only slightly) most portable header file for these
> >     functions, while hinting at the fact that it might be more appropri=
ate
> >     to use <memory.h> where possible.
> >    =20
> >     Remove the STANDARDS and NOTES about this, since now the SYNOPSIS
> >     contains all the necessary information.  The extra info is in
> >     memory.h(3head), which is linked to in the SYNOPSIS.
> >
> > What do you think?
>=20
> Why, though?

To help guide programmers to understand these APIs, and consequentially
be able to write better code.  That's the goal of this project.  It's
the Linux Programmer's Manual, and its purpose is that programmers on
a Linux system are able to write correct programs.

The purpose of this documentation is not, and was never supposed to be,
a technical specification of the implementation.

Branden asked me yesterday:

| Date: 2026-08-03 11:09:02-0500
| From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
| Message-ID: <20260803160902.5edjmpxaqr5uudbu@illithid>
|
| What is the overall mission of the Linux man-pages project as you
| conceive it?

Here's my reply.

A programmer should be able to write correct code.

A piece of documentation that describes an API in detail --as if it were
reverse-engineering it from its binary code-- but doesn't tell me how
to use it correctly is useless.

Let's take an example.  Here's the description of strncpy(3) as of
man-pages-5.05 (right before my first patch to the project):

     The strcpy() function copies the string pointed to by src,
     including  the terminating null byte ('\0'), to the buffer
     pointed to by dest.  The strings may not overlap, and  the
     destination  string  dest  must be large enough to receive
     the copy.  Beware of buffer overruns!  (See BUGS.)

     The strncpy() function is similar, except that at  most  n
     bytes  of  src  are  copied.  Warning: If there is no null
     byte among the first n bytes of src, the string placed  in
     dest will not be null=E2=80=90terminated.

     If  the length of src is less than n, strncpy() writes ad=E2=80=90
     ditional null bytes to dest to ensure that a  total  of  n
     bytes are written.

Okay, we have an algorithm.  I'm sure you can implement strncpy(3) from
that description.  But what is it useful for?  Why would I want to call
it?  How do I even call it?

The page even continues with an actual implementation.

     A simple implementation of strncpy() might be:

         char *
         strncpy(char *dest, const char *src, size_t n)
         {
             size_t i;

             for (i =3D 0; i < n && src[i] !=3D '\0'; i++)
                 dest[i] =3D src[i];
             for ( ; i < n; i++)
                 dest[i] =3D '\0';

             return dest;
         }

Well, if someone misunderstood the reverse-engineered description, now
they should have it clear.  Still, as a user, I don't give a shit about
any of the text I've read.  What is this good for?  How do I use it?
Should I use it at all?  This is the 'Linux Programmer=E2=80=99s Manual', a=
s the
page says at the top, but as a programmer, I don't know what to do with
this.  How am I supposed to write programs in a Linux system?

Branden continued with more questions:

| Take some time to draft one, if you haven't already and I missed it.
| Here are some points you might consider.
|
| *  Is delivery of factual information more or less important than
|    advocacy of correct methods and accepted idioms?

I continue with my reply:

Factual information is useless if it can't be interpreted.  The only
thing that matters is that the programmer is able to, well, program.
Of course, the program should be correct, and as safe/simple as
possible/reasonable.

'Accepted' idioms is something that doesn't strike me as an
unconditionally good thing.  Back in the times of Galileo, it was
accepted that the Earth didn't move.  Good documentation might need to
exceptionally reject accepted idioms, even if most of the time they'll
be good.

So, maybe correct methods would be the priority, with accepted idioms
and factual information being secondary to it.

> I think that, in the thread, it was already demonstrated (by Bionic
> having an empty memory.h for a time) that nobody includes <memory.h> on
> its own and expects to see these functions.

This is part of 'factual information', which is only a secondary goal of
this documentation project, as stated above.

The purpose of this change is to help form a mental model of how these
memory and string functions relate to each other, and how they behave.

> (not that Bionic is that
> widely-used; a better test would be checking something like Debian
> codesearch)
>=20
> As I've noted before, what header provides what declaration is also
> largely inconsequential.

If it is largely inconsequential, I expect this change shouldn't be as
controversial as it seemed to be.

> So, the only effect of this can be to create new cases where <memory.h>
> is included, for no gain.

I don't agree with the 'for no gain' claim.  But yes, the first part of
the sentence is certainly true.

> It doesn't really matter that memory.h is only slightly less portable,
> IMO.  It is unused, to the point where Autoconf recommends not using it,
> and no longer bothers checking whether 'mem*' functions are also present
> in string.h.

It doesn't really matter that it is unused.  What matters is that it can
be used just fine, and will help --IMO-- understand these functions
better.

> Is suddenly reviving a dead header to copy a few declarations of
> functions well known to be part of string.h into it not just unneeded
> churn?  Especially as program code would (nearly?) always need to do:
>=20
>   #include <string.h>
>   #ifdef HAVE_MEMORY_H
>   # include <memory.h>
>   #endif

Are there any systems without <memory.h>?  We've been seeing in this
thread that most systems have it.  Even Microsoft has it.  I bet most
programs can live without that conditional.

I'd say most programs would be portable enough with this:

	#include <string.h>
	#include <memory.h>


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--gpuz3szwi3h65jnd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpyHmEACgkQ64mZXMKQ
wqmiig/+MUQ1J2cFkrQ1zIFjpBQtG0KGaaE1RGoODOpbBjTFZmbqq2QPU5VwP57e
vyA93uXfLFAxCtSpKp3VU2a9EPTdjYcE3lMVSfP144ul9fAker0JkqlHS/fLDvmi
sf3bKVjcZcPN+/6TT2EA80GCFhbYJ9ZFe3XAaAmL+JZzssvi78PffNs23Bt/kFsg
PR2zJwbmm7J8O3whBXracx+LgkLcdze/R7qsC0PPmCGdHONvevqf2xNM6NdWCI8G
dUz9AxV7b6lAXHmDj+AOqUuETT3T8eUDUwkIOp4JSjalEINCaPweMn/EBGx5l2yl
oM+k3rX+7gHHjYFMyBDQ5UHk87YqFWXSV11H22ed9aEZwPR7/QMNhqnYbmk8RYpk
L5tLZkPm0HOaoyDFhk8CVKTABM/MGvIgpIAREEVrSc3t8k+KtNfbIxezo1IByWI3
cGi0aheuU0V32T0IhbJwSVuooYyorYE4sFF7L0O5FXtI7uW8mcDpiZEakGloweeh
zdY8G9W93+9MThlZ1vIZMteTTPIIeIIqTvi7kG6+AuCkPbPyyzl/xeHcWVaJiu6h
VT8blRtHo+5SoqUOgDkQlVrFzwcRSBYwq8GuAl6S5JR54s8zJjVk8lAC+ggSJ0ww
z6AsHWtejiVv95/peOGe2p8W1AkfQ7KvQKd1hAU2IKWGt4O8Qmo=
=tAYB
-----END PGP SIGNATURE-----

--gpuz3szwi3h65jnd--
