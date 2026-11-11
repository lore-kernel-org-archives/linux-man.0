Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.63.66.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409545;
	b=UudoedmzbCKnpOj8p/qL2zIRkaQh5RhGXZ9Z1NvyoOs06axfwEIj4FYOMC0b/+W2AgFX
	 +oz9ih6uMGuWv8AX3yA+Q2aIpmVgxky5TifUGVuSC5xsg/9LA8E2kQzq3dLLA67/pZdX/
	 26+RgOmC4oSMsJ0xMH0RWg+fsvleBIRkvrb5Sg1RxIMtLCFUawIgdMxuWqSqg9/v+Exww
	 YvAlcy2jggrpVab7v3xgv1gz9HEKuxvJXrYGXBaNkbjwPD+wUzI30hCwTQ+MkR2z6T5CR
	 DZRte3/c5vbNKrXtvdak2Y3f9dsPJS8xf3pJAQP9+CMHDGGOwMecB9razH8/13VfdtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409545;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=MYa7id9/Am+SRnGA8qAUl/oKa8X8ErKTigUI7lmQhkA=;
	b=Ba5VN97pC8VH26vYG4qAf77MLgX+328p/4otweVGCfg0s8YV5K2WoQycSsd9n8ts2CiI
	 Xc5RJUw13DKVaSUOL42rJr6oX6xdvQTgFkyMSFea5Rmfd/yIzkVAVFsZDCBRCO2uHdxky
	 jd201jzjHZWKGLLVVRukO/51yGiTHjCLxOPZegP8rDoD0BHsJshzXCOHU4GLD9ZIMGIoM
	 4iWBApaMj8m3p+ae2YxZoBURYXJYeKGACNypuzbYCrJ3yx18uT164KcEdtnbpj907xrDg
	 lNxGGIp6Iq4+vS2BwRj/SqeADF7Zgj4EEqHNF0+seAZhH5rX5WVEL77LjQrVOhuOsTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hallyn.com;
	spf=(null) smtp.mailfrom=hallyn.com;
	dkim=pass header.d=hallyn.com header.i=@hallyn.com header.a=rsa-sha256 header.s=mail header.b=ZB06JvfG;
	arc=none smtp.remote-ip=178.63.66.53
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549EF60A5BC1
	for <linux-man@vger.kernel.org>; Wed, 11 Nov 2026 15:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 549EF60A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hallyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=hallyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hallyn.com header.i=@hallyn.com header.a=rsa-sha256 header.s=mail header.b=ZB06JvfG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hallyn.com; s=mail;
	t=1794409540; bh=EBRNm//JfPcZXMYhwI+qYyXniTFy+g3yCW79I7d7dZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZB06JvfGNoXq8Cii9WbhovC5xJBIqeFmjveltaKW0TuReE1kKb7FdvSMi47XbPFft
	 caCP3eUmeVEhgccwZV5k8AWkDTG5e+gUMMYnduIxUu8TNc69UU3btnmGoS0hZqRoAS
	 y0T4ahof3JaSfRYEcEpfVFoEDwEtNipQsbH9y4VddnonJl74MGwjp/xwOkJsAgXFlv
	 okumKfBm8GAyHk2cqDq1jKnfrShM+ABkAz0A6axpBvD9TKd7+QySbvdsiaQfsNwydP
	 li0D5WOvBLeMATzsri7B6mNdcgmdDENYTyc9UHIHiGxyb1IGMWyK0wYVxZLN7EO2e0
	 rxwNbNzYpVTYw==
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id 387A4841; Wed, 11 Nov 2026 09:05:40 -0600 (CST)
Date: Wed, 11 Nov 2026 09:05:40 -0600
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	Rich Felker <dalias@libc.org>, ~hallyn/shadow@lists.sr.ht,
	musl@lists.openwall.com
Subject: Re: [PATCH v1] man/man3/crypt.3: These functions accept many
 algorithms, not only DES
Message-ID: <avSERDjw/CeqN60U@hallyn.com>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avJeq6_q5rpqoGlW@devuan>

On Tue, Nov 10, 2026 at 01:01:19AM +0100, Alejandro Colomar wrote:
> > Date: 2026-11-10 00:58:45+0100
> > From: Alejandro Colomar <alx@kernel.org>
> >
> > This page was written as if DES was the only portable algorithm, and
> > glibc was a weird one supporting other algorithms.  These days (and
> > since a long time ago), DES has been long deprecated, and crypt(3)
> > supports many algorithms in all systems.
> > 
> > Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > ---
> > 
> > Hi!
> > 
> > The patch for documenting the detail about "*" will come later.
> > This was a cleanup that seemed necessary before doing that.
> > Let me know what you think about it.  I'll reply with a copy of the
> > formatted page, so you don't need to apply the patch to review it.
> 
> Below is a diff of the formatted page.
> 
> 
> Cheers,
> Alex
> ---
> 
> $ MANWIDTH=64 diffman-git -U99 HEAD
> --- HEAD^:man/man3/crypt.3
> +++ HEAD:man/man3/crypt.3
> @@ -1,183 +1,155 @@
>  crypt(3)            Library Functions Manual           crypt(3)
>  
>  NAME
>       crypt, crypt_r - password hashing
>  
>  LIBRARY
>       Password hashing library (libcrypt, -lcrypt)
>  
>  SYNOPSIS
>       #include <unistd.h>
>  
>       char *crypt(const char *key, const char *salt);
>  
>       #include <crypt.h>
>  
>       char *crypt_r(const char *key, const char *salt,
>                     struct crypt_data *restrict data);
>  
>   Feature Test Macro Requirements for glibc (see fea‐
>   ture_test_macros(7)):
>  
>       crypt():
>           Since glibc 2.28:
>               _DEFAULT_SOURCE
>           glibc 2.27 and earlier:
>               _XOPEN_SOURCE
>  
>       crypt_r():
>           _GNU_SOURCE
>  
>  DESCRIPTION
> -     crypt() is the password hashing function.  It is based on
> -     the Data Encryption Standard algorithm with variations in‐
> -     tended (among other things) to discourage use of hardware
> -     implementations of a key search.
> +     crypt() is the password hashing function.
>  
>       key is a user’s typed password.
>  
> -     salt is a two‐character string chosen from the set
> -     [a-zA-Z0-9./].  This string is used to perturb the algo‐
> -     rithm in one of 4096 different ways.
> -
> -     By taking the lowest 7 bits of each of the first eight
> -     characters of the key, a 56‐bit key is obtained.  This
> -     56‐bit key is used to encrypt repeatedly a constant string
> -     (usually a string consisting of all zeros).  The returned
> -     value points to the hashed password, a series of 13 print‐
> -     able ASCII characters (the first two characters represent
> -     the salt itself).  The return value points to static data
> -     whose content is overwritten by each call.
> -
> -     Warning: the key space consists of 2**56 equal 7.2e16 pos‐
> -     sible values.  Exhaustive searches of this key space are
> -     possible using massively parallel computers.  Software,
> -     such as crack(1), is available which will search the por‐
> -     tion of this key space that is generally used by humans
> -     for passwords.  Hence, password selection should, at mini‐
> -     mum, avoid common words and names.  The use of a passwd(1)
> -     program that checks for crackable passwords during the se‐
> -     lection process is recommended.
> -
> -     The DES algorithm itself has a few quirks which make the
> -     use of the crypt() interface a very poor choice for any‐
> -     thing other than password authentication.  If you are
> -     planning on using the crypt() interface for a cryptography
> -     project, don’t do it: get a good book on encryption and
> -     one of the widely available DES libraries.
> +     salt is a string used for determining the hasing algorithm

typo: hashing

> +     (possibly including parameters).  It is also used to per‐
> +     turb the algorithm.
> +
> +     The returned value points to the hashed password.  The re‐
> +     turn value points to static data whose content is over‐
> +     written by each call.
>  
>       crypt_r() is a reentrant version of crypt().  The struc‐
>       ture pointed to by data is used to store result data and
>       bookkeeping information.  Other than allocating it, the
>       only thing that the caller should do with this structure
>       is to set data->initialized to zero before the first call
>       to crypt_r().
>  
>  RETURN VALUE
>       On success, a pointer to the hashed password is returned.
>       On error, NULL is returned.
>  
>  ERRORS
>       EINVAL
>              salt has the wrong format.
>  
>       ENOSYS
>              The crypt() function was not implemented, probably
>              because of U.S.A. export restrictions.
>  
>       EPERM  /proc/sys/crypto/fips_enabled has a nonzero value,
>              and an attempt was made to use a weak hashing type,
>              such as DES.
>  
>  ATTRIBUTES
>       For an explanation of the terms used in this section, see
>       attributes(7).
>       ┌─────────────────┬───────────────┬──────────────────────┐
>       │ Interface       │ Attribute     │ Value                │
>       ├─────────────────┼───────────────┼──────────────────────┤
>       │ crypt()         │ Thread safety │ MT‐Unsafe race:crypt │
>       ├─────────────────┼───────────────┼──────────────────────┤
>       │ crypt_r()       │ Thread safety │ MT‐Safe              │
>       └─────────────────┴───────────────┴──────────────────────┘
>  
>  STANDARDS
>       crypt()
>              POSIX.1‐2008.
>  
>       crypt_r()
>              GNU.
>  
>  HISTORY
>       crypt()
>              POSIX.1‐2001, SVr4, 4.3BSD.
>  
>     Availability in glibc
>       The crypt(), encrypt(3), and setkey(3) functions are part
>       of the POSIX.1‐2008 XSI Options Group for Encryption and
>       are optional.  If the interfaces are not available, then
>       the symbolic constant _XOPEN_CRYPT is either not defined,
>       or it is defined to -1 and availability can be checked at
>       run time with sysconf(3).  This may be the case if the
>       downstream distribution has switched from glibc crypt to
>       libxcrypt.  When recompiling applications in such distrib‐
>       utions, the programmer must detect if _XOPEN_CRYPT is not
>       available and include <crypt.h> for the function proto‐
>       types; otherwise libxcrypt is an ABI‐compatible drop‐in
>       replacement.
>  
>  NOTES
> -   Features in glibc
> -     The glibc version of this function supports additional
> -     hashing algorithms.
> -
> +   salt
>       If salt is a character string starting with the characters
>       "$id$" followed by a string optionally terminated by "$",
>       then the result has the form:
>  
>              $id$salt$hashed
>  
>       id identifies the hashing method used instead of DES and
>       this then determines how the rest of the password string
>       is interpreted.  The following values of id are supported:
>              ID   Method
>              ───────────────────────────────────────────────────
>              1    MD5
>              2a   Blowfish (not in mainline glibc; added in
>                   some Linux distributions)
>              5    SHA‐256 (since glibc 2.7)
>              6    SHA‐512 (since glibc 2.7)
>  
>       Thus, $5$salt$hashed and $6$salt$hashed contain the pass‐
>       word hashed with, respectively, functions based on SHA‐256
>       and SHA‐512.
>  
>       "salt" stands for the up to 16 characters following "$id$"
>       in the salt.  The "hashed" part of the password string is
>       the actual computed password.  The size of this string is
>       fixed:
>              MD5       22 characters
>              SHA‐256   43 characters
>              SHA‐512   86 characters
>  
>       The characters in "salt" and "hashed" are drawn from the
>       set [a-zA-Z0-9./].  In the MD5 and SHA implementations the
>       entire key is significant (instead of only the first 8
>       bytes in DES).
>  
>       Since glibc 2.7, the SHA‐256 and SHA‐512 implementations
>       support a user‐supplied number of hashing rounds, default‐
>       ing to 5000.  If the "$id$"charactersinthesaltare followed
>       by "rounds=xxx$", where xxx is an integer, then the result
>       has the form
>  
>              $id$rounds=yyy$salt$hashed
>  
>       where yyy is the number of hashing rounds actually used.
>       The number of rounds actually used is 1000 if xxx is less
>       than 1000, 999999999 if xxx is greater than 999999999, and
>       is equal to xxx otherwise.
>  
>  SEE ALSO
>       login(1), passwd(1), encrypt(3), getpass(3), passwd(5)
>  
>  Linux man‐pages (unreleased) (date)                    crypt(3)
> 
> 
> -- 
> <https://www.alejandro-colomar.es>


