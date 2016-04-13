From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2] vdso.7: update for MIPS
Date: Tue, 12 Apr 2016 22:08:28 -0400
Message-ID: <20160413020828.GD6588@vapier.lan>
References: <20160406190137.GH6588@vapier.lan>
 <1460448781-42861-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="biJGBUpzJDMg2Z7t"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460448781-42861-1-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--biJGBUpzJDMg2Z7t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 12 Apr 2016 09:13, Zubair Lutfullah Kakakhel wrote:
> +__kernel_rt_sigreturn	LINUX_2.6 (exported since Linux 4.4)
> +__kernel_sigreturn	LINUX_2.6 (exported since Linux 4.4)

are these actually exported ?  looking at vdso.lds.S, only the other two
are.  my question previously was more about the kernel behavior than it
was about the docs being incorrect.  your v1 looks fine to merge now (as
the 4.4 release is already out the door).
-mike

--biJGBUpzJDMg2Z7t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXDaocAAoJEEFjO5/oN/WBuowP/0lDeqdRFYqi4pcgJDFGW/tH
xDeDK6qSjNG/lavQmQTtfmrdf2TgTltRd1sMN5Y44GZMGB8MErDFDt12nzZJfi43
Kjs5kcZAESD/YgTwwpychRKpKvEPXFerro2b3nKdGklboFyDqGpdFup0dyP3o/t5
2IZXT7BxE8NCFmyv2qWyCvTG795djhjVWGykNWhO//FeWoMKeDbJ2RC6cGuojLZO
S6D6oFVnzY4eb+O3yKfgFP00pwre0B1aOtLFBkWV6E8wY6DwnjIz+v7BmGV2SU7o
cdMF05DIQWj9pJ5V7nYlyVerI+w6FaL8pvgeSLcqJGNikTP+TC9UwLZNjumbzHq4
eAquAmq38fArl74vEcrpigkJbzjTSboBvIZ9wVNc5WJuyUaFy3dt/UXAQpiAZlQs
r6V3mxgX1k4ok6GmAsOs9qaCWJiqf1yMV448wCKqB5bD5JagXmGgQdUGU20wAzh5
FpgbbvfT04GkPGFPGDAUcM+KrSwT+7CHL9jgBJwhkq+FGUP2KNXjmTZsgKJc1ac/
dn1DX7RXHZ0CvmeEeRG+alBWFLsc6PzIdD4BosXb9XpNqF1Gx9qbuiLN7983erfr
UM6yqidSLbDlXHeo12etjoovs6534bHJoqQ5M2hccORGrOWWHIPj9ieVYtxbC1o9
GDIOX29LsQlWPZcjI4PF
=f2+t
-----END PGP SIGNATURE-----

--biJGBUpzJDMg2Z7t--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
