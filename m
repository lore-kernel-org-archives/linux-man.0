From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : add notes
Date: Mon, 1 Apr 2013 03:19:43 -0400
Message-ID: <201304010319.45019.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <201304010213.06056.vapier@gentoo.org> <CAKgNAki_8bOsuKTJLx3iMLeSvVXHo0bZf8zSUQ08RR7+D33xgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1669440.TPon2Q5Lq6";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAki_8bOsuKTJLx3iMLeSvVXHo0bZf8zSUQ08RR7+D33xgQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gunho.lee-Hm3cg6mZ9cc@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1669440.TPon2Q5Lq6
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 01 April 2013 02:22:45 Michael Kerrisk (man-pages) wrote:
> On Mon, Apr 1, 2013 at 8:13 AM, Mike Frysinger wrote:
> > On Monday 01 April 2013 01:33:49 Changhee Han wrote:
> >> +However, when using
> >> +.BR syscall ()
> >> +to make a system call,
> >> +the caller may need to handle architecture-dependent details.
> >> +For example, on ARM architecture, a
> >> +.I "long long"
> >> +argument is considered to be 8-byte aligned and to be split into two
> >> 4-byte arguments. +
> >> +.BR readahead ()
> >> +system call could be called like below in ARM architecture.
> >=20
> > this has nothing to do with alignment.  syscalls pass args via register=
s,
> > and in the 32bit ARM port, registers are 32bits wide.  so in order to
> > pass a 64bit value, you have to manually split it up.
>=20
> So, I'm not familiar with all the details here. What is the purpose of
> the '0' argument that precedes 'offset' then?

ok, so the answer is more nuanced, and the reasoning above is incorrect (or=
 at=20
the very least, poorly phrased).

for ARM OABI, there is no such padding, and the proposed example is wrong a=
nd=20
will not work.

for ARM EABI, the ABI requires that 64bit values be passed in register pair=
s. =20
since the kernel people wanted to avoid an assembly trampoline to unpack th=
e=20
64bit value with EABI, you have to call it as proposed:
	syscall(readahead, fd, _pad, high32, low32)

for MIPS, only the O32 ABI has this behavior.

for PPC, only the 32bit ABI has this behavior.

otherwise, i don't believe anyone else does this -- they just pass things=20
along in registers w/out padding.

since the current list of syscalls which are impacted is small, it might be=
=20
useful to explicitly enumerate them.  they are:
	fadvise64_64
	ftruncate64
	pread64
	pwrite64
	readahead
	truncate64
=2Dmike

--nextPart1669440.TPon2Q5Lq6
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRWTUQAAoJEEFjO5/oN/WBQ2oQALhw4jB/dV5SI4wIY7UhSsR2
a769bx68eNDKu3TFBAUAtXfzV7TJzrjLMgTqk2/nhJ7zyZBF0axus3BInN0oLBHf
ePbq+yl0IGjW3ytwcmOCp86ipjxsTYliginPrvfHJZZB9TBmn9mBEEe+8IkX18Dj
prv2XozPBrB3IDrm2QkXkNba+qMoGHJWuEAKCP5PI7IobTgcSSY3+9FtoCLz9sLO
Ad/0QUWmOb6Cou6ybsi1jAgcHNFu8h8FErCsR0bNigWd+YyuNQ0/KBIaBOtgHPOG
LPFGsH3AmHcBDKmtAk5jJ0x+lPMOhK8u9bNXo2WBf8Jv3BMo64Bf8+WrIM62OFTh
IKbIJtVEd+2zJP0sKmjjWikMeo41MdJIpO5oszw1uJsNXEAqmI43OY/0UbTea9oX
tEvgYwFklURxt//8kT86CT3L9OW7WJZZjLqZcnOg6t7Hd0mqVHYSzLG+R9ISOsIa
teL1fwYJLR4v90j/JCni62kwNe4N1aDRBUT5RFZ+vBu3aiwmmoxcv0qz9ucmiCEN
UZ7MCUxnTVLXmHl9Rv/R7azycdTyc+89mjitRZeRf0oY0g6KU9bQ+aVq3qTITTSC
IR2Vu/okYJm9ZX7B3EuwKI5R82Y27uDAFT9rfsW0tgir8hjtmNNEwAkz6pcP46e1
ZsxDY33SrOnLWK7mAxZF
=s8QA
-----END PGP SIGNATURE-----

--nextPart1669440.TPon2Q5Lq6--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
