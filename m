From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ld.so.8: update and expand
Date: Wed, 10 May 2017 00:47:45 -0400
Message-ID: <20170510044742.ntq2g5vdnb7q3lf7@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7phvn5wmeqgfpwjj"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--7phvn5wmeqgfpwjj
Content-Type: multipart/mixed; boundary="nrk3sb7fh32spzqw"
Content-Disposition: inline


--nrk3sb7fh32spzqw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

    ld.so.8: update and expand

    * Discuss possible observable effects of running on a multiarch-capable
      system (the linker may be in a different directory under a different
      name, for instance).

    * Add some basic background material for the novice reader.

    * Call out use of shell glob in filenames, particularly in the topic of
      the man page itself since this is a little unusual.

    * Connect discussion of --audit option and LD_AUDIT environment
      variable.

    * Explain where shared object dependencies are declared and connec to
      elf(5) (already mentioned in See Also section).

--=20
Regards,
Branden

--nrk3sb7fh32spzqw
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="ld.so.8-expansion.diff"

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index a4b405bb7..eb261a008 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -23,8 +23,22 @@ The programs
 .B ld.so
 and
 .BR ld-linux * .so *
+(where * indicates a shell wild card)
 find and load the shared objects (shared libraries) needed by a program,
 prepare the program to run, and then run it.
+The tool is called a loader because it loads object files into memory, and a
+linker because it resolves symbolic references like
+.I printf
+into machine addresses in the memory map of a running program.
+In this discussion, we refer to these programs simply as the \(lqdynamic
+linker\(rq even though both functions are essential.
+.PP
+The dynamic linker's name and location may vary to indicate the machine
+architecture and operating system it supports, and to permit linkers for
+different configurations to exist on the same system.
+For example, the dynamic linker for an x86-64-based GNU/Linux host with support
+for multiple architectures might be located at
+.IR /lib/x86_64\-linux\-gnu/ld\-linux\-x86\-64.so.2 .
 .PP
 Linux binaries require dynamic linking (linking at run time)
 unless the
@@ -52,6 +66,11 @@ support files and programs
 and
 .IR /etc/ld.so.conf .
 .PP
+Each dynamically-linked object lists its shared object dependencies in an
+ELF section called
+.IR .dynamic ;
+see
+.BR elf (5).
 When resolving shared object dependencies,
 the dynamic linker first inspects each dependency
 string to see if it contains a slash (this can occur if
@@ -193,6 +212,9 @@ This option is ignored when running in secure-execution mode (see below).
 Use objects named in
 .I list
 as auditors.
+See the discussion of the
+.BR LD_AUDIT
+environment variable, below.
 .SH ENVIRONMENT
 Various environment variables influence the operation of the dynamic linker.
 .\"
@@ -636,7 +658,14 @@ is always disabled in secure-execution mode.
 a.out dynamic linker/loader
 .TP
 .IR /lib/ld\-linux.so. { 1 , 2 }
-ELF dynamic linker/loader
+ELF dynamic linker/loader (traditional location)
+.TP
+.IR /lib/ gnu-target-triplet /ld\-linux\- machine .so.2
+ELF dynamic linker/loader (multi-architecture location), where
+.I gnu-target-triplet
+is a string like \(lqx86_64\-linux\-gnu\(rq and
+.I machine
+is \(lqx86\-64\(rq, for example.
 .TP
 .I /etc/ld.so.cache
 File containing a compiled list of directories in which to search for

--nrk3sb7fh32spzqw--

--7phvn5wmeqgfpwjj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlkSm14ACgkQ0Z6cfXEm
bc5ZeRAAl3XxdpXf4gzlRNuGnOpVwmWOEGRQu/zo+rlXRb8MQ/zygGHKIO42UEto
yeDTBJn6+Ny8S9g4mRKpT6g7BJoczZr/xyC+ukrtvCjeodPQxbT3EUCITWpsmCmy
UDTU/d6EXIPiphNqsvgNYzEU2jfnwtV4YjJz2H+m3RRLrP+DzyTRFwmKo9RYEU4H
wj+scf+jfEO9xesfE6VzW0FuxR1no0CtzHcODx6GCn3wV5ipyWhJYiKdPSx5yg89
edxPEX6vOAa6sfS8sAtUXW1K7ZlBIr713URX4ZVx/gxX7XjeEt8T1oM6dSz4Fa26
nFHmlGOXSgNXMaH4Krm+cYHlicqUyB7tirFhpEkDQ1odlIXlR86hqAK1Af8dwek1
q75jzEud2lnuFza2xBEyFsYlmpflF0GTG6vRBUB1weJMSIoJHmCMkqJRKNrN3xza
VAdMWRsG8etDWznropnhnTkdlqOcM/8BhgCTZqm2w8OKGRhIfbVEzkBp6VAyC6qd
V72vmFWqM8aYdr/aZI8K7fidrrAiz2bIOWbJcIybRM8QkhsFN3xnwiE3dEvR+hdJ
Sip/gX0GZ6XGjJGMMOJqx678Dn3hp+klw4gLSEbQcwG4eFe623PL0rr6Lqu9/EEC
EF7W9D3aJazTfOHAWkfEGj6hZ8PrT0u4D8PwEwQUH2Reya3VKlU=
=Hmgc
-----END PGP SIGNATURE-----

--7phvn5wmeqgfpwjj--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
