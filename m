Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700829;
	b=de/CKVOeLBnm3Z9Z6qASCL8mGS6n8BNpu4GYE5bP0GI+IELb+ZR0foZKVom+l74ztVLN
	 8CQTi/YD+ExFd1d0jzwOwuy3IwpvJrrFd5GfaUl3ap4IMO+tD+62vvhxGVxoHdqqD4Hkp
	 KQcH81ist+9j16COtf5gtD99IkpOxUekfIljOKR2dffJe+4BZ+2QOXRdc+nd/x1nAPQxg
	 wMuLU6gjBPH70JrzwWXRJZTuxRCgTgGoV5BH4Jgj5pigah08N6YUrD0skZn+GCrWdC6DL
	 zivaagVMC67IEVMCWcU6FnM5vA95BmiEZshFOncddZdtaZ4/yB5jJi+PtvhnsWgRNmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700829;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jbQSsvxnd33xxQVOcdXpdX6m5Jtl6NzcaUhgfnPLReI=;
	b=zS+zkOAKtRVgHpsKApuOEbhf9AtZ1EdKQsKYo1NbH4h/NMkIYqFxZhGOZLhO+6ja9xr0
	 OEnCQ66hx187NPdh+nUU7E7pqGJsJQpehsBAyaW60/cXUgQ9O45OnS0P/ZD/4mMf3gHub
	 I6//3jVTs9z2wiuaKDw5xLoBnqoI0j0EcKanfCrUwhDspCWi/KxfShmNHpqrgEvyI4lSN
	 vdO5jLuPAVUa7sFsRCWPJv9EwkavH/rQ5xnI9eRpKwLw92G4NdDv/sqOesqvg9Js++eBv
	 D3+4FWlQz0Hn7vhVJnMb7MliWUcsWHosLkFYydH5KVecAu/ZpxEhjCha2uTPpTTPqBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gCPCOLZz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C107B606A319
	for <linux-man@vger.kernel.org>; Thu, 22 Oct 2026 20:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gCPCOLZz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBFAB1F01829;
	Thu, 22 Oct 2026 20:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792700828;
	bh=jbQSsvxnd33xxQVOcdXpdX6m5Jtl6NzcaUhgfnPLReI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gCPCOLZzlssabPP61woZZVwteQu879Kd7/kC0ZHgPCHbuz/zhKBDkoIIxVcgNKqAp
	 wGXf3pzJVC6hdnzlhZ151zxOzo5rdG6dacqC5KUdzt1b/b6hlj4hs8YpaU8QsYXDNE
	 PG0WX1HkEgXotHQYhl/h+iq46ZmyVdjdXdXyoaWPT+EIDz+qXZGbFa5sfDJNSnA1oW
	 9ITAjOSNxxvoToeU/Gd4XMCOPdRq+zQlZTB4lRlSbsnD7ewZKOvbPRVfsswsIOaudB
	 FJvUCIWAF3Piz37i0sL3UR00rXR9COIsC10Umcr5y3k3csJ5eEYkuthUqfoSxPZ/iU
	 XKfRO64Tcq12g==
Date: Thu, 22 Oct 2026 22:27:00 +0200
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atpuEfs7NFU5gQvb@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <543dcd09540ba941c8d3ce86dd7581bc6425c367.camel@tugraz.at>
 <atpp6tUO5GfMFkcB@debian>
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
	protocol="application/pgp-signature"; boundary="yg47ltba7ipswrto"
Content-Disposition: inline
In-Reply-To: <atpp6tUO5GfMFkcB@debian>


--yg47ltba7ipswrto
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atpuEfs7NFU5gQvb@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <543dcd09540ba941c8d3ce86dd7581bc6425c367.camel@tugraz.at>
 <atpp6tUO5GfMFkcB@debian>
MIME-Version: 1.0
In-Reply-To: <atpp6tUO5GfMFkcB@debian>

Hi Martin,

> Date: 2026-10-22 22:01:17+0200
> From: Alejandro Colomar <alx+linux-man@kernel.org>
>
[...]
> >  I still do not like it, as the fully developed form
> > would be a major pain for most C compiler to implement, but
> > I guess a restricted version would be ok.  Unfortunately, this
> > syntax does not work today, so could be used in code only at
> > some point in the future.=20

This syntax is useless for us.  We have several functions that need to
write expressions in array lengths, and not just identifiers.  We even
dereference some pointer types (see getsockopt(2), lfind(3), and
lsearch(3)).

It's also useless for me as a programmer, since I need to do non-trivial
stuff in my array sizes.  Whatever we add to the language should work
for arbitrary types and expressions.

Here's a list of functions we have documented and which need a
non-restricted feature.

     long get_mempolicy(unsigned long maxnode;
                        int *mode,
                        unsigned long nodemask[(maxnode + ULONG_WIDTH - 1)
                                               / ULONG_WIDTH],
                        unsigned long maxnode, void *addr,
                        unsigned long flags);

     char *inet_net_ntop(int bits, size_t psize;
                       int af,
                       const void netp[(bits - CHAR_BIT + 1) / CHAR_BIT],
                       int bits,
                       char pres[psize], size_t psize);

     int getsockopt(socklen_t *restrict optlen;
                    int sockfd, int level, int optname,
                    void optval[_Nullable restrict *optlen],
                    socklen_t *restrict optlen);

     void *bsearch(size_t n, size_t size;
                   const void key[size], const void base[size * n],
                   size_t n, size_t size,
                   typeof(int (const void [size], const void [size]))
                       *compar);

     /* In SCO OpenServer */
     void cfree(unsigned int n, unsigned int size;
                char ptr[size * n], unsigned int n, unsigned int size);

     /* In Solaris watchmalloc.so.1 */
     void cfree(size_t n, size_t size;
                void ptr[size * n], size_t n, size_t size);

     size_t fread(size_t size, size_t n;
                  void ptr[restrict size * n],
                  size_t size, size_t n,
                  FILE *restrict stream);
     size_t fwrite(size_t size, size_t n;
                  const void ptr[restrict size * n],
                  size_t size, size_t n,
                  FILE *restrict stream);

     size_t fread_unlocked(size_t size, size_t n;
                           void ptr[restrict size * n],
                           size_t size, size_t n,
                           FILE *restrict stream);
     size_t fwrite_unlocked(size_t size, size_t n;
                           const void ptr[restrict size * n],
                           size_t size, size_t n,
                           FILE *restrict stream);

     void *lfind(size_t *n, size_t size;
                 const void key[size],
                 const void base[*n * size],
                 size_t *n, size_t size,
                 typeof(int (const void [size], const void [size]))
                     *compar);
     void *lsearch(size_t *n, size_t size;
                 const void key[size],
                 void base[*n * size],
                 size_t *n, size_t size,
                 typeof(int (const void [size], const void [size]))
                     *compar);

I might have missed some other functions; I think this isn't exhaustive.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--yg47ltba7ipswrto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmracYwACgkQ64mZXMKQ
wqlXLQ/+LFJyRq5jJdKF55yuyPwPQolceU6fnOi5Ec3w8qdAX0zae3dxXowkD8I5
Bdmsg1VZIU5NOHfDrTxgOXfsh6ONrjhWvT62Dw0dQb9GBPLQYpTRd7DnT5KiGWv+
lGgXFqCf0VfMhzB7k1WbBeRPEmLrbSxSBsSuM86n9v+topBclqCXW775CpwA38NV
dCoMjv4M7J1h0h3tCysmVh9tC8GehJ2UFuA0OoDjabMbgvH8Ndtzqhbw8Jzhz8bq
YrTyI38y8yhWvOxt63Rre1eYAVzjDeSVZpfDanzq0AOZAWKRrCJzCHOwSS9vd7Og
tnjDFZ7vdnbs+l1nqHRaNw+n+9OpxKOrvEBhUxgnEhhdkbcUuCwb1KOqAQ+6qzGK
FIbTTS+OloYUz6Krcmt0g9ibiAsTrmIw0HZ2h43m6H8rNq34Uj8j4vkm4m89ZKzH
6rkw4ON6dt3aHMpBnf45wZ1ahvFP6SMhgdVYh/3aJyf08cSVA0CVHQycXR8SLlbA
Kwvzlo4ZMDhMwS6KBGkqqbKxBbBIw/NT942Ig/E30PMLVVb+BSbnIMnG4LzEsn43
2z3Xl91fMPhSGN2iCwghNB5KCA0/zj1t7KdWLOsFTa3BMd4QxqOYg9i58eWGAYpk
jAdtHRzJNtZPrP7cMCR0FPR+zPxQgH8VbgxgTYxHhIEVPiL6UQQ=
=n/Ti
-----END PGP SIGNATURE-----

--yg47ltba7ipswrto--
