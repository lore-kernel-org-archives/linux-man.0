Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762B66BB5B
	for <linux-man@vger.kernel.org>; Sat, 25 Jul 2026 23:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785023404; cv=none; b=T+T6VQggR/JDRSh9W8qCxueKesly82cmVoU7X7P5/TsF5Y0ovzLCN5OZO9ksBcQADXWrIIOW2edo/KCYc0nHasfu9OchkQ7aPDLxJDDUu1KhCzagWnn0FooxJGbg/QOH3Kt2QODa3YtgxTreEQDzTwNwmmKYUVVbb0zAb7YJw6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785023404; c=relaxed/simple;
	bh=sewFqSX7GUGeoKjq4VGNiu4KfVdITrg5SavjYdtbsns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7yhM93ivWWF5A0AvN6efBsgafFusTlRfkeg0yr/S9wEifc/VQ72ENUpSyH+dt5bI7n85n0vvjTiQlF7A3JfhrBuyKIfm9mKOYL89IgcgNfBCQ2XOscS1bLI9RLgoDmPqgau+NAS7et/1aEXummdHobjEYjBc7cGXFdw0PnF6ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddtBcFlJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddtBcFlJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905FF1F00A3A;
	Sat, 25 Jul 2026 23:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785023403;
	bh=cpwyxdu0IwaCl7OzT7Y0NuOhcnsbRS8CdT/6QG7CEHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ddtBcFlJs6Crr+h6lkhyixjpxLsmweBvajgQKp+acFD50nwrcjz400OyuGLfxZkz1
	 0LGBn6hcMFcMCyzwsrpYHYPeBaBLt+YQCJsOc1aTGtVAis0NZSGOvh5HzNarBPUtG/
	 8m9O7ivkKOQWHtNMN38tWLFtT7VgzypJHc8FIJEsa/Ic26PJ0JwnnvkAf0+04Vfcln
	 0RAsrvUA1jrGlnS1M1gQgM7QELCMlIXGQaXwFQ87XeS27uTM/F8pxMtzAtToum8b1p
	 jw23tmQDwFtRFLqUsXWPpVU6nvQ8EANUwxE9oRB1T+DAcKPKQ46ytjCkhX3IWCoroU
	 FzzV18R6L8z1g==
Date: Sun, 26 Jul 2026 01:50:00 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	Alejandro Colomar <alx@kernel.org>, Serge Hallyn <sergeh@kernel.org>
Subject: [PATCH v3 2/4] man/man3/strpbrk.3: BUGS: Clarify the NAME
Message-ID: <7a06ee7f7e761e8655d241fae864f56476624fc0.1785023118.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
References: <cover.1785023118.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sgpzzpsvmwea2spr"
Content-Disposition: inline
In-Reply-To: <cover.1785023118.git.alx@kernel.org>


--sgpzzpsvmwea2spr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	Alejandro Colomar <alx@kernel.org>, Serge Hallyn <sergeh@kernel.org>
Subject: [PATCH v3 2/4] man/man3/strpbrk.3: BUGS: Clarify the NAME
Message-ID: <7a06ee7f7e761e8655d241fae864f56476624fc0.1785023118.git.alx@kernel.org>
References: <cover.1785023118.git.alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1785023118.git.alx@kernel.org>

Cc: Mark Harris <mark.hsj@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Acked-by: Serge Hallyn <sergeh@kernel.org>
Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/man3/strpbrk.3 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/man/man3/strpbrk.3 b/man/man3/strpbrk.3
index 6e5b79a48bbe..ee7a84f1a944 100644
--- a/man/man3/strpbrk.3
+++ b/man/man3/strpbrk.3
@@ -51,6 +51,10 @@ .SH STANDARDS
 C11, POSIX.1-2008.
 .SH HISTORY
 POSIX.1-2001, C89, SVr4, 4.3BSD.
+.SH BUGS
+The name of this function is bad.
+It should have been named strchrs().
+The NAME section above reflects this.
 .SH SEE ALSO
 .BR memchr (3),
 .BR strchr (3),
--=20
2.53.0


--sgpzzpsvmwea2spr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmplS6cACgkQ64mZXMKQ
wqkwjw/8DiDSBTRd5PNCfKWFfXa+3Nv3QWEueUS7xHGxyqfUmoXiat/TQNAFryn3
4iuyAiO5+8s9KAvni30XeFmwpmB/3x1Wnz3CmYSmxgTFNGxiDAA9213ucrV6wsPg
/rdaKrIeQWRezmsIvvU9cJ8kHqtfG6h3gzv/9cZm7fqjgRolQy+mj+3LNuLvhExr
518TNv5k4uTMltsn5WHlQfTLg6Gxrq6hno9UG4+b+4b4Bd+9kSHrGsNcu0Qdeem9
MBVC+tkp0AeGx357A3TyP3ZUB1S44i+znwbGk6aSnsMEmoM8HI+WobiCKzEoZ63L
XxFgmvieTg+MqDFdPD8lj7ARR+SlTOhfOTzO8cIkV2bPb2d69qMRHZKEH07Gh6nK
skH6tlOIjGUt3XjJhYWL3KYlZBpewU/7He95ANpTTOqDYAX71hGG02pw20YE58Td
a/Cejn1XxDTchH6Uk0+FCFosH3NUG9d2sFJf9ay7gicWxFRl7uqmfBNB0FAmEBFs
rEhAGoMM7zopKiKv9z75ZeZVl+gcYVX14tcAlPqLAqKDEXoOxJVJ1bd8raGLVbP+
B+aHyodopX1TR1EpqBNWR7sijNHq40Fr8V8HxCAX30EJpGyEqoNY0bw9OvUyzXHE
+AgWQltHe0QS3Z4dCJ8D/yij3uom5yUl/+Z409UwiT9VPR6G74k=
=+7NV
-----END PGP SIGNATURE-----

--sgpzzpsvmwea2spr--
