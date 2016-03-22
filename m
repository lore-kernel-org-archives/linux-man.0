From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: Re: ptrace(2): wrong kernel version for PTRACE_SEIZE and others
Date: Tue, 22 Mar 2016 14:16:29 +0300
Message-ID: <20160322111629.GA13320@altlinux.org>
References: <CACh33FrJRvC-ZQkBD2DZjW-YYnqNY5iCu_DtB8x+Jz_w80tMPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=x-unknown;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACh33FrJRvC-ZQkBD2DZjW-YYnqNY5iCu_DtB8x+Jz_w80tMPg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Patrick Donnelly <batrick-dP08NitdTj1Wk0Htik3J/w@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2016 at 05:21:28PM -0400, Patrick Donnelly wrote:
> The ptrace(2) man page says that PTRACE_SEIZE, PTRACE_LISTEN, and
> PTRACE_INTERRUPT was introduced in Linux 3.4. In fact, this was added
> in 3.1:
>=20
> $ git diff v3.0 v3.1 include/linux/ptrace.h | grep SEIZE
> +#define PTRACE_SEIZE           0x4206
> +/* flags in @data for PTRACE_SEIZE */
> +#define PTRACE_SEIZE_DEVEL     0x80000000 /* temp flag for development */

Yes, PTRACE_SEIZE was introduced by commit v3.1-rc1~308^2~28, but
it had to be used along with a temporary flag PTRACE_SEIZE_DEVEL,
which was removed later by commit v3.4-rc1~109^2~20.

That is, between v3.0 and v3.4 we had a test mode of PTRACE_SEIZE API,
which was not compatible with the current PTRACE_SEIZE API introduced
in Linux 3.4.


--=20
ldv

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJW8SmNAAoJEAVFT+BVnCUIxnsQAIvex0nBJwYNA8QjRmP6VPKT
tPOMQFxiLjqfpt50F8JsZmJ9vBdmMALxJazB6qiXO3NReW94Dl8Lh4rDS/fCa3fV
kZFCwi5IedkyzU+jTf+XJMGLKq4MqVxXkoVZv99OtEB5VINAK8ATG6rQ2llErIAN
Pkr/GoIFngQDMarJWZU+maLlWlfppXObZPVXJTWo9Pnc1Mio+TEP/kt6QYJYJrQm
6JKNiy/nFhfXk4m3MsOaN2IbQFB7wBTMdSvu7fchU2oZd43c7qJ7QtLol+F43ObN
I4ZP6Mid9eaWBfKMKAY3KngW2hZboyyzAF876vwRqHLa5lXC2+v6o9ouqmhYj88W
4yryIbM9ciRHzFj4Ji/8E6io11RWizl360NQcu1bkwWoRh7oOE5lhmyyh9z7eUJB
YoPHhl+6lCwxiQeo+OlrJENmPM/w3icvIkJZtH1wXQdJIJYgP6bmrtFTxDzaAxR4
SFQlHqb7Y0rtwibnjxkb0UNkAVBQwNjzavcAfq6jXYUpXIFnlOlu9ehzwGIIUDGG
oj4BaLdWLawfyIXn/fusDbyuIp40xTHtf/dnydmJMCJa7mTDp/XQUxADbrA5CKue
b2u5oFKArf/W4t2MioeriFfkBU19CnWRsB0PIWdumxdbj5edA0UT6MnrWrd3mteU
t1ky43V1AkwJW0TD/hnm
=duK9
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
