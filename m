Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268884;
	b=K+OFGnI28SWmIHeYUKqSte6s8HDNDkEftMDced2+8r5Pzuio7vJNc1F4ACbx7h8ZLB7j
	 2P0tYq/R7HewV60/JZ4gI8C9j9OwVn8iipaUjUKVSxedl3/RTaXTfyHi5Z5eaEEZXxVS9
	 nrmP0APQQ8tiDkIWtVHy3P2LfalPlH9gXK9Lvvx/haMcsl4ID7EfwB9aoiTM5IvLJLPXB
	 ePO2FbH+ksTiC9Bje0xW5G+lQN+qRz0BbkfRmcLjA5Bf+bVpCyQ9dmIpXVHXVFLhqopu4
	 J53G5G2PKE3NzGqJg9y+rLT8xIQ97byvclUDUE1ovrikAvtehKVjh/i5gDjy5wdf9vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268884;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=v0Pc/T/AWWZUqF6nd6Z/IFKExf9irPzuwgpqINH7fG0=;
	b=GrTHWAnwZCO6EVke93rUfUD0qgVU1Fz13mQieLKuIiEoWSULjJikx8mGKXQcqkDsgRaQ
	 2oFJ+k/6stHw1HB33ZmlTrbF/8HxJrXD6WJfn1+ijoSGwib6jnKEHoaiLtHp6nrYKZ+0x
	 sKRH/g0gntzKeDEzmnQOtSLrDzjKqFn+RZoV4hAtugJHjHe/oyxyLLK0NxfB21yYtdgXM
	 TuMboU8wp2cwTm8ETlk96zL7AP3DJdAS3zw/5ahg07b81DTo1FLscv9aVQvcCgA7CpPcZ
	 0cE6AjdGdtwNYXWPEF+f6cgNqQkOnXAwqCMAYypMQ/E6XDD0jhgYngx0It4QiW3eFeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MORX76MW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8090606A332
	for <linux-man@vger.kernel.org>; Tue, 10 Nov 2026 00:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MORX76MW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4CD1F008A6;
	Tue, 10 Nov 2026 00:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794268883;
	bh=v0Pc/T/AWWZUqF6nd6Z/IFKExf9irPzuwgpqINH7fG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MORX76MWhyG+PxN6sJ4Qv6J2efCPKfNqLGsD4GDdIu5NqcDmSCcaN3Pur1jhe9Ru9
	 GDH65oRbF8wqM3w4gJ55HS7bH+cEIJc428f6hhxue1A/BZU6vy6fMXwN9fXZy2tRNR
	 JqO4yzaGiVclmaDqB6UPFeC4+Tmr4y5cSDoYGNYqxPq0cOygEzWsbvDUG2YYc3wtey
	 AXTewHm3ISIIqJrKbf5/ZBpnTSsI7DQCvt6g4B4so11mRMnCp3dpe1QCyqYGi66ng5
	 NKeu59fKMOVMj94AwBhuO7E+oXHJ0V5YywRVHAQ9AN8QY3fgxkZR0wlWlRu6uHPSkv
	 qEiKMaeoLILvQ==
Date: Tue, 10 Nov 2026 01:01:19 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, Rich Felker <dalias@libc.org>, ~hallyn/shadow@lists.sr.ht, 
	musl@lists.openwall.com
Subject: Re: [PATCH v1] man/man3/crypt.3: These functions accept many
 algorithms, not only DES
Message-ID: <avJeq6_q5rpqoGlW@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
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
	protocol="application/pgp-signature"; boundary="qx55ib2d7awromac"
Content-Disposition: inline
In-Reply-To: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>


--qx55ib2d7awromac
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, Rich Felker <dalias@libc.org>, ~hallyn/shadow@lists.sr.ht, 
	musl@lists.openwall.com
Subject: Re: [PATCH v1] man/man3/crypt.3: These functions accept many
 algorithms, not only DES
Message-ID: <avJeq6_q5rpqoGlW@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>

> Date: 2026-11-10 00:58:45+0100
> From: Alejandro Colomar <alx@kernel.org>
>
> This page was written as if DES was the only portable algorithm, and
> glibc was a weird one supporting other algorithms.  These days (and
> since a long time ago), DES has been long deprecated, and crypt(3)
> supports many algorithms in all systems.
>=20
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>=20
> Hi!
>=20
> The patch for documenting the detail about "*" will come later.
> This was a cleanup that seemed necessary before doing that.
> Let me know what you think about it.  I'll reply with a copy of the
> formatted page, so you don't need to apply the patch to review it.

Below is a diff of the formatted page.


Cheers,
Alex
---

$ MANWIDTH=3D64 diffman-git -U99 HEAD
--- HEAD^:man/man3/crypt.3
+++ HEAD:man/man3/crypt.3
@@ -1,183 +1,155 @@
 crypt(3)            Library Functions Manual           crypt(3)
=20
 NAME
      crypt, crypt_r - password hashing
=20
 LIBRARY
      Password hashing library (libcrypt, -lcrypt)
=20
 SYNOPSIS
      #include <unistd.h>
=20
      char *crypt(const char *key, const char *salt);
=20
      #include <crypt.h>
=20
      char *crypt_r(const char *key, const char *salt,
                    struct crypt_data *restrict data);
=20
  Feature Test Macro Requirements for glibc (see fea=E2=80=90
  ture_test_macros(7)):
=20
      crypt():
          Since glibc 2.28:
              _DEFAULT_SOURCE
          glibc 2.27 and earlier:
              _XOPEN_SOURCE
=20
      crypt_r():
          _GNU_SOURCE
=20
 DESCRIPTION
-     crypt() is the password hashing function.  It is based on
-     the Data Encryption Standard algorithm with variations in=E2=80=90
-     tended (among other things) to discourage use of hardware
-     implementations of a key search.
+     crypt() is the password hashing function.
=20
      key is a user=E2=80=99s typed password.
=20
-     salt is a two=E2=80=90character string chosen from the set
-     [a-zA-Z0-9./].  This string is used to perturb the algo=E2=80=90
-     rithm in one of 4096 different ways.
-
-     By taking the lowest 7 bits of each of the first eight
-     characters of the key, a 56=E2=80=90bit key is obtained.  This
-     56=E2=80=90bit key is used to encrypt repeatedly a constant string
-     (usually a string consisting of all zeros).  The returned
-     value points to the hashed password, a series of 13 print=E2=80=90
-     able ASCII characters (the first two characters represent
-     the salt itself).  The return value points to static data
-     whose content is overwritten by each call.
-
-     Warning: the key space consists of 2**56 equal 7.2e16 pos=E2=80=90
-     sible values.  Exhaustive searches of this key space are
-     possible using massively parallel computers.  Software,
-     such as crack(1), is available which will search the por=E2=80=90
-     tion of this key space that is generally used by humans
-     for passwords.  Hence, password selection should, at mini=E2=80=90
-     mum, avoid common words and names.  The use of a passwd(1)
-     program that checks for crackable passwords during the se=E2=80=90
-     lection process is recommended.
-
-     The DES algorithm itself has a few quirks which make the
-     use of the crypt() interface a very poor choice for any=E2=80=90
-     thing other than password authentication.  If you are
-     planning on using the crypt() interface for a cryptography
-     project, don=E2=80=99t do it: get a good book on encryption and
-     one of the widely available DES libraries.
+     salt is a string used for determining the hasing algorithm
+     (possibly including parameters).  It is also used to per=E2=80=90
+     turb the algorithm.
+
+     The returned value points to the hashed password.  The re=E2=80=90
+     turn value points to static data whose content is over=E2=80=90
+     written by each call.
=20
      crypt_r() is a reentrant version of crypt().  The struc=E2=80=90
      ture pointed to by data is used to store result data and
      bookkeeping information.  Other than allocating it, the
      only thing that the caller should do with this structure
      is to set data->initialized to zero before the first call
      to crypt_r().
=20
 RETURN VALUE
      On success, a pointer to the hashed password is returned.
      On error, NULL is returned.
=20
 ERRORS
      EINVAL
             salt has the wrong format.
=20
      ENOSYS
             The crypt() function was not implemented, probably
             because of U.S.A. export restrictions.
=20
      EPERM  /proc/sys/crypto/fips_enabled has a nonzero value,
             and an attempt was made to use a weak hashing type,
             such as DES.
=20
 ATTRIBUTES
      For an explanation of the terms used in this section, see
      attributes(7).
      =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=90
      =E2=94=82 Interface       =E2=94=82 Attribute     =E2=94=82 Value    =
            =E2=94=82
      =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=A4
      =E2=94=82 crypt()         =E2=94=82 Thread safety =E2=94=82 MT=E2=80=
=90Unsafe race:crypt =E2=94=82
      =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=A4
      =E2=94=82 crypt_r()       =E2=94=82 Thread safety =E2=94=82 MT=E2=80=
=90Safe              =E2=94=82
      =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=98
=20
 STANDARDS
      crypt()
             POSIX.1=E2=80=902008.
=20
      crypt_r()
             GNU.
=20
 HISTORY
      crypt()
             POSIX.1=E2=80=902001, SVr4, 4.3BSD.
=20
    Availability in glibc
      The crypt(), encrypt(3), and setkey(3) functions are part
      of the POSIX.1=E2=80=902008 XSI Options Group for Encryption and
      are optional.  If the interfaces are not available, then
      the symbolic constant _XOPEN_CRYPT is either not defined,
      or it is defined to -1 and availability can be checked at
      run time with sysconf(3).  This may be the case if the
      downstream distribution has switched from glibc crypt to
      libxcrypt.  When recompiling applications in such distrib=E2=80=90
      utions, the programmer must detect if _XOPEN_CRYPT is not
      available and include <crypt.h> for the function proto=E2=80=90
      types; otherwise libxcrypt is an ABI=E2=80=90compatible drop=E2=80=90=
in
      replacement.
=20
 NOTES
-   Features in glibc
-     The glibc version of this function supports additional
-     hashing algorithms.
-
+   salt
      If salt is a character string starting with the characters
      "$id$" followed by a string optionally terminated by "$",
      then the result has the form:
=20
             $id$salt$hashed
=20
      id identifies the hashing method used instead of DES and
      this then determines how the rest of the password string
      is interpreted.  The following values of id are supported:
             ID   Method
             =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80
             1    MD5
             2a   Blowfish (not in mainline glibc; added in
                  some Linux distributions)
             5    SHA=E2=80=90256 (since glibc 2.7)
             6    SHA=E2=80=90512 (since glibc 2.7)
=20
      Thus, $5$salt$hashed and $6$salt$hashed contain the pass=E2=80=90
      word hashed with, respectively, functions based on SHA=E2=80=90256
      and SHA=E2=80=90512.
=20
      "salt" stands for the up to 16 characters following "$id$"
      in the salt.  The "hashed" part of the password string is
      the actual computed password.  The size of this string is
      fixed:
             MD5       22 characters
             SHA=E2=80=90256   43 characters
             SHA=E2=80=90512   86 characters
=20
      The characters in "salt" and "hashed" are drawn from the
      set [a-zA-Z0-9./].  In the MD5 and SHA implementations the
      entire key is significant (instead of only the first 8
      bytes in DES).
=20
      Since glibc 2.7, the SHA=E2=80=90256 and SHA=E2=80=90512 implementati=
ons
      support a user=E2=80=90supplied number of hashing rounds, default=E2=
=80=90
      ing to 5000.  If the "$id$"charactersinthesaltare followed
      by "rounds=3Dxxx$", where xxx is an integer, then the result
      has the form
=20
             $id$rounds=3Dyyy$salt$hashed
=20
      where yyy is the number of hashing rounds actually used.
      The number of rounds actually used is 1000 if xxx is less
      than 1000, 999999999 if xxx is greater than 999999999, and
      is equal to xxx otherwise.
=20
 SEE ALSO
      login(1), passwd(1), encrypt(3), getpass(3), passwd(5)
=20
 Linux man=E2=80=90pages (unreleased) (date)                    crypt(3)


--=20
<https://www.alejandro-colomar.es>

--qx55ib2d7awromac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmryXs8ACgkQ64mZXMKQ
wqnxVw/7BfFcBc9Znk/AN6M0dN4qNFlkPvQPufN6gk+/kdUKWelnG534YnQVd0c3
vNtCczgm4oidi42UQfTxgddSJYWGpEknQ8mW4R4V1Ly65UNB+UzD5DKKcKV4+bqV
xgk9/6Xvz+Jn1vbVJSgzgnRUw7iPLErHs/xu4NgQX2hnVaggrjgcfdORszhGxmhg
VYp5pHAdxxsi32QOjpij+Npcta0Kg1bXfpZuxB687BC9aE1OxCgzXxEJEfIauIbL
ypRPKiCfcY4eKXwT09VwydaJqoB+5GJxF8MmPaOQ8mrCku9zPyq7RP/zByecDKCr
Wjqaw6Rj/d7T22qmXDdhLXMb3Av3qrmzkUGH62zia783d8xMaJIymBrqplxI9QeK
5iRUGDEdQgR7ORedJvXcRTbBZq9j0P1OTapDc7gGI35kX8666JaYQnovx4guyoOL
mUGjrlM0KDgUeJOxs98TSSJ+uSq1UA9cK/HtRg+6kg1iOPNp3pyKYC9TM2BonvRm
WnetOyKZ86tORj0xQvU64898Egl4MkhPggHfQln0c+GlrdiskV/lkzmNnf0FG6js
1zcVh+C5GHrqXjnkpsMcaoUDjQw5PH+ZnU5JmQfT6S+oWXjQ8gb/cPXX5lGD1ZIP
o+8nEdkuKbXc3XVt3emEEIWYN6eGgvG2uR0YIHBq73GqbATmYgU=
=R29n
-----END PGP SIGNATURE-----

--qx55ib2d7awromac--
