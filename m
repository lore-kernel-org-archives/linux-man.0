From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Subject: Re: [PATCH] pldd.1: Document glibc's unbreakage of tool.
Date: Sat, 18 May 2019 01:51:00 +1000
Message-ID: <20190517155057.vr5uk6hfkyp44y3t@localhost.localdomain>
References: <20190511072049.2w7pp723iszp3gra@localhost.localdomain>
 <8736liit24.fsf@oldenburg2.str.redhat.com>
 <20190513141746.mail6ny43wh4t5oj@localhost.localdomain>
 <87y335m6fq.fsf@oldenburg2.str.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pqk57mfgj3dnyq2e"
Return-path: <libc-alpha-return-102088-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
Content-Disposition: inline
In-Reply-To: <87y335m6fq.fsf@oldenburg2.str.redhat.com>
To: Florian Weimer <fweimer@redhat.com>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, libc-alpha@sourceware.org
List-Id: linux-man@vger.kernel.org


--pqk57mfgj3dnyq2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

At 2019-05-17T17:44:41+0200, Florian Weimer wrote:
> I'm pretty sure Debian 10 does not use glibc 2.28.

No, and for that matter I can't be sure that the next release of glibc
will be numbered 2.30.  :)

> My point is that the glibc change will get backported, but any
> man-pages change will not, so it will be quite some time until the
> latter shows up on developer workstations.  And due to glibc
> backporting, the version information there will be misleading.

Backports and distributor patches are a fact of life in the present
ecosystem, but an upstream version still communicates valuable
information.  My opinion.

What would you prefer?  That the man page not document the bug at all?
Was it a mistake in your view to have added the information about the
bug to the man page in the first place?

Regards,
Branden

--pqk57mfgj3dnyq2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlze2FkACgkQ0Z6cfXEm
bc5iPg//aSkGK+LwOscXbNlCHjPYuSj/PdlPeNIuSiUcSMFhqUopAO/XAwjdFxnz
1sxtC2M3Wn0Y52c2DE3rDTP4FzP9hPCitzHpzULaS+vDqt61HLHpHYeM68D85C/5
efaBoi3ZNClbUq7Hj/fqy6snnlen5/cyNAh9EeDoS10e8k9jKVCpgsHG92upXoao
yUiGAr2z4UGfXigLWKJFnpdSUTiE7yI35z8/lwV2NRws9NZxjJTkVWhu91LJdl+U
iPkcDpZ8YT5ZqG0nBmlo57otQqyi1LjfjhYhjeg1xMWRFyJZKIYEJxTXfRNkYIR2
lmP77XjHWoJGUjrHNXt48HzyGavUn9sp62DGsZebBJR2sevXX4VCl4uJlgQ/ZL+o
CLfQFDBE2eRoATMlkDkPMbYVQiLwjkoIsCmtVvkXLnNwqx61OEVMCtBJqPlLileu
Z8hQz2K98lHUeYZYfv530YHM71jxaCV3MEl11dYiRiIoS19lUcgQswfrm+KCc/Vp
/LbErMShwU11fKQyRDssaYIwAokE8C9dzMWpWrdImTr1AS9D6PdQYnZGrtd8Brem
O1qqpw8l2uJCQcO0o+stzzEJhA51S6Zn2hQcJZmOQKPuKz2Prt+O2wJUw6Yk/bff
VoZLywLSQFpSk8fZUxDh/glyCunJL7ny75tziUkPumxlmGyhIfg=
=ECQO
-----END PGP SIGNATURE-----

--pqk57mfgj3dnyq2e--
