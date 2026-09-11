Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B292C2E3FE
	for <linux-man@vger.kernel.org>; Fri, 11 Sep 2026 00:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085640; cv=none; b=L61iKWfcUGye9qXgSyRc15S9MKTMJov/MtIDRsq1eohZ2fXI7pIytQAOL03LyQEqtKEAAbeO79vvKaTv7Ow4oGA9sU3FPkwOEfbJvx0B+1AMZ6qFh5yE4E/nSbBTXjhal1rjljOmRdH9+lxZ5MdnSPdX1BRpDT+vl6HP9KOb/5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085640; c=relaxed/simple;
	bh=qIpZa/zoJR23PbVIgjow4XKMcEPt5NkqfbBQENztzl0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pjhQXyTu0SKQ7IVEgUndSU9BvaAbjZlfdmkiZCbuCFa6bCOZDKTxogbNhK5D3Da4IMmKPyBAcjSl0lzVa2c8NXnKpH8wDOBlrw+f2yBNTEgLrSZkJJNrGpjg4yDzy+K+hF7kSntblx8qh+PjTTw6qL7BA1cMGlzO/FZmU3t1t5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxr+KWYd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxr+KWYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9A01F000FF;
	Fri, 11 Sep 2026 00:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789085639;
	bh=L6r4aUf/cS2c2wcl6y7MTjR0gkq3asuDORP+IhEA5zg=;
	h=Date:From:To:Subject;
	b=mxr+KWYdVx330gyoKEbLOr94D569+onMkZMRpdUha3ZufEREJSH7jKV2j9BRgAB1q
	 BBvxaVEd5p5Rs35YuWQB5b58m4yR21YOFy+3u82Pg2xnu+7jtpX2D24WFwzAZKqy0W
	 CQ1/xSpyQ+v4FXl5DlZs/CFOJoHyc+WkfNRYTaDzk29/DP1PYtimVShW1FdOkkvFhT
	 plMF7Xvhq47yUeSY0fXdF78n1YCJBLmjdSSf6Rvy1xMY5X/XHTwHgGQKpXaZ4GMgZp
	 eJ3Q9aox+JceU4PAGQHyVt0D9DfuzZFplsUmAwClQ7bGEhXmw4ZePjlSVXwjX0devU
	 7L/ShFHZZ9hbQ==
Date: Fri, 11 Sep 2026 02:13:55 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org, man-db-devel@nongnu.org
Subject: Spaces, underscores, and dashes in manual page names when using
 man(1)
Message-ID: <aqNFJA3aXiitHCyz@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ndpsva65xnlx7noe"
Content-Disposition: inline


--ndpsva65xnlx7noe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org, man-db-devel@nongnu.org
Subject: Spaces, underscores, and dashes in manual page names when using
 man(1)
Message-ID: <aqNFJA3aXiitHCyz@devuan>
MIME-Version: 1.0

Hi Colin,

I find this quite intriguing.  Using a space in place of an underscore
in the name of a manual page seems to work, but using two seems to not
work.  This seems inconsistent.  I'd say this should either work for any
and/or all spaces, or for none of them.

	$ man -aw proc_sys_fs_inotify
	/usr/local/man/man5/proc_sys_fs_inotify.5
	$ man -aw proc sys_fs_inotify
	/usr/local/man/man5/proc_sys_fs_inotify.5
	$ man -aw proc_sys fs_inotify
	/usr/local/man/man5/proc_sys_fs_inotify.5
	$ man -aw proc_sys_fs inotify
	/usr/local/man/man5/proc_sys_fs_inotify.5
	$ man -aw proc sys fs_inotify
	/usr/local/man/man5/proc_sys.5
	/usr/share/man/man5/proc_sys.5.gz
	No manual entry for fs_inotify
	$ man -aw proc sys_fs inotify
	/usr/local/man/man5/proc_sys_fs.5
	/usr/share/man/man5/proc_sys_fs.5.gz
	/usr/local/man/man7/inotify.7
	/usr/share/man/man7/inotify.7.gz
	$ man -aw proc_sys fs inotify
	/usr/local/man/man5/proc_sys_fs.5
	/usr/share/man/man5/proc_sys_fs.5.gz
	/usr/local/man/man7/inotify.7
	/usr/share/man/man7/inotify.7.gz
	$ man -aw proc sys fs inotify
	/usr/local/man/man5/proc_sys.5
	/usr/share/man/man5/proc_sys.5.gz
	/usr/local/share/man/man5/filesystems.5
	/usr/share/man/man5/filesystems.5.gz
	/usr/local/man/man7/inotify.7
	/usr/share/man/man7/inotify.7.gz

The same thing happens with dashes:

	$ man -aw user-session-keyring
	/usr/local/man/man7/user-session-keyring.7
	/usr/share/man/man7/user-session-keyring.7.gz
	$ man -aw user session-keyring
	/usr/local/man/man7/user-session-keyring.7
	/usr/share/man/man7/user-session-keyring.7.gz
	$ man -aw user-session keyring
	/usr/local/man/man7/user-session-keyring.7
	/usr/share/man/man7/user-session-keyring.7.gz
	$ man -aw user session keyring
	No manual entry for user
	/usr/local/man/man7/session-keyring.7
	/usr/share/man/man7/session-keyring.7.gz

And also with combinations:

	alx@devuan:~/src/linux/man-pages/man-pages/contrib$ man -aw proc_sysrq-tri=
gger
	/usr/local/man/man5/proc_sysrq-trigger.5
	/usr/share/man/man5/proc_sysrq-trigger.5.gz
	alx@devuan:~/src/linux/man-pages/man-pages/contrib$ man -aw proc sysrq-tri=
gger
	/usr/local/man/man5/proc_sysrq-trigger.5
	/usr/share/man/man5/proc_sysrq-trigger.5.gz
	alx@devuan:~/src/linux/man-pages/man-pages/contrib$ man -aw proc_sysrq tri=
gger
	/usr/local/man/man5/proc_sysrq-trigger.5
	/usr/share/man/man5/proc_sysrq-trigger.5.gz
	alx@devuan:~/src/linux/man-pages/man-pages/contrib$ man -aw proc sysrq tri=
gger
	/usr/local/man/man5/proc.5
	/usr/share/man/man5/proc.5.gz
	No manual entry for sysrq
	No manual entry for trigger

The (one) space is well-known to work, and helps find documentation for
things like 'git diff' as 'man git diff', so that behavior should stay.
I suspect we also want to make it work for more than one space, though.
Or are there any important issues with handling more than one space?

Here's the version of man-db I have installed (Devuan unstable):

	$ dpkg -l man-db | tail -n1
	ii  man-db   2.13.1-1   amd64          tools for reading manual pages


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--ndpsva65xnlx7noe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqjR7sACgkQ64mZXMKQ
wql/vxAArIfmaBbVJmR7OJrgTQfUasoKy7vppjxJS+4VUVDseg2/jCF2IfQelKuN
Ldwb9mYsuzgLP5GQhjyJ2XR+iTrnpKZyG3KeB2dYwf/wyY4piPlJr2E0Ft5RCfwr
XZjLyAQri4grRN1iIRu8ljanTLHU3KkEkPqzwIYWBX9EGiiX1aTZaDZDtN6Dv2Sm
uDsADNYwckZX3zCC9LKjEV/b4H0LNV3c7rs6D72Mb7mt1KWStjGDeG365FuE4IW1
qWYcmyEoZYfhJ0WfNhW8KnxLHW5hWBd5omHVpzFI6tDJKaUb5YnEHc3ObpdqqSbQ
OGCFcfrspaT+aD6h4GJ1kXTBXYnUmntqkBrjRNTnReS/A1RzKCMitP3AO02MBxPN
CO5OLMr0bg+Ad94g9yE7rfutc/u2DDIinZNutoDLU+cHCxVrtiEWzWSGdiESf74F
QG9ZwdazhVAYOuJ/Umdh+EXD8xrrpWlIh9sOcTwe0xsIIF9/jVgos9csImnX9slm
tE3P7obZmDo4IAnN9MtNo4+RS12quqyVkaTqLijibpd/JNgw2c5qrhxUkCUXHlBu
8sb5exEppOSnqIGXxp5v3aXOEYX/O01sDlOzg4ju1nOyQA3/VdrPIeZ4hfGziEh7
JyvmkGTgFoe/+09PqJjJc7GsmVQo7VztZPrH4cCWBeJRxTQmzY0=
=eF4N
-----END PGP SIGNATURE-----

--ndpsva65xnlx7noe--
