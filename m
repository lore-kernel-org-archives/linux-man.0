Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBC9524F
	for <linux-man@vger.kernel.org>; Sat, 25 Jul 2026 23:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785023408; cv=none; b=qmK7qabOpVtUEdkVcfuSawDx4CoEltcztnsxpzEXKbZFVpnJHIjfyPtL3ic9E3TleIqleM7dKOMZgMbcNP3AbhAwlhJ0m/sQHmNFY28OUZtRIQi04uuVfyUrOalXa7z800AeadlSv3eWIW4qtcr0v3lHhC6led1oFwHr6M0ey/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785023408; c=relaxed/simple;
	bh=PsF7zhZMWvm+lfKc+rf1WjXF2xnprD22qRM6kCMurEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dv30ppZU0I++DYeD/yxgDaFwiAD/4oUNHnSZFZ9v4fakQ+SLI14rwbjMWuZMEKViZRVkQ0HD3wHW1DHBmpbMasJ7Fo2bTiOXKxcVAKs4jRCIvAZzQmNwhUXY9U0tG1LtzFnwLr7fLaeCMFhHTlxCp4GoSPQZaMH+zVZr5a5C+pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXC73pVG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXC73pVG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CEF1F000E9;
	Sat, 25 Jul 2026 23:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785023406;
	bh=X8od88mO5ri+Fzp/7H0EsLv1nn1wXdNBcWW/Lc+l4js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aXC73pVGQQOkFw0Y7ufMSgDXgjXMBgSb8nnUhZNfP1k8EqaYkbb2f11B0z6CHmwyN
	 h3TCyiSuR7+WVgPkJ2gQDa1mxyLzkmO6Vf3R95pv4zM1cmIbCvEYTRQjSVbw6B1BLv
	 lA68i4gC92k6XFwuWh8+/JHmIYrZfCR3UCoPozSYGvEXVc6ot5gBvJFnXpfy9HFe1Y
	 oog8Qt9mmeH2zlvyeGMsyaUkz8HUOblyrzZNW8BrrFAMVLwMxrs1iFEmu8edzf990k
	 9yaORq1brjxSv/Ok8vEuF4p36+c+jiJg0dSpEqCxZZR/7IABfPNHyQln0nXvdVab1O
	 kAKj861ZAqhDw==
Date: Sun, 26 Jul 2026 01:50:03 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	Alejandro Colomar <alx@kernel.org>, Serge Hallyn <sergeh@kernel.org>
Subject: [PATCH v3 3/4] man/man3/mem*.3: NAME: Explain the names
Message-ID: <69f0c458bec5303abae433a0e09b84b6b3612081.1785023118.git.alx@kernel.org>
X-Mailer: git-send-email 2.53.0
References: <cover.1785023118.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lwjyifjgmyjytgqd"
Content-Disposition: inline
In-Reply-To: <cover.1785023118.git.alx@kernel.org>


--lwjyifjgmyjytgqd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	Alejandro Colomar <alx@kernel.org>, Serge Hallyn <sergeh@kernel.org>
Subject: [PATCH v3 3/4] man/man3/mem*.3: NAME: Explain the names
Message-ID: <69f0c458bec5303abae433a0e09b84b6b3612081.1785023118.git.alx@kernel.org>
References: <cover.1785023118.git.alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1785023118.git.alx@kernel.org>

Reported-by: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Mark Harris <mark.hsj@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Acked-by: Serge Hallyn <sergeh@kernel.org>
Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/man3/memalign.3 | 4 +---
 man/man3/memccpy.3  | 2 +-
 man/man3/memchr.3   | 2 +-
 man/man3/memcmp.3   | 2 +-
 man/man3/memcpy.3   | 2 +-
 man/man3/memfrob.3  | 2 +-
 man/man3/memmem.3   | 2 +-
 man/man3/memmove.3  | 2 +-
 man/man3/mempcpy.3  | 2 +-
 man/man3/memset.3   | 2 +-
 10 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/man/man3/memalign.3 b/man/man3/memalign.3
index 12e8a5bb0c33..5954693e3d30 100644
--- a/man/man3/memalign.3
+++ b/man/man3/memalign.3
@@ -5,9 +5,7 @@
 .\"
 .TH memalign 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-memalign
-\-
-allocate aligned memory
+memalign \- memory aligned allocate
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/memccpy.3 b/man/man3/memccpy.3
index d21e7d014af6..706f8152f58c 100644
--- a/man/man3/memccpy.3
+++ b/man/man3/memccpy.3
@@ -6,7 +6,7 @@
 .\"
 .TH memccpy 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-memccpy \- copy memory area
+memccpy \- memory until-and-including-character copy
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/memchr.3 b/man/man3/memchr.3
index 40ea45fdfb83..0a493ff4029d 100644
--- a/man/man3/memchr.3
+++ b/man/man3/memchr.3
@@ -6,7 +6,7 @@
 .\"
 .TH memchr 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-memchr \- scan memory for a character
+memchr \- memory search character
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/memcmp.3 b/man/man3/memcmp.3
index 815bd10252fe..9cecb282ba4f 100644
--- a/man/man3/memcmp.3
+++ b/man/man3/memcmp.3
@@ -6,7 +6,7 @@
 .\"
 .TH memcmp 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-memcmp \- compare memory areas
+memcmp \- memory compare
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/memcpy.3 b/man/man3/memcpy.3
index c94c501b0374..f8f049bf5c4c 100644
--- a/man/man3/memcpy.3
+++ b/man/man3/memcpy.3
@@ -7,7 +7,7 @@
 .\"
 .TH memcpy 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-memcpy \- copy memory area
+memcpy \- memory copy
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/memfrob.3 b/man/man3/memfrob.3
index 90534b749c4c..ee41da0ced7b 100644
--- a/man/man3/memfrob.3
+++ b/man/man3/memfrob.3
@@ -6,7 +6,7 @@
 .\"
 .TH memfrob 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-memfrob \- frobnicate (obfuscate) a memory area
+memfrob \- memory frobnicate (obfuscate)
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/memmem.3 b/man/man3/memmem.3
index 0224a130537e..13fd8b7cea7b 100644
--- a/man/man3/memmem.3
+++ b/man/man3/memmem.3
@@ -6,7 +6,7 @@
 .\"
 .TH memmem 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-memmem \- locate a substring
+memmem \- memory search submemory
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/memmove.3 b/man/man3/memmove.3
index c549c6145176..99f152412142 100644
--- a/man/man3/memmove.3
+++ b/man/man3/memmove.3
@@ -6,7 +6,7 @@
 .\"
 .TH memmove 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-memmove \- copy memory area
+memmove \- memory move
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/mempcpy.3 b/man/man3/mempcpy.3
index d5ae5812758e..012e6326dd00 100644
--- a/man/man3/mempcpy.3
+++ b/man/man3/mempcpy.3
@@ -7,7 +7,7 @@
 .\"
 .TH mempcpy 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-mempcpy, wmempcpy  \- copy memory area
+mempcpy, wmempcpy  \- memory return-offset-pointer copy
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
diff --git a/man/man3/memset.3 b/man/man3/memset.3
index 370ac64fdf25..91b3b476abf9 100644
--- a/man/man3/memset.3
+++ b/man/man3/memset.3
@@ -6,7 +6,7 @@
 .\"
 .TH memset 3 (date) "Linux man-pages (unreleased)"
 .SH NAME
-memset \- fill memory with a constant byte
+memset \- memory set
 .SH LIBRARY
 Standard C library
 .RI ( libc ,\~ \-lc )
--=20
2.53.0


--lwjyifjgmyjytgqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmplS6sACgkQ64mZXMKQ
wqndLg/+PbNXJOPDOl24xkYPinWYRi/vopSXxpPYVRJgBGPPfk0wwlfJw8k23+eT
+uUyd0jLdwjquf1bXr8m7xyrkBATlTV/XVHl3xYS5EUI1Hm4ZzoOG59UXQH6bqN7
Ko9GNdOnJ8somEfDvAywCkYeDu4iACTYgTjyv7N/j4KhOQmwuotjsWVyq9fsSd6K
ocgY1yPefM/knt0Z0O4dhzV1pAJPFHO70he7E2VffjV2xpcpR1DN8Bf8IKxZ8hi/
oN8DliA3QiBEnWOzgt4/LNQiya22rg5BYU/eKEgJs8L6Oj6NxxtW0adxk/EqGN2s
m6F2sarXucqbm2bCQE+4CU9k5goPxys3Y1xlUkY0sT8rh5vkzXHkoDpAjo7KsXNP
xGWQoNqovotUUucg1rB8VfVx39Wlhx1t1TxftBlrTE+vLIBDTV0yAhqimvMEQCmw
AAXj+ZPxpQvWjgkSioIbdI67m+XSQwiLNVgCm1hpOJvOCwLMt4VHEa0XN7kJmaM/
M0NK92+Kgqw+jV84DadNoaLLGM5Mn0PRdCtZX6WKMlxz417fCTBrYq3rS7Jigqs5
uWsbJnFbJ/0zezTc6uGwQSvCVdzOnAZ/ubaQwo+A+G0cXxjg0Q5fOQ4WpXlXgoiw
K3u0qoonsI9HbbZDOqHbE2qQB4W3BkepcyB2L5iWqaZ83P5I1+w=
=wxzd
-----END PGP SIGNATURE-----

--lwjyifjgmyjytgqd--
