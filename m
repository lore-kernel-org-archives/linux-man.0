From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: clone(2) should be clone(3)
Date: Tue, 9 Apr 2013 14:11:11 -0400
Message-ID: <201304091411.12265.vapier@gentoo.org>
References: <515EF542.8090200@redhat.com> <CAKgNAkiRHNZsnWj0J3hizbMRtnq6yAbJpFSr0x_-77bu_9eFXA@mail.gmail.com> <51645912.5080602@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2053222.xTjyu2kTKy";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51645912.5080602-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart2053222.xTjyu2kTKy
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 09 April 2013 14:08:18 Peter Schiffer wrote:
> My aim here is, that when I'm opening man page in section 2, the first
> thing I'm expecting to see is syscall signature. In clone(2), it's not
> even clear that this is a library call.

err, the very first sentence of the first paragraph says it's exactly this:
	clone() creates a new process, in a manner similar to fork(2).  It is
	actually a library function layered on top of the underlying clone()
	system call, hereinafter referred to as sys_clone.  A description of
	sys_clone is given toward the end of this page.
-mike

--nextPart2053222.xTjyu2kTKy
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRZFnAAAoJEEFjO5/oN/WB7AkP/0Nap0K9cseTKbd97jFXa+yM
ekJjGoWz6wwAFw0j+fHvjpjzIKCG5GRxlofGeUarnYo2LSYTO1qQwaCcwSZz/Z+t
J3LN+H5YIElxxCPM3sA6P275pFbMmaNRLAhef0+R95PIFWI928594mRdvCsrhxj7
9aQwPiirQUhobhO0vzR4l9y5fG75IHvQI0lrXhyUmOZJc5+L9ccGlOxoh+VVYF/E
urDwuoV8U2/qdqHD3bNqpoYRoBvgDQDK+HbAtuji0meZiNN0rFV893fm7PkAAlTM
MQk2mlZl8458nQSpfr1DDBTOqOQiBUgNFMuK3kW/G1Tpl2KCQ8CwJg+MBmb1AaTT
jmsxROJ9uk/uYRFedOL7GmfRFxbgn3k5HAE3XYq6iofSZReXRB/uHjs3OiU8ERDm
Xxlgv8vEKeWmWPYXjK9puaaa6RMKtU+DsyfDcxqbndAozLS0vpnTGR79Zfy/BTfa
9eXOJKJP7UTCbaMzWtcTwMbP+9FLpINxrjIz+st/E/HgwUAiSe81kabOprnIGV5C
nGVuvFbw1tAoj+ZgGgAuv4soiEuj7i0vdxIR4ozNJvC6UQntgpUIbOs4KlXZ4Ex2
GFhlt1MVg2z5fuXAK/TrZTz0t2f5OjVemc8V4dvPOrCUkS8DMUNdCI+CDafe996A
3m03WTyLH/1EQSrh6XuH
=8s2k
-----END PGP SIGNATURE-----

--nextPart2053222.xTjyu2kTKy--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
