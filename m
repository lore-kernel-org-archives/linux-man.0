Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=129.27.2.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689127;
	b=stelKLBWExDQ9KHBxTF2Z3dPOeSfriZKOworptZv7SUaVABeSI3tpZ3E+pK9DhD/qIlT
	 T9RXIoyYxzNZ56mGOlDyHROqWmqL7G1Fn+16MGcLSmabFCgj2vMHgS0ARximg7peQ2DFM
	 nP8iwWMMaO0qVXqGM36Q6urj0h+rj34bxbYRNjbdCGzh78F1q0RTcEG+VNGJh5W6IUGGv
	 pNMpr2ZXi304HTMnfjoODwfZvUK1nEX6E3eLozwuXPmIkMpA9s5Tp0hj6hwnhKelhA3CC
	 IqG1ZMbsBJCDBuXF6oVYrHRJ1NzeS9asr8M+T5jBIkSWW+0vmU28oI3Cerd6aoAKz7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689127;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-TUG-Backscatter-control:X-Spam-Scanner:
	 X-Spam-Score-relay:X-Scanned-By;
	bh=9vGN8T6bshCbNqzDWccB3cKDLqxWsKRZjFqB0WfYoC8=;
	b=oYy5Sop22Sethe25PYI/zXq1AhhDcdntn+EIcGvtJ43GEHV3jF+rOP3AVE7J6h+DKRUL
	 /ycKNt3+NqPFmmhMVeujq4S6+PDbzFJGo5n7+J8uVx2vQFczeGSVi/lzMPJBGhBCtTNjB
	 fXCI4L5kxImoGkkx1AnmDTHhNYQiV3ww1e9XeYNqCkCoIh3dp1MTxnsx5vNX982WSxUTc
	 FrZ6r4JCZKjEW/Lf0y8LitMiMOhOvg5zv0dkqIQ8TIYlmiHxAwImLF8Lcy0CcARW2gifG
	 BJ1/+iLaZa1R3cWaFmJsnx6aF3z3AhYNkjzT2+LZ0lukfBzccnrO3YFJ3Wm/8HtoORQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tugraz.at;
	spf=pass smtp.mailfrom=tugraz.at;
	dkim=pass header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b=VVvpguMp;
	arc=none smtp.remote-ip=129.27.2.202
Received: from mailrelay.tugraz.at (mailrelay.tugraz.at [129.27.2.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5467606A31A
	for <linux-man@vger.kernel.org>; Thu, 22 Oct 2026 17:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5467606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tugraz.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b=VVvpguMp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tugraz.at;
	s=mailrelay; t=1792689103;
	bh=9vGN8T6bshCbNqzDWccB3cKDLqxWsKRZjFqB0WfYoC8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VVvpguMpLn/wLIbkyF8HK0Y4XlRnT89esVaT7ZBgGf9seVZ4iFvOy9zJb5UTdH8E9
	 MgmJNGCuuXSi+UyQli5WrFSEJjzqOR9q9JS2ZogviEysOvYz0xbA8rAcmInn/Vp0MI
	 pkR+XrOcXTCUOZqa+w3zg1xDcp9U2xNzhyVWsCNk=
Received: from heim-032-120.raab-heim.uni-linz.ac.at (heim-032-120.raab-heim.uni-linz.ac.at [193.171.32.120])
	by mailrelay.tugraz.at (Postfix) with ESMTPSA id 4j9XkQ1Lz0z9s0w;
	Thu, 22 Oct 2026 19:11:41 +0200 (CEST)
Message-ID: <543dcd09540ba941c8d3ce86dd7581bc6425c367.camel@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
From: Martin Uecker <uecker@tugraz.at>
To: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, Michael Kerrisk	
 <mtk.manpages@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>,
  Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, "Joseph
 S. Myers" <jsm28@cam.ac.uk>
Date: Thu, 22 Oct 2026 19:11:41 +0200
In-Reply-To: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
References: 
	<79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-TUG-Backscatter-control: G/VXY7/6zeyuAY/PU2/0qw
X-Spam-Scanner: SpamAssassin 3.003001 
X-Spam-Score-relay: 0.0
X-Scanned-By: MIMEDefang 2.74 on 129.27.10.117


Here are my 2 cents:

The one big advantage of the forward declaration syntax is, that
if one does use it, one can get real benefits in security already
today in the forms of compiler warnings and when using object-size
sanitizer.  In my opinion, it is real tragedy for the world that it
is not more widely known and used (and that Clang does not want to
implement it).=20

On the other hand, we have now a counter proposal from Apple
which would make the simpler syntax with retrospective scoping
work.  I still do not like it, as the fully developed form
would be a major pain for most C compiler to implement, but
I guess a restricted version would be ok.  Unfortunately, this
syntax does not work today, so could be used in code only at
some point in the future.=20

Still, my recommendation would be to wait until this issue is settled
in WG14 and if Apple's proposal is accepted, use Apple's syntax
in the man pages.

Martin


*) Also I hate giving in to bullies.  (not talking about
the Apple engineers)


Am Donnerstag, dem 22.10.2026 um 18:44 +0200 schrieb Alejandro Colomar:
> From: Alejandro Colomar <alx+linux-man@kernel.org>
>=20
> From: Alejandro Colomar <alx@kernel.org>
>=20
> I'm not fully convinced of this patch.  But I'm open to being convinced.
> I've written the patch, as Michael asked me to do, but am willing to
> hear everyone's opinion before applying the patch.
>=20
> As Michael reminded me recently, and as I've defended in other cases, it
> is true that the SYNOPSIS of the manual pages does not need to be
> strictly valid C.  It only needs to be useful enough for readers to
> understand the interface.  Thus, if using lengths without declaring them
> would improve the usefulness of the documentation, even if becoming
> invalid C, it would be okay.
>=20
> However, I still have doubts, because this change comes with risks:
>=20
> Programmers might think it is valid C to refer to parameters that have
> not been declared yet, and use that in their code, and if they are
> unlucky, it might compile for them, which might result in UB at some
> point.
>=20
> One valid point is that this is rather unlikely to happen, and most of
> the time it will just result in a compiler error, because no global
> variables with the name of the parameter exist.
>=20
> However, with local (nested) functions, this might be easier to happen,
> as variables declared in the outer function are more likely to share a
> name with a length parameter.  Given that the C Committee is working
> hard to standardize local functions, it might be a very bad idea to have
> this combination of events going on.
>=20
> Concerns that have been raised against using the GNU C syntax in the
> manual pages:
>=20
> Very very few programmers know this syntax, and thus they are confused
> when reading it for the first time.
>=20
> This is obviously true.  However, this is true of any innovative syntax.
> We should consider whether the confusion is dangerous or not, and
> whether programmers can learn it easily or not.
>=20
> I believe once you've been exposed to this syntax, after some research,
> or asking the right people, one would easily learn to read it, and then
> we'd have overcome the issue.  I don't think the syntax is inherently
> difficult to understand once you've seen the documentation and seen it
> a few times.
>=20
> Also, this syntax is not very dangerous: a programmer thinking
> that a forward declaration is actually a normal parameter will pass a
> wrong number of arguments to the function, and thus will have compiler
> errors.  This syntax is quite robust, as it requires several bugs to
> happen in the same code to pass compilation silently.  If one replaces
> ';' with ',', the parameter will be declared twice, which is an error.
> If one renames a forward declaration, it will not match a parameter, and
> will result in a compiler error.  Only if both mistakes happen at once,
> the compilation would pass, but then the call sites would also have to
> match the bogus declaration.  And also, the function definition would
> have unused parameters, which would trigger diagnostics.  So, concerning
> safety, this feature is not very dangerous, even if used by someone who
> is very confused.
>=20
> Do we think programmers are unable to ever learn this new syntax?
> Are we ready to accept the risks of using the dangerous invalid syntax,
> but which is more intuitive to programmers?
>=20
> Reported-by: Michael Kerrisk <mtk.manpages@gmail.com>
> Not-yet-Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>=20
> I've cut the diff below to just a single page, because this is just for
> discussion; the actual diff is huge and uninteresting.  It's just a
> removal of all uses of fwd decls of parameters in the manual pages.
>=20
>=20
> Have a lovely day!
> Alex
>=20
>  man/man2/add_key.2                       |  2 +-
>  man/man2/alloc_hugepages.2               |  2 +-
>  man/man2/cacheflush.2                    |  2 +-
>  man/man2/epoll_wait.2                    |  6 +++---
>  man/man2/futex_waitv.2                   |  2 +-
>  man/man2/get_mempolicy.2                 |  2 +-
>  man/man2/getdents.2                      |  2 +-
>  man/man2/getdomainname.2                 |  4 ++--
>  man/man2/getrandom.2                     |  2 +-
>  man/man2/getsockopt.2                    |  4 ++--
>  man/man2/getunwind.2                     |  2 +-
>  man/man2/getxattr.2                      |  6 +++---
>  man/man2/init_module.2                   |  2 +-
>  man/man2/listmount.2                     |  2 +-
>  man/man2/lookup_dcookie.2                |  2 +-
>  man/man2/madvise.2                       |  2 +-
>  man/man2/mbind.2                         |  2 +-
>  man/man2/mincore.2                       |  2 +-
>  man/man2/mlock.2                         |  6 +++---
>  man/man2/mmap.2                          |  4 ++--
>  man/man2/modify_ldt.2                    |  2 +-
>  man/man2/mprotect.2                      |  4 ++--
>  man/man2/mremap.2                        |  2 +-
>  man/man2/msgop.2                         |  4 ++--
>  man/man2/msync.2                         |  2 +-
>  man/man2/outb.2                          | 12 ++++++------
>  man/man2/perfmonctl.2                    |  2 +-
>  man/man2/pread.2                         |  4 ++--
>  man/man2/query_module.2                  |  2 +-
>  man/man2/read.2                          |  2 +-
>  man/man2/readlink.2                      |  4 ++--
>  man/man2/recv.2                          |  4 ++--
>  man/man2/recvmmsg.2                      |  2 +-
>  man/man2/remap_file_pages.2              |  2 +-
>  man/man2/s390_pci_mmio_write.2           |  4 ++--
>  man/man2/send.2                          |  4 ++--
>  man/man2/sendmmsg.2                      |  2 +-
>  man/man2/setxattr.2                      |  6 +++---
>  man/man2/write.2                         |  2 +-
>  man/man2const/KEYCTL_DESCRIBE.2const     |  2 +-
>  man/man2const/KEYCTL_DH_COMPUTE.2const   |  2 +-
>  man/man2const/KEYCTL_GET_SECURITY.2const |  2 +-
>  man/man2const/KEYCTL_INSTANTIATE.2const  |  4 ++--
>  man/man2const/KEYCTL_READ.2const         |  2 +-
>  man/man2const/KEYCTL_UPDATE.2const       |  2 +-
>  man/man2const/PR_GET_AUXV.2const         |  2 +-
>  man/man3/aio_suspend.3                   |  2 +-
>  man/man3/arc4random.3                    |  2 +-
>  man/man3/backtrace.3                     |  6 +++---
>  man/man3/bcmp.3                          |  2 +-
>  man/man3/bcopy.3                         |  2 +-
>  man/man3/bsearch.3                       |  2 +-
>  man/man3/bzero.3                         |  2 +-
>  man/man3/cfree.3                         |  4 ++--
>  man/man3/confstr.3                       |  2 +-
>  man/man3/des_crypt.3                     |  4 ++--
>  man/man3/explicit_bzero.3                |  2 +-
>  man/man3/fgets.3                         |  2 +-
>  man/man3/fgetws.3                        |  2 +-
>  man/man3/fmemopen.3                      |  2 +-
>  man/man3/fread.3                         |  4 ++--
>  man/man3/getcwd.3                        |  2 +-
>  man/man3/getdirentries.3                 |  2 +-
>  man/man3/getentropy.3                    |  2 +-
>  man/man3/getgrent_r.3                    |  4 ++--
>  man/man3/getgrnam.3                      |  4 ++--
>  man/man3/gethostbyname.3                 | 10 +++++-----
>  man/man3/getipnodebyname.3               |  2 +-
>  man/man3/getlogin.3                      |  2 +-
>  man/man3/getmntent.3                     |  2 +-
>  man/man3/getnameinfo.3                   |  2 +-
>  man/man3/getnetent_r.3                   |  6 +++---
>  man/man3/getprotoent_r.3                 |  6 +++---
>  man/man3/getpwent_r.3                    |  4 ++--
>  man/man3/getpwnam.3                      |  4 ++--
>  man/man3/getrpcent_r.3                   |  6 +++---
>  man/man3/getservent_r.3                  |  6 +++---
>  man/man3/getspnam.3                      |  8 ++++----
>  man/man3/inet_net_pton.3                 |  4 ++--
>  man/man3/inet_ntop.3                     |  2 +-
>  man/man3/lio_listio.3                    |  2 +-
>  man/man3/lsearch.3                       |  4 ++--
>  man/man3/mblen.3                         |  2 +-
>  man/man3/mbrlen.3                        |  2 +-
>  man/man3/mbrtowc.3                       |  2 +-
>  man/man3/mbsnrtowcs.3                    |  2 +-
>  man/man3/mbsrtowcs.3                     |  2 +-
>  man/man3/mbstowcs.3                      |  2 +-
>  man/man3/mbtowc.3                        |  2 +-
>  man/man3/memccpy.3                       |  2 +-
>  man/man3/memchr.3                        |  2 +-
>  man/man3/memcmp.3                        |  2 +-
>  man/man3/memcpy.3                        |  2 +-
>  man/man3/memfrob.3                       |  2 +-
>  man/man3/memmem.3                        |  2 +-
>  man/man3/memmove.3                       |  2 +-
>  man/man3/mempcpy.3                       |  2 +-
>  man/man3/memrchr.3                       |  2 +-
>  man/man3/memset.3                        |  2 +-
>  man/man3/memset_explicit.3               |  2 +-
>  man/man3/mq_receive.3                    |  4 ++--
>  man/man3/mq_send.3                       |  4 ++--
>  man/man3/posix_madvise.3                 |  2 +-
>  man/man3/pthread_attr_setstack.3         |  2 +-
>  man/man3/pthread_setname_np.3            |  2 +-
>  man/man3/ptsname.3                       |  2 +-
>  man/man3/qsort.3                         |  4 ++--
>  man/man3/random.3                        |  2 +-
>  man/man3/regex.3                         |  2 +-
>  man/man3/resolver.3                      | 24 ++++++++++++------------
>  man/man3/setaliasent.3                   |  4 ++--
>  man/man3/setbuf.3                        |  4 ++--
>  man/man3/setnetgrent.3                   |  2 +-
>  man/man3/snprintf.3                      |  4 ++--
>  man/man3/stpncpy.3                       |  2 +-
>  man/man3/strerror.3                      |  4 ++--
>  man/man3/strfmon.3                       |  4 ++--
>  man/man3/strfromd.3                      |  6 +++---
>  man/man3/strftime.3                      |  4 ++--
>  man/man3/strlcpy.3                       |  4 ++--
>  man/man3/strncat.3                       |  2 +-
>  man/man3/strncpy.3                       |  2 +-
>  man/man3/strndup.3                       |  2 +-
>  man/man3/strndupa.3                      |  2 +-
>  man/man3/strxfrm.3                       |  2 +-
>  man/man3/swab.3                          |  2 +-
>  man/man3/ttyname.3                       |  2 +-
>  man/man3/unlocked_stdio.3                |  8 ++++----
>  man/man3/wcpncpy.3                       |  2 +-
>  man/man3/wcsncat.3                       |  2 +-
>  man/man3/wcsncpy.3                       |  2 +-
>  man/man3/wcsnrtombs.3                    |  2 +-
>  man/man3/wcsrtombs.3                     |  2 +-
>  man/man3/wcstombs.3                      |  2 +-
>  man/man3/wmemchr.3                       |  2 +-
>  man/man3/wmemcmp.3                       |  2 +-
>  man/man3/wmemcpy.3                       |  2 +-
>  man/man3/wmemmove.3                      |  2 +-
>  man/man3/wmempcpy.3                      |  2 +-
>  man/man3/wmemset.3                       |  2 +-
>  man/man3/wprintf.3                       |  4 ++--
>  man/man7/man-pages.7                     |  2 +-
>  man/man7/string_copying.7                | 16 ++++++++--------
>  man/man9/strscpy.9                       |  2 +-
>  144 files changed, 228 insertions(+), 228 deletions(-)
>=20
> diff --git a/man/man2/add_key.2 b/man/man2/add_key.2
> index 19bc5d40ae76..908c63a10fbb 100644
> --- a/man/man2/add_key.2
> +++ b/man/man2/add_key.2
> @@ -14,7 +14,7 @@ .SH SYNOPSIS
>  .nf
>  .B #include <keyutils.h>
>  .P
> -.BR key_serial_t\~add_key( size_t\~size;
> +.B key_serial_t\~add_key(
>  .BI "                     const char *" type ", const char *" descriptio=
n ,
>  .BI "                     const void " payload [ size "], size_t " size =
,
>  .BI "                     key_serial_t " keyring ");"
