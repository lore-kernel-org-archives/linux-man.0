From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : add notes
Date: Mon, 1 Apr 2013 04:29:44 -0400
Message-ID: <201304010429.45737.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <201304010319.45019.vapier@gentoo.org> <CAKgNAkhBASGvXGfdBSjpGaMuxoJofcQvZQrX3a=uxbcKQnXOAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2637687.fKkRpY2ZvS";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhBASGvXGfdBSjpGaMuxoJofcQvZQrX3a=uxbcKQnXOAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gunho.lee-Hm3cg6mZ9cc@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart2637687.fKkRpY2ZvS
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 01 April 2013 03:36:40 Michael Kerrisk (man-pages) wrote:
> +glibc handles the details of copyiing arguments to the right registers

copying

> +the caller may need to handle architecture-dependent details.

may->might

> +For example, on the ARM architecture Embbeded ABI (EABI), a

Embedded

> +.I "long long"
> +argument is considered to be 8-byte aligned and to be split
> +into two 4-byte arguments.

i would rewrite to:
64 bit value (e.g. "long long") must be aligned to an even register pair.

> +.I offset
> +is 64 bit and should be 8-byte aligned.
> +Thus, a padding is inserted before
> +.I offset
> +and
> +.I offset
> +is split into two 32-bit arguments.

i would rewrite to:
Since the offset argument is 64 bits, and the first argument (fd) is passed=
 in=20
r0, we need to manually split & align the 64 bit value ourselves so that it=
 is=20
passed in the r2/r3 register pair.  That means inserting a dummy value into=
 r1=20
(the 2nd argument of 0).

> +Similar issues can occur on MIPS with the O32 ABI and
> +on PowerPC with the 32-bit ABI.
> +.BR fadvise64_64 (2)
> +.BR ftruncate64 (2)
> +.BR pread64 (2)
> +.BR pwrite64 (2)
> +.BR readahead (2)
> +and
> +.BR truncate64 (2).

the style here is messed up.  i'm guessing you meant to make a new paragrap=
h=20
starting at "Similar", and you meant to add some text before the function=20
list.  also add to the list: sync_file_range and posix_fadvise.

not sure if it's worth mentioning, but this issue ends up forcing MIPS' O32=
 to=20
take 7 arguments to syscall() :).  on ARM/PPC, they avoid this by reorderin=
g=20
the arguments.

i see that the existing sync_file_range and posix_fadvise pages explicitly =
call=20
out this issue.  i'd suggest updating those (as well as the other funcs tha=
t=20
are affected) to point back to syscall(2) for more details rather than gett=
ing=20
into too much detail.

on a related topic, would it be useful to document the exact calling=20
convention for architecture system calls ?  from time to time, i need to=20
reference this, and i inevitably turn to a variety of sources to dig up the=
=20
answer (the kernel itself, or strace, or qemu, or glibc, or uClibc, or lss,=
 or=20
other random places).  i would find it handy to have all of these in a sing=
le=20
location.
=2Dmike

--nextPart2637687.fKkRpY2ZvS
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRWUV5AAoJEEFjO5/oN/WBNLIP/AxltUF3fwZM2GCC880Iex2Q
l8IQdXqvXVT/ge5rrfFNH/NBzQLNugNDQkVbrTQ2GPRhEBmIkCwhpMMw6tgn4938
qv/WtQRjdL63N3wOc1jVGV8iDoeEptXBSR1FzAMEgk1y7X2kDQj0TUB3y7e5iKXJ
yJxNYKzMTaHZQjdGoQvNG550uxY+xKdG+5JPDNjKg8ntzhJE/NZKzRuRjCHermzd
cQ6osBU7O6q6mJ3xbZ/jvc5i3OzWP56e+nc0u5jDwUo61wj2RlYYUdGqKSqiqXoW
DlyDcuffQS9lxxXRNPoFRQ1U8syKaeCDeChHr+IW70PCEPt8wTLLB4VTW6+Mpsd1
Md5aHCf4zvDIscPqSnJ3GEQml1VGfHUtla7CBKyCDlX9Fhcp0ZzyeaOJOMD7+bsH
rgAm4Ly9rgx4DMwZqVPmhDrsRMgT7HZW6m71LWxD14xkuW1SbvaupL/Zk1Bywuof
V7dWck6LQX59mXmjooQsF285AsOgtLNAfYZAUAkvHexQeZi32kY/HkwDP/5l48hk
orZKyFSLPOUUT6o8T5WSgjujxbB8Dtis850egFKXDYlexdhV6+nxMcje3A1LFKRz
76NKXM3FjdsTI9CvsPilhw87/eNaVJ6xIZNJy6mXRpFPJIE14KG+nchHeU3xNAcF
sdYOW8C3banKG2qSJVj8
=wBW9
-----END PGP SIGNATURE-----

--nextPart2637687.fKkRpY2ZvS--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
