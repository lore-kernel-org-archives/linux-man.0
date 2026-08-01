Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2DA212F89
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 14:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785595390; cv=none; b=KJ83UllzonzcbjawAU5FBcWs3TDWD0JbpQtSorz069T8cNxt/aXYXUYivD5gMR+5aRNXOjN6cbCYvlFJBIpuqhdQKpOGhZjD7M8UF1VruAXJdzytmVvV91FLHPaHI+XvNxhCHyw/uQX4xnlUrCIc3412kwTLFxzX9rPo9kb0PwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785595390; c=relaxed/simple;
	bh=OJlYEunTU/zrf1Erq0A9ewuh9apgL3IiMDfznoawTzI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KO3wTC6leRmDHPJedkj/3sUeNlkmuSF09gvYgR+sjnw3bCmPyWlH26cpRgE69ngwob7n+xt0skLJaAkbQHIpgVPJBgik03jbkvMjeFfTY8hexsGzUe3T+pg+MdSs2u/ph7zVKG08gyXaqSXdBLgQuQ0VZQcjwGADc44lZRHRMlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (c.1.a.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::a1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 778A9340F8F;
	Sat, 01 Aug 2026 14:43:06 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: Joseph Myers <josmyers@redhat.com>,  linux-man@vger.kernel.org,  Keith
 Bostic <keith@bostic.com>,  Mark Harris <mark.hsj@gmail.com>,  Nevin Liber
 <nevin@cplusplusguy.com>,  JeanHeyd Meneide <phdofthehouse@gmail.com>,
  Christopher Bazley <chris.bazley.wg14@gmail.com>,  "Serge E. Hallyn"
 <serge@hallyn.com>,  Iker Pedrosa <ipedrosa@redhat.com>,  "Evgeny Grin
 (Karlson2k)" <k2k@drgrin.dev>,  Kees Cook <keescook@chromium.org>,
  bug-gnulib@gnu.org,  libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
In-Reply-To: <am0dFT38yXK_ch_o@devuan>
Organization: Gentoo
References: <cover.1785532392.git.alx@kernel.org>
	<784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
	<e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
	<am0TUn55P7uNtTTh@devuan> <87ik5uesfg.fsf@gentoo.org>
	<am0dFT38yXK_ch_o@devuan>
User-Agent: mu4e 1.14.2; emacs 31.0.91
Date: Sat, 01 Aug 2026 15:43:03 +0100
Message-ID: <87pl01dhqg.fsf@gentoo.org>
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

Alejandro Colomar <alx@kernel.org> writes:

> Hi Sam,
>
>> Date: 2026-07-31 22:54:27+0100
>> From: Sam James <sam@gentoo.org>
>>
>> Alejandro Colomar <alx@kernel.org> writes:
>>=20
>> > Hi Joseph,
>> >
>> >> Date: 2026-07-31 21:23:35+0000
>> >> From: Joseph Myers <josmyers@redhat.com>
>> >>
>> >> I think it's irresponsible to use the man-pages project to promote=20
>> >> personal idiosyncratic ideas like this in preference to what's been t=
he=20
>> >> standard location of functions since 1989.
>> >>=20
>> >> I'd rather we add a mandatory deprecation warning to memory.h in glib=
c.
>> >
>> > I hope you don't; it'd be a gratuitous breaking change.
>> >
>>=20
>> Yet this change has the same effect, just people will see it themselves
>> rather than the compiler telling them, and go around sending patches to
>> change it.
>
> IME, people don't go changing includes unless they need something it's
> not available in the already-included header files.
>
> Analysis of includes is quite complex, and there are tools for that
> --iwyu(1)--.  As long as those tools don't start complaining --and they
> won't-- [1], I find it quite unlikely that people will start changing
> includes in existing code.
>

OK, that's useful behaviour. I wasn't aware it accepted a list of
headers that would provide it.

> This is rather something that will affect new code (new source files).
>
> [1]	iwyu(1) works in a way that it allows a number of headers to
> 	provide a symbol.  If no header provides the symbol, then it
> 	will recommend the best header for it; but if a header that
> 	provides the symbol is already there, it won't complain.
>
>> The man pages should reflect what the standard currently says, not what
>> you'd like it to say.
>
> Not exactly; the standard is a good guideline, but sometimes it's off.
> We have vendor extensions, which are well documented, and when the
> standard is bogus, the extensions take over the page.

I think we have different views on the purpose of man-pages and users'
expectations of them.

>
> FWIW, the information from the standard is still there.
>
> 	$ MANWIDTH=3D64 mansectf STANDARDS man3/memcpy.3 | cat
> 	memcpy(3)           Library Functions Manual          memcpy(3)
>
> 	STANDARDS
> 	     C11, POSIX.1=E2=80=902008.
>
> 	     ISO C and POSIX declare this function in <string.h>.
>
> 	Linux man=E2=80=90pages (unreleased) (date)                   memcpy(3)
>
> I've just removed it from the front of the page (SYNOPSIS), but it's
> still there, because of course, we must document the standard alongside
> the extension.
>
>> We had the same problem with e.g. stripping "C89"
>> everywhere.
>
> Sorry for that one; it was a useful change, though.  Now we have better
> manual pages than we had back then, regarding standards.  I hope you
> realize about that.  It triggered discussion, and a careful review of
> the text, which resulted in a good change after all.

Yes, we got there in the end, but it was very disruptive, and caused a
lot of pain. I am not sure the right lessons have been learned from it.

>
>> People want it to reflect what the standard says.
>
> And it still does.
>
>
> Have a lovely night!
> Alex

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmpuBfcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkHOB
AP9KwAIyv2vYEGxBoN+FMx2NW3faGH9/efNQ+rhbiqiU0wD+Mjrr8Y9FVzx/Njk2
KAfEIkUGDhDAjH216OExoR1Z0gQ=
=J7bc
-----END PGP SIGNATURE-----
--=-=-=--
