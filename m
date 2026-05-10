Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82596175A68
	for <linux-man@vger.kernel.org>; Sun, 10 May 2026 22:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778450783; cv=none; b=XCvl4MKLf0u2p4aMP1K2THtCdKeOS0qsAiAHeWbK03PcnBxGaXPC/51LisxQMBqKZVrecza/NiMamlYwm6+P1iUfh9vqdfp8JtKTyE8R9LXkEv3YwbrzDZ7RQ7XMlEAkG2+OqX0ZtEGwquMQ0qlUcQsX955uXmmUpIN/s/y2Pu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778450783; c=relaxed/simple;
	bh=VD643KUI7bQGxO9mShORwWx4zFPT5dyUJ89ZFDKqHCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+TMmD3PouYNEczNpEUBeItV2fqPleC7p91hJO7hpUbxn2IohHI8I1CsHY0ejs+1K78D1dVytmaH2Sw31w/2NMhmwDbD2jQdkzv1C/EhzOIK2E/0cPdtyX/VCIrkNHkxwzVya8qtVk8YWqSMp/xywCe0MwNaZyaQUZBwqJCk2LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdPGrNP5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdPGrNP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE81C2BCB8;
	Sun, 10 May 2026 22:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778450782;
	bh=VD643KUI7bQGxO9mShORwWx4zFPT5dyUJ89ZFDKqHCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WdPGrNP5RWXuQX6yB+M4mKoI94heG81lEACW7DJ7my4elRgi8KGju2n/PE7vOwa3A
	 mQXbmy6oEAePAtM+4EoMWOhrrI3SLLDzAyeDQjDhhySBrc8tJD84H551ttE6Y8xQIx
	 y+FdO66HjwcT+Dxx17cnm9VSUSB3INirk+gkqpX4WtRGIGHHrADIbGTDxh3lphmAix
	 8slm+zNhwzaIpRIUa4KaYQKLfJF8X+4gZlRC7k1goupV6anECYAZBvphh2FcKR3dsB
	 Hh+8850aqlxvfA14MSRge05jEJ9NTvPZ9HNbkf18YIATDtdRWymiD9bPuxv8ngrMql
	 PKxFd72tKi6Zw==
Date: Mon, 11 May 2026 00:06:19 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Guillem Jover <guillem@debian.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 1/3] */: Say OpenPGP instead of PGP
Message-ID: <agEAmFC7e4bGBJFo@devuan>
References: <20260509185022.289672-1-guillem@debian.org>
 <20260509185022.289672-2-guillem@debian.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6qrfx2o2k3773py2"
Content-Disposition: inline
In-Reply-To: <20260509185022.289672-2-guillem@debian.org>


--6qrfx2o2k3773py2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Guillem Jover <guillem@debian.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 1/3] */: Say OpenPGP instead of PGP
Message-ID: <agEAmFC7e4bGBJFo@devuan>
References: <20260509185022.289672-1-guillem@debian.org>
 <20260509185022.289672-2-guillem@debian.org>
MIME-Version: 1.0
In-Reply-To: <20260509185022.289672-2-guillem@debian.org>

Hi Guillem,

On 2026-05-09T20:50:20+0200, Guillem Jover wrote:
> From: Guillem Jover <guillem@hadrons.org>
>=20
> The IETF draft is called OpenPGP, where PGP is the original
> implementation from where the specification was based on. For file

I've changed the inter-sentence space to 2.
<https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIBUT=
ING.d/patches/description#n44>

> artifacts =C2=AB.pgp=C2=BB is the correct short term to use though, which=
 can

And I've changed the quotes to ASCII ones ("), to avoid making the
commit messages unnecessarily unreadable for those still using for
example the C locale.

> be considered the more implementation neutral name to use.
>=20
> Signed-off-by: Guillem Jover <guillem@hadrons.org>

Thanks!  I've applied the patch.


Cheers,
Alex

> ---
>  CONTRIBUTING.d/mail             | 8 ++++----
>  CONTRIBUTING.d/patches/sendmail | 2 +-
>  man/man7/suffixes.7             | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/CONTRIBUTING.d/mail b/CONTRIBUTING.d/mail
> index f900c0a1b..84c8fbcfb 100644
> --- a/CONTRIBUTING.d/mail
> +++ b/CONTRIBUTING.d/mail
> @@ -41,18 +41,18 @@ Description
>               it, go to
>               <https://subspace.kernel.org/vger.kernel.org.html>.
> =20
> -   Sign your emails with PGP
> +   Sign your emails with OpenPGP
>          We encourage that you sign all of your emails sent to the
>          mailing list, (especially) including the ones containing
> -        patches, with your PGP key.  This helps establish trust between
> +        patches, with your OpenPGP key.  This helps establish trust betw=
een
>          you and other contributors of this project, and prevent others
>          impersonating you.  If you don't have a key, it's not mandatory
>          to sign your email, but you're encouraged to create and start
> -        using a PGP key.  See also:
> +        using a OpenPGP key.  See also:
>          <https://www.gnupg.org/faq/gnupg-faq.html#use_pgpmime>
> =20
>          If you use mutt(1), we recommend the following configuration for
> -        PGP:
> +        OpenPGP:
> =20
>              set crypt_autosign =3D yes
>              set crypt_protected_headers_write =3D yes
> diff --git a/CONTRIBUTING.d/patches/sendmail b/CONTRIBUTING.d/patches/sen=
dmail
> index f0a91f993..9f2c8f554 100644
> --- a/CONTRIBUTING.d/patches/sendmail
> +++ b/CONTRIBUTING.d/patches/sendmail
> @@ -32,7 +32,7 @@ Description
>  		  =E2=94=9C=E2=94=80> [PATCH v3 02] ...
>  		  =E2=94=94=E2=94=80> [PATCH v3 03] ...
> =20
> -    Sign the email containing patches with PGP
> +    Sign the email containing patches with OpenPGP
>  	See <CONTRIBUTING.d/mail> for more details on signing your mail
>  	to the list.  See also <CONTRIBUTING.d/git> for instructions for
>  	configuring git-send-email(1) to use neomutt(1) as a driver.
> diff --git a/man/man7/suffixes.7 b/man/man7/suffixes.7
> index 3e17afc77..4c8b3f27a 100644
> --- a/man/man7/suffixes.7
> +++ b/man/man7/suffixes.7
> @@ -46,7 +46,7 @@ Suffix	File type
>  \&.am	\f[B]automake\f[](1) input file
>  \&.arc	\f[B]arc\f[](1) archive
>  \&.arj	\f[B]arj\f[](1) archive
> -\&.asc	PGP ASCII-armored data
> +\&.asc	OpenPGP ASCII-armored data
>  \&.asm	(GNU) assembler source file
>  \&.au	Audio sound file
>  \&.aux	LaTeX auxiliary file
> @@ -177,7 +177,7 @@ T}
>  \&.pfa	PostScript font definition files, ASCII format
>  \&.pfb	PostScript font definition files, binary format
>  \&.pgm	portable greymap format
> -\&.pgp	PGP binary data
> +\&.pgp	OpenPGP binary data
>  \&.ph	Perl header file
>  \&.php	PHP program file
>  \&.php3	PHP3 program file
> --=20
> 2.53.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--6qrfx2o2k3773py2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmoBAVsACgkQ64mZXMKQ
wql4ghAAjS1fDidmmZIC7OPsIA1Tgg5uMziqg0HelnYT0VJQpXdEY5I+Gp59MAWT
doh3cmD11fayyJMPtutek91HFwpQAhI7319le8VlmpatkP2kzs+c8tuMaEEClFOn
SJzBnXjB83szGcAsksRtObX4Q5sY9Gz5IZR3NU1ZoFYjppZ4M1pHbBxmA+eXDaLw
S2J/VcJuerBeWtwK7X1gFf090PvKHUtOnP/z5qd3OA2F9dLnIHArCQzzAV/m+hoV
Ib/qpWtjuZuHLZmzd5exqY/t5JHakSvs+BeT3oeLmSJA7d5g2DarYhTcDyY+kqWd
K8SMguH4N3whQSZOUncVsOxIhyxpCIDeb5B40rsNzJvF/BX+/yCAGorYZRLmXAjB
PwydX6i0P/9MbLO1eBzp323GA4epgX8SzYYg6Px/2eOvMroBiJxLFY6x7a/RUOCY
VBGGLripi3tqdB3FhCcCRufxtByvLm57FHhZR+qaVumSXgIE/7vLAHW0b0HZhvpa
qTWwO2jA+8sYKLVW2fg6SEi+CBB+Xn81E7Is/F8nXihH45Hoe0PaXqP9vt6E7cUk
4RmjxN4FzQ31Nf//tSb3pi4uDD8rqe4+9rQ1dJW+gQIDJr6ODsAQ7sAFH9m/ORF/
5xgE07R6wLZgex4LVryx/wYrq/MdP8avh1GBfvD0NAEeOpapIRw=
=CthG
-----END PGP SIGNATURE-----

--6qrfx2o2k3773py2--
