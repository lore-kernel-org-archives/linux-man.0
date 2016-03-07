From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: locale.5: drop tel/fax description
Date: Mon, 7 Mar 2016 12:48:50 -0500
Message-ID: <20160307174850.GI6588@vapier.lan>
References: <56DD6B93.8070802@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TIEGfCGDzZzDroj5"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56DD6B93.8070802-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--TIEGfCGDzZzDroj5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 07 Mar 2016 13:52, Marko Myllynen wrote:
> glibc upstream recently deemed that the tel/fax fields are not useful
> and dropped them from the few locales which had them defined. Do you
> think we could/should drop the descriptions from the man page as well?

the fields are technically still supported, we've just emptied them out.
i would add a note saying that their use is discouraged in favor of the
other fields like e-mail.
-mike

--TIEGfCGDzZzDroj5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW3b8CAAoJEEFjO5/oN/WB318P/0YgGriiwWByd0xCFA7CW0bB
WnkrjIStUAh4tnhGgaVy1a4Yyx6XjhSNwihVk/0iYwGYFlQPTm0KVOITbCMexeDx
67C/EblC+CrAlDq3uPVTeU79qpujwnU+6cDjpb8avYgy9r748fr3VWpz+DVZiOZD
rDGr83FoHV1jn4XYRNwnDqkz/lTdlYx3pQFVB92RTTrBxIwl5KCAheMILW+WwVbd
Uv9pG58yax//nM8RZtiR8SNR+y7RQ+pXd+EOFxX6rKjI/VODoiwQeIH9KyyzT1B0
UY/kzPEfL+BbistAQ87KJv/HQvY91eheX5gTaxMVs/V+e1ndDaUvt4ey6txflpwo
ZTLQ/gyVVTHg+Hcqb4LO12dNBY32I9A5oSsOgL7f5AyGt2oXXnuzEj+e10h+ww2W
IExVssVVwO2P8PztRKijE0zoRGecLQ6W9iTI2rhfwBKDsPmF7VkFv4nL6cPEQbca
NNybynTh2CWLWEb976FPijoeAIrgTLhLdHBRcfph8cnDiISmxaLeeUB7zurW9hDR
Gv4fw3Krll5iRpZgU/tCbNsmFQOESu985724TtBVBWuT+sOZmHbs75WlNbdlC1Fv
1zQTssMRnftSzazaREafsSVNu2rvzgzp+huvB3GKuFs8AprKjs8SrXWt0Rk/1MKW
QNCcAcXu7ae8KcarnnoT
=DChi
-----END PGP SIGNATURE-----

--TIEGfCGDzZzDroj5--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
