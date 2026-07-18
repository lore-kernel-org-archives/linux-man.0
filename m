Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC87135979
	for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376241; cv=none; b=MAvDXprrxVUHs/4RmkxMth0VicuaO+VDlKUCL/VwX3ervgpOXsPgK9zayVSvNgDQ8SB/DI67zldzXkE5VbF9wCLQd9IQ79PtVIISKaBXpwByM22sIu10Mssg5ZLv6OiFuYVXQsRQclvCKatol6wENZs8h/Z1YMQupkjgDDZDDok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376241; c=relaxed/simple;
	bh=KUi3lz/9g+eA48+RPpcldLdZAONU6P7nLn6JXtIgkgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyD64nx3Vertjz4KbqEZWuEMI14x7Hscn1ECf2DDi3OS5FFW4ctin/nSogmaFTr8Igf3usGb+dm6s8NzXJVIPrl1u59yf2TxSca6CgcH9WdNrK/tsfRJ1KpHLFRc9sc6H5wVPR7XmnlZrLv2bVGiDXkuo6PEbtA8AdEK0HBtosY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqoOy6h5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqoOy6h5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F291F000E9;
	Sat, 18 Jul 2026 12:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784376240;
	bh=9ngonvnHej62Xh7XYkgLHfOHWSivogRnpRvsQAOiqcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BqoOy6h5eYGQnzFxAczMuSIMmP6KQtXAYsIME2UxRngOZlIZkLf4sAg6aYPn4kZjo
	 eX2JAKgkQyCaZ+lkUqJ0AraseXuXe9Nf6lTDVJgCLPl0zbzPIieItJvPcb/L5x4d1a
	 eRBzw3j16QIwiTouSiBUEiTQ/FGTBg4phxq9en6TL5KWXrD5CUmompmaYWVG6eqUmH
	 0yruxLVUj9sWW6iIUxhhZGnBVrBm81peGcpzGjn1us9Jt2L4krIAcIs3U1jVuTjMQN
	 hIh3QG+P/+N2Aiy9txpp4SOSV5vTnw7irD9/MC9fEpsYusY3kDbIK8Zv47KazkIkGe
	 XDlFbwcuu003w==
Date: Sat, 18 Jul 2026 14:03:57 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Maja =?utf-8?B?S8SFZHppb8WCa2E=?= <maya@compilercrim.es>
Cc: linux-man@vger.kernel.org, Kalesh Singh <kaleshsingh@google.com>
Subject: Re: [PATCH] man/man5/proc_pid_fdinfo.5: document the ino field
Message-ID: <altrcm5NL--VaUjl@devuan>
References: <7eeaa92f7a7cc14024a6474d4cc117e875185f6d.1784211190.git.maya@compilercrim.es>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cyswk7wg7tgpynts"
Content-Disposition: inline
In-Reply-To: <7eeaa92f7a7cc14024a6474d4cc117e875185f6d.1784211190.git.maya@compilercrim.es>


--cyswk7wg7tgpynts
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Maja =?utf-8?B?S8SFZHppb8WCa2E=?= <maya@compilercrim.es>
Cc: linux-man@vger.kernel.org, Kalesh Singh <kaleshsingh@google.com>
Subject: Re: [PATCH] man/man5/proc_pid_fdinfo.5: document the ino field
Message-ID: <altrcm5NL--VaUjl@devuan>
References: <7eeaa92f7a7cc14024a6474d4cc117e875185f6d.1784211190.git.maya@compilercrim.es>
MIME-Version: 1.0
In-Reply-To: <7eeaa92f7a7cc14024a6474d4cc117e875185f6d.1784211190.git.maya@compilercrim.es>

Hi Maja,

On 2026-07-16T16:51:07+0200, Maja K=C4=85dzio=C5=82ka wrote:
> Also expands the tabs into spaces where relevant, in order to ensure
> proper alignment between the fields when rendered by man.
>=20
> Signed-off-by: Maja K=C4=85dzio=C5=82ka <maya@compilercrim.es>
> Cc: Kalesh Singh <kaleshsingh@google.com>

Thanks!  I've split the commit in two: documenting that these fields
(especially, mnt_id) are decimal deserves a separate commit, with its
own commit message.


Have a lovely day!
Alex

> ---
>  man/man5/proc_pid_fdinfo.5 | 46 ++++++++++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 17 deletions(-)
>=20
> diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
> index 93c6cf269f31..f93b69c6c59d 100644
> --- a/man/man5/proc_pid_fdinfo.5
> +++ b/man/man5/proc_pid_fdinfo.5
> @@ -24,6 +24,7 @@ For regular files and directories, we see something lik=
e:
>  pos:    1000
>  flags:  01002002
>  mnt_id: 21
> +ino:    63107
>  .EE
>  .in
>  .P
> @@ -51,9 +52,14 @@ rather than the current setting of the close-on-exec f=
lag.
>  .I mnt_id
>  This field, present since Linux 3.15,
>  .\" commit 49d063cb353265c3af701bab215ac438ca7df36d
> -is the ID of the mount containing this file.
> +is the decimal ID of the mount containing this file.
>  See the description of
>  .IR /proc/ pid /mountinfo .
> +.TP
> +.I ino
> +This field, present since Linux 5.14,
> +.\" commit 3845f256a8b527127bfbd4ced21e93d9e89aa6d7
> +is the decimal inode number of the file.
>  .P
>  For eventfd file descriptors (see
>  .BR eventfd (2)),
> @@ -63,9 +69,10 @@ the following fields:
>  .P
>  .in +4n
>  .EX
> -pos:	0
> -flags:	02
> -mnt_id:	10
> +pos:    0
> +flags:  02
> +mnt_id: 10
> +ino:    63107
>  eventfd\-count:               40
>  .EE
>  .in
> @@ -81,9 +88,10 @@ the following fields:
>  .P
>  .in +4n
>  .EX
> -pos:	0
> -flags:	02
> -mnt_id:	10
> +pos:    0
> +flags:  02
> +mnt_id: 10
> +ino:    63107
>  tfd:        9 events:       19 data: 74253d2500000009
>  tfd:        7 events:       19 data: 74253d2500000007
>  .EE
> @@ -114,10 +122,11 @@ the following fields:
>  .P
>  .in +4n
>  .EX
> -pos:	0
> -flags:	02
> -mnt_id:	10
> -sigmask:	0000000000000006
> +pos:    0
> +flags:  02
> +mnt_id: 10
> +ino:    63107
> +sigmask:        0000000000000006
>  .EE
>  .in
>  .P
> @@ -138,9 +147,10 @@ the following fields:
>  .P
>  .in +4n
>  .EX
> -pos:	0
> -flags:	00
> -mnt_id:	11
> +pos:    0
> +flags:  00
> +mnt_id: 11
> +ino:    63107
>  inotify wd:2 ino:7ef82a sdev:800001 mask:800afff ignored_mask:0 fhandle\=
-bytes:8 fhandle\-type:1 f_handle:2af87e00220ffd73
>  inotify wd:1 ino:192627 sdev:800001 mask:800afff ignored_mask:0 fhandle\=
-bytes:8 fhandle\-type:1 f_handle:27261900802dfd73
>  .EE
> @@ -176,9 +186,10 @@ the following fields:
>  .P
>  .in +4n
>  .EX
> -pos:	0
> -flags:	02
> -mnt_id:	11
> +pos:    0
> +flags:  02
> +mnt_id: 11
> +ino:    63107
>  fanotify flags:0 event\-flags:88002
>  fanotify ino:19264f sdev:800001 mflags:0 mask:1 ignored_mask:0 fhandle\-=
bytes:8 fhandle\-type:1 f_handle:4f261900a82dfd73
>  .EE
> @@ -232,6 +243,7 @@ the following fields:
>  pos:    0
>  flags:  02004002
>  mnt_id: 13
> +ino:    63107
>  clockid: 0
>  ticks: 0
>  settime flags: 03
> --=20
> 2.54.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--cyswk7wg7tgpynts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpba6wACgkQ64mZXMKQ
wqlV1g//eeaz5Z4rjShXD6D4lzio0KhQBj5b63jk+1+QcoFjTb8eIT+2wQ7I9aCu
DQ90U8O8LpqypB892CxcRZJ1TF19jEpVvxlay0DLxHVPJoHpCgDGeXj7BUpqc+Cv
NHyDx9ZsnX0IHCmm5+IoK2TJ4XknMp6m6rHMElXUT9/+k+XefziMCtAwh8dD/T5x
aW4iaR0c7fNYkas6Gndei+kYqFIKzjb+XA2JD0MHIAH1IGcV1NLQ6RbEvHwQlaBv
DZNJdOrgC+yMrMTRx/wIRiM/3pILDe9Xmj5B96YIw87+IfAeap/pcS6O3rNSHqtF
LT9t8OfV3IGt/dHp7iBhjVsWlbJFawRVD2KtLW8cHmzn2r/uBrcEHCykfcsNIgB6
5Ene5b7K+lLD6AB1J2XRSSag0172vFOPcmnDRpdPw3JeJSWuxkDwY25K76OaFGAd
aTUB9F6y8O18Wb8xyH2seHkdwPnHBtc7NKKdLUVlJ0LTVPDs5F2I8ytlOwzdfbD4
pSKCfH8BH6fVJ9D2vJGUEtxwSRQiznvL4aWZremCWCwkETGi1MJKjU3h1GbTta/M
TL5jAeMpQ/vURqE+l6NDBjK3011XN6+yFfun96wbPyWIH9iiw0MmOQUpOkO+g7Mi
mEl9QZ78aA1LmuCxZBRPKmEUQNLzNuxpcXSsWusux6edvTmzGAc=
=RtIS
-----END PGP SIGNATURE-----

--cyswk7wg7tgpynts--
