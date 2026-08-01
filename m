Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8162DF128
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 21:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785620066; cv=none; b=XsCwYtKaWR4y/TCHEgf6YnIiE0642b/Z8CpRCbg7cY2bGyRkW02lv24KVpb5xNMJgSEQOPBHZkboCYCYRkjChur2SPGMINPdVG16HRrP3IVHUpHhbuAb4Gc+wEvoSby7X1arFTbBoMK9MhZlCNMpGUxpbDnRH1CPlaO+p74bPzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785620066; c=relaxed/simple;
	bh=HkP1blV6CphUu5u9ixuhjrHMJzfMqhxHJyRRWRqexkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6bJRMogniK3hgPqP0ZzDBfKHGXy3sz2FOauu7lqdB8pFBf4SMUuGPLoJKUrdlUXq88kOA4EhMfqtL+kBohy8ZdwJ63vxJhBb1GOwf6n79apqVsqRGULvOY/I6UXyTzRlJG0VIjIot3rzZnY8+XhWF1W2TVY41S9ZT1qk3As/Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HafEJ3Pg; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HafEJ3Pg"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81f52945098so37820307b3.0
        for <linux-man@vger.kernel.org>; Sat, 01 Aug 2026 14:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620064; x=1786224864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zG3UW+CjlE0EqC+xKjarsMiOazagf4uR09H3LuesNcY=;
        b=HafEJ3PgCDfnLdueLpjen0MNMfQhB8P/bdN6nzzvQ7Y15w0SocBUmNG/YgoPZ35GwG
         H2jyx6x0RHBwvmIYH21KqRYI6UKBuDaHA7Cshh4v3AjotZGtwo1R8VfYfteThKxmZ60s
         4SYdJHeW5LRuY2wOYbfPHFyZnaD0pbJVXo5OHy0ub31/gPf2yq5qTgFG+vHQl0vFq03H
         DPKN1urPjiuPowSM3oSsgO+/yqzsHrRg9jFcjiiH/tsq4CMvG8ZBV07SUGVyyEDWdF9S
         AnLXapdViZMU0J1uLB2ddsezw3XlFsgMjtnFHPboOJUX+ACh+ysC6EjbqlqoMkqKcT51
         nZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620064; x=1786224864;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zG3UW+CjlE0EqC+xKjarsMiOazagf4uR09H3LuesNcY=;
        b=iLM85Lkj2K4/sK1X4/UqfezHigdQPNV/pJATzzL/8nYTwSQGeYIYxVBfg5O+cmtJS2
         PY+WrryLxy06CcBKoHMkGL0jgxEB/vJxUrnUr3VKqGk0XzQbVjrBCpQYchJkR2ABaf4L
         T5JTUBQEI9so5Z9Pwho2Jf8io8GXxXmFO+qVSk+AzIfdax/eZBp1UU8cquj9t0fcgnJL
         EHMZbEpYi0fvkuFwCRINJt1A2QSg33JV3nJMGdl3E9GO+UFlO9l5zrAIViffPYdjIv4e
         5wEw1DQf26nXpyCXa5zcRb9BA/FBc5niOlglZvO7H+/95a/JSwwU/Pxv6mLpnmzEH1yU
         TSTA==
X-Forwarded-Encrypted: i=1; AHgh+Rpq4Rk8IqNWLS3wWtKNkGwIYF7gLIJHiYbITRTVNwyd2TmRHG0fwZMxHXTQwYtbXiCul0X5xMx8HVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL2IZVHNwcLTvCUs+ukiF2SzXdM3xRjOUHpR4HUUJ7l+O63U4H
	m9MUOl5r5PbYs7jpJOkBc0QiQkZW30ah4GzP0baX1vAXJ8SgVJnxnmAH
X-Gm-Gg: AR+sD13z/2j97uBur9RQ1q2Z1O7InizGfQ3p3o6BxBUTURFWz0avJgP+DumFeJw0UH0
	WyRMBXNxu/P0/26RJtrAmaddqi9Hzx3NPn7LyBEkBzFpqhXSn4yw4yESDoG2VyhhXQNP7ujp3om
	YWXLah24a7Mx4K6en2XG8jG6NSrOL7zseQjMa+UDqC024018cbV0Up4vv9C5IW9Ml5MtpueVbwF
	Nd6sh2lmNjWLybd406fJFC+VLyPVzojQStOAKeSHPl0a/xEvmHo2vHizCFuZ3GYW5uvpj+Nop0L
	KXmq/nEqiHOS1S0CH+RympdS19FIIWUpdYJtdSumXOAUEY8MEZRJ30qRK6+ZV8R713v6i9vz+Tm
	tmOMbCZsWR4hN8+JnvVUucLtpfojCe7hGkaU43bVXchYBJb+TQ4iOqZnSiRwKhq8NlhZtYjJlt8
	+b6tJhJcFxZcWR8iu0uQYSJ/0EHfjPDd8onqKBZnzSm9hr8yOUS1WCCEb0wSb5
X-Received: by 2002:a05:690c:4c0f:b0:81e:d001:e0ca with SMTP id 00721157ae682-81fd4ef9154mr74365997b3.17.1785620064183;
        Sat, 01 Aug 2026 14:34:24 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd164474sm30287857b3.48.2026.08.01.14.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:34:23 -0700 (PDT)
Date: Sat, 1 Aug 2026 16:34:21 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Sam James <sam@gentoo.org>, Joseph Myers <josmyers@redhat.com>,
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>,
	Mark Harris <mark.hsj@gmail.com>,
	Nevin Liber <nevin@cplusplusguy.com>,
	JeanHeyd Meneide <phdofthehouse@gmail.com>,
	Christopher Bazley <chris.bazley.wg14@gmail.com>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Iker Pedrosa <ipedrosa@redhat.com>,
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>,
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org,
	libc-alpha@sourceware.org,
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <20260801213421.7e3wvyjwmlwxzd55@illithid>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="52lanksjzzli43hd"
Content-Disposition: inline
In-Reply-To: <am4jxBOh_VRvhCQw@devuan>


--52lanksjzzli43hd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: on the irresponsibility of pursuing C language reform
MIME-Version: 1.0

Hi Alex,

At 2026-08-01T19:09:36+0200, Alejandro Colomar wrote:
> Well, Keith Bostic wouldn't have suggested that I do this change, and
> Branden wouldn't be defending that it might make sense to make this
> change.

I'm flattered to be mentioned in the same breath as Keith Bostic!

> A vocal majority is not consensus.  Consensus would be if there were
> no significantly different or strongly opposed opinions to those of
> the majority.  Even my strong and sustained opposition against your
> opinion already means there's no consensus against.

"Consensus" is a word that gets abused a lot, because it has multiple
definitions.  To some people it means "unanimity".  To others, it means
a majority vote with potentially many abstentions but no (or
proportionally very few) negative votes.  From reading WG14 minutes, I'm
vaguely aware that it has a rubric for reading the straw polls they take
when voting on N-papers and related motions.[1]  I invite a member to
cite a resource laying out their actual procedures.

I don't think I'm voicing a controversial view when I venture that
Michael Kerrisk administered the Linux man-pages with a more settled
view of the APIs it documents.  By that, I mean that he tended to update
its content with a retrospective view of matters that were no longer in
contention.  If some controversy brewed, he tended to omit it from
"coverage" in the documentary corpus until the contention resolved.

Your approach is a little different: you're more ready to give the
reader a view of live controversies and unsettled matters troubling the
C community where these intersect with the topics man-pages(7) covers.

Neither approach is better.  They're just different.  I think Sam is
right that people had many years to get used to Michael's approach.
=46rom there it's a short--but logically unsound--step to associate
"familiar" with "better".

But, if you're going to document unresolved controversies, how do you
avoid putting a thumb on the scale?

One way is to solicit review of that coverage for even-handedness--I
do not say "neutrality".  List pros and cons of competing interfaces or
code idioms.  If you do that job correctly, _reasonable_ partisans of
the various contesting positions will find no cause to criticize.
(There will sometimes be fanboys who object to the "opposition" getting
any coverage at all.)

Further, with such lists you do a service to the engineer who must
select a means of solving the problem confronting them.  The engineer
often knows that problem better than anyone else does.

Next comes a trickier bit: what if you yourself get involved, even while
"wearing a different hat", in one of these live controversies?

Your first line of defense is your own ethical conscience.

Another, as I suggested earlier, is to solicit one or more volunteers to
serve as "deputy maintainers".  Prepare a list of man pages or sections
thereof upon which you are "conflicted out", and ask the deputies to
field all Linux man-pages business regarding those pages/sections while
you have business regarding those interfaces before a vendor libc and/or
the WG14 committee.  It will likely be obvious to you what vehicle can
communicate these areas of deputy maintenance--a man page!

I intuit that Michael had a hard time finding anyone to take the mantle
of Linux man-pages maintainership.  It's a huge job and demanded someone
of your unusual resources and energy.  By opening deputy positions that
are limited both in scope and in time, nobody need worry that they'll be
expected to eat the whole elephant.  If you find such volunteers, then
you'll also be spreading expertise and socializing personal investment
in the success of this project.  That's good management!

Finally, to return to the question of consensus: a potential point of
development in Linux man-pages project governance is to _document how
you measure consensus_.

We'd be unwise to determine consensus by measuring who writes the most
words (hi, folks), or with the angriest tone, or who has the most
impressive job title at the biggest company, or who can shut down a
discussion most coldly or derail it most effectively.

So tell the members of this community how _you_ measure it.  Put the
burden on the critical and the concerned to find flaws in your method.

Regards,
Branden

[1]  I'm not sure WG14 uses the term "motions", and I haven't seen much
     evidence that they use Robert's Rules of Order, with which
     Commonwealth people are likely not familiar, let alone
     non-Anglophones.

--52lanksjzzli43hd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpuZlUACgkQ0Z6cfXEm
bc4K3w//Tj3bJlwxaH8XPPDskyQzipFgUPqhdbWBI3aN2LXHXGhEfwV2J5rXB6Eo
oeOQrBvtf9mKrrfrUzyNShUCUsm4Q4VoU2/7w2cZjWcekv09A9iT44GOw1ornWiD
IKeFuUxXmFblT//nnwS0cLdvo1bq+VKShLNk8LHMSTKOqKWGk9NDtQDY7bVmY9gc
ZkK6LfDObs4xHvqH5wn7rVRjRJfMJLzJVR0OgwcOjHvxlxyZfsyV4WVAhBUlrT9B
1o+c6xqYT59qWbaL62mDmnvQzVwSyWPJxfXlTXuskCcEKW8JrIZCMIdlEMp6GkSJ
scWgL+yHUAge2U6oo+yhjNmKM/Ry7xWUSs3HSCw8qsRdkqxyECZNqBDJMgKoVu5d
1JDFMjrR617E0kCpR5wiCXSgzyvmmH0jwW9ZoZjh+IVTbQ129kz0N722UuKxZcZc
EyhAGKvSayixwZwea9GS/qBtoA0CF6C5OiSQCk1z41lStQybVOIRIxWnwiR13Qnt
vOALZrSScykHjUVMOftM0qQ+PpLSyc2jZx5kq2PtsCOiTmc8fMXZj2QnHCsf4k93
I47w4fwloNpd/OFWlsSksPbTA4TjhswCY6KFVP5a92FkA354pkF8TbJwaK4lWeFu
lPLHnS2sHSPmnMQ9OpvDFfrvTEBIpMGmpCugQ+265sI72WujiBc=
=4cu0
-----END PGP SIGNATURE-----

--52lanksjzzli43hd--
