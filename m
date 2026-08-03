Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D7630E858
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 15:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771303; cv=none; b=nGtimojjdvP/8Olj7/s9B+ZHPP9FLvKkHM6v/axb+n1jXcEaRo4UAA2WIAkPoCjbO9/7hg7Kk3JVIp7nruEO2/5nwDzpZaLajFGXdVJxcYx5gYAOFI6fGtOTRhsvQg5YD1AzO7EP4BqKeW3Trenfv/Bb+b86UmgVWtl1Zq+BMMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771303; c=relaxed/simple;
	bh=iW9I11OXFEZNUUEjcB4xTnMbry/nfXlVXFR6lAL7j4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZu4Zvou7/VshICvluan70p9jkndaTlOJdZ7yne2gKMMLBS1V6k5dopJeHAlnDFSdVL/IvtQieqLPHxEMcI8pKOd54GRUmEBGjaK0jv180vw/d7V2LMigqtC9E3feQKa156ZiTMbsLGYzR4TL6t0S1ufpUZf7A3wdLIQpxDpwfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBfZ3d8h; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBfZ3d8h"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81f52945098so437177b3.0
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 08:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785771301; x=1786376101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H4tXanIHaP9iOLQGuv7vd545245PgO09gqYG4sA7qaY=;
        b=pBfZ3d8hHX6WPRLe8ki0tSf1ZLN0pZiBaCcZfJ/7e0T0jE+bsrYmtWh+7BbYB64NHw
         CsWl7RxM8vJg5sqwszFfbk3pIWZ7bT7Wnaz9dTELkmMAqI4WRaub25VUiZ5wxj2u3pIX
         NRJfY0Uvmp/oQsURbiOq6uRacB5FOrFrZ3v9zkeELpzQmeMJ4ca9WJFJbHc7YBFKdyU8
         OszFnUxqRmt8L5+Xl6igKVzmiJvGXXgRpOP/nVee00+uECXLLyWsGHO2VJZQIX9rzL+W
         Usx5jLOzJ1n8fSJjGv/pm25bO1AcUAI0Yx4bW56AnEHfuFzCnilRM2Py8p9Cj8VwYxMe
         V9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785771301; x=1786376101;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4tXanIHaP9iOLQGuv7vd545245PgO09gqYG4sA7qaY=;
        b=KSxsXm7Xa5geK8sQi8at9hOL41Ynw+qAd3sw6NNdK0h/aXL3etETC5YhFsEvc+Rii2
         AJ05EneRGq2Jfzoj/sJodygr+acJFjOvYtnTQ5Zrg2a/W0ZGM5MPRPRdawLjA3aShfZj
         sYqdev2Y+U2piTYpmCS1nJzWF11URif3/7yeS3S2LX+laz0pN2t2b4N2fY/DlW8xlQSr
         yyAGgLiUM1MWWHXamp9B5SZ2sXLC+8xiT5oIKuFimZhD+6aEasTzGLI49+dYhH7IwbAU
         zc/DrPRpxniMa4v91OfFgOg8NIQEDLO+jOZGGUGKEaE8cHWVd49/qwvFqas3W77thC+e
         jEtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2HYTEqSo38fLfe5qFRO5l2aGil+/clgC38Lwt/+9yOQMWbGp4BKWKf/9KLz4u7qNWsS3f5m35An8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuoVZ/hjJWo9beI8nYT71kXb60nowBPTEI/xHK7GF6JSayC81O
	sNS+prdRK+RoDROyv8JYvOj5QiB4Z8qUvV74RHUiPgm6lIINtw65XHsv
X-Gm-Gg: AR+sD11sRWHsMSTudm5WggC3tit4bRkE9ot1m4nVW41GZ1PocmUS271v2E4iHd/3hV/
	EkBS78CYg7o97PcuytWJ3f+5refEgzcbS8vUEABTjesQJk7wxezo+1Jzv1CEmVv8ml1V8ctuOAi
	tgOgaPqpa+uVUbca17C2EXVFU20rEc0yT0oOUeyrtoNrlH6GYuQS9uNUZiSIq85iOqLctq1BXUo
	1pchEQ7fmXq6zs06pHQi8qzMmt1l372O+x9TvCOJJvsbv2PU8kEfSJhnq74ppIp9lfyv1+d3l2a
	GAFui/Rm8oNFq8AvkpoX9V55f3309Cd+1KfmJz1YgaHdY/JcN9+xHozClsPWtmvctCxI8YaYy/w
	ZzsS5CeJ/odeTUoSp8qz/oJFUhdkSvO+R4svBc5PFhayAMFap4dwWmPV3B17lS7zvy0z6OBe8En
	bMRsGMiP2777QHKo1VoyFwd2Rd8+USbftTVdY752NCd8Rwl1UUEw==
X-Received: by 2002:a05:690c:e05:b0:81e:6d03:40d2 with SMTP id 00721157ae682-81fd4ed034amr138371417b3.15.1785771300631;
        Mon, 03 Aug 2026 08:35:00 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd14658csm57390887b3.45.2026.08.03.08.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:34:59 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:34:56 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Sam James <sam@gentoo.org>, Collin Funk <collin.funk1@gmail.com>,
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org,
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <20260803153456.taj7qvj7csiyh43r@illithid>
References: <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
 <am_V3bvOiH9TaJQW@devuan>
 <20260803020908.efqt5ilkcjq4z3yz@illithid>
 <anCAeQ5YNwXwSTWA@devuan>
 <878q6n9u4v.fsf@gentoo.org>
 <anCmfRDpkhSErjkS@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="flkxvvxrlbkhw4xh"
Content-Disposition: inline
In-Reply-To: <anCmfRDpkhSErjkS@devuan>


--flkxvvxrlbkhw4xh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: the Linux man-pages as an educational tool
MIME-Version: 1.0

At 2026-08-03T16:40:26+0200, Alejandro Colomar wrote:
> > From: Sam James <sam@gentoo.org>
> > Alejandro Colomar <alx@kernel.org> writes:
> >=20
> [...]
> > > [Collin Funk] doesn't need to have read every word of the glibc
> > > manual, but this precise text he could have read it, because it
> > > was mentioned by Paul in this thread (different subthread) prior
> > > (19:28 UTC) to his message, and reviewed by me also prior (20:31
> > > UTC) to his message (23:27 UTC).
> >=20
> > I often reply as I go rather than reading all other emails around
> > that time. I don't think you should assume he read those emails and
> > deliberately neglected their contents.
>=20
> Me too.  But eventually I respond to those other emails, and rectify
> when that new information conflicts with something I said with
> incomplete information.  So far, Collin didn't rectify.

But does he _need_ to?  It's easy to have imperfect knowledge.  We all
swim in ignorance.

I advise against personalizing this conflict.  And even if you feel
insulted, there are hazards to injecting honor-based cultural patterns
into technical forums.

I'm deeply familiar with a region of my country that practices such
patterns, and I was still very young when I got heartily sick of it.

https://en.wikipedia.org/wiki/Culture_of_honor_(Southern_United_States)

> > > Also relevant is the fact that he accused me of "slowly"
> > > documenting "personal preferences".  His wording implies that it
> > > wasn't there before.  Maybe I misunderstood, though.  I'd be happy
> > > to rectify if I was wrong.
> >=20
> > I think he meant in general?
>=20
> I don't interpret that.  I guess he can defend himself and clarify.

Again, does Collin _need_ to?  Would it meaningfully advance your
objectives if he did?

Some things can be permitted to drop.  You can always pick them up again
later if someone tries to press your benign neglect to their advantage.

> I only see my style slightly different than Michael's, but not
> necessarily in the sense of involving a more opinionated approach.
> See the other messages where I've shown how Michael had done the exact
> same thing with strlcpy(3) a long time ago.
>=20
> On reconsideration, and after researching what Michael really did, I
> think I was wrong saying we have a different style at all.  I believe
> we've had the same style.  We just had different topics of expertise.
>=20
> Michael has had his own share of opinionated comments in manual pages.

You might be completely right about all of this.  Maybe people have
beatified Michael in the rosy glow of hindsight, and overlooked his less
temperate statements.  (Some day, they might do the same of you.  ;-) )

But I don't see how concern with this matter materially advances the
objectives of getting good advice to frustrated or curious programmers
into the Linux man-pages, and of making the C Standard Library more
comprehensible and less painful to use.

A suggestion I've been meaning to make but have struggled to find a good
place to inject is the following:

You've spoken multiple times of about 5 years of your work hammering as
hard as you could on the various memory buffer/string interfaces of
libc, and how much of the benefit of that work went into the
shadow-utils project.  And I believe you because I've caught fugitive
glimpses of that work over most of that period.

So I recommend, hypocritically, that you engage in a practice that I
struggle with:

Promote your work.

What I have in mind is an article, say of the length that a guest
columnist might write for LWN, working your way though a selection of
the most frustrating or fascinating issues you encountered.  To a first
approximation, every C programmer believes they know how to use these
functions, because hey, how hard could they be?  Illustrate the hazards.
Show how the na=EFve assumptions fail.  Point to how you solved them in
shadow-utils (or elsewhere).  Then, as your grand conclusion, show how
your proposed reforms to the C standard logically follow.

Circulate that piece, either to a few reviewers whose judgment you
trust, or on the linux-man list, possibly marked "[off-topic]" or
"[meta]".  Engage your reviewers and let them improve it, as Paul Eggert
did by pointing out the multiple evaluations of one of your macro
arguments.  (Even if it didn't matter in that case, it's not a great
pattern.)

Does this require more work of you before going to WG14?  Yes.  But at
the end of it you'll have an artifact you can point to.  It can be your
personal FAQ for this subject.  You can mine it for future N papers.

You're doing a lot of work arguing with people on these mailing lists,
too.  So think of it in terms of opportunity cost.  With a "Hard Lessons
Learned from string.h" paper, you have an artifact you can point to--
one that is almost certainly going to get read by more people than will
follow hyperlinks to mailing list disputes.

And like an N document, an article can be revised over time, whereas
with mailing list posts, your errors are burned into the ground to
embarrass a person for all eternity.

=2E..except for the fact that correct and incorrect claims alike are much
more often utterly forgotten.

Regards,
Branden

--flkxvvxrlbkhw4xh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpwtRkACgkQ0Z6cfXEm
bc693hAAsDHqCvKEcnBfydsJXua8rAcLUljVMNipthxDHnmRCHI3tc8MywpO1b87
4VfAbh/Gv1qJzv3pUShagA/Swaa1w0Rj67Sc8wB0li7Lo38G9tBQGBs9Ombn4AlE
VtHrDTFW+GE1riNEgV1NibkIZyFeyaDbNGodnttT/7W60Ft5KKstF5yU5ACv7Pxe
rJWCL8qeUKxDBNf/Eo91HKjDkyUAumaPHhvS4Z6U+LrMGtX78a7mZCB7Yu4tQXhT
+CHkvY4wlQexUT6FsQnKkoCDRIzRzXW5Hrsgx6xOMb+91TAEkHsYV8qA+2zNSkKe
wfyNerofn5uOmDMLYVUInaqCVo6iOZKc6VJfWSrOditJwOiu/QlcWv8cHLypxmGy
nk5FLomU0rnKsDtClmtSdCIKTpaS6NxQu74VLFLM8anLhNnKSZ+Hk9z2qdx08iJQ
SiIWiPZjtUF6IDW5YWsxgZKakBGfYh4hvp2XOzOsgEXlChl1hyDSPYOrl3LP51qU
YNSe+chCd1UMN9mO/jM4lunVWhcDZh7Zthhu3yXwApouHKX5AHqcJgfoUQyUxLuc
idue36/wXyT/sugHqnW7Q040uSvacp9+amZnnEeXTqaeKY9KfLhhhHZLgWWMAw3B
9M4+oTu/QPcSR5HIy2NPOwjs0F5UVc/PUVILIFGHuC44Z91+lE8=
=F1mx
-----END PGP SIGNATURE-----

--flkxvvxrlbkhw4xh--
