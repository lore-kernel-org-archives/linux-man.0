Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D1E23EAA6
	for <linux-man@vger.kernel.org>; Sat, 22 Aug 2026 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787438311; cv=none; b=Q5q0yhKj+GapWmGANAgF6xUf+oNA8d0Xa+Z9A6iU8KRrNW3b6rCFfIIlxQQCXXtbX0O8/X3YGrkl6OV4xY79oEbzwaQ2ZMnCLNZMJZvG9cyyOpdsnvHGpZjTqToTr6W12xBrbcd/xaawLGfuk+Pe64zP7oNS/CotDMWfMsF4Ql4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787438311; c=relaxed/simple;
	bh=SUUrhBpSkxBHXCmE4b65ViFTSzkKbs11xriS1ABdavM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kimzbUdmJGC3t49+Umou3WXPIR5nQojtJerCVt/JLJYseB+R9kAZJFw3hED7vhsB1B6F3hzXTrR31Bz6+guM7SzL1pJvH6NZ/f2G2RKVG1jRPoA5DjsRDBLgeUpRBMakC4pvyyz1+RilPbH9ulzm/9qLuW0NHuerqO8VC2OBDO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djlq46ii; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djlq46ii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724BB1F000E9;
	Sat, 22 Aug 2026 22:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787438310;
	bh=m1H4vCz7CF/gDZ9U3YkJyA1h/o9rLptHQlRVbn9UdmY=;
	h=Date:From:To:Cc:Subject;
	b=djlq46iixemp8lsX7BRGL1I/nRiHSTmKhu2cTdjnkhvaJArZcw/HMLy/zbJO+Rlp3
	 YtIOsrS9JhD1p0spnzmU3ctaO6rFwlJk5xtwh6tp7DiAZCEKcVs8PC/+XhOSEPgW9W
	 zuNHHc+su0CZTrIF2xozg6Swg46aHUhxw75KuF491xelarH6yEqklaDwSScrPWTxVU
	 YJJcLWh25JiJuNCi+BMlKwHemxRcWoDL6ufwCGubwuGfheZ/UUTR8yZmtMWdVKlvGA
	 psUvVWUxSIgn0DNQLcr1YXpGceuuXTHdOJRfOsO0OS7UpPiuaHC9XFc1YRy2O3ThmL
	 xypGpjTpXbtuw==
Date: Sun, 23 Aug 2026 00:38:27 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org, DJ Delorie <dj@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1] man/man5/{ld.so,tunables}.conf.5: Add subsections
Message-ID: <34bd47e97f05419ce3171a2464ec2bd22901232f.1787438190.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tuwf6o7yl2xdon4h"
Content-Disposition: inline


--tuwf6o7yl2xdon4h
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org, DJ Delorie <dj@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1] man/man5/{ld.so,tunables}.conf.5: Add subsections
Message-ID: <34bd47e97f05419ce3171a2464ec2bd22901232f.1787438190.git.alx@kernel.org>
MIME-Version: 1.0

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---

Hi DJ,

This is a patch for improving a little bit the organization of the two
files.  Here's how it looks after formatting:

	$ MANWIDTH=3D64 diffman-git HEAD--- HEAD^:man/man5/ld.so.conf.5
	+++ HEAD:man/man5/ld.so.conf.5
	@@ -13,6 +13,7 @@ DESCRIPTION
	      The file is parsed by ldconfig(8) and the results stored
	      in /etc/ld.so.cache.
	=20
	+   Directives
	      The syntax allows lines to start with the keyword include
	      followed by a glob(7) pattern.  Files matching that pat=E2=80=90
	      tern will be processed as if their contents were included
	--- HEAD^:man/man5/tunables.conf.5
	+++ HEAD:man/man5/tunables.conf.5
	@@ -21,14 +21,19 @@ DESCRIPTION
	      program starts execution.
	=20
	      Each line in the file /etc/tunables.conf specifies a tun=E2=80=90
	-     able, which is specified with a string of the form
	+     able, a directive, or a filter.
	+
	+   Tunables
	+     A tunable is specified with a string of the form
	      name=3Dvalue.
	=20
	+   Directives
	      The syntax allows lines to start with the keyword include
	      followed by a glob(7) pattern.  Files matching that pat=E2=80=90
	      tern will be processed as if their contents were included
	      at that point.
	=20
	+   Modifiers
	      Each line may include zero or more keywords or symbols at
	      the beginning, which affect how each tunable affects each
	      processes.  The keywords must be separated by whitespace,
	@@ -56,9 +61,9 @@ DESCRIPTION
	      *      The tunable applies to both AT_SECURE and non=E2=80=90
		     AT_SECURE processes.
	=20
	-     The file may also contain filters, which limit the tun=E2=80=90
	-     ables following it.  The effects of a filter are termi=E2=80=90
	-     nated by any of the following:
	+   Filters
	+     Filters limit the tunables following it.  The effects of a
	+     filter are terminated by any of the following:
	=20
	      =E2=80=A2  The end of the file.
	      =E2=80=A2  The end of an included file.


Let me know what you think.


Have a lovely night!
Alex

 man/man5/ld.so.conf.5    |  2 +-
 man/man5/tunables.conf.5 | 18 ++++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/man/man5/ld.so.conf.5 b/man/man5/ld.so.conf.5
index d9fae3c1f377..a94e82747f9d 100644
--- a/man/man5/ld.so.conf.5
+++ b/man/man5/ld.so.conf.5
@@ -14,7 +14,7 @@ .SH DESCRIPTION
 .BR \%ldconfig (8)
 and the results stored in
 .IR /etc/ld.so.cache .
-.P
+.SS Directives
 The syntax allows lines to start with the keyword
 .B include
 followed by a
diff --git a/man/man5/tunables.conf.5 b/man/man5/tunables.conf.5
index a27f78cde6f7..91bb6b81cb85 100644
--- a/man/man5/tunables.conf.5
+++ b/man/man5/tunables.conf.5
@@ -27,10 +27,14 @@ .SH DESCRIPTION
 .P
 Each line in the file
 .I /etc/tunables.conf
-specifies a tunable,
-which is specified with a string of the form
+specifies
+a tunable,
+a directive,
+or a filter.
+.SS Tunables
+A tunable is specified with a string of the form
 .IB name =3D value \f[R].\f[]
-.P
+.SS Directives
 The syntax allows lines to start with the keyword
 .B include
 followed by a
@@ -38,7 +42,7 @@ .SH DESCRIPTION
 pattern.
 Files matching that pattern will be processed
 as if their contents were included at that point.
-.P
+.SS Modifiers
 Each line may include zero or more keywords or symbols at the beginning,
 which affect how each tunable affects each processes.
 The keywords must be separated by whitespace,
@@ -81,10 +85,8 @@ .SH DESCRIPTION
 and
 .RB non- AT_SECURE
 processes.
-.P
-The file may also contain
-.IR filters ,
-which limit the tunables following it.
+.SS Filters
+Filters limit the tunables following it.
 The effects of a filter are terminated by
 any of the following:
 .IP \[bu] 3

base-commit: 6bb006086657277c670f120981aeb41d6a4ea14c
--=20
2.53.0


--tuwf6o7yl2xdon4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqKJOMACgkQ64mZXMKQ
wqlAWQ//UaZz7WAsVrpszUHPI3tguTYWu6CAfCO0tGXawL9mjSXW4bIvhERDzvla
P6SCQDtIUf0MuSXU8tATG9cy+mPmST5oVhGbFnALQEwDEb6O2s/KmKJN/VrAEBYy
EPtnbmbjR8H1ZPsvoVKqn+Rc0h5r247xk1Or8dJU8OcRWQ2pzoe1l4qktKXoFlEr
EmgKp3lhye+AhCX9i6nNWZ82JSqCIlOrWW15UInnhFSCfrh5Tuy4sazWG49cehzh
Hz8tAlCJE1eZcHfhcS+wUtVjRqiBw8YbsgKzDxc82BqNELfYuzec95Ed9pyKOnXh
y1mhOxeiUvnb1mvvNVKK718VIDmiwaJY/MvEMbKr22T/x/OCeIVhAn1BkTQL7FjM
8p4IIMMxYIiNNM48oLjqNLFQs1pJOK+bPNKTkCxs9mD33TkNVSd5MUQvMrXG/5gf
u9oKHapDngM8dSV8G0ex/WPEc0l1OhnIz+wkta8T4crCaDXrVMaxX/68IJ9xmwC8
io5F/z9u2MBXZgPUJ6JZoHtIR2HjXL+gHiTPRNpqtj3UIUTqB1/ulQ7otvNXTw0u
xPW0/G0slinLI0d65RZSU19JRk1YChlHcSRZqKgC+VR5A5GwwarE7B8POjBBAwSn
nJcoH8fsYxATZetSsUxnR//3Cie8kJoQ/ZMrRc4shtqwEQPT5Jc=
=Ry1q
-----END PGP SIGNATURE-----

--tuwf6o7yl2xdon4h--
