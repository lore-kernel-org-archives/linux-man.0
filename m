Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2544038AC9A
	for <linux-man@vger.kernel.org>; Sat, 12 Sep 2026 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789220383; cv=none; b=VRTod21Y+R3Xf9KFeqK78Qy+2HfoXqWhSjfoCw27a4htUUNvgW2qkrD54X5AMlmXfKcMdEX2CSVT8nQBnslOFEi26+MpCOv4gQHfLqMF4nvVhzlXqb8KLg/688NtkrDUhccoLDMoqw7EsDAGcpBUw3dXTOYdhvdEJXq6Rl/oEI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789220383; c=relaxed/simple;
	bh=9/n4CSDt/x/JnMfUodWyhkcWMBTcy+ewvfKfUVAX0pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnlrTLgfwhRT9NzCUxrP8faoEWFXeLT8Na+z4GMe3aTVWDMhlSPYhqlDla5V2Dt3tnVkSvqJ0jY3kAc76f6yr1a3N/NHr55ZgekJlMAyMeTV+kNHpLldQTjjju6+Lwy1+QBpeeuC05o566k4Jfpc0/m8xLUh04sp5dSKnfH7pVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GW0soVw6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GW0soVw6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975BA1F00893;
	Sat, 12 Sep 2026 13:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789220380;
	bh=4rMbsWtdOgZplmbmch+nYYpav27xAOOXY//nKeuK34I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GW0soVw6KvaIbfbwLMySn9Dosq5y9vu5ih3vkhU3iav8HuWTiOfXkbrrBO6MS4U7Y
	 7nMTXOSvYuw1if8090yFvCaPRzHk1FgcQJ0Htf2mjF9ITRjIC5hWNm+R68q4eVlkWM
	 jmg29LKECjAtV9griUIxzSWX1y/bZM+nH/hpD2+T1XkJPYxCAw+kPGKjSGwdDdwwz3
	 gRd1QYv8XZnUU1c18/V8NcOmnIFZhtF369aX+5SxglwHKJreYPVrnH5gMzTK+jSANv
	 FZyKpGQBviMu1hjOvxuWA8vPFWHiW0mnPYfWbpV9PcKVYRpWc4bmh3umtgR6mBySY0
	 LQeMa34C8+B9A==
Date: Sat, 12 Sep 2026 15:39:37 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Max Chernoff <git@maxchernoff.ca>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 2/3] man/man5/proc_pid_{smaps,smaps_rollup,maps}.5,
 man/man7/capabilities.7: CAP_PERFMON allows reading
 /proc/pid/{smaps,smaps_rollup,maps}
Message-ID: <aqVWA9eVr0jSxHGX@devuan>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
 <b239ee32ef7d0cbdc09c95f28034bb2426f72507.1789212041.git.git@maxchernoff.ca>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h6vkmgouaxu4r6u5"
Content-Disposition: inline
In-Reply-To: <b239ee32ef7d0cbdc09c95f28034bb2426f72507.1789212041.git.git@maxchernoff.ca>


--h6vkmgouaxu4r6u5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Max Chernoff <git@maxchernoff.ca>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 2/3] man/man5/proc_pid_{smaps,smaps_rollup,maps}.5,
 man/man7/capabilities.7: CAP_PERFMON allows reading
 /proc/pid/{smaps,smaps_rollup,maps}
Message-ID: <aqVWA9eVr0jSxHGX@devuan>
References: <2129b0c39ad5248641f24b43a4b1750bb62be43f.1789212041.git.git@maxchernoff.ca>
 <b239ee32ef7d0cbdc09c95f28034bb2426f72507.1789212041.git.git@maxchernoff.ca>
MIME-Version: 1.0
In-Reply-To: <b239ee32ef7d0cbdc09c95f28034bb2426f72507.1789212041.git.git@maxchernoff.ca>

> Date: 2026-09-12 05:32:12-0600
> From: Max Chernoff <git@maxchernoff.ca>
>
> Link: <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/?id=3D0c555a3c1bc9114ad91422b941dcd29e02490687>
> Signed-off-by: Max Chernoff <git@maxchernoff.ca>

Reviewed-by: Alejandro Colomar <alx@kernel.org>


Cheers,
Alex

> ---
>  man/man5/proc_pid_maps.5  |  5 ++++-
>  man/man5/proc_pid_smaps.5 | 10 ++++++++++
>  man/man7/capabilities.7   |  9 ++++++++-
>  3 files changed, 22 insertions(+), 2 deletions(-)
>=20
> diff --git a/man/man5/proc_pid_maps.5 b/man/man5/proc_pid_maps.5
> index 8783dbb3a89d..dcd455ea840c 100644
> --- a/man/man5/proc_pid_maps.5
> +++ b/man/man5/proc_pid_maps.5
> @@ -16,7 +16,10 @@
>  .BR mmap (2)
>  for some further information about memory mappings.
>  .IP
> -Permission to access this file is governed by a ptrace access mode
> +Permission to access this file is governed by
> +.B CAP_PERFMON
> +(since Linux 6.15)
> +or a ptrace access mode
>  .B PTRACE_MODE_READ_FSCREDS
>  check;
>  see
> diff --git a/man/man5/proc_pid_smaps.5 b/man/man5/proc_pid_smaps.5
> index 51440cc13bf6..d83521409375 100644
> --- a/man/man5/proc_pid_smaps.5
> +++ b/man/man5/proc_pid_smaps.5
> @@ -16,6 +16,16 @@
>  .BR pmap (1)
>  command displays similar information,
>  in a form that may be easier for parsing.)
> +.IP
> +Permission to access this file is governed by
> +.B CAP_PERFMON
> +(since Linux 6.15)
> +or a ptrace access mode
> +.B PTRACE_MODE_READ_FSCREDS
> +check;
> +see
> +.BR ptrace (2).
> +.IP
>  For each mapping there is a series of lines such as the following:
>  .IP
>  .in +4n
> diff --git a/man/man7/capabilities.7 b/man/man7/capabilities.7
> index eef074979f1b..bb8f6d9db433 100644
> --- a/man/man7/capabilities.7
> +++ b/man/man7/capabilities.7
> @@ -283,7 +283,14 @@
>  call
>  .BR perf_event_open (2);
>  .IP \[bu]
> -employ various BPF operations that have performance implications.
> +employ various BPF operations that have performance implications;
> +.IP \[bu]
> +read the contents of
> +.IR /proc/ pid /maps,
> +.IR /proc/ pid /smaps,
> +and
> +.IR /proc/ pid /smaps_rollup
> +for all processes.
>  .RE
>  .PD
>  .IP
> --=20
> 2.55.0
>=20

--=20
<https://www.alejandro-colomar.es>

--h6vkmgouaxu4r6u5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqlVhkACgkQ64mZXMKQ
wqkv6BAApeKsDRZgNxwfDgrOcUFhYKqDlhymDHJLYDuFdSEeNoYzu0umpgzvTsWz
lhcZ7dbgOsq6CREj2GD/mKG4vk6hpL/pCdRoMKnc4lTAYOPD9V4IAy5gO1pTFbR7
ws2k4hsSKV6pUoNze5rHcbnIManTI6tSRv6XWbRnTizO3OHoALmvewe6DCwinGdB
S6M0mv9H83oH4lEGIh4UBTMtzWzAH0XMCGvU7jLPwLN8gQ5rEt5wd7vi+sVEhQ6H
oF9o1/rvp8AXhz9Rt5+XP9gE9YYOTmCGCO08rhE17iaOv80RItg7+101tszPCMEr
g/O2NpZJxSDXB7k1nDzNMwrz9YWPJ9QPH/dwsYu7SxCIPBR5JvG/dXcnL193J/D/
UUYjvxjwwKzOG7zn2EXupua/HPyFKyQ1KHh4FqkD5YLbj+ALhT8JMQ9MrR8CUcX2
LeaP11zbF/qAtVoq3ffBTK96q3BrWxou/w7xBgzSDowW5Fb8btiYhfjASS6RgXN1
8ob/v8GT9DtndORS/4LvewqFg/cuambIo/DfjJ22MH527QlEnDEsioQDYD32Ldnr
o9w+qKO9/jmLi0VgeJokIZaOo7hXI5mWr+rKvK6k6NtE6qLiF7bmzohspV8IAf+4
4GKYmZHQ1QOdVceksiUZmE8h4LpvJMERbbBZ+3G5lov8VyZTJK0=
=gK0u
-----END PGP SIGNATURE-----

--h6vkmgouaxu4r6u5--
