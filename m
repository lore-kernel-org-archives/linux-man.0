Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764A43BBA09
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784203779; cv=none; b=egPSiKVLyzCEzm68xw9h+H73krQE6m6lkmj0HaVhhX59usGgOy7ZHXoZc5aMiZ0HhwYG/6RTgUpmUNskroD34SUX4prnmdEMk2yFz4jotHu3WJ3JGvCWGNlVBouFPVB6P0usNGjfTx/vHrxj613RsBE5sg4HcK2ECr+EQvEYgqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784203779; c=relaxed/simple;
	bh=zNADPkbWihEOsMCkFr096hJMY95qAzyyPza3a/LlPdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NF8akGCiuFZJ1zolRyZTK+HI24PeIFgVJev/AEFGrYM6TV4Sg4zNPwT3aYXlc/zV8AiR+e2f0c+U1DnaoL7gFFO7fP4+eNKnQhFBOq+sM4NRs2cXqjmXbXgQDuvZ9GtOPUsf1CU85A6cY9MIHMWTMk3WCCLZVGXW/5cQu1VYccc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlfWUAHz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlfWUAHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB7F1F000E9;
	Thu, 16 Jul 2026 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784203778;
	bh=jfosLgcIRWp7yW83CydRywXWAUswK3wYDzheOStCTjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dlfWUAHz4DVEEXTfjyOIjPsPxFHLrA2d5lhU/dKHTBK5J4exfLkyPe45tlNhz/IUq
	 JiNePZYZl+bQYZcIotEwSEAQQUpMLo+DcrlbY3qTo+AHk6V04npsl07+hPWqTAxpZ9
	 Adh0tXes5SfnZhryMFYg4gOsFg4ioSzhJMGKRwgXRMjou19whjtBAJ8v6LNJgoocKk
	 vhLYOOMdXxRblwDmSHKlowTcKkqzslbUxcIqS1Ap+fEocCDw5dB2LtrN19QG+dB9ai
	 7k+NFk7HnTg6G/MnLF26r/JiKnind75BOcpv6luP1Ir2TgIBot+11gm3HKSJF+cnPl
	 PPRAEpnnN8cRw==
Date: Thu, 16 Jul 2026 14:09:34 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v2 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <aljFw_lxPpGrvtQy@devuan>
References: <cover.1784084289.git.dj@redhat.com>
 <ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@redhat.com>
 <fed61f93333ec0421dc9adc5af05d740a2e4bcd7.1784084289.git.dj@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="apahp5uzjvgzcmq2"
Content-Disposition: inline
In-Reply-To: <fed61f93333ec0421dc9adc5af05d740a2e4bcd7.1784084289.git.dj@redhat.com>


--apahp5uzjvgzcmq2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v2 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <aljFw_lxPpGrvtQy@devuan>
References: <cover.1784084289.git.dj@redhat.com>
 <ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@redhat.com>
 <fed61f93333ec0421dc9adc5af05d740a2e4bcd7.1784084289.git.dj@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fed61f93333ec0421dc9adc5af05d740a2e4bcd7.1784084289.git.dj@redhat.com>

Hi DJ,

On 2026-07-14T22:58:09-0400, DJ Delorie wrote:
> ---
>  man/man5/tunables.conf.5 | 116 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 man/man5/tunables.conf.5
>=20
> diff --git a/man/man5/tunables.conf.5 b/man/man5/tunables.conf.5
> new file mode 100644
> index 000000000..e2b31e351
> --- /dev/null
> +++ b/man/man5/tunables.conf.5
> @@ -0,0 +1,116 @@
> +.TH tunables.conf 5 (date) "Linux man-pages (unreleased)"
> +.SH NAME
> +tunables.conf \- tunables configuration file
> +.SH SYNOPSIS
> +.nf
> +.B /etc/tunables.conf
> +.fi
> +.SH DESCRIPTION
> +Each line in the file
> +.I /etc/tunables.conf
> +specifies a tunable,
> +which is a name and value separated by an equals sign.

I suspect a tunable _is_ _not_ a name=3Dvalue.  That's _how_ you specify
a tunable, which is a different thing.

In fact, I think we'd have to document what a tunable actually is.
=46rom the glibc manual, I see:

	Tunables are a feature in the GNU C Library that allows
	application authors and distribution maintainers to alter the
	runtime library behavior to match their workload.  [...]

This seems more like a description of what a tunable is.
I'd put such a short description in the first paragraph, and move the
specification of how a tunable is specified in /etc/tunables.conf to the
second paragraph.

> +.P
> +For a list of valid tunables,

Maybe s/valid/supported/?

> +please consult the glibc manual.

s/please//

Also, a link to the specific point in the glibc manual would help:

	consult the
	.UR https://sourceware.org/glibc/manual/latest/html_node/Tunables.html
	glibc manual
	.UE .

However, I see that link documents the list of supported tunables by
saying you should run `ld.so --list-tunables`, so maybe we should
document that directly?  It shouldn't take much space.

Also, I see --list-tunables is already documented in ld.so(8), so we
only need to refer to that page.

	For a list of the supported tunables,
	see
	.B \-\-list\-tunables
	in
	.BR ld.so (8).

> +.P
> +The syntax allows lines to start with the word
> +.I include
> +followed by a path wildcard,
> +and will include any files matching that wildcard.
> +The wildcard is a path specification in the
> +.BR \%glob (7)
> +format.
> +Files matching that wildcard will be processed
> +as if their contents were included in the main config file.
> +.P
> +The file is parsed by
> +.BR \%ldconfig (8)
> +and the results stored in
> +.IR /etc/ld.so.cache .
> +The resulting data is read when a new process starts.
> +.P
> +Each line may include zero or more words or symbols at the beginning,

s/words/keywords/

Also, do symbols allow/require whitespace after them?

> +which affect how each tunable affects each processes:
> +.TP
> +.B overridable
> +.TQ
> +.B +
> +Allow the tunable to be overridden by the
> +.B GLIBC_TUNABLES
> +environment variable when the process runs
> +(this is the default).
> +.TP
> +.B nonoverridable
> +.TQ
> +.B \-
> +Do not allow the tunable to be overridden by the environment variable.
> +.TP
> +.B onlysecure
> +.TQ
> +.B @
> +The tunable only applies to
> +.B AT_SECURE
> +processes,
> +such as a set-user-ID process,
> +or one with elevated capabilities.
> +.TP
> +.B nonsecure
> +.TQ
> +.B $
> +The tunable only applies to
> +.RB non- AT_SECURE
> +processes (this is the default).
> +.TP
> +.B anysecure
> +.TQ
> +.B *
> +The tunable only applies to both
> +.B AT_SECURE
> +and
> +.RB non- AT_SECURE
> +processes.
> +.P
> +The file may also contain
> +.IR filters ,
> +which limit the tunables following it,
> +up to the end of the file
> +(or end of the included file,
> +or start of a new included file)
> +or a line with only
> +.B []
> +on it.
> +The syntax is:
> +.IP
> +.in +4n
> +.EX
> +.RI [ filter : pattern ]
> +.EE
> +.in
> +.TP
> +.B proc
> +The
> +.I proc

s/I/B/

(This and many other issues were reported in the previous patch set;
 please revise that.)


Have a lovely day!
Alex

> +filter limits the following tunables to processes
> +whose name matches the pattern.
> +The pattern may be an absolute path
> +or just the base name.
> +.P
> +Example config file:
> +.IP
> +.in +4n
> +.EX
> +glibc.malloc.arenas_max=3D5
> +onlysecure glibc.malloc.arenas_max=3D1
> +\-glibc.pthread.rseq=3D1
> +[proc:/bin/bad.program]
> +\-glibc.pthread.rseq=3D0
> +[proc:some.program]
> +\-glibc.malloc.mmap_threshold=3D65536
> +.EE
> +.in
> +.SH FILES
> +.I /etc/ld.so.conf
> +.SH SEE ALSO
> +.BR ld.so (8),
> +.BR ldconfig (8)
> --=20
> 2.47.3
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--apahp5uzjvgzcmq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpYyf4ACgkQ64mZXMKQ
wqkbbhAAspdPhlfUjlUVZATVABgzkJGm24FvK/LSJx5gvR6G7U6iPZgR07+GIEDe
75D8Lc0dYS3xxKlyKCkagYLM15GewA5lw/qvKoWJMVTdIB/KxE8NnSABb7dN/tbI
zGklzz5Kxdoe28gq8Nn2mIl4wyWOfibDFJkVG+3Tw7OPCoNbmwdLncm7FHkfe9iN
JApL0oAFgF/s0ozESBGNeci0RcO4gewVazDO5YP51mS1rSEDblDxGla3sTm9z+/N
rvze/njXuZymWCnZuAsnr6rp6dHeai9lnjsEcycOzXZvGjIh017sAUAq3o5/5Sbm
Qry9E/8i6LCZ1MkyB4FRsOd45MDWuEHOZ2Jp+5QE0aNTao4FnSACiHNvdAKTTOcW
U3lXI90/RFPeK9SFfxJmC6Agb28GPc4jzjhhpLDkGmmsFyt/JrO/OLyOBrMLcIjZ
IKL+5Y03m7hwKOBOtX8nu71p17N6GlrQBgAwGH1b9NjzjCjyEwma550WS5jGjaC6
YXMpSF5+HmVo6ilnhyz+xcYbMNIYH583a31jyY/v5rieIThZTOAxqKflTHJsdq1A
xyzO78a0kn0PfMJHkxn3Ej0IaALvr2p7G8PVN35XMzr1fw7gpJaCy3lLdN9N6zJX
8sFayXYGIiSK1AXRSfLLZemGrUgaXESnX82ZYv8lednZTUcms5Y=
=X8uQ
-----END PGP SIGNATURE-----

--apahp5uzjvgzcmq2--
