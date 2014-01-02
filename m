From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] vdso(7): new man page
Date: Thu, 2 Jan 2014 07:29:04 -0500
Message-ID: <201401020729.05590.vapier@gentoo.org>
References: <201304092317.01590.vapier@gentoo.org> <201401011244.13632.vapier@gentoo.org> <52C472DF.8020107@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1507618.Z66NRD3rxM";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52C472DF.8020107-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1507618.Z66NRD3rxM
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 01 January 2014 14:56:15 Michael Kerrisk (man-pages) wrote:
> .SH DESCRIPTION
> The "vDSO" is a small shared library that
> the kernel automatically maps into the
> address space of all user-space applications.
> Applications usually do not need to concern themselves with these details
> as the vDSO is most commonly called by the C library.
> This way you can code in the normal way using standard functions
> and the C library will take care
> of using any functionality that is available via the vDSO.

seems like sentences in this new version are excessively wrapped.  for=20
example, this first one will easily fit into two lines.  is this just due t=
o the=20
editing process ?  content changed but things weren't re-wrapped ?  or do y=
ou=20
not wrap to 80 cols ?  (this is beyond the rule of "wrap to commas and=20
periods").

> There are some system calls the kernel provides that
> user space code ends up using frequently,

shouldn't this be "user-space" now ?

> .SH ARCHITECTURE_SPECIFIC NOTES

change the _ to a space ?

> The subsections below provide architecture-specific notes
> on the vDSO.

another example of a sentence easily fitting on one line (there are many)

> Note that the vDSO that is used is based on the ABI of your user-space co=
de
> and not the ABI of the kernel.
> Thus, for example,
> when you run an i386 32-bit ELF binary,
> you'll get the same vDSO regardless of whether you run it under
> an i386 32-bit kernel or under an x86_64 64-bit kernel.
> Thus, the name of the user-space ABI should be used to determine
> which of the sections below is relevant.

having two sentences in a row start with "Thus" is a little funny sounding.=
 =20
could change one to "So" and largely be the same.

> The system calls listed here have the same semantics as if you called them
> directly via
> .BR syscall (2),
> so refer to the relevant
> documentation for each.
> The table below lists the functions available via this mechanism.
> .if t \{\
> .ft CW
> \}
> .TS
> l.
> function
> _
> clock_gettime
> getcpu
> getpid
> getppid
> gettimeofday
> set_tid_address
> .TE
> .if t \{\
> .in
> .ft P
> \}

my troff foo is not strong.  this section renders funny for me -- there's t=
hree=20
blank lines above the table.  do you see the same thing ?

	The  Itanium port is somewhat tricky.  In addition to the vDSO above, it
	also has "light-weight system calls" (also known as "fast syscalls" or
	"fsys").  You can invoke these via the __kernel_syscall_via_epc vDSO
	helper.  The system calls listed here have the same semantics as if you
	called them directly via syscall(2), so refer to the relevant
	documentation for each.  The table below lists the functions available
	via this mechanism.



       function
       =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80
       clock_gettime
       getcpu

> .SS parisc (hppa) functions
> .\" See linux/arch/parisc/kernel/syscall.S
> .\" See linux/Documentation/parisc/registers
> The parisc port has a code page full of utility functions
> called a gateway page.
> Rather than use the normal ELF auxiliary vector approach,
> it passes the address of
> the page to the process via the SR2 register.
> The permissions on the page are such that merely executing those addresses
> automatically executes with kernel privileges and not in user-space.

should be "user space" i think.
=2Dmike

--nextPart1507618.Z66NRD3rxM
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSxVuRAAoJEEFjO5/oN/WBP8YP/3B8RSIpqKRSsy4YlH33GrKN
/bGWSYkLbYZZU9Fg1o9+nDDgQa8HG1IeEuZihiQanOLhdcSc51P61IpuA7Ho5MIG
wkEJIQlC9ph+NJKT9RqjrXgolRm9LHaiXxLC14NhEg2a/a76O+zk/pwIOZeyKhDg
aVkZr+NR6a5ssqHBeagB1RT+u1i8oh7e5VVRqp2GfiZR5jtsPFoZB32o9OfheK4/
5/M7w8vctgxkjHmmtqtqNufiT6JsYvaLcpojPV4YvHit9TmeyMbwXz24wSWWdkH5
wZkIjVuJaTsehR4BRK/VgXVGj51j3LuYu3T6P3IFkRt2rsPOLh5J0Qvkxe9k45Ke
GB/wDVKXA5hmT1h1QNTAWRdZoGSV0JY+xMpwbSV0h18bO6fmM7/bzXrOZIzyEqYs
NtpFHYbXRRdDCgTYN/z0z+NfWbboW5MsdZosIjGmwCOkvA+PhwnYa4MgCiPB8lWE
F+umhUhS8h3k3C96bJthmo3CeBmNwUoD0wnUscx6PM8uV0wEowptogGHtcheJdWn
tNDgh7Brwza6adp+EgfuqdjjWPYeArbiTCRQ/gTNVa02ZNvdIfDEMNwH6x/pfftL
GwPta9w3iARWj08/kOZB3EliHQuZzoAqomp5//PrCP4YYVfarnvwKwSYIwJ9AQK/
wQh4SsC2nGLzB0ZctQTW
=WDsP
-----END PGP SIGNATURE-----

--nextPart1507618.Z66NRD3rxM--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
