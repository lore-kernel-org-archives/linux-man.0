Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731194;
	b=r9sRZ8BjH5uuaiz/Ze28WJnm9zslHmZlvFk4YxrxOkTsIlLVnkbT0vKnEyKTsJDuQpH6
	 XSk/KYAEIl/HdE3VCiBScT6OfnsDhWmijzTvGtjOCh8L3yJ6C0T9Hbv/GQWErk3NnKs12
	 /cjDjaDQ+xnJM5Dk7nJ1suve0P8FEnP4PyFBJAhGf28NhRFw5741c40uo3DiEnDHp2Ky7
	 llYGPKXOpR9nfeldDUMK6G1fN066+MwLuExOTmp8OfLaiMkt/j0h8TFvBBi3IL5v5WKgw
	 P7JSofb734CZdcB/+H3JhBR/N8eyEfGajZsOzoXA/Cr2XrNPKhhDo4L/8aCEe+ZcCxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RKU8JIPXPLXjkdnSf7lnw5FevW78z805XdawwjX5vpg=;
	b=Ox2PL7REJqF2ZAF9ghOI//HivNbrfT7XIqNhEjkuKEoYLgEPDgtgtdWqGC2j5CnR35zL
	 XcSVE74WdG878c8Ix21ucLTdIfxcsBVS2iDVLg0UPQMUqvVqipNqZFEDYWkG/w6aGhklh
	 LFI3Xx/2ZLtfjLWlDCsYeBb7A9fRfRicqMQtjuofWAhtzH5K8HutBxIZWG5b11R1fZiXe
	 COmVf5QeBEW4rb9yGN3r5x44WWN6JVh7YQcLGm6Mli3XW7KFBr/f1IGJU5OWJIWnZaxKA
	 f+5SiJkH/qn01CixKv8576vaSz1fvZ7nW1Wk9ys1iuRb8hjCClJJ/RHMxHRAr+pCQlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pUl9XdS9;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04D3606A326
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 18:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B04D3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pUl9XdS9
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67a2efec15cso1019357d50.0
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 10:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731193; x=1794335993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKU8JIPXPLXjkdnSf7lnw5FevW78z805XdawwjX5vpg=;
        b=pUl9XdS9rwRloZUwjWkEVIE2+1bXw6J89wNg5S9pqjqAfxxNMHVnc5YAi/e4gBWZ0X
         tLjl0V43QpaeRS8rNxEwSp7V5ZG5nu7xpr0ZiTOVSkrKp3y8+UT159Bi4edllY2LrGrF
         kgJM/CRk2mtrrmKoLW/Iocbp/tw/iMQJSFKqZoc9GMLesj0VpuOsnB5H1TL/kua65lOg
         p/dbgTcddqI1NCKnsSmoErdw0l4Q5rYMAJf14UCAO/GckribJIZBDIqB8fzhK4JbT6MG
         TRHas9PgXrm8kllNemDBnwwiSmZgz8MyUn2C0K285Ps2V0aq8oDNb7h68wx7nyM1y1pf
         W0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731193; x=1794335993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKU8JIPXPLXjkdnSf7lnw5FevW78z805XdawwjX5vpg=;
        b=iatOuhp1cfyu1hr6UDl3TV7E3JmQRpwpEFMEu+fd8w9nFj26YekUI1a7fV/+L4CCGx
         eLLtO2UQDigrMVHSaMVvmPT9zCyKsVm3aO04kh60sff6YdKOOhOYsxZBHiP+R//fDUyX
         hsXh1jq4LNVBaV5OaobbIlUoJofupwe2nh592G+s1K3vCA2ntGl8rclOqTG3BqLlp9G1
         w9gfA2J6DWBFyS+ct9wAEL/LsBfFcurYqt3ggRzsiq6B3YLMBDoyEh8/Igp2aOs6unV5
         K9pnXwmpfeJuaj0ZDbAwCCiBPopKjmd8/sXVOZH+3HkxFGXPEQbSdHuQMGGK2s1T7RiP
         E5+A==
X-Forwarded-Encrypted: i=1; AKwUvBzOHZ5Yx86xssMxge/qGhbzSc7mzG/HbnezzEIvOfg1fWFb9WX1Zzz34SV3K3rIBFoOsUgzDU5tWLw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fF+n7xAJR97EXGMrgtED9HjW13R3TpUl4ibkkGhQelT9MH9yL
	YC/XWAhifeQ/tfEPcZ8eUAUW+DSmF36iAtr8IMm5NpVQUtZxv6ZF0pom
X-Gm-Gg: AYBFou10GZgklns0IKpoKjAjz31LehWusM/eUJWf3vefWt5/Bb3Ggn1FB7wKFqu6A+i
	I2IHK2j050qTb6aG3c00Ti1O/XcrNC8yyBBp4R48gUr3vvEbSIFk91X0KzXreUFmhxZQXHcvCcH
	nkta5PYoM//e8KucIyEV9LgaxzR1ItfDroq3e/4vOfBCos76+LtKwZiIwZDNUiaJWxSbnwVHtKL
	OXztZLjA2dMkhoIYR71qYRTLcOnOsZS5QmOBi/+Fys5GeGA5aFx55A7Sxya3VOUDETz9fSeqwUk
	GU/UOsUHkRJT3DzEl1TVqT73L41K/FJh0P5Ps0TRCjHn14L6lPJRxpqxEOSGhUPknkjzV4gO1sA
	m5gZN4StmF9vlRzA+P33MkhKtcZsTXOep7ClgjqOK039qEolRyYEC4n90+6JosYuuzeEeBfGglx
	mcOzQFymN5kT6POpb2C2BZ+ZwCSUBXRbJeCL/08MVDc0BWgd4xFJKztOE3lfksCkfZmECxVkF5Q
	f4HfZgyzXNDPj9Ph3hetZX8psC2l7bgXAk8k31md55tkvSNL0/4FE0UV4h8yQpBmkUuCgLoBda7
	rMwKhFZv2JRohm/J
X-Received: by 2002:a05:690e:128e:b0:677:d4de:21a9 with SMTP id 956f58d0204a3-67a8d05856bmr13409245d50.7.1793731192591;
        Tue, 03 Nov 2026 10:39:52 -0800 (PST)
Received: from illithid ([2600:1702:7cd0:e980::49])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf344b20sm7549259d50.20.2026.11.03.10.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:39:51 -0800 (PST)
Date: Tue, 3 Nov 2026 12:39:49 -0600
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>,
	Xavier Leroy <Xavier.Leroy@inria.fr>,
	linux-man <linux-man@vger.kernel.org>,
	Michal Schorm <mschorm@redhat.com>
Subject: Re: copyright year ranges and "collapse"
Message-ID: <20261103183949.2r6w43u2ok6tij76@illithid>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan>
 <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
 <20261103165448.3y5ujyzvgypygjgj@illithid>
 <e9634fc8-26be-485d-8bf5-ed32098a8ae2@redhat.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3l4uspgcgyncjo5m"
Content-Disposition: inline
In-Reply-To: <e9634fc8-26be-485d-8bf5-ed32098a8ae2@redhat.com>


--3l4uspgcgyncjo5m
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: copyright year ranges and "collapse"
MIME-Version: 1.0

At 2026-11-03T12:55:53-0500, Carlos O'Donell wrote:
> On 11/3/26 11:54 AM, G. Branden Robinson wrote:
> > I am not a lawyer.  This is not legal advice.  The expertise I don't
> > possess is limited to the United States.  Your mileage may vary.
>=20
> I disagree.

No kidding.

> I will note that this has come up in other communities.

Well of course it has.

> Guidance given by the GNU Project and the FSF is to keep the years
> distinct if they do not form a continuous range.

The groff project historically (almost?) never did this, and I regard it
as an unproductive use of my time to go back over the circa 2,000 files
comprising it to insert gaps in the year ranges, a procedure that would
be further stymied by the murky first decade or so of its history (from
1989 to about 2000), where have only release snapshots,[0] sometimes
with more than a year's gap between them.  For example, from 1995 to
1999 or so, the pace of groff development was extremely slow.  But it's
hard to say with precision which files were and were not altered in any
way, let alone in a way that met the threshold of original expression
required for copyright.

It's tedious enough fixing up groff's copyright notices to unwind the
robotic "bumps" that were once done at intervals, and in some GNU
projects are done every year in January to every file even in the utter
absence of any other modification to it.

For example:
https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=3D73d3a49f4=
5770c45808e4fdab35ae4fe248a3cd9

> https://www.gnu.org/prep/maintain/html_node/Copyright-Notices.html
>=20
> ~~~
> You can use a range (=E2=80=982008-2010=E2=80=99) instead of listing indi=
vidual years
> (=E2=80=982008, 2009, 2010=E2=80=99) if and only if: 1) every year in the=
 range,
> inclusive, really is a =E2=80=9Ccopyrightable=E2=80=9D year that would be=
 listed
> individually; and 2) you make an explicit statement in a README file
> about this usage:
>=20
>     For any copyright year range specified as YYYY-ZZZZ in this package
>     note that the range specifies every single year in that closed
>     interval.
> ~~~

I reject this guidance.  It's impractical for me to apply it to groff.

The guidelines also speak of copyright assignment to the FSF,[1] but
glibc, for instance, has chosen to go its own way.  Of course you know.

https://sourceware.org/pipermail/libc-alpha/2021-July/129577.html

groff made a similar decision some years ago.  (I don't know when; I
wasn't involved with the project yet.)

> The man pages project can choose differently.

Of course!

> I agree with the guidance because it is more accurate, promotes
> eventual entry into the public domain,

Only when there is only one year in the notice.  If there's more than
one, how do you know which parts of a file have passed into the public
domain?  If people can't identify these parts to reuse them freely, then
their liberation from copyright is a mere notion, without substance.

I don't think you read my message closely.

> and can be referenced without access to source control.

=2E..without that?

> My understanding is that under US Copyright the years may be collapsed
> without invalidating the statutory copyright statement.

As far as I know that's correct, but I'm not a lawyer.  I offer my views
as one project maintainer to another.

> I leave this up to Alejandro to decide.

I don't think he requires your leave.  ...unless you have executive
responsibility for copyrighted materials in it that you mean to withdraw
if Alex doesn't administer the Linux man-pages to your satisfaction.

Is that the case?

Regards,
Branden

[0]  In fact we have nothing at all prior to groff 1.01 in 1991, and
     that only because BSD Net/2 got preserved on the Web.

     https://www.tuhs.org/cgi-bin/utree.pl?file=3DNet2/usr/src/usr.bin/grof=
f/groff/groff.cc

     So anyone agitating for groff pre-1.01's public domain materials in
     2084-2085[2] will, I expect, face a daunting task in software
     archeology, if some wonderful discovery is not made in the interim.

[1]  https://www.gnu.org/prep/maintain/maintain.html#Copyright-Papers

[2]  As I understand it, material copyrighted by the FSF in 1991 will
     pass into the public domain on 1 January 2086.

     https://www.copyright.gov/help/faq/faq-duration.html

     But maybe I'm off by one and it'll be 1 January 2087.

--3l4uspgcgyncjo5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmrqKm8ACgkQ0Z6cfXEm
bc7U4hAAoVvcx44DZZnvxkr8RwbWU6ID3TqN3YNeH89W89i637upo2u5NlVR5+OV
ViIfUTKa5Bxm3MrRRCJYSj44WMMVeeSwK1ZtktzcxxL9NN0CvG/ZS++6hLjkQXuY
N9aUorJtBHE/JFtxmHWUwa4d3lN9rTMdVnIp693JBynukqyeyjmhlnKjRTZ6qvmQ
/joXFG07CORu1VlB4jcF0ybuJ2Z5HSRPUW0gNScizaP5+R7AZBrVfBzgMREnIfI/
iSrmQwGTSZlNNS5uSKWGAHBqlHU4GgU4/5PWHckcvrCrodLLo+kycykTB/EUIsk6
4WiOScsexXxUZzxbQr7XflZEaVIqSQlJpCZSQcAY5gG+7ZwXZ3HJiWZbYvTBm7iG
oqt4gkOqvsJh2GH4QeDCoU/ae/AioGsDlLvmY6sSBMEJTPsnPWXLQtNjAwE68Tii
xcfSpbKk2ggH6Uz4IO1w4KxZTAPH7pYyWbYpJCkj98Oa/lSh+ylsxsU4oJVR41u/
llSntJrUV+E3T4fUPmKD0Gv5oZGJyUzJcDA2JtUtsM7ke5+G1Absl/62AqS73VyS
jVKfxwVaamN3F+4W5Fg/lDmuy63wh8gq0RZWsY4darF1AOtUBAQbfeUQSY8KiQKo
GGOlNvI5mI3xdKgas57FL89DrziFrd3761By0nMecPjGW+lYnV4=
=IG3H
-----END PGP SIGNATURE-----

--3l4uspgcgyncjo5m--
