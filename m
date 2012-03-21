From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Wed, 21 Mar 2012 00:09:25 -0400
Message-ID: <201203210009.27190.vapier@gentoo.org>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org> <CAKgNAkj-bss8Tuq3jcPMRpsKCfKgHGSemq5emS48eBXi2JXA_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3946058.UST7ibAXz0";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkj-bss8Tuq3jcPMRpsKCfKgHGSemq5emS48eBXi2JXA_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart3946058.UST7ibAXz0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 20 March 2012 02:30:29 Michael Kerrisk (man-pages) wrote:
> And another question about a different part of the page:
> > +.SH "RETURN VALUE"
> > +On success,
> > +.BR process_vm_readv ()
> > +returns the number of bytes read while
> > +.BR process_vm_writev ()
> > +returns the number of bytes written.
> > +
> > +On error, the number of bytes read or written is returned, or -1 is
> > +returned if it was unable to read/write any bytes; in either case,
> > +.I errno
> > +is set appropriately.
>=20
> Is that last piece really true? On error, how does the syscall return
> number of bytes read or written *and* set errno?

yeah, this was a mistranslation by me from the .txt to the man page
=2Dmike

--nextPart3946058.UST7ibAXz0
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPaVR2AAoJEEFjO5/oN/WB6zgP/0Cd400WLF3hvXjbzTpDzNjR
c4RSMjgv4umL9WaXvmrgy69NlgnMD02SsPEJwdyUzJ1orgcDUulYCskU/3R/R9r/
uyZAvbqbfq5ZN+fwsQItGzA4evF8vJLHNBX950CTE3MG1vR/zqbh0oM5cogtES0H
LdWm5EA8BLBkSvj0e6Z6qHD0N8sAjVuJ3zPI21l7xAzzl9NsNfc5gLug05XOd4Bt
exhEVlKWJhZXNkwVJ+nHHSwmMUm5p5ZQyrFGLWPCh+rIIxyXlBe//TeoUE3RkeQo
TPfomsnK7Brdm2LL/8NrnTvtIdvSWGkQfno3PFas2uSCBKAkVuX3p0Lufgg5Gem3
S0tIFJcF8Aazxb+Y2XOi8xixPafySD3ILEoCHay4VUDVcv2MseGgRz2CrUrzRPMp
bjqBoL32Fq6W5xiXl31mWgK9eODr908D+ec4nrpmCF11fDVTgdtpB9GerXtB2qep
IF0accdZM5GGA2CSy4X4ZaGi3B+45vBhuT6IkKoia0aH+f40zb7+uKQL67XvRbzc
9nL5FXy6BrdBDKh59H/RBEyn1CFLxFMmDsTXT42ESfHnxu9kWhrB7kvzjpMWadZd
2lcHJzk20SZ90vQdAH47nLl5A1cWg1y6/QKTU99XchXDDbCzeDiuNZ0bwBcSf2mf
P/Oxg1vgc9oJZydTzaNF
=NMGh
-----END PGP SIGNATURE-----

--nextPart3946058.UST7ibAXz0--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
