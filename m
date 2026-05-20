Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185953C3420
	for <linux-man@vger.kernel.org>; Wed, 20 May 2026 23:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779318611; cv=none; b=SNxsTwX8khc2a4XtJ4p3ai+I5jlt5EnZydn7h0BFGWa/f2i7jioN9excO0ai8mrKL3/Vs1kA9tfW3kdGONZFBVpN6E8gdZiN0cMVvLYFJpBPGZHnt8+E3NH4zFhh2d1cnwMgaGv0Kelo8uXV4QIGIqnQfzW69wPZPPLQLpJFw38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779318611; c=relaxed/simple;
	bh=7UIpBVxhotOyMjBUiSbSJpoY4S+duzClqmkNgAk8Nb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0vAWeSZDXirXXJmXrqlFKp0lIu5UqdjwmhmSlzQnGgfWSxAFhVWDYNWe2eU0SgQ0MFG0HEYPNrxrL0zNhcOz2b3Ia2X8xduCY5KWVQuQBibtniZkThwnsnvqMgzkyeCppgU7nPMtOUM9Y01r6oqGAJOS+wCgN7stm3YPmz8MD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBUvSo/x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBUvSo/x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081EF1F000E9;
	Wed, 20 May 2026 23:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779318609;
	bh=na4dmmyKdr/Wk/lnzwUUGLrkPF5S5FonXKtQN2oD6Jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SBUvSo/x0hM5vV+VHtLnXKFATx5/+iXi9q/Sv0tz6LeWB2ZRqJFOVN/fyXubXZl65
	 PYTYjnEnEo0buUPZpBWhxpqUH+nz7LDLkWQ1l1np0Na3wl8HuuTjRiDU0eA47QdSLx
	 TquPIfYtaOM9+aE5ggSug8lMy65J2uonchQ55xsMawr1upxrGvPiMLIlDtmKXcwlEz
	 +oMTqUdhBxeIM/nYnpd2KaJD03+u8CCB+s2Bz5Jx51TRiggs8M8XsYQVuAuwNtW7Uu
	 CVFPvq0r70R/97CBBXMs5X4U6AG84mgJLeBlOmvdWzZn3J5E4/up03q9xadoqBhAXx
	 IOF5O5fYIVYpA==
Date: Thu, 21 May 2026 01:10:05 +0200
From: Alejandro Colomar <alx@kernel.org>
To: ChaseKnowlden <haroldknowlden@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/seccomp.2: Fix signal.h type conflict with
 glibc in seccomp.2
Message-ID: <ag4-lKqvpieapYrt@devuan>
References: <20260520213258.23500-1-haroldknowlden@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wuifi3sfrl5r6vpp"
Content-Disposition: inline
In-Reply-To: <20260520213258.23500-1-haroldknowlden@gmail.com>


--wuifi3sfrl5r6vpp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: ChaseKnowlden <haroldknowlden@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/seccomp.2: Fix signal.h type conflict with
 glibc in seccomp.2
Message-ID: <ag4-lKqvpieapYrt@devuan>
References: <20260520213258.23500-1-haroldknowlden@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260520213258.23500-1-haroldknowlden@gmail.com>

Hi ChaseKnowlden,

> Subject: Re: [PATCH] man/man2/seccomp.2: Fix signal.h type conflict with =
glibc in seccomp.2

On 2026-05-20T17:32:58-0400, ChaseKnowlden wrote:
> Signed-off-by: ChaseKnowlden <haroldknowlden@gmail.com>

You should say something more in the commit message.  What type conflict
do you have?  Why is this fix correct?  It would be good to link to
other sources that confirm this, and/or CC glibc.

> ---
>  man/man2/seccomp.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man2/seccomp.2 b/man/man2/seccomp.2
> index e469f3997..8b8f2fc61 100644
> --- a/man/man2/seccomp.2
> +++ b/man/man2/seccomp.2
> @@ -16,7 +16,7 @@ Standard C library
>  .BR "#include <linux/seccomp.h>" "  /* Definition of " SECCOMP_* " const=
ants */"
>  .BR "#include <linux/filter.h>" "   /* Definition of " "struct sock_fpro=
g" " */"
>  .BR "#include <linux/audit.h>" "    /* Definition of " AUDIT_* " constan=
ts */"
> -.BR "#include <linux/signal.h>" "   /* Definition of " SIG* " constants =
*/"
> +.BR "#include <signal.h>" "   /* Definition of " SIG* " constants */"

Please keep the alignment of the comments.


Have a lovely night!
Alex

>  .BR "#include <sys/ptrace.h>" "     /* Definition of " PTRACE_* " consta=
nts */"
>  .\" Kees Cook noted: Anything that uses SECCOMP_RET_TRACE returns will
>  .\"                  need <sys/ptrace.h>
> --=20
> 2.54.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--wuifi3sfrl5r6vpp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmoOP00ACgkQ64mZXMKQ
wqnx6g/7B7QjamLqAGDklRt/ChjYmbKGOnE9UcTcR6spp/BbtseKknX9HVJTwhLA
iRVL7wr6/EPElDh5fQyzgsUzyWEFf9wnK8b9C7YvjQ/w/vij4lQB/zc4DSjnAO8n
XngbwGuo7XtC9vO0E9RNpufJju9S8R7IonBu9R3gvlWjzyTyxWx+eaMR3zRW0Zr7
ihfojJRTKVnmVHOOu5wlAH5l7b2rwMMGtwtCsLDjL2qeQ0+j0Z6uzjWUU1wrJbCL
6QRS7ODjLUZ/wSDSQetv+iOgsiuruh5hMp55x3sj4sna8QmJyZD7EMIv8064r1nN
SDsgTWM+t57Vl4CFBaoLp8tjg5tbSWTe50bff/qXx2pmLv1jSjOR5HZoO7YkWCSy
vVCyl+V7ZZYwEx1AGrLfoF8o1zqGZwFD0I6NOxqzpMW7MoeoukVOKn+ET1xfzwOL
/07OJFgRqXHObjQFdXmOmB2OPXxo3ED9cyZ59cTcs76AeK3Q2ogssn2n4G8P0Iyh
QRV7NiTU8p0HHIPnZN2W3nQoMIa91aO2tTjvn67eQfek8x4E8FuNfmtBjZxnXWcQ
Xs+sDp/s4Llrx2oLUL1k6pigCYN0e51WAw521nhFVx5tVQ+FIZjkHQe4DperD+v0
1k231Djv7dezPOE0H2QSA3zwGoVqsvt4QXzBLQjzDaNIKlIBGjQ=
=dwJE
-----END PGP SIGNATURE-----

--wuifi3sfrl5r6vpp--
