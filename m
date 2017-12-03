From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Standarize on "nonzero".
Date: Sun, 3 Dec 2017 15:09:37 -0500
Message-ID: <20171203200934.7rmbcl2bzqf5hb4q@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bnid7yi74mppxiqy"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--bnid7yi74mppxiqy
Content-Type: multipart/mixed; boundary="cy3ietkciwqum2mt"
Content-Disposition: inline


--cy3ietkciwqum2mt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Patch inline and attached.  "Nonzero" is by far the preferred term in
the existing man pages, with roughly 180 occurrences compared to the
handful I have changed below.

Also add this term to the style guide in man-pages(7).

diff --git a/man1/iconv.1 b/man1/iconv.1
index 9e66f988c..f66477d7b 100644
--- a/man1/iconv.1
+++ b/man1/iconv.1
@@ -112,7 +112,7 @@ Print a short usage summary and exit.
 Print the version number, license, and disclaimer of warranty for
 .BR iconv .
 .SH EXIT STATUS
-Zero on success, non-zero on errors.
+Zero on success, nonzero on errors.
 .SH ENVIRONMENT
 Internally, the
 .B iconv
diff --git a/man3/pthread_rwlockattr_setkind_np.3 b/man3/pthread_rwlockattr=
_setkind_np.3
index 227e0af1c..defaf0d0b 100644
--- a/man3/pthread_rwlockattr_setkind_np.3
+++ b/man3/pthread_rwlockattr_setkind_np.3
@@ -100,7 +100,7 @@ Given valid pointer arguments,
 always succeeds.
 On error,
 .BR pthread_rwlockattr_setkind_np ()
-returns a non-zero error number.
+returns a nonzero error number.
 .SH ERRORS
 .TP
 .BR EINVAL
diff --git a/man7/man-pages.7 b/man7/man-pages.7
index cf6727af9..1e2ee61e5 100644
--- a/man7/man-pages.7
+++ b/man7/man-pages.7
@@ -682,6 +682,7 @@ filesystem	file system
 hostname	host name
 inode	i-node
 lowercase	lower case, lower-case
+nonzero	non-zero
 pathname	path name
 pseudoterminal	pseudo-terminal
 privileged port	T{
diff --git a/man7/socket.7 b/man7/socket.7
index 1a2cfe9cc..64696d3b1 100644
--- a/man7/socket.7
+++ b/man7/socket.7
@@ -319,7 +319,7 @@ or an extended BPF
 program to the socket for use as a filter of incoming packets.
 A packet will be dropped if the filter program returns zero.
 If the filter program returns a
-non-zero value which is less than the packet's data length,
+nonzero value which is less than the packet's data length,
 the packet will be truncated to the length returned.
 If the value returned by the filter is greater than or equal to the
 packet's data length, the packet is allowed to proceed unmodified.
diff --git a/man8/iconvconfig.8 b/man8/iconvconfig.8
index c5fdf3cfd..e94ad1e5a 100644
--- a/man8/iconvconfig.8
+++ b/man8/iconvconfig.8
@@ -87,7 +87,7 @@ Print a short usage summary and exit.
 Print the version number, license, and disclaimer of warranty for
 .BR iconv .
 .SH EXIT STATUS
-Zero on success, non-zero on errors.
+Zero on success, nonzero on errors.
 .SH FILES
 .TP
 .I /usr/lib/gconv

--=20
Regards,
Branden

--cy3ietkciwqum2mt
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="man-pages_nonzero.diff"

diff --git a/man1/iconv.1 b/man1/iconv.1
index 9e66f988c..f66477d7b 100644
--- a/man1/iconv.1
+++ b/man1/iconv.1
@@ -112,7 +112,7 @@ Print a short usage summary and exit.
 Print the version number, license, and disclaimer of warranty for
 .BR iconv .
 .SH EXIT STATUS
-Zero on success, non-zero on errors.
+Zero on success, nonzero on errors.
 .SH ENVIRONMENT
 Internally, the
 .B iconv
diff --git a/man3/pthread_rwlockattr_setkind_np.3 b/man3/pthread_rwlockattr_setkind_np.3
index 227e0af1c..defaf0d0b 100644
--- a/man3/pthread_rwlockattr_setkind_np.3
+++ b/man3/pthread_rwlockattr_setkind_np.3
@@ -100,7 +100,7 @@ Given valid pointer arguments,
 always succeeds.
 On error,
 .BR pthread_rwlockattr_setkind_np ()
-returns a non-zero error number.
+returns a nonzero error number.
 .SH ERRORS
 .TP
 .BR EINVAL
diff --git a/man7/man-pages.7 b/man7/man-pages.7
index cf6727af9..1e2ee61e5 100644
--- a/man7/man-pages.7
+++ b/man7/man-pages.7
@@ -682,6 +682,7 @@ filesystem	file system
 hostname	host name
 inode	i-node
 lowercase	lower case, lower-case
+nonzero	non-zero
 pathname	path name
 pseudoterminal	pseudo-terminal
 privileged port	T{
diff --git a/man7/socket.7 b/man7/socket.7
index 1a2cfe9cc..64696d3b1 100644
--- a/man7/socket.7
+++ b/man7/socket.7
@@ -319,7 +319,7 @@ or an extended BPF
 program to the socket for use as a filter of incoming packets.
 A packet will be dropped if the filter program returns zero.
 If the filter program returns a
-non-zero value which is less than the packet's data length,
+nonzero value which is less than the packet's data length,
 the packet will be truncated to the length returned.
 If the value returned by the filter is greater than or equal to the
 packet's data length, the packet is allowed to proceed unmodified.
diff --git a/man8/iconvconfig.8 b/man8/iconvconfig.8
index c5fdf3cfd..e94ad1e5a 100644
--- a/man8/iconvconfig.8
+++ b/man8/iconvconfig.8
@@ -87,7 +87,7 @@ Print a short usage summary and exit.
 Print the version number, license, and disclaimer of warranty for
 .BR iconv .
 .SH EXIT STATUS
-Zero on success, non-zero on errors.
+Zero on success, nonzero on errors.
 .SH FILES
 .TP
 .I /usr/lib/gconv

--cy3ietkciwqum2mt--

--bnid7yi74mppxiqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlokWewACgkQ0Z6cfXEm
bc7XWw/8CqzxpL4VuAD97qA1D8JHtJ0+wv9lWWGeuBKDZnWP8nLA63714Cjdl8TX
v13yVnsMixMnT2O8oI8O9h8C4u3au3uMCqmimk63e06vmpBehMNfcb0tQz5aX1hK
4rklQmQJ2ij0ut7gEACPZZNQSg1jlxERBDV+7199k2hKDIHlBm66uuOaZMRYkh9N
GSMTrQ+a6oQ11AiSqDIh3G2YqVGqbgF/MkTFfQaK7rsf/kXg3MZi/v5PcnSpKuSA
3iaUZOP5u/Hb+LetBvvMND+NwzjfftLHQucAzCUhiwauTsu5fwHMSt+IarV8qG9r
6Qtz2mBcf8b7mEeE6fQxOXAPJJFpsdp5U4UFiK07vlhlDDUTYEGTvwzJo1Q6PPbc
D6/7U84dpF5i8FrOp53TomjxYp9w3hHrNJt/Au3uEPD4oPRSOEhj1ZqxO5y+gVy+
fjBu4Q+REx8fZp2I9pfD0NQLK9ETosyMvoV7BhpPvR8Jk11n/w5cBR/z0/8euxJr
AgjiWpx6by93UhImD3LNn1EobP7dPrPV0oTmpl0yAnK46kcM+ivcf5sDFfLMCocL
FBHRr6oWNNpTrojDCy2X0El+71dT/w/O7R4qZ8bPpHwTMmN3tMSMtjpUU5a0b/li
Z+HMmpy5JiAyKlJieCXgiGR0CUr9KykuxlCLDm/tzZLARdZNGvo=
=DBBA
-----END PGP SIGNATURE-----

--bnid7yi74mppxiqy--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
