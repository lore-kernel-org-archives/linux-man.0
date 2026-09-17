Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ABE4B0E27
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 23:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686149; cv=none; b=Uh5ExyC0s3vxEq7+TbUbqwhtVDTlHMIBbrHKOvTHfxPAYvquxFUq9TV72+6Mxlk2XmadDv2szbxeZc5+0nNCuTSWCergjiiNFVseyxEP0LO9ovhNTiRVXN0uv7H4Kt1ROB0CqbvzWmgP17PLHGSTXu7CoBjRAUj9DJSjzJa71lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686149; c=relaxed/simple;
	bh=bndByk+GmceIlB+wm/8RwEh+eZbwIKajBXRfBSiHb8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ky6tfK/ACqzVfl3Rk0DY9R7asXOgCR0P/iK6FFIE5B9GAqCAFy/Hwy1TGSADJ5NB5znAfOBiGQMGkWWj/dW7VT+EEKhA1vy0pPwlspcipzcE7ujwHcD32AH9q3tpR/soD+Wl2M56XOWIdOT87kmjA1FU7RgAlXWN4uTGfB/Iorw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puPCpAZZ; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puPCpAZZ"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43daa8f4so974587b3.3
        for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 16:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789686145; x=1790290945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2FFhQ506JlqBKHjbySqYGun6hRKS08Aw7rHSzIlJOwU=;
        b=puPCpAZZaQVGKhUbeouBzmugkywg4iNREtcKrEM9jv7eMQWaRW0sOgN6QBwOMCc+mb
         17Ku8jzcISfdMM5KZDW1LI7iaqSGg0Wa2k+3eCOG1F63DCBHJMxjIjNmmIEmc+x4Zwr9
         Xgvwf6IJN5aokGrvKoGVgmZMrkO+FJ2pGHP4egm4w79eomYstOcEZgNuXpFG4z3NuoyF
         uKAAUqY+7VnFfIGElPEEY3kTvmRtbJ1EIE28Kfoe7/4nTHAlTq6DXLW1sp3b0s5fyaUF
         1J+YYyGVNasbkgIEnuuaD83wA2RYmIYeY3SyyzSQIiFq0KKesiLjoaRYi+7FKmWxCe/h
         EDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686145; x=1790290945;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2FFhQ506JlqBKHjbySqYGun6hRKS08Aw7rHSzIlJOwU=;
        b=oJpRYmUAj4EI86KuvttiD+koYODvCVTnF1i6kriCPNNaao6siS+OU7HuPPPNyA4sFg
         m+5RIsJou55Py7mbn/k+302XpujsAMpyPdnGwYTnAIC1SHtPG3uKl+RbtRyw+ekLsoPa
         95uWejYOmRq8hRF7UQM4dcnEqO0vuzFrI+fZ0v1mUNyUjg0ZJT3bHxgsq6h4sgd9FQNe
         UOWFhqs06l2k3nd4yPTY7xu5mHoSKdfIr8LonOKPZ302WGAHedpzWo7/ldb0JMX6s+xd
         w1t+VJlLvjVjqnQG+ALk403NcRydS7UQzXCKOXKYp7e4alBHyzNm5tmXapz+YVdHD3TQ
         Kb6g==
X-Forwarded-Encrypted: i=1; AKwUvBzHbY1TsVrc6Dbd2Sj03hT8OKYmIf/TH210KcnoZ63Kx5f7PxA55Ktct5Uy7LH9qZvl55DwF3J7Ifo=@vger.kernel.org
X-Gm-Message-State: AFuF++kCrmUAxyoBwRyhdFrijuk0Qp1bv4nGCKLMiYL+gx4tO212m48w
	DlOTozArNpEpbUf0hk1XJcBk28u4HhTEdiiSphrk6kgbZLpxuT4K4pAypCLFxg==
X-Gm-Gg: AYBFou3b7AI18Oc+wueOkZBIKzopuiMRvkoFU09Nn0bRkWRORW5Ct5Lro3Rk89hVRpm
	crhx4QOV1EilsCe2e3vzcV1cVC0G8mmFA5r4yWgSraO5sGw9fvttxSyAujpESrf57QcCGkMpaLJ
	TG3xXVmqe6HmK3BYyhUOF4yWnFF5NKRzBY7JnT491t5RzpPg8j0MiY6cXKxaiyymZ3h36gBw8tg
	sdTrRLrT56f2v5Zj19b5evpQBqjRnQoE47kUYjBvR+voqTz+jM8syPd5yqLL7nrOKJ2+yo/xQ2k
	kXZuVN3RJ1+N3/rjfWOddQhKbj/VN2IvF4NimYALk1m+8KUB7FUnXRaWQfRZnxcEUthmZOaESEA
	vbGJm7kI6qjM53VPqmk90tCeN/34ZifNWE7u8ydANju2kAW6Lh/0Ng/JuHSuJ7w1YcWlzM0mbrB
	yaSkxD5ElYNMh+LVswfxDEj6LJVl2n16FO5M2ol/BpKYRph5+LvGgKGCf5l+9RWER9Ul3CbP1Hm
	9wXySVm
X-Received: by 2002:a05:690c:660c:b0:820:a55:3ca3 with SMTP id 00721157ae682-89736b375bcmr1986097b3.33.1789686145230;
        Thu, 17 Sep 2026 16:02:25 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980:4f4c:9d3d:ae83:2fcc])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89786199688sm515127b3.1.2026.09.17.16.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:02:24 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:02:22 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: astian <astian@memeware.net>
Cc: Alejandro Colomar <alx@kernel.org>,
	linux-man <linux-man@vger.kernel.org>
Subject: Re: ioperm(2): confusing terminology
Message-ID: <20260917230222.uhvlukqycvjm47kb@illithid>
References: <aqvHRZ7DfbdG5XBt@devuan>
 <aqvVeSW_dHnYbwca@devuan>
 <20260917123845.valu5ro5zur23o56@illithid>
 <DLHTTJ9FETPL.27KU2F08VUTLP@memeware.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uwlpxyvtjsfqutk6"
Content-Disposition: inline
In-Reply-To: <DLHTTJ9FETPL.27KU2F08VUTLP@memeware.net>


--uwlpxyvtjsfqutk6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: ioperm(2): confusing terminology
MIME-Version: 1.0

Hi astian,

At 2026-09-17T19:08:44+0000, astian wrote:
> On 17 Sep 2026 07:38 -0500, G. Branden Robinson wrote:
> > At 2026-09-17T13:00:30+0200, Alejandro Colomar wrote:
> >> > Date: 2026-09-17 07:04:37+0000
> >> > From: astian <astian@memeware.net>
> >> > On 14 Sep 2026 14:56 +0200, Alejandro Colomar wrote:
> >> > > One thing that is very important is that we use semantic
> >> > > newlines.  That discards .md and .rst, since they are meant to
> >> > > be written with paragraphs as they'd be read by humans.
> >> >
> >> > Sorry, I didn't read groff_man fully, but I'm curious: what is
> >> > the meaning of newlines in man that gets lost in those other
> >> > formats?
> >>
> >> They have no meaning.
> >
> > I wouldn't go that far.
> >
> > Like TeX, *roff uses newlines, _in context_, to help it automatically
> > decide where sentence boundaries are.
> >
> > Because the formatter, not the macro package, makes that decision, the
> > rules are documented not in groff_man_(7), but roff(7) and groff's
> > Texinfo manual.  If a person follows the "semantic newline" guidance
> > from man-pages(7), they can worry less often about what the rules for
> > automatic sentence boundary detection are.
[...]
> Thanks.
>=20
> So, if I'm understanding this right, the newlines are semantic only
> insofar as letting the formatter know that it should insert an
> additional space if the character before the newline is a dot.  Right?

Insufficiently general, but yes.

s/a dot/a sentence-ending punctuation mark/

In GNU troff, the set of sentence-ending punctuation marks is
configurable.

https://www.gnu.org/software/groff/manual/groff.html.node/Characters-and-Gl=
yphs.html

(See the `cflags` request.)

s/an additional space/supplementary inter-sentence space/

In GNU troff, the amount of supplementary inter-sentence space is
configurable, and can be zero, which is the default for non-English
languages.

https://www.gnu.org/software/groff/manual/groff.html.node/Manipulating-Fill=
ing-and-Adjustment.html

(See the `ss` request.)

Some English speakers dislike supplementary inter-sentence space.  In
GNU troff, there is a way to configure the man(7) package _locally_ to
suppress it.

groff_man_style(7)
=2E..
Files
=2E..
     /.../groff/site-tmac/man.local
            Put site=E2=80=90local changes and customizations into this fil=
e.

                   .\" Put only one space after the end of a sentence.
                   .ss 12 0 \" See groff(7).
                   .\" Keep pages narrow even on wide terminals.
                   .if n .if \n[LL]>80n .nr LL 80n

> (PS: More or less:
> https://www.gnu.org/software/groff/manual/groff.html.node/Sentences.html)

Right.  If you see any problems in the manual, please report them!

https://savannah.gnu.org/bugs/?group=3Dgroff

*roff might be hairy, but we intend for the manual to equip you with a
nice, big paddle brush to style the hair nicely with minimal effort. ;-)

> I don't find this surprising.  The whole point of those formats is
> that they look nice enough and read smoothly enough in their source
> form (insert small-letter caveats here).  If we start putting in line
> breaks for the purpose of nicer diffs we soon lose the smoothness and
> get some of the *roff-like hairiness ;).

Right.  But you refill the paragraph after an edit to keep it looking
nice, that can lead to (semantically) spurious reports of change by
diff(1).  One _can_ use wdiff(1) or `git diff --word-diff`, though.

> Regarding the delimiting of sentences, it doesn't seem like the most
> typical rendered outputs for those formats (HTML, PDF) cares about
> putting the correct number of spaces after a dot ;).

HTML generally doesn't, because it "normalizes" whitespace between
words, except within <pre> elements.  PDF certainly _does_ care; or,
rather, by the a time PDF document is prepared from *roff (or TeX)
source, inter-sentence space has already been applied and any
alterations to the amount _will_ be visible.

Of course CSS makes HTML more complicated, potentially in this area too.

> And yet it turns out this exists:
>=20
>   https://asciidoctor.org/docs/asciidoc-recommended-practices/
>=20
>   One Sentence Per Line
>=20
>   Don't wrap text at a fixed column width.  Instead, put each sentence
>   on its own line, a technique called sentence per line.  This
>   technique is similar to how you write and organize source code.  The
>   result can be spectacular.

Two cheers for asciidoc!

> Kinda defeats the goal of having a nicely formatted source, but if one
> were to consistently use that convention, then whatever program is
> used to turn adoc into man already has the sentence problem solved at
> the source, and whatever program is used to turn adoc into final
> presentation format can know where a double-space sentence separator
> needs to go, if so desired.

Yes!  Some documentation formats transform to man(7) straightforwardly,
and over the past few years I've worked with the maintainers of most of
the popular tools that do so, including pandoc (Haskell), docutils
(Python), asciidoctor (Ruby), and perlpod (Perl) to improve the quality
of the man(7) they produce.  Ingo Schwarze, a fellow groff developer and
the mandoc(1) maintainer, has also worked with some of these same folks.

I'd say the man(7) output quality of all these tools shows an upward
trend.

Regards,
Branden

--uwlpxyvtjsfqutk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmqscXcACgkQ0Z6cfXEm
bc6/wg/+LjGRpHSnsUyvt2OhSvsI0OLhThkErpzhSjzfDegS7XWLqVsunjOQfoVd
TVr3XqwWferlidcNCiOOfvN1/EHwsvn57AeAAeiI7IXcv6XLqE8Jel6Ho7QNx9PG
rRHMs/F3IwyghuUAO39E/Jr5rsSEF6KUIzin4PWONHW2jSwW4BySe+KDEP1dekrf
i1aF4LoEFZdPpVtnnvXYrvJhrWJveW9tTqYu8DbbVLjz95Lm6SjZaOMEJL2Myvz0
qislTwrESR3W4gvaJNIdW0bbo8bDw7LF4XE4w9HJW5R09ihQSMee62wCHuqpk3pi
pTgFcUJJpVhvyz6Pqz8lhnAW8aLRBvk4i7XeC4Bk7HhRuq8H+5Nw6NJwzQ4eLH7H
YnLystqd0v6/581K6D3s6A1noAFbt3v6qYkAWBKs0mc+RI1gc73A043ZnHXTRjsD
CAfqDvM8xRccgPRtIIvGz9Awztl7gMac5J6KEg47y23aO46QDVBUdD1UrJdc62f4
VNVdknOnGtvz2IeE9sM/Yn/3bV5FjE+rkRY1VN0nyJChFh2XdUTaqO19iZ4uhDj4
dhof9LCD08YB/kUl/NCgq9uQJj7jbRVYX7c/Nw5w0L2DXQ20tTW2eCvtxMc5Ig8+
J5vLnlRtRVpt4htd+PZ5o9yu0puHBwt5+TSWs2WefDN6YTSv1RA=
=FjQb
-----END PGP SIGNATURE-----

--uwlpxyvtjsfqutk6--
