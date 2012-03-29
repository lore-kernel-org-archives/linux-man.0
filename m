From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Thu, 29 Mar 2012 15:17:44 -0400
Message-ID: <201203291517.46815.vapier@gentoo.org>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2486733.NQJdP1dnj2";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331358148-17235-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart2486733.NQJdP1dnj2
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 29 March 2012 14:42:49 Michael Kerrisk (man-pages) wrote:
> .SH SYNOPSIS
> .B #include <sys/uio.h>
> .nf
> .BI "ssize_t process_vm_readv(pid_t " pid ,

i think there should be a blank line between sys/uio.h and the prototypes

> These system calls transfer data between the address space
> of the calling process ("the local process") and the process identified by
> .IR pid
> ("the remote process").

you set up terms as if you're going to use them, but then later continue to=
=20
say "the calling process" and "the process identified by pid".  wouldn't it=
 be=20
better to convert all of those to "local" and "remote" ?

> .IR remote_vec
> is a pointer to an array describing address ranges in the process
> .IR pid ,
> and
> .IR riovcnt
> specifies the number of items in

personally, i prefer "elements" over "items"

> is a pointer to an array describing address ranges in the calling process,
> and
> .IR liovcnt
> specifies the specifies the number of items in

got "specifies the" duplicated here

> The
> .BR process_vm_writev ()
> system call is the converse of

"inverse" might be better, but either works

> .BR process_vm_readv ()\(emit
> transfers data from the calling process to the process

i don't like how this renders.  there's no spacing between the func and the=
=20
next word:
	process_vm_readv()=E2=80=94it

imo, there should be:
	process_vm_readv() =E2=80=94 it

> or the addresses refer to regions that are inaccessible in the local
> process,

might be better phrased as:
	... inaccessible to the local process ...

> .\" FIXME: What does the following sentence mean?

heh, i was just about to suggest a clarification.  consider the case where =
you=20
want to read a C string from a remote process.  you don't know its length, =
so=20
it is probably cheaper to read too much data and then discard the rest than=
 it=20
is to read it byte by byte in a single syscall.

further consider the string lies in the last page of a valid mapping.  you=
=20
don't want to always say "read 500 bytes" because if the first 200 bytes ar=
e=20
the last 200 bytes of the last page, the remaining 300 bytes cover invalid=
=20
memory, and so no data will be read.

instead, you'd split the remote read array into two elements and have them=
=20
merge back into a single write array entry.  the first read entry goes up t=
o=20
the page boundary while the second starts on the next page boundary.

> Keep this in mind when attempting to
> extract data of unknown length (such as C strings which are
> null-terminated) by avoiding spanning memory pages (typically 4KiB).

=2E.. by avoiding spanning memory pages (typically 4KiB) in a single iovec=
=20
element.

> Note, however, that these system calls do not check the memory regions
> in the remote process until just before doing the read/write.
> Consequently, a partial read/write may result if one of the
> .I remote_vec
> elements points to an invalid memory region in the remote process.
> No further reads/writes will be attempted beyond that point.

should clarify that the partial read/write applies to iovec elements=20
granularity and not byte granularity.  i.e. the syscall won't return a part=
ial=20
read that splits a single iovect element.

> In order to read from or write to another process,
> either the caller must have the capability
> .BR CAP_SYS_PTRACE ,
> or
> the real, effective, and saved set user IDs
> of the target process must match the real user ID of the caller
> .I and
> the real, effective, and saved set group IDs
> of the target process must match the real group ID of the caller.

the "set" phrasing here seems off.  should it be:
	... the real, effective, and saved set of user IDs ...
i.e. add the word "of"

> .SH "RETURN VALUE"
> On success,
> .BR process_vm_readv ()
> returns the number of bytes read and
> .BR process_vm_writev ()
> returns the number of bytes written.
> (This return value may be less than the total number of requested bytes,
> if a partial read/write occurred.
> The caller should check the return value to determine whether
> a partial read/write occurred.)

the stuff in parenthesis is larger than not.  maybe just drop them ?

> .B ENOMEM
> Out of memory.

this can be a little confusing to people based on the statements earlier th=
at=20
the kernel doesn't do any copying.  perhaps clarify that the kernel allocat=
es=20
copies of the iovec structures/etc... for internal state and that can OOM ?
=2Dmike

--nextPart2486733.NQJdP1dnj2
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPdLVaAAoJEEFjO5/oN/WB0UkQAK06FyVzshFqPdmO1B3oTnjc
OoDzAO00HVG/CR2s1nI2as6pnMX9nI2/2hIZG/2bBvm97jzbGX7lFhoxdsEWQTEM
8NrqcoCKz9uJCbn+UA9oB491KRm0FmipVB7WL8WJMhIOOK81vf6OVoCU7zfw+v4V
IkV5csnqDJ46ufExew4ZL/5qJ7s60PrR+Cqae51vn5s0RDF0wg91yPdtuKDnREQK
3aQS+rdnZ2QbknzBvK3LN+OJFkRSjA3z0Hs0EiSj88ukLHAUEQ9vX4E41GO7SeFD
VkOiesI/xyJspuIMfpxIBCAMRt/SZ+fyFyUyHiRq4SkrdKAZaU5ckZBNqTRBcJUG
O6U2gG6JJksi2/i0SalSS9nD/wyUVXlNgaOkvDhEj7xwRKQbrTER2QVp2pl0r9Qg
3KXTQQaCC+4KdhYFWjM7xBkHkr9eKXSnTqn1UPTNr5LiK9TdvOF0DpNy4lnyBHPt
cn4WL96CB0ZZqzWq+qd2c99Zsnj0I74XOD1KNywJCA8v35hQzPiVrW7GkhtvIKWV
5n/4gnJWXB6PRbJSVgpkFM6JcDB4govGGVVlpvp1NXynPzdsUXrj5vz9lt0+57ad
+t+yR4e9WJGFSJLVi+cFEKij6Lxdd5p3yhmVTE2mAp4uSNTgDa9iN9FJ7IaWKa3U
ecDTeegyv3J+sWfAeiIS
=2WFs
-----END PGP SIGNATURE-----

--nextPart2486733.NQJdP1dnj2--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
