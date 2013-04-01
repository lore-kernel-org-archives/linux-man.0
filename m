From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : add notes
Date: Mon, 1 Apr 2013 06:09:05 -0400
Message-ID: <201304010609.06127.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <201304010437.52901.vapier@gentoo.org> <CAKgNAkit-qRPErHDzGEJ_yedA+O97bFxDsqWJMZOhCZ9DPvOtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart35018271.poxcUouJuL";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkit-qRPErHDzGEJ_yedA+O97bFxDsqWJMZOhCZ9DPvOtw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gunho.lee-Hm3cg6mZ9cc@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart35018271.poxcUouJuL
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 01 April 2013 05:30:06 Michael Kerrisk (man-pages) wrote:
> On Mon, Apr 1, 2013 at 10:37 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> > On Monday 01 April 2013 03:19:43 Mike Frysinger wrote:
> >> for ARM OABI, there is no such padding, and the proposed example is
> >> wrong and will not work.
> >>=20
> >> for ARM EABI, the ABI requires that 64bit values be passed in register
> >> pairs. since the kernel people wanted to avoid an assembly trampoline =
to
> >>=20
> >> unpack the 64bit value with EABI, you have to call it as proposed:
> >>       syscall(readahead, fd, _pad, high32, low32)
> >>=20
> >> for MIPS, only the O32 ABI has this behavior.
> >>=20
> >> for PPC, only the 32bit ABI has this behavior.
> >>=20
> >> otherwise, i don't believe anyone else does this -- they just pass
> >> things along in registers w/out padding.
> >=20
> > in random grepping of code bases (uClibc), i believe the xtensa arch al=
so
> > does 64bit register pair aligning.  a cursory scan of the kernel seems
> > to back this up.
>=20
> Also SuperH?

i don't think so ... the pread/pwrite is indeed funky for SuperH, but i'm=20
pretty sure that's a wart they accidentally copied from another arch (ppc=20
maybe?) when they implemented the syscall rather than needing to do 64bit=20
register alignment.  i say that because qemu/strace/glibc don't do the=20
register realigning for any other function.

> For my own education: which part of the kernel sources backed this up?

for xtensa, this part:
	arch/xtensa/include/uapi/asm/unistd.h:
	__SYSCALL(260, sys_readahead, 5)
that says readahead takes 5 args, but that's only true for 32bit arches if=
=20
you're re-aligning the value.  the other 64bit syscalls have the same prope=
rty=20
(+1 to the normal # of args).

additionally, the arch/xtensa/kernel/syscall.c file has a custom fadvise64_=
64=20
syscall with re-order arguments (with "advice" moved from last to 2nd) so t=
hat=20
the shifting of args doesn't end up requiring 7 slots (ala mips/o32).
=2Dmike

--nextPart35018271.poxcUouJuL
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRWVzCAAoJEEFjO5/oN/WBP6EQAKgBAcDlDe2wazdEF0HTQDwa
G7py+oz8MVXeQUwdQi/WEIM6w9QrACCxiNcmPu0u22GDJ5KgczkrSH8eErzPSoNk
emqPcRD2qZgmHgvEnmK+/SW3Rbvl396VaQ3MNkfzs/NH0kwS2Qd3esXvEbnioNMR
5LzLx6fFckpawvIE2tJOvqUN/gJwYg8TtGTewZCD1v5JBxeKJdG1hVsu+95atdHF
ciiP5GmBOkDS9kTVRzKFlQyhWp8s+uz3vl245WaSePhiG2IgG/NfItKF7ZSlyH1U
DWeGktDgjerQoNVgY6ufTgJfhiX+/diU0ifJJQtrLtUuyOxL3nRYD6bA0QIDACPk
J7nnnPvz4TWHlH8Nq6i+a+y1vdethxj1JinZCu3iAdY9ENSFW8eEQbNgY8asNlb8
iFY0/M6OyGrs846w7ds6Qc6Fog/UmggO1/XqhvDBsvvhc8qtURdG3Hl8vP3V5V3m
+Pm11nT9me2b6qSrA+uOMLkmZlbGxbvk18Q/T9fakFaZLSS383ojaPTIXXnOW+Yd
h36JgEAtcQ1EnrNthYgP7JCkIltIhdQwCHh7jgIAOmqiiJNAKzUBGCfPDqwLdL6B
wvvfBeBtqdpxPCmvkTjOVbK7D4hbI64zLzOSwG1mbq1Z6HHKhScgv6Dqq3xAAYss
utb6pYY5ErIT1b+qcO49
=Psty
-----END PGP SIGNATURE-----

--nextPart35018271.poxcUouJuL--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
