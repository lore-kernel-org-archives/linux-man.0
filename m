From: =?UTF-8?B?RGF2aWQgUHLDqXZvdA==?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Subject: Re: formatting of encoding standards in utf-8.7
Date: Sun, 27 Feb 2011 15:07:11 -0400
Message-ID: <ike7d0$cjs$1@dough.gmane.org>
References: <4D6A94D3.2090701@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D6A94D3.2090701-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

Le 27/02/2011 14:15, Martin Eberhard Schauer a =C3=A9crit :

> working on the update of the German translation of utf-8.7 I found an
> inconsistent markup for UCS, Unicode, ASCII. As it was bold in many

> @@ -104,7 +114,8 @@
>  encoding.
>  .TP
>  *
> -The first byte of a multibyte sequence which represents a single non=
-ASCII
> +The first byte of a multibyte sequence which represents a single non=
-
> +.B ASCII
>  .B UCS
>  character is always in the range 0xc0 to 0xfd and indicates how long
>  this multibyte sequence is.

Please consider

+The first byte of a multibyte sequence which represents a single
+.RB non- ASCII

in order to keep the =E2=80=9Cnon-ASCII=E2=80=9D words attached.

Regards

David

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJNaqDdAAoJELgqIXr9/gny6OAP/2Q4D+VdOxNjNetKM2b3CLk/
xRyWoUR/IA7JTnhWwV9yNfSNmfkrupxm/wacxNKQqZCr4YGYB2CAPpVmFKdKtsTz
txv1qeBLJwbtMQ7dfQb9g3gHx/QnJJQYdomriRwbuueBsXlj7EfJSaJUNHPDv/pS
XeCE5KZN0gkj9+AbbkC2KVZkhg39fytCt3m1sz7cSfRRYzs2d2vuWdqtKZk915h/
tubAutlD03CPaA553E+qSrNbiE0Ym+3CX3/6TUp2XFif/t/ndBIFvg0KXMnVp8ys
JJzv8fsY2ohmgBqfmDv5vyVprFTKVPD756i3uN5dCDfO5+D5GuOCJwFAuVWOsfIZ
MSIshRRZIXzT0n15ImeNB//W4xDiJzUQChmR4tN1nZcMhWhMymqH8I6cGd4cULdn
SAz8CRrialdk/gtIPKZV39xbRs6r8J+vi1tNk2Uf6CO1IDKbeqqiVM9UiUoPRN5f
DFvO1YoFTB+guTHk7WWYO3kXs33DjmE+OmaJSzf2kvVSxGKhHP9qlXpg/Ru6k8sm
PDLayas+x3fTU63BiPKnXOiGEZOFKcuqC3du13OF54vHK2LOWRf8nnUdTIfnCrtp
fm6EJqFrSOKI7W75wtIh9mCLOmQ6osSlz8R5em4jVwqbrAJmgf5jvrTVIeMBsz/i
qWDlyYZe7VrmiuUvRM3d
=3D+ELM
-----END PGP SIGNATURE-----

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
