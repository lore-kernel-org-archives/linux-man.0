Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003644F055A
	for <linux-man@vger.kernel.org>; Wed, 16 Sep 2026 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568570; cv=none; b=eUlMAd7iYkYaI7fT3yXSfYRaZKDI7OmNw05ieLXH6RDx5zgnny/LQ6Ku9n52MYeP5GHj0y8n7hOfyClL0g/I1xhyBvqsJ/tI13afsfR208wmIdQFk9ZWZLA5RLDtvAI8HB8k9YdTiV8va4C0h1I8itqxrH6Yn4nFA6v1oUQnnwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568570; c=relaxed/simple;
	bh=pTXxjmirf1MuIBWFppnJrN520boXV8glzmiGoRH6jlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7qoG4ctdqQJ6Vh7LNOBNFhCu9DpDEbhyZqZCp3d+dVVOXraT3KpUNXbwOHhsqx2d369kHJ6jfdijLfzfmQjXFCAPtZWNZBzCKuSJTQzZGPKzqNaN+MdKI9UYzewn84tDDnWp9RoiOQVpHNHVqMEOUB9d1Ns/087xAMB7YXZ9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHVJ0yhb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHVJ0yhb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2371F00899;
	Wed, 16 Sep 2026 14:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789568568;
	bh=6ZL5XaZxRZVXT95zEfb98n9S4NjZwkp5wlsA6Sa3aJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AHVJ0yhbO7p0hTiNzckEsn5lwrY/YCRw90uKAbtxCj0gQr0LiITNDvO/QUn+DLcjp
	 QqCFKdTLWFAjVqdt0GQPGtlEU+NoIvH7NKef7OFAOJTrYa6AClUcHgr4b0gwBUKQ8N
	 IXLYmbAtd28fN+DRrItdUcdEo1nZvm1RBZ6bHh9evnJcRPBnluzz7VZlr0/Ed5Cv3o
	 1oLxZmU3l3RjaQGO95gWZNSCZPhqKmmgmlEXeE+hHvb4iFURrpo9oo3Qt1iOofDE5L
	 S3duEMlkF2sI3RWOdaK+GVEnJc0nEef8MZ8V1g5Fd2PeroQbJ+ksMB6KZwa41p1x5N
	 pJa70bWvin6xg==
Date: Wed, 16 Sep 2026 16:22:45 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Anmol Katiyar <anmol.katiyar24@spit.ac.in>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] read.2: Fix mangled SYNOPSIS macro
Message-ID: <aqqih5uGqYP0D_db@devuan>
References: <20260916135205.84561-1-anmol.katiyar24@spit.ac.in>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kv5ufyqpqvto3evi"
Content-Disposition: inline
In-Reply-To: <20260916135205.84561-1-anmol.katiyar24@spit.ac.in>


--kv5ufyqpqvto3evi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Anmol Katiyar <anmol.katiyar24@spit.ac.in>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] read.2: Fix mangled SYNOPSIS macro
Message-ID: <aqqih5uGqYP0D_db@devuan>
References: <20260916135205.84561-1-anmol.katiyar24@spit.ac.in>
MIME-Version: 1.0
In-Reply-To: <20260916135205.84561-1-anmol.katiyar24@spit.ac.in>

Hi Anmol,

> Date: 2026-09-16 19:22:05+0530
> From: Anmol Katiyar <anmol.katiyar24@spit.ac.in>
>
> The .BR/.BI macro pair for the function prototype was broken:
> .BR alternates bold/roman rather than bold/italic, and a stray
> duplicate "size_t count;" fragment had been left in from an
> apparent botched conversion to the buf[.count] bounds-annotation
> style. This rendered as invalid C:
>=20
>     ssize_t read(size_t count;
>                  int fd, void buf[count], size_t count);

This is valid GNU C (ignoring the array of void, of course.)

	$ cat r.c
	#include <stddef.h>
	#include <sys/types.h>

	ssize_t read_char(size_t count;
		          int fd, char buf[count], size_t count);
	$ gcc -Wall -Wextra -S r.c=20
	$=20

See at the bottom of this page from the GCC documentation:
<https://gcc.gnu.org/onlinedocs/gcc/Variable-Length.html>

Here's the text as of gcc-15 (the documentation has improved a bit in
gcc-16, but the feature hasn't changed since decades ago):

	$ info gcc -n 'Variable Length' | sed -n '/arguments/,$p';
	 You can also use variable-length arrays as arguments to functions:

	     struct entry
	     tester (int len, char data[len][len])
	     {
	       /* ... */
	     }

	 The length of an array is computed once when the storage is allocated
	and is remembered for the scope of the array in case you access it with
	=E2=80=98sizeof=E2=80=99.

	 If you want to pass the array first and the length afterward, you can
	use a forward declaration in the parameter list--another GNU extension.

	     struct entry
	     tester (int len; char data[len][len], int len)
	     {
	       /* ... */
	     }

	 The =E2=80=98int len=E2=80=99 before the semicolon is a =E2=80=9Cparamete=
r forward
	declaration=E2=80=9D, and it serves the purpose of making the name =E2=80=
=98len=E2=80=99 known
	when the declaration of =E2=80=98data=E2=80=99 is parsed.

	 You can write any number of such parameter forward declarations in the
	parameter list.  They can be separated by commas or semicolons, but the
	last one must end with a semicolon, which is followed by the "real"
	parameter declarations.  Each forward declaration must match a "real"
	declaration in parameter name and data type.  ISO C99 does not support
	parameter forward declarations.

> Replace with a single correct .BI call, matching the bounds-
> annotation convention used elsewhere in the page set.

The rest of the pages use the same convention as this page.
The convention using [.length] was used in the past, and was changed
precisely because it's not valid C.

> Signed-off-by: Anmol Katiyar <anmol.katiyar24@spit.ac.in>
> ---

Have a lovely day!
Alex

>  man/man2/read.2 | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/man/man2/read.2 b/man/man2/read.2
> index 8eb222743..c460a2a61 100644
> --- a/man/man2/read.2
> +++ b/man/man2/read.2
> @@ -14,8 +14,7 @@ Standard C library
>  .nf
>  .B #include <unistd.h>
>  .P
> -.BR "ssize_t read(" "size_t count;"
> -.BI "             int " fd ", void " buf [ count "], size_t " count );
> +.BI "ssize_t read(int " fd ", void " buf "[." count "], size_t " count );
>  .fi
>  .SH DESCRIPTION
>  .BR read ()
> --=20
> 2.55.0

--=20
<https://www.alejandro-colomar.es>

--kv5ufyqpqvto3evi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqqpi8ACgkQ64mZXMKQ
wqnnmxAArgcCNsMpd8wzCp+RPfYARTr+Tk/pSjVqdfGZOnQdniEvPirDPVGApW1U
74X9H2bZ6gXDuqSIllqLbFScwL3qh7JbVpbx2DQzQ6C6EjL5tuOkN/Gg+ADBVv86
sxeRjbI3x9KDj2krK/jp1CbYLvWfvZbP323LpAh8gkPlXpnJFetJ373zZG7TLWz6
3Jzz2bGf/rCQflKDmhXlnoVjsHPSSUIWnPnEuUjSfG3SwkU5ZyZ3D+UIYK7GeTRA
ccyRwlNBPirYycZzDzxlIhyy+6MicRwjVes2gzmCrh4SdXFf9OlD0PNgVkrmh4Yl
Ln72ux5WtoRgR9xywAgiRw9qWWUAyKVTfYLmSXgbOSogmSS50fhShuPoO2BWnq4d
lh5VcJqMHpboIuC7DgW81o8uY1O2g/qc0xSYdv/LksQ+lDWYgQwGy22gUMpZxQO6
oS9C4fDQfdUwTm+y/MVCHKKyuQGQYnSD/gWaRBOe7CiAsDYp7H3PFsf57Qu/phYD
nE/TZe0qHmg+4LY0S/dDdz59au5gHWv7lFZjV3YoaeoCjTcRqkxYqiLO6J3dX9dD
Em3gNrsrGVnuwBdAX711rCCeyhih+MOYp3SDuXUJnXztGnLZFZJ///hy9YhTHZzW
t1tQpC3d+agOghpfUlZNc2Q2HAhxDz0w0aTHux6nH8oGTbJVFYE=
=L7ER
-----END PGP SIGNATURE-----

--kv5ufyqpqvto3evi--
