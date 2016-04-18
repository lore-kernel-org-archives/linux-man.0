From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/7] Improve support for compressed man pages
Date: Mon, 18 Apr 2016 11:12:58 -0400
Message-ID: <20160418151258.GO5369@vapier.lan>
References: <20160416022503.1df762cb.alex.miller@gmx.de>
 <20160416045058.GS6588@vapier.lan>
 <20160416183013.352f4ba6.alex.miller@gmx.de>
 <20160418144918.GK5369@vapier.lan>
 <5714F856.9090206@bfs.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6yHiY5vv/BiPjcMt"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5714F856.9090206-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Cc: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org


--6yHiY5vv/BiPjcMt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 18 Apr 2016 17:08, walter harms wrote:
> Am 18.04.2016 16:49, schrieb Mike Frysinger:
> > On 16 Apr 2016 18:30, Alexander Miller wrote:
> >> On Sat, 16 Apr 2016 00:50:58 -0400
> >> Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> >>>  if no one
> >>> is using this code, then it's just sucking up space.
> >>
> >> I'm not concerned about the space, but code needs to be maintained.
> >> IMO, as long as it works, we can keep it; if it has issues we'd
> >> better remove it.
> >=20
> > sorry for the ambigious term ... i'm not referring to disk space, but
> > to the code "sucking up space in the Makefiles and our eyes".
> >=20
> >> We can drop compression support or do it right - I'm fine with
> >> either option. We shouldn't keep the status quo, though.
> >=20
> > i'm not advocating for the status quo ;)
>=20
> as one of those people that like to have it directly from source ...
>=20
> I would advocate for having just one compression type .gz would be ok.
> space i nowadays not the main concern but it is convinced to have.

in my experience, the majority of packages nowadays don't try to "help"
you out and automatically compress installed man pages.  so why should
man-pages do it ?  you already either (1) have a custom solution or (2)
have uncompressed pages installed.
-mike

--6yHiY5vv/BiPjcMt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXFPl6AAoJEEFjO5/oN/WBXFgQAIU2vj9JiImxLpNJaN9Zl5Pe
rOmIR1pPvA8si5lVkXXWCVLgpbRlBgrMpXw9e/0Y2d9JRIL44QcvUqeh++sJpBZY
6Ej0hq5eA2tDrAklNudUGUAsyvubsP60raji89YV0Ph7MJeB0u/1iYANjTbtKf5w
SRFgsUek4DJWVER44S5MU8MWQepOHpSipJOAtdGazxruAuSsv7MJcq3xxt2Q9tDx
Oj3hI7DIAsGhXJ8KwAwHCsHcXWZOCbDD2uKOuQr1tnsdWY94WdBbtoRuBPPgyvTk
w2qO+gogcKd9IDLtyddIXk6LGOzoHPyDC5TZfQCc2uJrGhwiOyyzhbW2I4tEs4gT
PPyJb3RDgZK9j57qcVpkHefEfq3WpDb+J5/qrfCBoi7gYZYMHjnpORsijdlfbjC2
Lpe9k14/cf38CCUHTuMXsJqzC++PpWAW9X9AFvQZWW7cDY7ttC4mY8uXME16idyS
CIaQTYeKjzLgzKSsbpnUbWIdGYcKnEzo1bnEs7IFKESkv5S2ZE51BbQG6X1M8XO5
wrxvCCM+JPzucA5tZwpbHk+28HZmgkCTDDnHw533Aq76QjnnUyjL51NSIXb1YuzR
tVtHU+BLsxnjhXBSCcS9VzhDEW3/9+OqvPBv9iYpe6iUOksvYSsrb6fyUEL732Cx
jT/AMvL7dHYWzyX30ndw
=f7CQ
-----END PGP SIGNATURE-----

--6yHiY5vv/BiPjcMt--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
