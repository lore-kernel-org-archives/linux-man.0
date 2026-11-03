Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731981;
	b=X4rL66RG/KdrOHOzLFPns9tRcwO4cNW8/o4Zn5u3MMCzusJw05544aQD3g3ao42BT7KK
	 sWB6kYnJKcyYDe66Xp33uk1j8OiwnqwXnBmEHoNMtSo4EqMLrHXxz6MKFXLcVulm5lDeU
	 g709RRLonZftYdoTy5Se9nKuW91zplryC3RAZwBVQEO6eqQiiw54n8eHYspHdVoxZXXaD
	 73QV7iblcL1H7L/7jpwyBtOx0Uepl4Lg02NG1f8YRcV8K1R9gpw3rEMmbVEfihP2ShT3E
	 0cno5z7/IWIvzzT7PyqDhijLqSchou9i+/OaaOBxmgs36B/S4BPu+z0mMUNO7mu3RhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=c0GuBZl5tUEif275GYSNAdN9bxcg0f2inEBlXvD0hwQ=;
	b=2EvVVabgnvrEU2O7+9OrQDFxGjHolKUwF3+jXzy9OuXy2zyUUZZ6CpGro98BeApWpnrJ
	 uL8j1WdmfzyZeKu5Y8m9+9rvSr9tYqo0jmccTO9z68wMxcFsadUkIRKCgQRzcx8MvfjyB
	 nwOgzLleGeTBWYs5i9Y21OqIqi6kJ7+LBbKT7oNB0jYbgGznAhAfRPpE851Tsk1IkNemx
	 KustuUy/xEg/MJ3Xni9GenP1fprRNt8gnuQ8/qZ6d+rfGLG9Cox9iLH2aBt4mnupFrXnV
	 oJhg5jjS0cch8xZpa2lbRX283NqrhDHUmvZy8lLL7PbN/jRdQ0q2oXC48UuXAMDLagQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E1lQ8Hc0;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F3606A31B
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 18:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181F3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E1lQ8Hc0
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b06c0794cfso42262397b3.0
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 10:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731980; x=1794336780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c0GuBZl5tUEif275GYSNAdN9bxcg0f2inEBlXvD0hwQ=;
        b=E1lQ8Hc0S781mspDzZk+bWhW+JVZJ1BEVvb0fSeoAyXE4nhe+yteSn+BfJFsSxRXWJ
         8fUr6nML0iA8QmD8wugDEDwn+NwHPHVwBhKh1EIfVJNm75RBXb50/wzj5sPeFRxtzoiQ
         qWc9IXW9PBEx07Zkg39F+cSqZIWA+eRuDPt7kVRss+nl11T+fYqQslu1N+xFUrSPOOp7
         AnQ5PofrL3XUyTpljVpVCppdXv8/8ewIYaRDxRgEYpz6oAGRw4RjJUuw4By9LMEh80WU
         u458wXH6mNJOQ63Aw/KyPMP1VrLWYrWM91EQ5oZJ3cdw2zIwufuzjSlEDeaknGW5nWrx
         U6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731980; x=1794336780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0GuBZl5tUEif275GYSNAdN9bxcg0f2inEBlXvD0hwQ=;
        b=uAnYOPf2hhgJspo2oe0g1CupgQaQ+J8cE7WIo2TbVcq6EcMtoagUl1ooYrnkXPkQHc
         L6XymzWg47BXGYxtIG/OP69fYWkAwlgOA3WbJ5GbD98v7Qj4f/Iub9kFb+7gVKyL0Pr6
         rZT2BslG/2wV17EIWKYe0xuEaoZZXIhWmasb3i4jAOoZ44ITer451zf9PnSPVx4ZXtTA
         CnuROerDSS0iHT2B7EPnhB4SvcbbNOg+aUA+tr/DvcmNwGEyctSunSsMGeVGYMkjcnw/
         22mGKKW6Ot1ToMSICkz6G8FNWXOWAKBUUTxecK35UfIOs4Fu2RrXmgheYPWUEC3gLrc1
         yiFA==
X-Forwarded-Encrypted: i=1; AKwUvBxWga19K1Bo9UfK3SrsstU3poaSd7GS0er80MqbAfkKhDHYwfRaeboD2+zlNQI1xCMkOt2o2WofCb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g+BQJ8a57FtParWwBLTzB5tKIFMqFacVdhSzlX3x56z8Rpk4T
	GMI6RDBUkt0Nx+KHesS+nKT8/r525sTxa9wVAJ+QaNBvkQMkmrasZL7d
X-Gm-Gg: AYBFou0ALhIRZOCjCkSZR0ORKbj9OjmxNRxLwE4ZdwHCjFIcZ+xAAnAJiIEzUsXdD2N
	maRBs8JI0/d7nSs1eIOiz4EZul42HXH9Vsd1rlqp4qLfh2mG0kp5Vy1rx/0JtESPOwclWyLsSKE
	Uf6gU4JyAB5smrjLrWRy69MHTgl+xhKGc1XpsCCg11uTWKpmXcmsHMViTHjs9Yuxl7uO4UKklSM
	v2iaM4UNyMqJkLlTfYO6sSBOcIA/F3pA47pxQDDaVRyyAkwIbMhMAZQe5f2YvFsZo19XLh+6cAW
	jrHrqRFcB3HTLUa+W7Sa8s11rHBQY6cqso1I+jnUTAsMr9dh8uUMv9Lh+MQ4WJi/uECycr9wDYz
	4LOtS66KvWcpRd3IAqSXkQs3gq0wCSWUnXxw5/7Oye8Oqww3EUn4K5JirafL2oXJ/xtjOGmAdRS
	TPXyM6CDXFH57I/MLFvjLYCD6OB81h9cIcdyDTzulbTLYQUBnai1M4yB9ByYRl9dX3ckRNZq/zX
	dNWb9T40RS981OP+92dSPOvvMfsCN5OryUSNN358OB6yHf82BZ4LgYkHsBuo0IzJO1BoO1LfaPP
	9PxfCw+YYGdcEU9s
X-Received: by 2002:a05:690e:807:20b0:679:943f:b192 with SMTP id 956f58d0204a3-67ba50a6907mr6696335d50.76.1793731980016;
        Tue, 03 Nov 2026 10:53:00 -0800 (PST)
Received: from illithid ([2600:1702:7cd0:e980::49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309710cb8sm3026727b3.5.2026.11.03.10.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:52:59 -0800 (PST)
Date: Tue, 3 Nov 2026 12:52:57 -0600
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>,
	Alejandro Colomar <alx@kernel.org>,
	Xavier Leroy <Xavier.Leroy@inria.fr>,
	linux-man <linux-man@vger.kernel.org>,
	Michal Schorm <mschorm@redhat.com>
Subject: GPL/GFDL incompatibility (was: Two copyright notices missing in
 6.20?)
Message-ID: <20261103185257.drp754t7vjfi5wgw@illithid>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan>
 <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
 <aun6mEuYKQG-1IKv@devuan>
 <40697762-75d5-4d08-9740-4e68b379d80b@redhat.com>
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
	protocol="application/pgp-signature"; boundary="uky75ab3ta3ux7k6"
Content-Disposition: inline
In-Reply-To: <40697762-75d5-4d08-9740-4e68b379d80b@redhat.com>


--uky75ab3ta3ux7k6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: GPL/GFDL incompatibility (was: Two copyright notices missing in
 6.20?)
MIME-Version: 1.0

At 2026-11-03T13:02:01-0500, Carlos O'Donell wrote:
> On 11/3/26 10:28 AM, Alejandro Colomar wrote:
> > > Date: 2026-11-03 09:55:31-0500
> > > From: Carlos O'Donell <carlos@redhat.com>
> > > Likewise signbit.3, significand.3, and memcpy.3 are GFDL
> > > derivatives.
> > > - These should be rewritten from scratch or GFDL front-matter
> > > invariant requirements apply.
> >=20
> > Ouch!  Indeed.
>=20
> Yes, these are problematic and we should move towards compliance.
[...]
> I will go publicly on the record as saying I do not like the GFDL for
> the glibc manual, the invariant section, and choice of incompatibility
> with the LGPLv2+ means we can't even copy comments into the manual
> without having someone who can relicense them.  This is a process
> mistake that we've been trying to fix for a long time.

Can you shed some light on what is impeding the fix?

I share your frustration with GFDL.  Fortunately groff has escaped this
difficulty; for at least 22 years,[1][2] its maintainers have held that
everything distributed as part of it is licensed under the GPLv3, with
certain portions dual-licensed under other terms.  So, for example,
groff's Texinfo manual is also under the GFDLv1.3, the grn preprocessor
(from "Berkeley ditroff", a specimen that does not seem to otherwise
survive) is also under the usual UC Regents license, and gxditview is
also under the MIT X Consortium's permissive terms.

In the groff 1.25.0 release, which I hope to make later this week, the
copyright page of its Texinfo manual will be explicit about this.

https://cgit.git.savannah.gnu.org/cgit/groff.git/tree/doc/groff.texi.in?h=
=3D1.25.0.rc4#n26

Regards,
Branden

[1]  https://salsa.debian.org/debian/groff/-/blob/master/debian/copyright?r=
ef_type=3Dheads
[2]  https://cgit.git.savannah.gnu.org/cgit/groff.git/tree/LICENSES?h=3D1.2=
4.2

--uky75ab3ta3ux7k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmrqLYIACgkQ0Z6cfXEm
bc7ymhAAi2Y/uKUHnsz8A7KyhHvWHAZ0xt2MFYJTJxLasMDdLePntA6jxxQNpt8e
8LfRm4/FIJn8MGumJcNEv23wjDzVkZdgljTzJWNDXDHIrK3jJzWLq2GPO5nMwu7Y
yNcCyT+uSb6sLBKbx2VJlC9Vy+xrTjzh/wJcLA+0673Zr36QfWCdEGhsldn15OgF
vqE1n2os+pakZl+8t7cEQZ0VlFATeI5U00xnu3E7rVS8uQ6W2r3hOwB3WxZxTqyF
Ry4mGwT5+KqxEh7hwy+ESd0N9slGYOM3YFSmAsivoWyQg+sY00VVvH9Tniq6NekI
qvwz4eQa7kvZ29UTsrx8lmJi39sw97RFMVrKtiLju/5XKmxSG9ncaTgFgq8jveUn
iyY+1IuZUpa6f+IfigM13X8fIm3COw9BGgSNLln52icD89aJdsSRLVapCe19mzyy
VtAohI1rLiWXN1Vd5/ctq6xBDTmYuYz77sJ50HLU+X5u8TcLljiplIRbYcaJfzkY
lzt2rQNbZgu+EAtTzw1nRnKmrBIgnqHMReoMLMpGtYHslAbdP51wWlm9DvxN7jcP
ijmU4OvMuxpy7rI7Y0n2PgjYAIWbv2RP8fsS2cO4pS4DZEVzduWUwaJW8jq8LfJm
U+iXJ6SBd6yPQND+qLraLe96CdCmrRdp0KqarCBh/Sj2ERNs+ew=
=5bDl
-----END PGP SIGNATURE-----

--uky75ab3ta3ux7k6--
