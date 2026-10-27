Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077976;
	b=POPVvr8KfJwkKEyNzc5ayXj2QjPjIC6uvdetFnUEzBK0MP1XUiJvy4z+4LR25IWA4RSp
	 mUo95qBgi+3YJBXLIUzb92vLZxPiFJaRp6aDfLVApSf58xPdUiyjlJJMgFZT1L3CUtIY9
	 ItYROuFZbbQEQlhwETvuuRJh0MLt3FE5gMu4xQl+SDvdxP2BTt53WPAQoN0RUlaYilA/t
	 Exz8IQsGzHbOvTjM/58FBQDdeFYu61wYJQcg32IeGR6juFLQYoii2TEFW9RGkEklJagVL
	 LedcH+/Ew1+Ern31jQ9P4uC5kPx8yYWaj1qvYGXjMg1ljjpPbrBcjxuFy/hX5GaDMuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=PHKz3z0n6RDmObsbEsSmxFIh/CtdDmCG5XY42vLcEtI=;
	b=dPD1kSrPvDU7oz12z0pca2DtfdJpeqndv/i4wP5wgaASGBOoa7inzwhsgf9YBLT6v+sW
	 VW1oc5O8ON1IMWAJ9p2+6v0M4I9seaQmclX5AO36Onm8msKQKIEdlbpvpycdRYLu0IpN+
	 0ib2WEi06gdzJSl9nCln/HjC0uvvEzrzyJ3xL0IxVZM3duJGVuTLj/e9LkVxD6s+m/kR9
	 WxImmLuVpv+Ic2MqXuLDOhkSxd8DR1EdUgOXfRZOwncafUm3mb1Ef3oVNg5BEdMFxQzzh
	 vWFyNBiy8X9kUNEWlGHLjTDPWfA+1SZkXHWQ0dMYex0q1hIde0tGmcg83Yb0QG/UEig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jG8jqwrI;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51DA606A31A
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 05:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jG8jqwrI
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so2834501b3a.3
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 22:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793077975; x=1793682775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PHKz3z0n6RDmObsbEsSmxFIh/CtdDmCG5XY42vLcEtI=;
        b=jG8jqwrINPNtJ9hw/EDDTwKolhzw4MiKPDgtSSyl0ep7TLyAiyhMELGAuzzdoYG4cl
         QTS1zq3oXWX0AA8Lx/qMfjK94JnD6rVLd/ScPLWMBTqHQsY249I9IMTFVp8iV8L6tTS0
         YHTMu7Ad1RzZqFPQB19H+2gKTzrTNpwdJzlAKyXdez9BYLr2oqDsU60UQi9kvkT2AWNQ
         g8y8OH726ipvk6B2fh8oSoU980C83d4w6ihorNPQtrF1X5Qg6mo9U9lVcVtsa9j0cAui
         8KwjvPZzzDbX1O7gPEFxe6mdYv5nkSKjyhg7R3qQR1PuGrVaSjRB4kRGcIeOrTfWnpwo
         PsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793077975; x=1793682775;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHKz3z0n6RDmObsbEsSmxFIh/CtdDmCG5XY42vLcEtI=;
        b=KS/vB6qNeMfdkD+1snzPG3RXumeGawA4tOCVLWRfdc6QQ4yB1Obv1bj3Ou140qzFwY
         Jg9nzIj7n1wRBQWfMhX7UijWL/EM4l4DdkROa94NmaHTPpoxfd4oHspbqhHbrV4vVpTS
         2U/K9HdevHlnoXcEEmNwgpZNoqH770NCNFnVN7qQVuT78GwO/AMcVKs8B1nFizUufrTA
         UYoZnayL/swVTcFtmzfIgaJ851WMt5kK4b1ykHTgEu4qSsd7rwZCWcrfOmKnbjNoZTlL
         4VvvbcgJJFuC7bItkBCQupw9PojIxVNrEe8kpGhjRqDlvhDs+BJWxDqLpjCxWAt5Jmii
         M9tw==
X-Forwarded-Encrypted: i=1; AKwUvBx/CYRB8MFUqfzz5eYaJIMRVrdWMCWykdmKDJXMZmgD5Wd61UiBojgsagTweQgHME8OgHDma94TL7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9OjuAEAIVuiH2XAye74JYWe+vPJkiosI0YJFRyjJ2GQvJnrv/
	h5g0B2GU7+KnBAM+n3daCZiGHvNZoPm3YHdErcMLLEMnny9eeAsU0cThAOx0PV+nPM/2Ng5qoef
	zsAF/Pg==
X-Received: from pfks19.prod.google.com ([2002:a05:6a00:1953:b0:89e:c160:ca9a])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1c9c:b0:89e:9560:fc7a
 with SMTP id d2e1a72fcca58-8a3688b2cf9mr6223694b3a.29.1793077974824; Mon, 26
 Oct 2026 22:12:54 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:12:54 +0000
In-Reply-To: <20261026.dc0f52217f35@gnoack.org>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021210800.27338-2-gnoack3000@gmail.com> <20261021210800.27338-6-gnoack3000@gmail.com>
 <atxDa5S8RPeZTm7C@google.com> <20261026.dc0f52217f35@gnoack.org>
Message-ID: <auAxv0HZ14Nz5xDi@google.com>
Subject: Re: [PATCH 4/8] man/man7/unix.7: Explain Abstract UDS scoping to the
 network namespace
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2026 22:11:56 +0100, G=C3=BCnther Noack wrote:
> Hello! Thanks for the review!
>=20
> On Sat, Oct 24, 2026 at 05:39:52AM +0000, Kuniyuki Iwashima wrote:
> > On Wed, 21 Oct 2026 23:07:56 +0200, G=C3=BCnther Noack wrote:
> > > Point out that Abstract Unix Domain Sockets are visible within the
> > > current network namespace, unlike Named Unix Domain Sockets, where th=
e
> >=20
> > s/Named/pathname/.
> >=20
> > pathname, unnamed, abstract are used in Address format section.
>=20
> Thanks, fixed.
>=20
>=20
> > > remote socket is looked up through the mount namespace.
> > >=20
> > > To avoid confusion, remove the word "namespace" from the subsequent
> > > paragraph, where it is used in a more colloquial form (there is no
> > > abstract socket namespace in the sense of namespaces(7)).
> >=20
> > The change still uses "abstract socket namespace".
>=20
> In the "Abstract Sockets" section, the word "namespace" is not used
> any more in the general sense, but only in the sense of a
> setns(2)/namespaces(7) namespace.
>=20
> There are some places in the man page where the word "namespace" is
> still used colloquially, but these are not in the vicinity of this
> change and feel less prone to confusion.  Do you think I should update
> these all in the same commit?

I understand the "namespace" itself is a generic word but it
feels a bit odd as it most likely means CLONE_NEWXXX in Linux.

But fixing up all would be apparently boring, so I'll let you
decide, and leaving them as is is 100% fine ;)


>=20
>=20
> > > This is already described in network_namespaces(7) as well, but might
> > > be mentionworthy here too.
> > >=20
> > > The lookup of Abtract addresses happens in __unix_find_socket_byname(=
)
> > > in linux.git net/unix/af_unix.c, where it is looked up in the network
> > > namespace (struct net *net) in a hash table in that namespace:
> > >=20
> > > 	sk_for_each(s, &net->unx.table.buckets[hash]) {
> > > 		// ...
> > > 	}
> > >=20
> > > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > > Assisted-by: LLM
> > > Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > > ---
> > >=20
> > > Notes:
> > >     Verified in code
> > >=20
> > >  man/man7/unix.7 | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > > index 4c46b54206a5..232fdbf4c3cd 100644
> > > --- a/man/man7/unix.7
> > > +++ b/man/man7/unix.7
> > > @@ -257,7 +257,17 @@ has no effect on the accessibility of the socket=
.
> > >  Abstract sockets automatically disappear when all open references
> > >  to the socket are closed.
> > >  .P
> > > -The abstract socket namespace is a nonportable Linux extension.
> > > +Each network namespace has its own abstract socket namespace (see
> > > +.BR network_namespaces (7)):
> >=20
> > Remove this sentence and...
> >=20
> >=20
> > > +a socket can connect or send to an abstract address
> > > +only if the socket bound to that address
> > > +is in the same network namespace.
> >=20
> > add "(see network_namespaces (7))" here.
>=20
> Good idea, that's shorter.
>=20
>=20
> > > +In contrast,
> > > +pathname sockets are not confined to a network namespace;
> > > +they can be reached from any network namespace
> > > +in which the socket file is accessible.
> > > +.P
> > > +Abstract sockets are a nonportable Linux extension.
> > >  .\"
> > >  .SS Socket options
> > >  For historical reasons, these socket options are specified with a
> > > --=20
> > > 2.56.0
> > >=20
>=20
> Thanks,
> =E2=80=93G=C3=BCnther
