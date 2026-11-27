Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785188;
	b=2Im7bBXCU8qks9uFMEotOftxGQIWhg56mThOTgAVdEcp1jpeAyDhrfxiuxidqN+9G2JA
	 CFeosERsiAqxo3w/eEIjlVA+4ICOTFCJfJq68P91W0XiwGntwVwQZlypYPVZLHaG3qS7O
	 3CQw09GYCltapw7kTGiO0bvffqttvLYSsUHSMImJJZ25h/jnseZRbbxJ4d+B41xGPzzL+
	 b09ZInr1ksTLlNpkG4ptcXO19TLZBNpH0A7OT9Ja+4R4kgO2SL56DORgBZA+yQOlYPHA6
	 r5cZaHBSviSbIXYTAbG8SIYOEGs4t6y4/Px2v1oC/0lxaNPAWCNol6SFuK5t+r0VaDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785188;
	h=Received:DKIM-Signature:Resent-From:Resent-Date:Resent-Message-ID:
	 Resent-To:Date:From:To:Cc:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1n7aGqslJizq3A0w/V38NH8BqsVPS3xR6m9MYJQhWag=;
	b=pOn8ykGezGF42N9bjxaIacigsGWxjaGx4Bwtt4AdFurEDtTpV6G/wuUfES63I3VPyue3
	 0p4p0l5xikV6uLHyrQ7FHhmr3OcfQxjriQanByYJBsIbMD10hXCgcxoN2pMobTOWlpuVb
	 CyeQKqs1UKiY9THIXyxWXxpL621VW0mjY9ylcipbhmTynbbwGV6UFNGinBaYZOIXfeihr
	 gqH8LV/KTunkLMMSLVgTAMrs/HkMg3lhVoWcNjkgcC5NkvlyJfQ7nYui3p0t6BuiTxphO
	 R10Yx0f8BdhCOJz+ozuiYjjjNuLKWxX2yrgFJTtsmCJc+5V2MZ1nWRpP12EhrqJHd5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dfnIMtlE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABE6606A31F
	for <linux-man@vger.kernel.org>; Fri, 27 Nov 2026 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dfnIMtlE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40ABE1F00893
	for <linux-man@vger.kernel.org>; Fri, 27 Nov 2026 13:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795785187;
	bh=1n7aGqslJizq3A0w/V38NH8BqsVPS3xR6m9MYJQhWag=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:Cc:Cc:Subject:
	 References:In-Reply-To;
	b=dfnIMtlEKWfGILOHo3ncs8UiQXcT5NQwN5b2MXc0Y3McWW14aY04UYHn5QSzTE+Ux
	 XK1+WCEXtMfEqRs86klVnfsL6cj6m6Q9Rv7Ygp+gspJ5tT7yGNmEUuyq8yKQAFL+se
	 gaYWSK7BNEHhq4/TG6iJI1IsjJqHqMRcgogeMDBcCSwrwm14knxvzVE+ISF/CqR7zc
	 tQ/dWGMmbnidAIFfoYG65424K5CBVp3zvRkUXWveu4h3a5HN1ltKMXEm+8fsgdpIPv
	 MqriTa3q4gIT5arKK8wmOs3f1YfwUh8nZMd2H65s0UjkJtSfP9W72UyJZqOi5bJUG2
	 Vc+Fl/fDM/mcw==
Resent-From: Alejandro Colomar <alx+linux-man@kernel.org>
Resent-Date: Fri, 27 Nov 2026 14:13:05 +0100
Resent-Message-ID: <awmB4fvZN-tEu18M@devuan>
Resent-To: linux-man@vger.kernel.org
Date: Fri, 27 Nov 2026 14:08:04 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Niklas =?utf-8?Q?Hamb=C3=BCchen?= <mail@nh2.me>, 
	linux-man@vger.kernel.org, linux-api@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: man 2 unshare: UNSHARE_EMPTY_MNTNS
Message-ID: <awl-h1Kdc61JccWC@devuan>
References: <64fb02fd-0ffa-4311-bf21-a3211e9d599e@nh2.me>
 <av-DinDzrAeN_1mU@devuan>
 <20261127-rundlich-geldkassette-farbaufnahme-62856c08c80b@brauner>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bshabd5tnbamc7jq"
Content-Disposition: inline
In-Reply-To: <20261127-rundlich-geldkassette-farbaufnahme-62856c08c80b@brauner>
Message-ID: <20261127130804.V62-5e4QD-ZWpRika0sYfg2KjDTkNWRuxHKDw3E4OLQ@z>


--bshabd5tnbamc7jq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Niklas =?utf-8?Q?Hamb=C3=BCchen?= <mail@nh2.me>, 
	linux-man@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: man 2 unshare: UNSHARE_EMPTY_MNTNS
Message-ID: <awl-h1Kdc61JccWC@devuan>
References: <64fb02fd-0ffa-4311-bf21-a3211e9d599e@nh2.me>
 <av-DinDzrAeN_1mU@devuan>
 <20261127-rundlich-geldkassette-farbaufnahme-62856c08c80b@brauner>
MIME-Version: 1.0
In-Reply-To: <20261127-rundlich-geldkassette-farbaufnahme-62856c08c80b@brauner>

[CC +=3D linux-api@]

Hi Christian,

> Date: 2026-11-27 13:51:03+0100
> From: Christian Brauner <brauner@kernel.org>
>
> On Fri, Nov 20, 2026 at 12:22:52AM +0100, Alejandro Colomar wrote:
> > That same commit also adds CLONE_EMPTY_MNTNS (according to the commit
> > message, for clone3(2)).  Could you explain why there are two separate
> > flags?
>=20
> unshare() only takes 32 bits. All of them are taken by legacy CLONE_*
> flags. New clone3() flags live above bit 31 so CLONE_EMPTY_MNTNS (1ULL
> << 37) can't be passed to unshare(). UNSHARE_EMPTY_MNTNS reuses the
> CLONE_PARENT_SETTID bit which has no meaning for unshare(). Both imply
> CLONE_NEWNS.

Hmmm, thanks!

$ git grep -hP -f <(grepc_c -tm CLONE_EMPTY_MNTNS) include/
#define CLONE_EMPTY_MNTNS       (1ULL << 37) /* Create an empty mount names=
pace. */
$ git grep -hP -f <(grepc_c -tm UNSHARE_EMPTY_MNTNS) include/
#define UNSHARE_EMPTY_MNTNS 0x00100000 /* Unshare an empty mount namespace.=
 */
$ git grep -hP -f <(grepc_c -tm CLONE_PARENT_SETTID) include/
#define CLONE_PARENT_SETTID     0x00100000      /* set the TID in the paren=
t */

Would it make sense to create new UNSHARE_* flags for all the existing
CLONE_* flags that make sense in unshare(2)?  That would avoid some
possible confusion.

That is:

$ man 2 unshare | grep -o '^.....CLONE_\w*' | sed s/CLONE/UNSHARE/;
     UNSHARE_FILES
     UNSHARE_FS
     UNSHARE_NEWCGROUP
     UNSHARE_NEWIPC
     UNSHARE_NEWNET
     UNSHARE_NEWNS
     UNSHARE_NEWPID
     UNSHARE_NEWTIME
     UNSHARE_NEWUSER
     UNSHARE_NEWUTS
     UNSHARE_SYSVSEM


Have a lovely day!
Alex


--=20
<https://www.alejandro-colomar.es>

--bshabd5tnbamc7jq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsJgK4ACgkQ64mZXMKQ
wqk8ihAAl9OzcXygX9Lg1yhuFEo0Y1Ky0RCoadSTrpjteYRSQncD2eJxH8e33BD/
WPjsSIUKuXez0gQPW9hKAkK5hX+CH9zuLbzqLkvPB3HJyLFMZbERusbNk5x8wBjw
e0qqP42NnWJzBNfP/mC8tzXXMYm23QbvCn4AedTniHpVIz048/gXX/f5aGxZD9Mr
Z/xwUK+8l1f/lGlGXS3YClV8/MfYk+WqjUn0c7lngGbUP/5OBZOj9/cpc36P0aJ6
f6Dkz0kG+VcMsweJ59BUSCjNe0q5w7hGurVekkn2o9woTtUH7WL2WWKmyJX4C1uD
gUkN6FnnKGCgaG7Y1coCaYyYWeG3LXBWkCxJ/nHTGIy2QB/l0+Iw1fWposgRU7pv
0HJHXUeV5SfQ4RctNHmhXR+xsAqh5D9MUrsRFFFWslwdMooF28QiJIKe1ZzBylaI
VViePknbtiO8VxKpi1DqoGiuywIuYCAUMjjU7QxeUek/udMXAIc92PiBX/4aw59n
4PrmIenTxN8oU8aC9kUnnQJdJ9ALw+yGsPUuA90OiXk/Pj7cs9v0sbM9Bw+VusdR
CXUKRwv75U0kO2yQLlyjBdrAOqOXVgDFkEhxVniXbrioBjEHGfb/X2AyY8zcLBq3
zZ2v44kqIrqIVEaDpH4EQaQIckqiHtGFV1mXh/y0ZwWuwrHAI3I=
=HQXy
-----END PGP SIGNATURE-----

--bshabd5tnbamc7jq--
