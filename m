Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FD93FB7DD
	for <linux-man@vger.kernel.org>; Wed,  5 Aug 2026 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922282; cv=none; b=HkaKvAoAMyA3/HwycgKDaa7iJUDSSGDPVSZ6/En8d33S2tPAgrBtpZQGM5RUIFapuuQvAkCablBq2T/bUGdG6dSz+9jHMiraZ7mIEO83wCXKgcOF7qJwL5v1BrazgJ25wlXp3hHKpqk3iDD2qXX679SDSIokNcFbB+a/d2xPACQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922282; c=relaxed/simple;
	bh=AIBUN4yOxacEGDxNong43lW8l7dIVVZYNfQ37Sz3ySQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oLH7WJH1GS4fgR16179ig4vF8qc61XEyf7HFKydO8gMFVxBAvibnwjsHhKPW4uAbd9anfzJ+92+oK+WOwEZ7+qY6wjoMn03966SiURHkezyC4JEBJ1akGe1vLguJvLkgoSuednSqXKuPVOm7f1GRDt8g06qDWoIBppjdCBiKKu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me; spf=pass smtp.mailfrom=aarsen.me; dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b=QBxtLETG; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aarsen.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b="QBxtLETG"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hFQC82ZCpz8v34;
	Wed, 05 Aug 2026 11:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aarsen.me; s=MBO0001;
	t=1785922276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P2JAHov78H2M6DwmJRLTu36+b3Zv3/BttMgTGG4+now=;
	b=QBxtLETGp8cyE8Ex66O7snCA3TelPcPUmKADML4DlO77wPo5JpxbEJJjIugwFwnDdMC3Z5
	u4WBKr/ZRu9CTNNmodDWZDU7b30/M3yd9jnVabKYgcg48XpT2JQGpOt+avhgt/CXrp7Ov3
	JoGpmIE2wPqb1VfpQVgz8F9xLJGqrFTcW5WJDLezw7Md+i+1oWyUayvgwqEFHKjeHpXTPx
	CPN5zPn6ualQj7DW3qxWk6Ejg1BgN09XWAd/ax6ipjh9M4dXi0MSPuy3QzMgc2xKNMCDkn
	Ct4VvRFisphh8IFzv93q4Aj1C/Ut3q8Zoj6lEVZ6LX6d0L+uUAkmJ/pe6xkeZQ==
From: =?utf-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: Collin Funk <collin.funk1@gmail.com>,  Sam James <sam@gentoo.org>,  "G.
 Branden Robinson" <g.branden.robinson@gmail.com>,  "Maciej W. Rozycki"
 <macro@orcam.me.uk>,  Paul Eggert <eggert@cs.ucla.edu>,
  linux-man@vger.kernel.org,  bug-gnulib@gnu.org,
  libc-alpha@sourceware.org
Subject: Re: The goal of the Linux man-pages project
In-Reply-To: <anIaZ8X_73ZjmYtR@devuan>
References: <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
	<am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me>
	<20260802231058.o7gud4bd7co2nbhv@illithid> <875x1sp0h2.fsf@gmail.com>
	<am_TTjDLlAI68zkp@devuan> <87h5lb9u8d.fsf@gentoo.org>
	<8733wusj68.fsf@gmail.com> <anHVx-xWLmL7SPyM@devuan>
	<8633wtnaw8.fsf@aarsen.me> <anIaZ8X_73ZjmYtR@devuan>
Date: Wed, 05 Aug 2026 11:31:11 +0200
Message-ID: <865x1ohq1s.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Alejandro Colomar <alx@kernel.org> writes:

>> >     man/man3/: Put first <string.h> in SYNOPSIS, then comment about <m=
emory.h>
>> >=20=20=20=20=20
>> >     This is a compromise between the fact that <string.h> is the stand=
ard
>> >     header and (only slightly) most portable header file for these
>> >     functions, while hinting at the fact that it might be more appropr=
iate
>> >     to use <memory.h> where possible.
>> >=20=20=20=20=20
>> >     Remove the STANDARDS and NOTES about this, since now the SYNOPSIS
>> >     contains all the necessary information.  The extra info is in
>> >     memory.h(3head), which is linked to in the SYNOPSIS.
>> >
>> > What do you think?
>>=20
>> Why, though?
>
> To help guide programmers to understand these APIs, and consequentially
> be able to write better code.  That's the goal of this project.  It's
> the Linux Programmer's Manual, and its purpose is that programmers on
> a Linux system are able to write correct programs.

First of, this doesn't answer the question I asked.  Why should this
change, even the "compromise", be done?

But, ignoring that this doesn't answer the question posed, how exactly
is hinting that it's "more appropriate to use <memory.h> where possible"
accomplishing the goals of the project you've stated there?

It seems to me to just sow confusion.

I think the references to <memory.h> should be confined to a single page
that documents what it is, memory.h(3head) or whatever, which should be
honest and say only:

  <memory.h> is an obsolete header.  It exists for compatibility with
  older programs, and is implemented as an alias of <string.h>.

This makes it clear that the header is never useful, and that it's
strictly redundant with <string.h>, in a way that still lets someone
reading old code discover it.

The latter, of course, being much more widely used, and standardized.
The former being used only to placate pre-standard programs.

It seems to me that your intent was also to standardize memory.h.  In
this I also see no benefit.  string.h can't be split at this point, nor
can the real memory.h installed by libcs be shrunk by removing str* from
it.

I'll skip the rest of the philosophizing about the purpose of the
man-pages project, but I will add that if the Linux man-pages project
starts diverging from harmless standard practice to promote
idiosyncrasies, I'll have no choice but to caution against relying on
it.

>> I think that, in the thread, it was already demonstrated (by Bionic
>> having an empty memory.h for a time) that nobody includes <memory.h> on
>> its own and expects to see these functions.
>
> This is part of 'factual information', which is only a secondary goal
> of this documentation project, as stated above.
>
> The purpose of this change is to help form a mental model of how these
> memory and string functions relate to each other, and how they behave.

The mental model is certainly not helped by prominently featuring a
long-dead headers which may (or may not!  as seen above) contain
declarations from <string.h> (which is a header you consequently have to
include anyway).

>> (not that Bionic is that
>> widely-used; a better test would be checking something like Debian
>> codesearch)
>>=20
>> As I've noted before, what header provides what declaration is also
>> largely inconsequential.
>
> If it is largely inconsequential, I expect this change shouldn't be as
> controversial as it seemed to be.

It is largely inconsequential how a declaration is obtained from the
perspective of a programmer for reasons I've stated before.

The act of *documenting* a long dead non-standard header as a header
that provides some function has a consequence, that consequence being
that now a long-dead non-standard header gets included far more
frequently.

This means that its only effect is a detriment.

I think it's a far better idea to start emitting a warning when it is
included, to indicate that it's an obsolete non-standard header.

>> So, the only effect of this can be to create new cases where <memory.h>
>> is included, for no gain.
>
> I don't agree with the 'for no gain' claim.  But yes, the first part of
> the sentence is certainly true.

There is no gain, the programmer can't tell where a declaration comes
from, and this include is strictly redundant with string.h even on all
the various Linux systems.

>> It doesn't really matter that memory.h is only slightly less portable,
>> IMO.  It is unused, to the point where Autoconf recommends not using it,
>> and no longer bothers checking whether 'mem*' functions are also present
>> in string.h.
>
> It doesn't really matter that it is unused.  What matters is that it can
> be used just fine, [...]

Can it?  I don't accept that premise.  It's a non-standard header.

> [...] and will help --IMO-- understand these functions better.

I don't accept that either: I see no way in which understanding benefits
from this change.

>> Is suddenly reviving a dead header to copy a few declarations of
>> functions well known to be part of string.h into it not just unneeded
>> churn?  Especially as program code would (nearly?) always need to do:
>>=20
>>   #include <string.h>
>>   #ifdef HAVE_MEMORY_H
>>   # include <memory.h>
>>   #endif
>
> Are there any systems without <memory.h>?  We've been seeing in this
> thread that most systems have it.  Even Microsoft has it.  I bet most
> programs can live without that conditional.
>
> I'd say most programs would be portable enough with this:
>
> 	#include <string.h>
> 	#include <memory.h>

And even more of them can live with:

  #include <string.h>

That said, I imagine that many systems do have it.  After all, it is
quite cheap to run the following during an install step:

  echo '#include <string.h>' > $(DESTDIR)$(includedir)/memory.h

... but, I also would not fault a system for not having it.

We could check what systems have it and whether any do anything besides
including string.h.

Or we could just avoid prominently featuring a long-dead non-standard
header.
=2D-=20
Arsen Arsenovi=C4=87

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQECBAEWCgCqFiEE/uKz0RP8AKMWLWBhUsKUMB6ixJMFAmpzAt8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRGRUUyQjNEMTEzRkMwMEEzMTYyRDYw
NjE1MkMyOTQzMDFFQTJDNDkzEBxhcnNlbkBhYXJzZW4ubWUACgkQUsKUMB6ixJO2
awEAtZy4AJ2a0RPxNYHaBnvLLqIBfaFDK0YhF+YJICTe34UA/imv1HB4K3J11JXG
jFVkYaOXmtoi9R2EaC2dHvaUuRgI
=bhgf
-----END PGP SIGNATURE-----
--=-=-=--
