Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792840432;
	b=lDTtGky9YrmjzoP0Hi5BQkSC1UX3aia742PjX/7Ns+ZOIlZVTjAXfkjG0P2pXh9iOjgt
	 dvVYDxaj7wCtD9qDZdmKaxiXmbvY6DHLEnq1pOgNCWujjCJqwfypUdEPpTzOM959pkKt+
	 NC80NGGuhEX2HJWvQZ7tEPptEXlxDlucA/GwmU+7d32sTHfhUHr5ypNAD2jqxE1EMfcdp
	 ADY+AEGW9DqJdpN/w5HHLqSCkRWY7hLQm6j0axm4q54/2xU/5K7H2QIUZBrD+Vx0fi1v+
	 49+0cupBRm4+iLKpwKje9wrOTjyZlTc185K5/0ybZ4vKUSf8hmDZP7iJJtuRpW+hDZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792840432;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=thFugieXJpBn6kLqWNrY9fLT0fl9c+qxFLuOgSZNkQ8=;
	b=wEXzKgK9iPGL73SBBkxZBis5S17CD5+6unYwg81jn7uyZ1psk5znrE+nTDQfBuXt8pdz
	 B0JrREdR/1EXc8hqgiH1hPtU8IQIKv5PV53KyfkQ28CHpxf9gsd+ywfDLspA8IWrLZP9A
	 3YWI3B3JqxiiAL6ub7qwE5UkOgdxjqzMHm5TEmpHFL31fyfJ7Qsf7eTZcZ6LdjbjZPpl/
	 fHCnTZGiX10h1wbXG+ZqzpexHHvNsZOfUzgk+A5ol7GBUnYTBUppflaoguMkJkvJyxH3s
	 dNMjTSKqCoYzt6z1lVCQsbEN3gOojh5jDWXruVi7FqcK1WKiCMlfu3tShlqhALSL0Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=amTwavc0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18CF606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=amTwavc0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0951F01825;
	Sat, 24 Oct 2026 11:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792840431;
	bh=thFugieXJpBn6kLqWNrY9fLT0fl9c+qxFLuOgSZNkQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=amTwavc0eHtbrqVOHIOFYmsMJ4vv5dnx0JczjSO2+Y4n4RkRdxkIxbmf7FwxiLGqt
	 NwNNGF7JD5c3g7JPIO6chjMUHGZ3Z18hKyJrItJPIwh+e/WoQkmfvRImJ//UxzTtYo
	 43FKqdUltIIC6QDk0TZbZQhS4NUi3LlsRbmzAV+g1AFgqdLWKHYxyQ4HXDFTYpGIVk
	 /P1dlOpHRCWn2zxupV/Wm1RGbkRjGgoeMm1KgrKyX1twiQgjVVDQ5CsnCFwDD/tr8j
	 u5PfbKYEYwFCXOywkzEIT71iD+i326J7TUeFIu4cVD9z8zzdimQoMGW18e3KRrUh5+
	 0zheWSqq0oVgA==
Date: Sat, 24 Oct 2026 13:13:45 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Yannick Le Pennec <yannick.lepennec@live.fr>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 1/3] man/man2const/F_DUPFD_QUERY.2const: Add page
Message-ID: <atyPto0f1pba8P-U@debian>
References: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
 <AS2PR02MB9737E7B696310F87C9571E789B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rahzttcslqdwxly4"
Content-Disposition: inline
In-Reply-To: <AS2PR02MB9737E7B696310F87C9571E789B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>


--rahzttcslqdwxly4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Yannick Le Pennec <yannick.lepennec@live.fr>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 1/3] man/man2const/F_DUPFD_QUERY.2const: Add page
Message-ID: <atyPto0f1pba8P-U@debian>
References: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
 <AS2PR02MB9737E7B696310F87C9571E789B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AS2PR02MB9737E7B696310F87C9571E789B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>

Hi Yannick,

> Date: 2026-10-12 23:08:14+0200
> From: Yannick Le Pennec <yannick.lepennec@live.fr>
>
> Linux 6.10 adds a new fcntl(2) operation, F_DUPFD_QUERY, which glibc expo=
ses
> since 2.41. This commit documents it, with example usage.
>=20
> In essence, F_DUPFD_QUERY takes two file descriptors and determines wheth=
er they
> refer to the same open file description (by comparing the pointers to the
> underlying struct file). Two file descriptors can refer to the same open =
file
> description if one was obtained by dup(2)ing the other, for example.
>=20
> Previously, this comparison could be done through the kcmp system call wi=
th
> KCMP_FILE (see kcmp(2)), but not only that interface is much broader, gli=
bc
> does not presently provide a wrapper for it.
>=20
> See-also: linux.git c62b758bae6a ("fcntl: add F_DUPFD_QUERY fcntl()")
> See-also: glibc.git 28f8cee64a32 ("Add F_DUPFD_QUERY from Linux 6.10 to
>                                   bits/fcntl-linux.h")
> Link: <https://lore.kernel.org/dri-devel/CAHk-=3DwixO-fmQYgbGic-BQVUd9RQh=
wGsF4bGk8ufWDKnRS1v_A@mail.gmail.com/>
> Link: <https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3D28f8cee64a=
3223636d15c78f69432503d8ef1c22>
> Signed-off-by: Yannick Le Pennec <yannick.lepennec@live.fr>
> ---

Thanks!  LGTM, except for a feww minor details; see below.

>  man/man2const/F_DUPFD_QUERY.2const | 105 +++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 man/man2const/F_DUPFD_QUERY.2const
>=20
> diff --git a/man/man2const/F_DUPFD_QUERY.2const b/man/man2const/F_DUPFD_Q=
UERY.2const
> new file mode 100644
> index 0000000000..0a07f3968a
> --- /dev/null
> +++ b/man/man2const/F_DUPFD_QUERY.2const
> @@ -0,0 +1,105 @@
> +.\" Copyright, the authors of the Linux man-pages project
> +.\"
> +.\" SPDX-License-Identifier: Linux-man-pages-copyleft
> +.\"
> +.TH F_DUPFD_QUERY 2const 2026-10-11 "Linux man-pages (unreleased)"
> +.SH NAME
> +F_DUPFD_QUERY
> +\-
> +determine whether two file descriptors refer to the same open file descr=
iption
> +.SH LIBRARY
> +Standard C library
> +.RI ( libc ,\~ \-lc )
> +.SH SYNOPSIS
> +.nf
> +.B #define _GNU_SOURCE
> +.B #include <fcntl.h>
> +.P
> +.BI "int fcntl(int " fd ", F_DUPFD_QUERY, int " other );
> +.fi
> +.SH DESCRIPTION
> +Determine whether file descriptors
> +.I fd
> +and
> +.I other
> +refer to the same open file description (see
> +.BR open (2)).
> +.SH RETURN VALUE
> +On success, if both
> +.I fd
> +and
> +.I other

We don't need to repeat their names.

> +refer to the same open file description, 1 is returned.
> +Otherwise, zero is returned.
> +On error, \-1 is returned, and
> +.I errno
> +is set to indicate the error.

The 'Otherwise' above seems imprecise, since an error would also be an
otherwise.  I'd reword:

	On success,
	if both file descriptors
	refer to the same open file description,
	1 is returned;
	and if they don't,
	0 is returned.
	.P
	On error,
	\-1 is returned,
	and
	.I errno
	is set to indicate the error.

> +.SH ERRORS
> +See
> +.BR fcntl (2).
> +.SH STANDARDS
> +Linux.
> +.SH HISTORY
> +Linux 6.10.
> +.SH NOTES
> +On Linux, this
> +.BR fcntl ()

I'd remove the 'fcntl()' mention.  F_DUPFD_QUERY already implies
fcntl(2).  (And if we kept it, since it's a different page, it should
have a (2), not ().)

> +.BR F_DUPFD_QUERY
> +operation is a narrower, more efficient spelling of the following
> +.BR kcmp (2)
> +invocation:
> +.P
> +.in +4n
> +.EX
> +int   ret;
> +pid_t pid;
> +

We avoid blank lines in source code, since that triggers diagnostics
=66rom groff(1).  We use a dummy character for these: \&

	pid_t  pid;
	\&
	pid =3D getpid();

> +pid =3D getpid();
> +ret =3D syscall(SYS_kcmp, pid, pid, KCMP_FILE, fd, other);
> +
> +if (ret =3D=3D 0) {
> +	/* fd and other refer to the same file */
> +}

We can avoid the 'ret' variable:

	if (syscall(...) =3D=3D 0) {
		/* ... */
	}

> +.EE
> +.in
> +.SH EXAMPLES
> +The following program checks whether standard output and standard error =
streams
> +refer to the same open file description (typically, the user's terminal).
> +Example output:
> +.P
> +.in +4n
> +.EX
> +.RB $ " ./a.out"
> +stdout and stderr are the same file
> +.RB $ " ./a.out 2> /dev/null"
> +stdout and stderr are different files

The output text seems imprecise.  It should say "refer to the same /
different open file descriptions".

	$ ./a.out >/dev/tty 2>/dev/tty
	stdout and stderr are different files

In the case above, it clearly refers to the same files, but they're
different open file descriptions.

> +.EE
> +.in
> +.SS Program source
> +.\" SRC BEGIN (dupfd_query.c)
> +.EX
> +#define _GNU_SOURCE
> +#include <err.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +\&

Yup, you used the \& correctly here.  :)

> +int
> +main(void) {

We have the opening brace on a line of its own (like the kernel).  The
coding style is in <CONTRIBUTING.d/style/c> (although you don't need to
read it; it's just this minor thing).


Cheers,
Alex

> +	int ret;
> +
> +	ret =3D fcntl(STDOUT_FILENO, F_DUPFD_QUERY, STDERR_FILENO);
> +	if (ret =3D=3D -1)
> +		err(EXIT_FAILURE, "fcntl");
> +
> +	printf("stdout and stderr are %s\[rs]n",
> +	       ret ? "the same file" : "different files");
> +}
> +.EE
> +.\" SRC END
> +.SH SEE ALSO
> +.BR dup (2),
> +.BR fcntl (2),
> +.BR kcmp (2),
> +.BR open (2)
> --=20
> 2.55.0
>=20

--=20
<https://www.alejandro-colomar.es>

--rahzttcslqdwxly4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrckuIACgkQ64mZXMKQ
wql9GQ/9FHbECVsYCTVJ8/opmPSXQoiw7HcWZCKCw0OxtUY3hCkyVQfi6J44iQpA
ZlQYOraSk0Sbs4AOqle3ZpckNwj8Zc6njSXZYk7uGj9mJ3ri4ioobXuPQo5s6m51
8XGuEjiTDeZAKQYd5rSnUP/yxzSXZWyXYH/yAs8VAv8LKoICdg0yqY9VCvegQZ4x
WXBtZFF9Fve09SlsvAxJ7ebKIhdt5Jac5B62093OurD4EiqZz2i9UHQTpmOfXj7Q
6Gjz3Ba5k64HfDHjKN2A/5MAIQJdbzUwurWsYbdXIWvKdxvJ2JpLSc1f/DyTxwco
JVp53I7RTizzG2WmD7/78u61Tiqq45DVFgnrUZJySb3XCxTh4M2Su8nR+jds2YQ1
onzXbk1TCHGkZ/lwBgTsvIWX59hgV+b0Eav3N0+xRcZ/QieiRsGPphybS71Fqw/o
lS4f10e0OCCcDtQENaZe77ekvFTfiy9lhGWy5VTmDWmcieUpL4FEfdiJr/I1RAGW
W46/yDKIGnvB8WnUK0RLeamUQOxHWViIB0JchbeGkuXILMSqN/hQykmLtNgyitcH
WHN6Ga1iUTg7+rggOjVfZEQyLrgVDDTOzzDZN32JMp1aB60zoZNQ4F+KETGWlCXV
8MRXb9qHK/jXMjCN1zNTogXT77O2xTQgSlqMe/BEGfjypLvPzts=
=mArS
-----END PGP SIGNATURE-----

--rahzttcslqdwxly4--
