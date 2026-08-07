Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F2A4B0492
	for <linux-man@vger.kernel.org>; Fri,  7 Aug 2026 02:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786068781; cv=none; b=bqSU8jHa9v35HmimuDA+2uPpcqnU5xu+rZ6hG/N4Cp+OQVqI8s9S3+JdXkoRYmuAtu2ytWFPtIDJaE42d4zfEYXfMfX89QDaL50uuL+giTS4BKUQPI84WWJumADq5Zj9ADH7ZONgtMYePz2fIbZov8dwZ+eatns06oB2X7Uhywk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786068781; c=relaxed/simple;
	bh=3BT/T+H5Yo1qfYNYhO/C3eGLIDWtQbe37g/axj00e1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYA+nW+dGW3ECKllO6yfBHFugOmqVqHfytvoo0BOFSjsOvHXOwmOb/9XSOi2SWkHgf2xQnglFM95IAdReMyURRWZ06+FAmWPH8vUr3muiiS932vt7AmcU1dJ8YPuLU25qzVcxAeLsf1Zoa+e+20yS9wfLZkAe8b2p/9YW20Kq6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfYEpUBG; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfYEpUBG"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8200ca16f26so43456787b3.3
        for <linux-man@vger.kernel.org>; Thu, 06 Aug 2026 19:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786068779; x=1786673579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oCsFUYFq0TKjwdNg1DkUSyE+BX9X0MyyLoCRf95jemI=;
        b=OfYEpUBGW22eSGgwTc599aFYvQIz/5aEzTpIGBlMpkzCeNVjXhWmF20+r8hUZxbZHf
         pdTIdSlLuvcf9kmtiubqsNEZ03fkFmn27t+H5GtYmaKt52l2eijIlxkRrsL1Xm4O3/oI
         wTIcT0xYYE6neA+MoI7Ej0XFeO1UkPBhxHMjWrnz/eIG6mvYvwPCWNWb7b76yUNkSqeX
         CaO5P9In1EfCGSLClioO2is6t7XQzTwcY0SpBba0tvb6cxzpIIaouAAL+55ypRY2zRgv
         K7bT3Awyusy8j7xfOIfLiuO1d/GXiikBxf1Vv/y1+bQmN+sU0ls6euudM+PU2cbJvQgi
         TbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786068779; x=1786673579;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCsFUYFq0TKjwdNg1DkUSyE+BX9X0MyyLoCRf95jemI=;
        b=cN5ler8FUfde1pTKMH4y5hM7bcwJlts4sXj134ECjLe0jBaMogjMzxAicrrQachjsN
         iH+ItGYMckMeL7VLOBgVZwfjLqh5ph8VLW+oQBmNhfSSPgGffJ/2EjDPbY+Epq/wSzru
         y3uPP20q42VJBAlZHidcUGnTpWnxxswFpcH+3yz1tDw4bZKawwGhj+pki9zMdNT2Ln/x
         +nZqDWF5k+xR2EDms40suodMbo39jOYGjdX+DTX+V2uJczZQdEH8oVdI9pShPwXZXtOK
         sj+82LUHqSEKsT7fm2hR0RrupOkSEZs+oQp9KHateABH+vlD1jxst0K3UE3B9ZR4Gz6w
         gCpw==
X-Forwarded-Encrypted: i=1; AHgh+RqR23h0Uj+mfyPSRo55aLsLvAONd9Fmca0wuwQQYDlkaUzwpjx4whIyCiXq0lTeMkQ2LECA823mWUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbk7KC2f3ReT0f9jeCakh6e2vy7Ko0hX6P/BmktQgOiLO4bheY
	lSRyAuyqV2sWfCWfL4SPOAn0TgHIvi3QgtHrrmGraY5FZMfIDE59FOV1
X-Gm-Gg: AR+sD118IPlpPxQM6PbanOLlPsB2IxsFVRFtPxcM7lpr1anWSIC1UmpiurwN34r0G4Q
	2mFDSeitxAhrH8HX72/J2+henUT57mHCDisZRdJXuPfHDFwMZdYbpbaSMXPvH/beKLxndZ74row
	tjDctnl1gPIhs/UCVJkmNmQmvG99dUY+RZ2PV4DWpA2TBBdBlwLtpS1BAGglfHselVBdGRXszlr
	2L5IFPOomGEx+9cN7MP7kbBIDQBf6KKRltuMJWeqHA4tzprhby40dsDrqL3ToqujjVbigVnCceh
	hU6XbJtwigDS1jN8qxW7jgfpy/gaDxwy9Gc23yv5dZOm9jN98QPiYcWA183dKPhiRVMEXt0hrch
	B+/X4wCkPH+JKF070mLgMGHdpjoGherjZsFd18LcZql6yTc4HXpff68uNPjCrC2ujWP+Z/dYBJn
	1wmqF99kmJqkSfkaljTD7MvtosGo5lE+mQbjmNR5M9JgWyLjnRnw==
X-Received: by 2002:a05:690c:ed0:b0:80c:4923:cf4 with SMTP id 00721157ae682-8201f0979abmr128276327b3.10.1786068778605;
        Thu, 06 Aug 2026 19:12:58 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f623fa6fsm2069527b3.36.2026.08.06.19.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 19:12:57 -0700 (PDT)
Date: Thu, 6 Aug 2026 21:12:56 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: DJ Delorie <dj@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <20260807021256.pwzsls7awqmbslti@illithid>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s6t3ztp7w75d4cgg"
Content-Disposition: inline
In-Reply-To: <xn33wr3rr8.fsf@greed.delorie.com>


--s6t3ztp7w75d4cgg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
MIME-Version: 1.0

At 2026-08-06T16:42:35-0400, DJ Delorie wrote:
> Alejandro Colomar <alx@kernel.org> writes:
> > (I haven't tested; I've written it in the mail editor directly)
>=20
> The placement of the .PD's is important ;-)
>=20
> I'll send a v5 with these, you can decide if you like them or not.

Managing `PD` placement to achieve "compact lists" is indeed tedious.

If you like, you guys can pilot groff 1.25.0's new `LS` and `LE` macros
for man(7).  I expect to release 1.25.0 in the next week and a half.

Unlike the `MR` macro introduction/reform, `LS` and `LE` can be adopted
early and without any negative consequence except a GNU troff(1) warning
in category `mac`, which is not enabled by default, but which some
people enable for linting purposes.

If even that is unacceptable, you can add the following anywhere after
the `TH` macro call and before your use of `LS`.

=2E\" Avoid `mac` warnings from groff < 1.25.
=2Eas LS \" empty
=2Eas LE \" empty

Use the `as` request instead of `ds`, lest you clobber groff 1.25's
macro definitions.

So how do `LS` and `LE` help?  Here's groff's "NEWS" file:

*  The an (man) package offers new macros to ease the formatting of
   lists.  Enclose paragraphing macros between `LS` and `LE` to identify
   them as list items.  Doing so can mark them as "compact", ease
   management of their indentation, and supply hints to the output
   driver to improve their rendering (as with HTML).  Lists can be
   nested.  (Sub)sectioning macro calls, and the end of the document,
   close all open lists.  See groff_man(7) for details, and
   groff_man_style(7) for an example.  Thanks to Alex Colomar, Chet
   Ramey, P=C3=A1draig Brady, and Stephen Gildea for consultation and
   encouragement, and to Alex for selecting these macros' names.

   Because these macros format no text, documents employing them risk no
   damage to their content if the formatter does not support them.  A
   man(7) document author can choose either to transition to these
   macros, to manage list "compactness" and item indentation with
   existing man(7) package facilities, or to employ both approaches.

=2E..and here's groff_man(7).

   List enclosure macros
=2E..
     .LS type [compactness [indentation]]
            (since groff 1.25) Start (or open) a list.  type is one of
            =E2=80=9Cdefinition=E2=80=9D, =E2=80=9Cenumerated=E2=80=9D, or =
=E2=80=9Citemized=E2=80=9D.  compactness is a
            Boolean value directing suppression of inter=E2=80=90paragraph
            spacing between list items.  indentation specifies an
            indentation amount for the body of each list item; it is
            then unnecessary to specify this argument to the list item
            macros.  Use IP with a mark argument to represent an
            itemized or enumerated list item, and TP for a definition
            list item.  Use IP without arguments to associate successive
            paragraphs with an existing list item; to these, inter=E2=80=90
            paragraph spacing applies even in compact lists.

     .LE    (since groff 1.25) End (or close) the most recent open list.

For groff 1.26, I hope to use the "type" property to select appropriate
HTML elements to bracket paragraphs within list enclosures.

See:

https://savannah.gnu.org/bugs/?68335
https://savannah.gnu.org/bugs/?68424

Regards,
Branden

--s6t3ztp7w75d4cgg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmp1PyAACgkQ0Z6cfXEm
bc5uqQ/+K8mSL3pB3TZzTqP9ZWJ5t/O0Pk/xRgLO/O92INufPURd/2jSCZttCsEa
rCYZO90Z4URh+gQ+kMwIgwszk3DTGlJ8ouyWovU2hxSLLOo1ESqiQQPWpqIQRXGF
ZZujOY0I2/ew8etzSl2vY2i3NLtTdB7jktEhxZ2OjYF2fbUE/rA64rzYNLE53KLW
9Hewogg5fu5VJuTt6A/9aAnLj/XMiIoEibPrhx58dCuGUiAgjnPX8EezolTYV2NO
ntgDYxsx3NGOVOBjgpD7GDcwPWtJVXQMjZkl2UMIfdNGvxh04YlTeM+L8ThUnOFp
EOWUoRoSJqSoKQ2whN2PHoBzhkSdiljvO6FhDoSuqc1SGKrG6trqzzRkkh2tDlpU
GHMhmLVofepnMGVVmCdnxhaBVMqyu4pqisomOzlmY+EJHrSjuf6UDcTmtkHd/IRA
F7Xf+VAl+ihIPt9gg1AEcQQjmWffsvys+5ZIHtR9KM86eWMrmp2WDB+k6mkLlhvg
JqIN7G7kYZqEfl1fMYRvx/Qw66VlyVXPzTIFzvRM2gTVvz1bxzTLwRwCos/F52Mx
V9cNk+msYy1dV9TxWQdp/FtC4kINU0zL0lWy4udaYsd8RsP8+Er/qRqZC5MpqjLU
JQIEugxTP0oTtg1ZpZ2EalCJW9iv2RisqHCBL9pLHbj+HEndsdw=
=rQ4v
-----END PGP SIGNATURE-----

--s6t3ztp7w75d4cgg--
