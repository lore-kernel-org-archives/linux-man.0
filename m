From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : add notes
Date: Mon, 1 Apr 2013 06:32:40 -0400
Message-ID: <201304010632.41520.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <201304010429.45737.vapier@gentoo.org> <CAKgNAkij3zDwakWvcRkRbknmV2Hpt4HWfH4uVqmxp+7gQek-2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1473504.roA6bt12aY";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkij3zDwakWvcRkRbknmV2Hpt4HWfH4uVqmxp+7gQek-2g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gunho.lee-Hm3cg6mZ9cc@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1473504.roA6bt12aY
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 01 April 2013 05:29:11 Michael Kerrisk (man-pages) wrote:
> On Mon, Apr 1, 2013 at 10:29 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> > not sure if it's worth mentioning, but this issue ends up forcing MIPS'
> > O32 to take 7 arguments to syscall() :).  on ARM/PPC, they avoid this by
> > reordering the arguments.
>=20
> I'm not sure that we need quite this level of detail, so I'll leave for
> now.

i only mention it because 7 args to syscall is unusual ... i thinks mips/o3=
2=20
is the only arch that does this.

> > on a related topic, would it be useful to document the exact calling
> > convention for architecture system calls ?  from time to time, i need to
> > reference this, and i inevitably turn to a variety of sources to dig up
> > the answer (the kernel itself, or strace, or qemu, or glibc, or uClibc,
> > or lss, or other random places).  i would find it handy to have all of
> > these in a single location.
>=20
> Sounds like it would be useful to have that documented. Would you have
> a chance to write patches for that?

should we do it in syscall(2) ?  or a dedicated man page ?

if the former, create a dedicated section, or do it under NOTES ?

> --- a/man2/syscall.2
> +++ b/man2/syscall.2
>
> +64-bit value (e.g.,
> +.IR "long long" ) must be aligned to an even register pair.

this renders incorrectly.  the reset of the sentence should be pulled onto =
a=20
new line.

> +That means inserting a dummy value into
> +.I r1
> +(the second argument of 0).
> +Similar issues can occur on MIPS with the O32 ABI and
> +on PowerPC with the 32-bit ABI.
> +The affected system calls are
> +.BR fadvise64_64 (2),
> +.BR ftruncate64 (2),
> +.BR posix_fadvise (2),
> +.BR pread64 (2),
> +.BR pwrite64 (2),
> +.BR readahead (2),
> +.BR sync_file_range (2),
> +and
> +.BR truncate64 (2).

i'm on the fence whether this reads better if there's a new paragraph start=
ing=20
with "Similar issues", and whether the list of syscalls should be a flat li=
st=20
(one syscall per line).

> --- a/man2/posix_fadvise.2
> +++ b/man2/posix_fadvise.2
> @@ -153,7 +153,10 @@ or
>  first.
>  .SS arm_fadvise()
>  The ARM architecture
> -needs 64-bit arguments to be aligned in a suitable pair of registers.
> +needs 64-bit arguments to be aligned in a suitable pair of registers
> +(see
> +.BR syscall (2)
> +for further detail).

probably want to scrub the arm references altogether and say "some 32-bit=20
arches".  this signature is used on other arches as well (ppc and xtensa at=
=20
least).

would also stop describing it as "flawed".  there are tradeoffs when the AB=
I=20
imposes these kinds of requirements, and i'm not sure one is really better=
=20
than the other.

> --- a/man2/sync_file_range.2
> +++ b/man2/sync_file_range.2
> @@ -191,6 +191,9 @@ is flawed, since it forces a register to be wasted
> as padding between the
>  and
>  .I offset
>  arguments.
> +(See
> +.BR syscall (2)
> +for details.)
>  Therefore, these architectures define a different
>  system call that orders the arguments suitably:

also in this man page, i would stop describing it as "flawed".
=2Dmike

--nextPart1473504.roA6bt12aY
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRWWJJAAoJEEFjO5/oN/WByRUP/i66BbdL4J9WLbS13ynNCEZn
zKWKPppKp6wwOZ73BXrB9Vg59uzcbRNsSlZLzpJMVCjricma0mt2vHHRvaP/wW8n
0JzSbs6j4i9hu6+M6x12RxMX0sB176pezDLWV46SuZ2z1TbCrUYFJuwpIufADIyN
k8+THT+ikf5SYDTEzI68iuDEpZIIsO9PO6/b5k0nlyo5PNOHCycZovx6pvxaOoFD
vN7uyj58dsCU6c45C7vSw7IKVyp3gg+Q2ZK9CAIB7Po7D/foqxdjyJKZChcSOvaV
yjCf1U9vF3INDcYsJx+wWku0KyTBRyUaz/CxtcN5b6rrT9N9kNHlc5kJ5xWEPWgk
J4SeDw4Go50tK9CgFk95Q5gi+MhfPxBg0ssxh8x+N8MfUH5JqCczYmoZUqnsw1OW
fknpjdTMJA0u3O4KJL7/zUxeOic/ugb9mYKjWJ/uDT/eLVQgzKo90NoA/bK0M9p7
xIemrpLDJB9q0jT/XMBEUJbMfxWsMd3UNIXG/OdQcNnPWk59jnIWQMPVjxHOntTZ
ZUAQsG1ckdF49aSXQsdvHdJStRRlrMfM/0Fr3CB5VyBIACbnxaxb/yT6JJuR7mJZ
djv+yDOOxdRCLcFgIG5FT50BT2r4sgIFBZZIc+mvcYocoyfjEwVusn61bRdtuE/E
KC1rL+yUkF4wkVvalgAd
=Uw7S
-----END PGP SIGNATURE-----

--nextPart1473504.roA6bt12aY--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
