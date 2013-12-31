From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: vdso(7): new man page
Date: Tue, 31 Dec 2013 02:32:22 -0500
Message-ID: <201312310232.23392.vapier@gentoo.org>
References: <201304092317.01590.vapier@gentoo.org> <201304112128.47633.vapier@gentoo.org> <519CC681.6080502@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3010037.2W3t8lGp3U";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <519CC681.6080502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart3010037.2W3t8lGp3U
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 22 May 2013 09:22:09 Michael Kerrisk wrote:
> On 04/12/13 03:28, Mike Frysinger wrote:
> > here's v2 w/Andy's feedback
>=20
> Thanks for this--it's a nice piece of work. Could you take a
> look at my comments below and send a v3, please.

anything i didn't explicitly respond to below i merged with my version

> > the kernel you wish to make a syscall.
> > However, this instruction is expensive: it goes through the full
> > interrupt handling paths in the processor's microcode as well as in the
> > kernel. Newer processors have faster (but backwards incompatible)
> > instructions to initiate system calls.
> > Rather than require the C library to figure out if this functionality is
> > available at runtime itself, it can use functions provided by the kernel
> > in the vDSO.
>=20
> That last point (after the comma) is the most interesting (IMO) of the use
> cases of the vDSO. If you cared to expand on the details (i.e., are what
> are mechanics of the operation of those functions provided by the kernel),
> I think that would be interesting for the reader.

i think the paragraph after this explains things somewhat as you'd like (wh=
ere=20
it talks about gettimeofday) ?

> > All symbols are also versioned (using the GNU version format).
> > This allows the kernel (in the very unlikely situation) to update the
> > function
>=20
> s/situation/case that it is necessary/

hmm, i see what you mean, but i think your version isn't really better ...=
=20
just different.  i'll just delete the (...) text.

> > You use the standard C calling conventions when calling any of these
> > functions. No need to worry about weird register or stack behavior.
>=20
> That last sentence is a little incomplete. Could you expand/reword a litt=
le
> please.

it's meant as a follow up to the previous sentence.  so the implication is=
=20
that there are no functions which violate the C ABI for your particular=20
target.  arguments get passed in the standard way (registers/stack), and al=
l=20
the registers have corresponding behavior: scratch are scratch, caller-
preserved are caller-preserved, callee-preserved are callee-preserved, etc.=
=2E.

> > Note that the vDSO that is used is based on the ABI of your userspace
> > code and not the ABI of the kernel.
> > i.e. If you run an i386 32bit ELF under an i386 32bit kernel or under an
>=20
> s/i.e. If/In other words, if/

i.e. shows up a lot in man pages as does e.g. (and both show up in this new=
=20
vdso(7) page) ...

> > So when referring to sections below, use the userspace ABI.
>=20
> It's not clear what you mean here when you say "use the userspace ABI."
> Could you clarify?

the two sentences that preceded this one explained things ...
=2Dmike

--nextPart3010037.2W3t8lGp3U
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSwnMHAAoJEEFjO5/oN/WBQCoQAMDRV5gVJJWesXFJtZRFg8Af
WTUmkyrz+OyW8ucud+UE0Pp++MahAXoE9z4H4QG6BbI6mXvipo+HXTM3QjzUVNSy
eH0sYZDtsvd92LCjeiMmLGvuZj6TBrRX4oM2pY4SYSFIAAu95s7VPWosysNPJHQw
hj6M9lqWfN6DireEPAWFPnZcmhA9zfeTiq92fJ6lvJeL4p6foEU20s14v/2tLMgz
8lKZbLUvcfWWOkbxfJJO/SOvHPTD4QJnW0jMBoHUwsn9I6UQ6anGTrESqBnjbTYJ
WIRPfDCKuPsHTgH0ZzEIFjQnSjF6GI5nsiaOleU9qND2y47xUQ9hN8Lek57t6vc7
rOF6fKGGatbEV0RGgwZDcaJD8tKpysiZ4Y+6xAW5+ZjU7BW02E2+DZyf6yXXSyns
p9Us+GkGzRFUHpTwPBeLYngwi+tzogIrNDR6swhkUgI9Xb60Ip7dGP10DhFJredv
htRzYPGJCdT4lX41uEOMOhSf9Sg6ODH8gNdWASnj0CDZzJABXqmqMshxuPRHTpMh
kcWxC26p25ezzYJfIeDuHMC7zMVLsFkApXlKShue+zl0CchQWlNK5+aPyMXnvJO0
Giu6o2UWsy3/JygVJboIebEkqjx/FqT9F/RR4fe4a8zclA5q44uUhCYYNTeLJ/z5
smM2ANRmZK4Jgc6Q4xJp
=jIBl
-----END PGP SIGNATURE-----

--nextPart3010037.2W3t8lGp3U--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
