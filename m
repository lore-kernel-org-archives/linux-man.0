From: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Subject: [patch] nsswitch.conf.5: update for readability and latest glibc
Date: Thu, 13 Oct 2011 21:26:00 +0100
Message-ID: <51634.1318537560@proseconsulting.co.uk>
Reply-To: mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=_360133be3063b9edf3d76eb28315455a"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--=_360133be3063b9edf3d76eb28315455a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

This patch applies to nsswitch.conf.5 in man-pages-3.36.

My changes almost completely rewrite large sections of the man page.  They =
are needed to add clarity, correct grammar, reduce confusion, and bring up-=
to-date with the latest glibc.  I have checked the man page against the nss=
 source code in glibc 2.14.90.

Historical notes are demoted to the footer.

I believe the rewrite makes the man page much clearer to understand, more a=
uthoratitive and easier to read.

A web version of the man page is available here for proof reading: http://p=
rose.sourceforge.net/man/linux/nsswitch.conf.5.html

A patch is copied below, and also attached to this message.

I am happy for my work to be released under the terms of the GNU General Pu=
blic License.

Best regards,
Mark Bannister.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--- nsswitch.conf.5.old	2011-10-11 19:17:51.000000000 +0100
+++ nsswitch.conf.5	2011-10-13 21:09:07.000000000 +0100
@@ -1,4 +1,5 @@
 .\" Copyright (c) 1998, 1999 Thorsten Kukuk (kukuk-aKQS4ZrM5Ncxnse412ns4hvVK+yQ3ZXh@public.gmane.org)
+.\" Copyright (c) 2011, Mark R. Bannister <cambridge-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org=
>
 .\"
 .\" This is free documentation; you can redistribute it and/or
 .\" modify it under the terms of the GNU General Public License as
@@ -20,39 +21,32 @@
 .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 0211=
1,
 .\" USA.
 .\"
-.\" This manual page based on the GNU C Library info pages.
-.\" FIXME ? The use of quotes on this page is inconsistent with the
-.\" rest of man-pages.
-.\"
-.TH NSSWITCH.CONF 5 1999-01-17 "Linux" "Linux Programmer's Manual"
+.TH NSSWITCH.CONF 5 2011-10-13 "Linux" "Linux Programmer's Manual"
 .SH NAME
-nsswitch.conf \- System Databases and Name Service Switch configuration fi=
le
+nsswitch.conf \- Name Service Switch configuration file
 .SH DESCRIPTION
-Various functions in the C Library need to be configured to work
-correctly in the local environment.
-Traditionally, this was done by
-using files (e.g., \fI/etc/passwd\fP), but other nameservices (like the
-Network Information Service (NIS) and the Domain Name Service (DNS))
-became popular, and were hacked into the C library, usually with a fixed
-search order.
-.LP
-The Linux libc5 with NYS support and the GNU C Library 2.x (libc.so.6)
-contain a cleaner solution of this problem.
-It is designed after a method
-used by Sun Microsystems in the C library of Solaris 2.
-We follow their
-name and call this scheme "Name Service Switch" (NSS).
-The sources for
-the "databases" and their lookup order are specified in the
+The
 .I /etc/nsswitch.conf
-file.
-.LP
-The following databases are available in the NSS:
-.TP
+file is a configuration file used by the GNU C Library to determine from
+what sources to obtain name service information in a range of categories,
+and in what order.
+Each category of information is identified by a database name.
+.LP
+The file is plain ASCII text, with columns separated by spaces or tab
+characters.
+The first column defines the database name.
+The remaining columns describe the order of sources to query and a
+limited
+set of actions that can be performed by lookup result.
+.LP
+The following databases are made available by the standard
+GNU C Library:
+.RS 3
+.TP 10
 .B aliases
 Mail aliases, used by
-.BR sendmail (8).
-Presently ignored.
+.BR getaliasent (3)
+and related functions.
 .TP
 .B ethers
 Ethernet numbers.
@@ -60,31 +54,31 @@
 .B group
 Groups of users, used by
 .BR getgrent (3)
-functions.
+and related functions.
 .TP
 .B hosts
 Host names and numbers, used by
 .BR gethostbyname (3)
-and similar functions.
+and related functions.
 .TP
 .B netgroup
 Network wide list of hosts and users, used for access rules.
-C libraries before glibc 2.1 only support netgroups over NIS.
+C libraries before glibc 2.1 only supported netgroups over NIS.
 .TP
 .B networks
 Network names and numbers, used by
 .BR getnetent (3)
-functions.
+and related functions.
 .TP
 .B passwd
 User passwords, used by
 .BR getpwent (3)
-functions.
+and related functions.
 .TP
 .B protocols
 Network protocols, used by
 .BR getprotoent (3)
-functions.
+and related functions.
 .TP
 .B publickey
 Public and secret keys for Secure_RPC used by NFS and NIS+.
@@ -92,23 +86,24 @@
 .B rpc
 Remote procedure call names and numbers, used by
 .BR getrpcbyname (3)
-and similar functions.
+and related functions.
 .TP
 .B services
 Network services, used by
 .BR getservent (3)
-functions.
+and related functions.
 .TP
 .B shadow
 Shadow user passwords, used by
-.BR getspnam (3).
+.BR getspnam (3)
+and related functions.
+.RE
 .LP
-An example
+Here is an example
 .I /etc/nsswitch.conf
-(namely, the default used when
-.I /etc/nsswitch.conf
-is missing):
-.sp 1n
+file:
+.LP
+.RS 3
 .PD 0
 .TP 16
 passwd:
@@ -139,147 +134,216 @@
 services:
 nis [NOTFOUND=3Dreturn] files
 .PD
+.RE
 .LP
-The first column is the database.
-The rest of the line specifies how the lookup process works.
-You can specify the way it works for each database individually.
-.LP
-The configuration specification for each database can contain two
-different items:
-.PD 0
-.TP
-* The service specification like `files', `db', or `nis'.
-.TP
-* The reaction on lookup result like `[NOTFOUND=3Dreturn]'.
-.PD
-.LP
-For libc5 with NYS, the allowed service specifications are `files', `nis',
-and `nisplus'.
-For hosts, you could specify `dns' as extra service, for
-passwd and group `compat', but not for shadow.
-.LP
-For glibc, you must have a file called
-.BI /lib/libnss_SERVICE.so. X
-for every SERVICE you are using.
-On a standard installation, you could use
-`files', `db', `nis', and `nisplus'.
-For hosts, you could specify `dns' as
-extra service, for passwd, group, and shadow `compat'.
-These services will not
-be used by libc5 with NYS.
+The first column is the database name.
+The remaining columns specify:
+.RS 3
+.TP 3
+o
+One or more service specifications e.g. "files", "db", or "nis".
+The order the services appear on the line determine the order in which
+those services will be queried, in turn, until a result is found.
+.TP
+o
+Optional actions to perform if a particular result is obtained
+from the preceding service, e.g. "[NOTFOUND=3Dreturn]".
+.RE
+.LP
+The service specifications supported on your system depend on the
+presence of shared libraries, and are therefore extensible.
+Libraries called
+.IB /lib/libnss_SERVICE.so. X
+will provide the named
+.IR SERVICE .
+On a standard installation, you can use
+"files", "db", "nis", and "nisplus".
+For the hosts database, you can additionally specify "dns".
+For the passwd, group, and shadow databases, you can additionally specify
+"compat" (see
+.B "Compatibility mode"
+below).
 The version number
-.I X
-is 1 for glibc 2.0 and 2 for glibc 2.1.
-.LP
-The second item in the specification gives the user much finer
-control on the lookup process.
-Action items are placed between two
-service names and are written within brackets.
-The general form is
-.LP
-`[' ( `!'? STATUS `=3D' ACTION )+ `]'
+.B X
+may be 1 for glibc 2.0, or 2 for glibc 2.1 and later.
+On systems with additional libraries installed, you may have access to
+further services such as "hesiod", "ldap", "winbind" and "wins".
+.LP
+An action may also be specified following a service specification, that
+modifies behaviour following a result obtained from the preceding data
+source.
+Action items take the general form:
+.LP
+.RS 3
+[
+.I STATUS
+=3D
+.I ACTION
+]
+.br
+[ !
+.I STATUS
+=3D
+.I ACTION
+]
+.RE
 .LP
 where
-.sp 1n
-.PD 0
-.TP
-STATUS =3D> success | notfound | unavail | tryagain
-.TP
-ACTION =3D> return | continue
-.PD
 .LP
+.RS 3
+.I STATUS
+=3D>
+.B success
+|
+.B notfound
+|
+.B unavail
+|
+.B tryagain
+.br
+.I ACTION
+=3D>
+.B return
+|
+.B continue
+.RE
+.LP
+The ! negates the test, matching all possible results except the
+one specified.
 The case of the keywords is insignificant.
-The STATUS values are
-the results of a call to a lookup function of a specific service.
-They mean:
-.TP
+.LP
+The
+.I STATUS
+value is matched against the result of the lookup function called by
+the preceding service specification, and can be one of:
+.RS 3
+.TP 10
 .B success
-No error occurred and the wanted entry is returned.
-The default
-action for this is `return'.
+No error occurred and the requested entry is returned.
+The default action for this condition is "return".
 .TP
 .B notfound
-The lookup process succeeded, but the needed value was not found.
-The default action is `continue'.
+The lookup succeeded, but the requested entry was not found.
+The default action for this condition is "continue".
 .TP
 .B unavail
 The service is permanently unavailable.
 This can either mean the
-needed file is not available, or, for DNS, the server is not
-available or does not allow queries.
-The default action is
-`continue'.
+required file cannot be read, or, for network services, the server
+is not available or does not allow queries.
+The default action for this condition is "continue".
 .TP
 .B tryagain
 The service is temporarily unavailable.
 This could mean a file is
 locked or a server currently cannot accept more connections.
-The default action is `continue'.
-.SS Interaction with +/\- syntax (compat mode)
-Linux libc5 without NYS does not have the name service switch but does
-allow the user some policy control.
-In
-.I /etc/passwd
-you could have entries of the form +user or +@netgroup
-(include the specified user from the NIS passwd map),
-\-user or \-@netgroup (exclude the specified user),
-and + (include every user, except the excluded ones, from the NIS
-passwd map).
-Since most people only put a + at the end of
+The default action for this condition is "continue".
+.RE
+.LP
+The
+.I ACTION
+value can be one of:
+.RS 3
+.TP 10
+.B return
+Return a result now.
+Do not call any further lookup functions.
+.TP
+.B continue
+Call the next lookup function.
+.RE
+.SS Compatibility mode (compat)
+The NSS "compat" service is similar to "files" except that it
+additionally permits special entries in
 .I /etc/passwd
-to include everything from NIS, the switch provides a faster
-alternative for this case (`passwd: files nis') which doesn't
-require the single + entry in
-.IR /etc/passwd ,
-.IR /etc/group ,
-and
-.IR /etc/shadow .
-If this is not sufficient, the NSS `compat' service provides full
-+/\- semantics.
-By default, the source is `nis', but this may be
-overridden by specifying `nisplus' as source for the pseudo-databases
+for granting users or members of netgroups access to the system.
+The following entries are valid in this mode:
+.RS 3
+.TP 12
+.BI + user
+Include the specified
+.I user
+from the NIS passwd map.
+.TP
+.BI +@ netgroup
+Include all users in the given
+.IR netgroup .
+.TP
+.BI \- user
+Exclude the specified
+.I user
+from the NIS passwd map.
+.TP
+.BI \-@ netgroup
+Exclude all users in the given
+.IR netgroup .
+.TP
+.B +
+Include every user, except previously excluded ones, in the
+NIS passwd map.
+.RE
+.LP
+By default the source is "nis", but this may be
+overridden by specifying "nisplus" as source for the pseudo-databases
 .BR passwd_compat ,
 .B group_compat
 and
 .BR shadow_compat .
-These pseudo-databases are only available in GNU C Library.
 .SH FILES
-A service named SERVICE is implemented by a shared object library named
-.BI libnss_SERVICE.so. X
+A service named
+.I SERVICE
+is implemented by a shared object library named
+.IB libnss_SERVICE.so. X
 that resides in
 .IR /lib .
+.RS 3
 .TP 25
 .PD 0
 .I /etc/nsswitch.conf
-configuration file
+NSS configuration file.
 .TP
-.BI /lib/libnss_compat.so. X
-implements `compat' source for glibc2
+.IB /lib/libnss_compat.so. X
+implements "compat" source.
 .TP
-.BI /lib/libnss_db.so. X
-implements `db' source for glibc2
+.IB /lib/libnss_db.so. X
+implements "db" source.
 .TP
-.BI /lib/libnss_dns.so. X
-implements `dns' source for glibc2
+.IB /lib/libnss_dns.so. X
+implements "dns" source.
 .TP
-.BI /lib/libnss_files.so. X
-implements `files' source for glibc2
+.IB /lib/libnss_files.so. X
+implements "files" source.
 .TP
-.BI /lib/libnss_hesiod.so. X
-implements `hesiod' source for glibc2
+.IB /lib/libnss_hesiod.so. X
+implements "hesiod" source.
 .TP
-.BI /lib/libnss_nis.so. X
-implements `nis' source for glibc2
+.IB /lib/libnss_nis.so. X
+implements "nis" source.
 .TP
-.I /lib/libnss_nisplus.so.2
-implements `nisplus' source for glibc 2.1
+.IB /lib/libnss_nisplus.so. X
+implements "nisplus" source.
 .PD
+.RE
+.SH SEE ALSO
+.BR getent (1),
+.BR nss (5).
 .SH NOTES
 Within each process that uses
 .BR nsswitch.conf ,
-the entire file is read only once; if the file is later changed, the
+the entire file is read only once.
+If the file is later changed, the
 process will continue using the old configuration.
 .LP
-With Solaris, it isn't possible to link programs using the NSS Service
-statically.
-With Linux, this is no problem.
+Traditionally there was only a single source for service information,
+often in the form of a single configuration
+file (e.g. \fI/etc/passwd\fP).
+However, as other nameservices, like the Network Information
+Service (NIS) and the Domain Name Service (DNS), became popular,
+a method was needed
+that would be more flexible than fixed search orders coded into
+the C library.
+.LP
+The Linux libc5 with NYS support and the GNU C Library 2.x (libc.so.6)
+introduced a cleaner solution to the problem, based on the
+.B "Name Service Switch"
+mechanism used by Sun Microsystems in the Solaris 2 C library.





--=_360133be3063b9edf3d76eb28315455a
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream;
 name="nsswitch.conf.5.patch";
Content-Disposition: attachment;
 filename="nsswitch.conf.5.patch";

LS0tIG5zc3dpdGNoLmNvbmYuNS5vbGQJMjAxMS0xMC0xMSAxOToxNzo1MS4wMDAwMDAwMDAgKzAx
MDAKKysrIG5zc3dpdGNoLmNvbmYuNQkyMDExLTEwLTEzIDIxOjA5OjA3LjAwMDAwMDAwMCArMDEw
MApAQCAtMSw0ICsxLDUgQEAKIC5cIiBDb3B5cmlnaHQgKGMpIDE5OTgsIDE5OTkgVGhvcnN0ZW4g
S3VrdWsgKGt1a3VrQHZ0LnVuaS1wYWRlcmJvcm4uZGUpCisuXCIgQ29weXJpZ2h0IChjKSAyMDEx
LCBNYXJrIFIuIEJhbm5pc3RlciA8Y2FtYnJpZGdlQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KIC5c
IgogLlwiIFRoaXMgaXMgZnJlZSBkb2N1bWVudGF0aW9uOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBp
dCBhbmQvb3IKIC5cIiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBhcwpAQCAtMjAsMzkgKzIxLDMyIEBACiAuXCIgU29mdHdhcmUgRm91
bmRhdGlvbiwgSW5jLiwgNTkgVGVtcGxlIFBsYWNlLCBTdWl0ZSAzMzAsIEJvc3RvbiwgTUEgMDIx
MTEsCiAuXCIgVVNBLgogLlwiCi0uXCIgVGhpcyBtYW51YWwgcGFnZSBiYXNlZCBvbiB0aGUgR05V
IEMgTGlicmFyeSBpbmZvIHBhZ2VzLgotLlwiIEZJWE1FID8gVGhlIHVzZSBvZiBxdW90ZXMgb24g
dGhpcyBwYWdlIGlzIGluY29uc2lzdGVudCB3aXRoIHRoZQotLlwiIHJlc3Qgb2YgbWFuLXBhZ2Vz
LgotLlwiCi0uVEggTlNTV0lUQ0guQ09ORiA1IDE5OTktMDEtMTcgIkxpbnV4IiAiTGludXggUHJv
Z3JhbW1lcidzIE1hbnVhbCIKKy5USCBOU1NXSVRDSC5DT05GIDUgMjAxMS0xMC0xMyAiTGludXgi
ICJMaW51eCBQcm9ncmFtbWVyJ3MgTWFudWFsIgogLlNIIE5BTUUKLW5zc3dpdGNoLmNvbmYgXC0g
U3lzdGVtIERhdGFiYXNlcyBhbmQgTmFtZSBTZXJ2aWNlIFN3aXRjaCBjb25maWd1cmF0aW9uIGZp
bGUKK25zc3dpdGNoLmNvbmYgXC0gTmFtZSBTZXJ2aWNlIFN3aXRjaCBjb25maWd1cmF0aW9uIGZp
bGUKIC5TSCBERVNDUklQVElPTgotVmFyaW91cyBmdW5jdGlvbnMgaW4gdGhlIEMgTGlicmFyeSBu
ZWVkIHRvIGJlIGNvbmZpZ3VyZWQgdG8gd29yawotY29ycmVjdGx5IGluIHRoZSBsb2NhbCBlbnZp
cm9ubWVudC4KLVRyYWRpdGlvbmFsbHksIHRoaXMgd2FzIGRvbmUgYnkKLXVzaW5nIGZpbGVzIChl
LmcuLCBcZkkvZXRjL3Bhc3N3ZFxmUCksIGJ1dCBvdGhlciBuYW1lc2VydmljZXMgKGxpa2UgdGhl
Ci1OZXR3b3JrIEluZm9ybWF0aW9uIFNlcnZpY2UgKE5JUykgYW5kIHRoZSBEb21haW4gTmFtZSBT
ZXJ2aWNlIChETlMpKQotYmVjYW1lIHBvcHVsYXIsIGFuZCB3ZXJlIGhhY2tlZCBpbnRvIHRoZSBD
IGxpYnJhcnksIHVzdWFsbHkgd2l0aCBhIGZpeGVkCi1zZWFyY2ggb3JkZXIuCi0uTFAKLVRoZSBM
aW51eCBsaWJjNSB3aXRoIE5ZUyBzdXBwb3J0IGFuZCB0aGUgR05VIEMgTGlicmFyeSAyLnggKGxp
YmMuc28uNikKLWNvbnRhaW4gYSBjbGVhbmVyIHNvbHV0aW9uIG9mIHRoaXMgcHJvYmxlbS4KLUl0
IGlzIGRlc2lnbmVkIGFmdGVyIGEgbWV0aG9kCi11c2VkIGJ5IFN1biBNaWNyb3N5c3RlbXMgaW4g
dGhlIEMgbGlicmFyeSBvZiBTb2xhcmlzIDIuCi1XZSBmb2xsb3cgdGhlaXIKLW5hbWUgYW5kIGNh
bGwgdGhpcyBzY2hlbWUgIk5hbWUgU2VydmljZSBTd2l0Y2giIChOU1MpLgotVGhlIHNvdXJjZXMg
Zm9yCi10aGUgImRhdGFiYXNlcyIgYW5kIHRoZWlyIGxvb2t1cCBvcmRlciBhcmUgc3BlY2lmaWVk
IGluIHRoZQorVGhlCiAuSSAvZXRjL25zc3dpdGNoLmNvbmYKLWZpbGUuCi0uTFAKLVRoZSBmb2xs
b3dpbmcgZGF0YWJhc2VzIGFyZSBhdmFpbGFibGUgaW4gdGhlIE5TUzoKLS5UUAorZmlsZSBpcyBh
IGNvbmZpZ3VyYXRpb24gZmlsZSB1c2VkIGJ5IHRoZSBHTlUgQyBMaWJyYXJ5IHRvIGRldGVybWlu
ZSBmcm9tCit3aGF0IHNvdXJjZXMgdG8gb2J0YWluIG5hbWUgc2VydmljZSBpbmZvcm1hdGlvbiBp
biBhIHJhbmdlIG9mIGNhdGVnb3JpZXMsCithbmQgaW4gd2hhdCBvcmRlci4KK0VhY2ggY2F0ZWdv
cnkgb2YgaW5mb3JtYXRpb24gaXMgaWRlbnRpZmllZCBieSBhIGRhdGFiYXNlIG5hbWUuCisuTFAK
K1RoZSBmaWxlIGlzIHBsYWluIEFTQ0lJIHRleHQsIHdpdGggY29sdW1ucyBzZXBhcmF0ZWQgYnkg
c3BhY2VzIG9yIHRhYgorY2hhcmFjdGVycy4KK1RoZSBmaXJzdCBjb2x1bW4gZGVmaW5lcyB0aGUg
ZGF0YWJhc2UgbmFtZS4KK1RoZSByZW1haW5pbmcgY29sdW1ucyBkZXNjcmliZSB0aGUgb3JkZXIg
b2Ygc291cmNlcyB0byBxdWVyeSBhbmQgYQorbGltaXRlZAorc2V0IG9mIGFjdGlvbnMgdGhhdCBj
YW4gYmUgcGVyZm9ybWVkIGJ5IGxvb2t1cCByZXN1bHQuCisuTFAKK1RoZSBmb2xsb3dpbmcgZGF0
YWJhc2VzIGFyZSBtYWRlIGF2YWlsYWJsZSBieSB0aGUgc3RhbmRhcmQKK0dOVSBDIExpYnJhcnk6
CisuUlMgMworLlRQIDEwCiAuQiBhbGlhc2VzCiBNYWlsIGFsaWFzZXMsIHVzZWQgYnkKLS5CUiBz
ZW5kbWFpbCAoOCkuCi1QcmVzZW50bHkgaWdub3JlZC4KKy5CUiBnZXRhbGlhc2VudCAoMykKK2Fu
ZCByZWxhdGVkIGZ1bmN0aW9ucy4KIC5UUAogLkIgZXRoZXJzCiBFdGhlcm5ldCBudW1iZXJzLgpA
QCAtNjAsMzEgKzU0LDMxIEBACiAuQiBncm91cAogR3JvdXBzIG9mIHVzZXJzLCB1c2VkIGJ5CiAu
QlIgZ2V0Z3JlbnQgKDMpCi1mdW5jdGlvbnMuCithbmQgcmVsYXRlZCBmdW5jdGlvbnMuCiAuVFAK
IC5CIGhvc3RzCiBIb3N0IG5hbWVzIGFuZCBudW1iZXJzLCB1c2VkIGJ5CiAuQlIgZ2V0aG9zdGJ5
bmFtZSAoMykKLWFuZCBzaW1pbGFyIGZ1bmN0aW9ucy4KK2FuZCByZWxhdGVkIGZ1bmN0aW9ucy4K
IC5UUAogLkIgbmV0Z3JvdXAKIE5ldHdvcmsgd2lkZSBsaXN0IG9mIGhvc3RzIGFuZCB1c2Vycywg
dXNlZCBmb3IgYWNjZXNzIHJ1bGVzLgotQyBsaWJyYXJpZXMgYmVmb3JlIGdsaWJjIDIuMSBvbmx5
IHN1cHBvcnQgbmV0Z3JvdXBzIG92ZXIgTklTLgorQyBsaWJyYXJpZXMgYmVmb3JlIGdsaWJjIDIu
MSBvbmx5IHN1cHBvcnRlZCBuZXRncm91cHMgb3ZlciBOSVMuCiAuVFAKIC5CIG5ldHdvcmtzCiBO
ZXR3b3JrIG5hbWVzIGFuZCBudW1iZXJzLCB1c2VkIGJ5CiAuQlIgZ2V0bmV0ZW50ICgzKQotZnVu
Y3Rpb25zLgorYW5kIHJlbGF0ZWQgZnVuY3Rpb25zLgogLlRQCiAuQiBwYXNzd2QKIFVzZXIgcGFz
c3dvcmRzLCB1c2VkIGJ5CiAuQlIgZ2V0cHdlbnQgKDMpCi1mdW5jdGlvbnMuCithbmQgcmVsYXRl
ZCBmdW5jdGlvbnMuCiAuVFAKIC5CIHByb3RvY29scwogTmV0d29yayBwcm90b2NvbHMsIHVzZWQg
YnkKIC5CUiBnZXRwcm90b2VudCAoMykKLWZ1bmN0aW9ucy4KK2FuZCByZWxhdGVkIGZ1bmN0aW9u
cy4KIC5UUAogLkIgcHVibGlja2V5CiBQdWJsaWMgYW5kIHNlY3JldCBrZXlzIGZvciBTZWN1cmVf
UlBDIHVzZWQgYnkgTkZTIGFuZCBOSVMrLgpAQCAtOTIsMjMgKzg2LDI0IEBACiAuQiBycGMKIFJl
bW90ZSBwcm9jZWR1cmUgY2FsbCBuYW1lcyBhbmQgbnVtYmVycywgdXNlZCBieQogLkJSIGdldHJw
Y2J5bmFtZSAoMykKLWFuZCBzaW1pbGFyIGZ1bmN0aW9ucy4KK2FuZCByZWxhdGVkIGZ1bmN0aW9u
cy4KIC5UUAogLkIgc2VydmljZXMKIE5ldHdvcmsgc2VydmljZXMsIHVzZWQgYnkKIC5CUiBnZXRz
ZXJ2ZW50ICgzKQotZnVuY3Rpb25zLgorYW5kIHJlbGF0ZWQgZnVuY3Rpb25zLgogLlRQCiAuQiBz
aGFkb3cKIFNoYWRvdyB1c2VyIHBhc3N3b3JkcywgdXNlZCBieQotLkJSIGdldHNwbmFtICgzKS4K
Ky5CUiBnZXRzcG5hbSAoMykKK2FuZCByZWxhdGVkIGZ1bmN0aW9ucy4KKy5SRQogLkxQCi1BbiBl
eGFtcGxlCitIZXJlIGlzIGFuIGV4YW1wbGUKIC5JIC9ldGMvbnNzd2l0Y2guY29uZgotKG5hbWVs
eSwgdGhlIGRlZmF1bHQgdXNlZCB3aGVuCi0uSSAvZXRjL25zc3dpdGNoLmNvbmYKLWlzIG1pc3Np
bmcpOgotLnNwIDFuCitmaWxlOgorLkxQCisuUlMgMwogLlBEIDAKIC5UUCAxNgogcGFzc3dkOgpA
QCAtMTM5LDE0NyArMTM0LDIxNiBAQAogc2VydmljZXM6CiBuaXMgW05PVEZPVU5EPXJldHVybl0g
ZmlsZXMKIC5QRAorLlJFCiAuTFAKLVRoZSBmaXJzdCBjb2x1bW4gaXMgdGhlIGRhdGFiYXNlLgot
VGhlIHJlc3Qgb2YgdGhlIGxpbmUgc3BlY2lmaWVzIGhvdyB0aGUgbG9va3VwIHByb2Nlc3Mgd29y
a3MuCi1Zb3UgY2FuIHNwZWNpZnkgdGhlIHdheSBpdCB3b3JrcyBmb3IgZWFjaCBkYXRhYmFzZSBp
bmRpdmlkdWFsbHkuCi0uTFAKLVRoZSBjb25maWd1cmF0aW9uIHNwZWNpZmljYXRpb24gZm9yIGVh
Y2ggZGF0YWJhc2UgY2FuIGNvbnRhaW4gdHdvCi1kaWZmZXJlbnQgaXRlbXM6Ci0uUEQgMAotLlRQ
Ci0qIFRoZSBzZXJ2aWNlIHNwZWNpZmljYXRpb24gbGlrZSBgZmlsZXMnLCBgZGInLCBvciBgbmlz
Jy4KLS5UUAotKiBUaGUgcmVhY3Rpb24gb24gbG9va3VwIHJlc3VsdCBsaWtlIGBbTk9URk9VTkQ9
cmV0dXJuXScuCi0uUEQKLS5MUAotRm9yIGxpYmM1IHdpdGggTllTLCB0aGUgYWxsb3dlZCBzZXJ2
aWNlIHNwZWNpZmljYXRpb25zIGFyZSBgZmlsZXMnLCBgbmlzJywKLWFuZCBgbmlzcGx1cycuCi1G
b3IgaG9zdHMsIHlvdSBjb3VsZCBzcGVjaWZ5IGBkbnMnIGFzIGV4dHJhIHNlcnZpY2UsIGZvcgot
cGFzc3dkIGFuZCBncm91cCBgY29tcGF0JywgYnV0IG5vdCBmb3Igc2hhZG93LgotLkxQCi1Gb3Ig
Z2xpYmMsIHlvdSBtdXN0IGhhdmUgYSBmaWxlIGNhbGxlZAotLkJJIC9saWIvbGlibnNzX1NFUlZJ
Q0Uuc28uIFgKLWZvciBldmVyeSBTRVJWSUNFIHlvdSBhcmUgdXNpbmcuCi1PbiBhIHN0YW5kYXJk
IGluc3RhbGxhdGlvbiwgeW91IGNvdWxkIHVzZQotYGZpbGVzJywgYGRiJywgYG5pcycsIGFuZCBg
bmlzcGx1cycuCi1Gb3IgaG9zdHMsIHlvdSBjb3VsZCBzcGVjaWZ5IGBkbnMnIGFzCi1leHRyYSBz
ZXJ2aWNlLCBmb3IgcGFzc3dkLCBncm91cCwgYW5kIHNoYWRvdyBgY29tcGF0Jy4KLVRoZXNlIHNl
cnZpY2VzIHdpbGwgbm90Ci1iZSB1c2VkIGJ5IGxpYmM1IHdpdGggTllTLgorVGhlIGZpcnN0IGNv
bHVtbiBpcyB0aGUgZGF0YWJhc2UgbmFtZS4KK1RoZSByZW1haW5pbmcgY29sdW1ucyBzcGVjaWZ5
OgorLlJTIDMKKy5UUCAzCitvCitPbmUgb3IgbW9yZSBzZXJ2aWNlIHNwZWNpZmljYXRpb25zIGUu
Zy4gImZpbGVzIiwgImRiIiwgb3IgIm5pcyIuCitUaGUgb3JkZXIgdGhlIHNlcnZpY2VzIGFwcGVh
ciBvbiB0aGUgbGluZSBkZXRlcm1pbmUgdGhlIG9yZGVyIGluIHdoaWNoCit0aG9zZSBzZXJ2aWNl
cyB3aWxsIGJlIHF1ZXJpZWQsIGluIHR1cm4sIHVudGlsIGEgcmVzdWx0IGlzIGZvdW5kLgorLlRQ
CitvCitPcHRpb25hbCBhY3Rpb25zIHRvIHBlcmZvcm0gaWYgYSBwYXJ0aWN1bGFyIHJlc3VsdCBp
cyBvYnRhaW5lZAorZnJvbSB0aGUgcHJlY2VkaW5nIHNlcnZpY2UsIGUuZy4gIltOT1RGT1VORD1y
ZXR1cm5dIi4KKy5SRQorLkxQCitUaGUgc2VydmljZSBzcGVjaWZpY2F0aW9ucyBzdXBwb3J0ZWQg
b24geW91ciBzeXN0ZW0gZGVwZW5kIG9uIHRoZQorcHJlc2VuY2Ugb2Ygc2hhcmVkIGxpYnJhcmll
cywgYW5kIGFyZSB0aGVyZWZvcmUgZXh0ZW5zaWJsZS4KK0xpYnJhcmllcyBjYWxsZWQKKy5JQiAv
bGliL2xpYm5zc19TRVJWSUNFLnNvLiBYCit3aWxsIHByb3ZpZGUgdGhlIG5hbWVkCisuSVIgU0VS
VklDRSAuCitPbiBhIHN0YW5kYXJkIGluc3RhbGxhdGlvbiwgeW91IGNhbiB1c2UKKyJmaWxlcyIs
ICJkYiIsICJuaXMiLCBhbmQgIm5pc3BsdXMiLgorRm9yIHRoZSBob3N0cyBkYXRhYmFzZSwgeW91
IGNhbiBhZGRpdGlvbmFsbHkgc3BlY2lmeSAiZG5zIi4KK0ZvciB0aGUgcGFzc3dkLCBncm91cCwg
YW5kIHNoYWRvdyBkYXRhYmFzZXMsIHlvdSBjYW4gYWRkaXRpb25hbGx5IHNwZWNpZnkKKyJjb21w
YXQiIChzZWUKKy5CICJDb21wYXRpYmlsaXR5IG1vZGUiCitiZWxvdykuCiBUaGUgdmVyc2lvbiBu
dW1iZXIKLS5JIFgKLWlzIDEgZm9yIGdsaWJjIDIuMCBhbmQgMiBmb3IgZ2xpYmMgMi4xLgotLkxQ
Ci1UaGUgc2Vjb25kIGl0ZW0gaW4gdGhlIHNwZWNpZmljYXRpb24gZ2l2ZXMgdGhlIHVzZXIgbXVj
aCBmaW5lcgotY29udHJvbCBvbiB0aGUgbG9va3VwIHByb2Nlc3MuCi1BY3Rpb24gaXRlbXMgYXJl
IHBsYWNlZCBiZXR3ZWVuIHR3bwotc2VydmljZSBuYW1lcyBhbmQgYXJlIHdyaXR0ZW4gd2l0aGlu
IGJyYWNrZXRzLgotVGhlIGdlbmVyYWwgZm9ybSBpcwotLkxQCi1gWycgKCBgISc/IFNUQVRVUyBg
PScgQUNUSU9OICkrIGBdJworLkIgWAorbWF5IGJlIDEgZm9yIGdsaWJjIDIuMCwgb3IgMiBmb3Ig
Z2xpYmMgMi4xIGFuZCBsYXRlci4KK09uIHN5c3RlbXMgd2l0aCBhZGRpdGlvbmFsIGxpYnJhcmll
cyBpbnN0YWxsZWQsIHlvdSBtYXkgaGF2ZSBhY2Nlc3MgdG8KK2Z1cnRoZXIgc2VydmljZXMgc3Vj
aCBhcyAiaGVzaW9kIiwgImxkYXAiLCAid2luYmluZCIgYW5kICJ3aW5zIi4KKy5MUAorQW4gYWN0
aW9uIG1heSBhbHNvIGJlIHNwZWNpZmllZCBmb2xsb3dpbmcgYSBzZXJ2aWNlIHNwZWNpZmljYXRp
b24sIHRoYXQKK21vZGlmaWVzIGJlaGF2aW91ciBmb2xsb3dpbmcgYSByZXN1bHQgb2J0YWluZWQg
ZnJvbSB0aGUgcHJlY2VkaW5nIGRhdGEKK3NvdXJjZS4KK0FjdGlvbiBpdGVtcyB0YWtlIHRoZSBn
ZW5lcmFsIGZvcm06CisuTFAKKy5SUyAzCitbCisuSSBTVEFUVVMKKz0KKy5JIEFDVElPTgorXQor
LmJyCitbICEKKy5JIFNUQVRVUworPQorLkkgQUNUSU9OCitdCisuUkUKIC5MUAogd2hlcmUKLS5z
cCAxbgotLlBEIDAKLS5UUAotU1RBVFVTID0+IHN1Y2Nlc3MgfCBub3Rmb3VuZCB8IHVuYXZhaWwg
fCB0cnlhZ2FpbgotLlRQCi1BQ1RJT04gPT4gcmV0dXJuIHwgY29udGludWUKLS5QRAogLkxQCisu
UlMgMworLkkgU1RBVFVTCis9PgorLkIgc3VjY2VzcworfAorLkIgbm90Zm91bmQKK3wKKy5CIHVu
YXZhaWwKK3wKKy5CIHRyeWFnYWluCisuYnIKKy5JIEFDVElPTgorPT4KKy5CIHJldHVybgorfAor
LkIgY29udGludWUKKy5SRQorLkxQCitUaGUgISBuZWdhdGVzIHRoZSB0ZXN0LCBtYXRjaGluZyBh
bGwgcG9zc2libGUgcmVzdWx0cyBleGNlcHQgdGhlCitvbmUgc3BlY2lmaWVkLgogVGhlIGNhc2Ug
b2YgdGhlIGtleXdvcmRzIGlzIGluc2lnbmlmaWNhbnQuCi1UaGUgU1RBVFVTIHZhbHVlcyBhcmUK
LXRoZSByZXN1bHRzIG9mIGEgY2FsbCB0byBhIGxvb2t1cCBmdW5jdGlvbiBvZiBhIHNwZWNpZmlj
IHNlcnZpY2UuCi1UaGV5IG1lYW46Ci0uVFAKKy5MUAorVGhlCisuSSBTVEFUVVMKK3ZhbHVlIGlz
IG1hdGNoZWQgYWdhaW5zdCB0aGUgcmVzdWx0IG9mIHRoZSBsb29rdXAgZnVuY3Rpb24gY2FsbGVk
IGJ5Cit0aGUgcHJlY2VkaW5nIHNlcnZpY2Ugc3BlY2lmaWNhdGlvbiwgYW5kIGNhbiBiZSBvbmUg
b2Y6CisuUlMgMworLlRQIDEwCiAuQiBzdWNjZXNzCi1ObyBlcnJvciBvY2N1cnJlZCBhbmQgdGhl
IHdhbnRlZCBlbnRyeSBpcyByZXR1cm5lZC4KLVRoZSBkZWZhdWx0Ci1hY3Rpb24gZm9yIHRoaXMg
aXMgYHJldHVybicuCitObyBlcnJvciBvY2N1cnJlZCBhbmQgdGhlIHJlcXVlc3RlZCBlbnRyeSBp
cyByZXR1cm5lZC4KK1RoZSBkZWZhdWx0IGFjdGlvbiBmb3IgdGhpcyBjb25kaXRpb24gaXMgInJl
dHVybiIuCiAuVFAKIC5CIG5vdGZvdW5kCi1UaGUgbG9va3VwIHByb2Nlc3Mgc3VjY2VlZGVkLCBi
dXQgdGhlIG5lZWRlZCB2YWx1ZSB3YXMgbm90IGZvdW5kLgotVGhlIGRlZmF1bHQgYWN0aW9uIGlz
IGBjb250aW51ZScuCitUaGUgbG9va3VwIHN1Y2NlZWRlZCwgYnV0IHRoZSByZXF1ZXN0ZWQgZW50
cnkgd2FzIG5vdCBmb3VuZC4KK1RoZSBkZWZhdWx0IGFjdGlvbiBmb3IgdGhpcyBjb25kaXRpb24g
aXMgImNvbnRpbnVlIi4KIC5UUAogLkIgdW5hdmFpbAogVGhlIHNlcnZpY2UgaXMgcGVybWFuZW50
bHkgdW5hdmFpbGFibGUuCiBUaGlzIGNhbiBlaXRoZXIgbWVhbiB0aGUKLW5lZWRlZCBmaWxlIGlz
IG5vdCBhdmFpbGFibGUsIG9yLCBmb3IgRE5TLCB0aGUgc2VydmVyIGlzIG5vdAotYXZhaWxhYmxl
IG9yIGRvZXMgbm90IGFsbG93IHF1ZXJpZXMuCi1UaGUgZGVmYXVsdCBhY3Rpb24gaXMKLWBjb250
aW51ZScuCityZXF1aXJlZCBmaWxlIGNhbm5vdCBiZSByZWFkLCBvciwgZm9yIG5ldHdvcmsgc2Vy
dmljZXMsIHRoZSBzZXJ2ZXIKK2lzIG5vdCBhdmFpbGFibGUgb3IgZG9lcyBub3QgYWxsb3cgcXVl
cmllcy4KK1RoZSBkZWZhdWx0IGFjdGlvbiBmb3IgdGhpcyBjb25kaXRpb24gaXMgImNvbnRpbnVl
Ii4KIC5UUAogLkIgdHJ5YWdhaW4KIFRoZSBzZXJ2aWNlIGlzIHRlbXBvcmFyaWx5IHVuYXZhaWxh
YmxlLgogVGhpcyBjb3VsZCBtZWFuIGEgZmlsZSBpcwogbG9ja2VkIG9yIGEgc2VydmVyIGN1cnJl
bnRseSBjYW5ub3QgYWNjZXB0IG1vcmUgY29ubmVjdGlvbnMuCi1UaGUgZGVmYXVsdCBhY3Rpb24g
aXMgYGNvbnRpbnVlJy4KLS5TUyBJbnRlcmFjdGlvbiB3aXRoICsvXC0gc3ludGF4IChjb21wYXQg
bW9kZSkKLUxpbnV4IGxpYmM1IHdpdGhvdXQgTllTIGRvZXMgbm90IGhhdmUgdGhlIG5hbWUgc2Vy
dmljZSBzd2l0Y2ggYnV0IGRvZXMKLWFsbG93IHRoZSB1c2VyIHNvbWUgcG9saWN5IGNvbnRyb2wu
Ci1JbgotLkkgL2V0Yy9wYXNzd2QKLXlvdSBjb3VsZCBoYXZlIGVudHJpZXMgb2YgdGhlIGZvcm0g
K3VzZXIgb3IgK0BuZXRncm91cAotKGluY2x1ZGUgdGhlIHNwZWNpZmllZCB1c2VyIGZyb20gdGhl
IE5JUyBwYXNzd2QgbWFwKSwKLVwtdXNlciBvciBcLUBuZXRncm91cCAoZXhjbHVkZSB0aGUgc3Bl
Y2lmaWVkIHVzZXIpLAotYW5kICsgKGluY2x1ZGUgZXZlcnkgdXNlciwgZXhjZXB0IHRoZSBleGNs
dWRlZCBvbmVzLCBmcm9tIHRoZSBOSVMKLXBhc3N3ZCBtYXApLgotU2luY2UgbW9zdCBwZW9wbGUg
b25seSBwdXQgYSArIGF0IHRoZSBlbmQgb2YKK1RoZSBkZWZhdWx0IGFjdGlvbiBmb3IgdGhpcyBj
b25kaXRpb24gaXMgImNvbnRpbnVlIi4KKy5SRQorLkxQCitUaGUKKy5JIEFDVElPTgordmFsdWUg
Y2FuIGJlIG9uZSBvZjoKKy5SUyAzCisuVFAgMTAKKy5CIHJldHVybgorUmV0dXJuIGEgcmVzdWx0
IG5vdy4KK0RvIG5vdCBjYWxsIGFueSBmdXJ0aGVyIGxvb2t1cCBmdW5jdGlvbnMuCisuVFAKKy5C
IGNvbnRpbnVlCitDYWxsIHRoZSBuZXh0IGxvb2t1cCBmdW5jdGlvbi4KKy5SRQorLlNTIENvbXBh
dGliaWxpdHkgbW9kZSAoY29tcGF0KQorVGhlIE5TUyAiY29tcGF0IiBzZXJ2aWNlIGlzIHNpbWls
YXIgdG8gImZpbGVzIiBleGNlcHQgdGhhdCBpdAorYWRkaXRpb25hbGx5IHBlcm1pdHMgc3BlY2lh
bCBlbnRyaWVzIGluCiAuSSAvZXRjL3Bhc3N3ZAotdG8gaW5jbHVkZSBldmVyeXRoaW5nIGZyb20g
TklTLCB0aGUgc3dpdGNoIHByb3ZpZGVzIGEgZmFzdGVyCi1hbHRlcm5hdGl2ZSBmb3IgdGhpcyBj
YXNlIChgcGFzc3dkOiBmaWxlcyBuaXMnKSB3aGljaCBkb2Vzbid0Ci1yZXF1aXJlIHRoZSBzaW5n
bGUgKyBlbnRyeSBpbgotLklSIC9ldGMvcGFzc3dkICwKLS5JUiAvZXRjL2dyb3VwICwKLWFuZAot
LklSIC9ldGMvc2hhZG93IC4KLUlmIHRoaXMgaXMgbm90IHN1ZmZpY2llbnQsIHRoZSBOU1MgYGNv
bXBhdCcgc2VydmljZSBwcm92aWRlcyBmdWxsCi0rL1wtIHNlbWFudGljcy4KLUJ5IGRlZmF1bHQs
IHRoZSBzb3VyY2UgaXMgYG5pcycsIGJ1dCB0aGlzIG1heSBiZQotb3ZlcnJpZGRlbiBieSBzcGVj
aWZ5aW5nIGBuaXNwbHVzJyBhcyBzb3VyY2UgZm9yIHRoZSBwc2V1ZG8tZGF0YWJhc2VzCitmb3Ig
Z3JhbnRpbmcgdXNlcnMgb3IgbWVtYmVycyBvZiBuZXRncm91cHMgYWNjZXNzIHRvIHRoZSBzeXN0
ZW0uCitUaGUgZm9sbG93aW5nIGVudHJpZXMgYXJlIHZhbGlkIGluIHRoaXMgbW9kZToKKy5SUyAz
CisuVFAgMTIKKy5CSSArIHVzZXIKK0luY2x1ZGUgdGhlIHNwZWNpZmllZAorLkkgdXNlcgorZnJv
bSB0aGUgTklTIHBhc3N3ZCBtYXAuCisuVFAKKy5CSSArQCBuZXRncm91cAorSW5jbHVkZSBhbGwg
dXNlcnMgaW4gdGhlIGdpdmVuCisuSVIgbmV0Z3JvdXAgLgorLlRQCisuQkkgXC0gdXNlcgorRXhj
bHVkZSB0aGUgc3BlY2lmaWVkCisuSSB1c2VyCitmcm9tIHRoZSBOSVMgcGFzc3dkIG1hcC4KKy5U
UAorLkJJIFwtQCBuZXRncm91cAorRXhjbHVkZSBhbGwgdXNlcnMgaW4gdGhlIGdpdmVuCisuSVIg
bmV0Z3JvdXAgLgorLlRQCisuQiArCitJbmNsdWRlIGV2ZXJ5IHVzZXIsIGV4Y2VwdCBwcmV2aW91
c2x5IGV4Y2x1ZGVkIG9uZXMsIGluIHRoZQorTklTIHBhc3N3ZCBtYXAuCisuUkUKKy5MUAorQnkg
ZGVmYXVsdCB0aGUgc291cmNlIGlzICJuaXMiLCBidXQgdGhpcyBtYXkgYmUKK292ZXJyaWRkZW4g
Ynkgc3BlY2lmeWluZyAibmlzcGx1cyIgYXMgc291cmNlIGZvciB0aGUgcHNldWRvLWRhdGFiYXNl
cwogLkJSIHBhc3N3ZF9jb21wYXQgLAogLkIgZ3JvdXBfY29tcGF0CiBhbmQKIC5CUiBzaGFkb3df
Y29tcGF0IC4KLVRoZXNlIHBzZXVkby1kYXRhYmFzZXMgYXJlIG9ubHkgYXZhaWxhYmxlIGluIEdO
VSBDIExpYnJhcnkuCiAuU0ggRklMRVMKLUEgc2VydmljZSBuYW1lZCBTRVJWSUNFIGlzIGltcGxl
bWVudGVkIGJ5IGEgc2hhcmVkIG9iamVjdCBsaWJyYXJ5IG5hbWVkCi0uQkkgbGlibnNzX1NFUlZJ
Q0Uuc28uIFgKK0Egc2VydmljZSBuYW1lZAorLkkgU0VSVklDRQoraXMgaW1wbGVtZW50ZWQgYnkg
YSBzaGFyZWQgb2JqZWN0IGxpYnJhcnkgbmFtZWQKKy5JQiBsaWJuc3NfU0VSVklDRS5zby4gWAog
dGhhdCByZXNpZGVzIGluCiAuSVIgL2xpYiAuCisuUlMgMwogLlRQIDI1CiAuUEQgMAogLkkgL2V0
Yy9uc3N3aXRjaC5jb25mCi1jb25maWd1cmF0aW9uIGZpbGUKK05TUyBjb25maWd1cmF0aW9uIGZp
bGUuCiAuVFAKLS5CSSAvbGliL2xpYm5zc19jb21wYXQuc28uIFgKLWltcGxlbWVudHMgYGNvbXBh
dCcgc291cmNlIGZvciBnbGliYzIKKy5JQiAvbGliL2xpYm5zc19jb21wYXQuc28uIFgKK2ltcGxl
bWVudHMgImNvbXBhdCIgc291cmNlLgogLlRQCi0uQkkgL2xpYi9saWJuc3NfZGIuc28uIFgKLWlt
cGxlbWVudHMgYGRiJyBzb3VyY2UgZm9yIGdsaWJjMgorLklCIC9saWIvbGlibnNzX2RiLnNvLiBY
CitpbXBsZW1lbnRzICJkYiIgc291cmNlLgogLlRQCi0uQkkgL2xpYi9saWJuc3NfZG5zLnNvLiBY
Ci1pbXBsZW1lbnRzIGBkbnMnIHNvdXJjZSBmb3IgZ2xpYmMyCisuSUIgL2xpYi9saWJuc3NfZG5z
LnNvLiBYCitpbXBsZW1lbnRzICJkbnMiIHNvdXJjZS4KIC5UUAotLkJJIC9saWIvbGlibnNzX2Zp
bGVzLnNvLiBYCi1pbXBsZW1lbnRzIGBmaWxlcycgc291cmNlIGZvciBnbGliYzIKKy5JQiAvbGli
L2xpYm5zc19maWxlcy5zby4gWAoraW1wbGVtZW50cyAiZmlsZXMiIHNvdXJjZS4KIC5UUAotLkJJ
IC9saWIvbGlibnNzX2hlc2lvZC5zby4gWAotaW1wbGVtZW50cyBgaGVzaW9kJyBzb3VyY2UgZm9y
IGdsaWJjMgorLklCIC9saWIvbGlibnNzX2hlc2lvZC5zby4gWAoraW1wbGVtZW50cyAiaGVzaW9k
IiBzb3VyY2UuCiAuVFAKLS5CSSAvbGliL2xpYm5zc19uaXMuc28uIFgKLWltcGxlbWVudHMgYG5p
cycgc291cmNlIGZvciBnbGliYzIKKy5JQiAvbGliL2xpYm5zc19uaXMuc28uIFgKK2ltcGxlbWVu
dHMgIm5pcyIgc291cmNlLgogLlRQCi0uSSAvbGliL2xpYm5zc19uaXNwbHVzLnNvLjIKLWltcGxl
bWVudHMgYG5pc3BsdXMnIHNvdXJjZSBmb3IgZ2xpYmMgMi4xCisuSUIgL2xpYi9saWJuc3Nfbmlz
cGx1cy5zby4gWAoraW1wbGVtZW50cyAibmlzcGx1cyIgc291cmNlLgogLlBECisuUkUKKy5TSCBT
RUUgQUxTTworLkJSIGdldGVudCAoMSksCisuQlIgbnNzICg1KS4KIC5TSCBOT1RFUwogV2l0aGlu
IGVhY2ggcHJvY2VzcyB0aGF0IHVzZXMKIC5CUiBuc3N3aXRjaC5jb25mICwKLXRoZSBlbnRpcmUg
ZmlsZSBpcyByZWFkIG9ubHkgb25jZTsgaWYgdGhlIGZpbGUgaXMgbGF0ZXIgY2hhbmdlZCwgdGhl
Cit0aGUgZW50aXJlIGZpbGUgaXMgcmVhZCBvbmx5IG9uY2UuCitJZiB0aGUgZmlsZSBpcyBsYXRl
ciBjaGFuZ2VkLCB0aGUKIHByb2Nlc3Mgd2lsbCBjb250aW51ZSB1c2luZyB0aGUgb2xkIGNvbmZp
Z3VyYXRpb24uCiAuTFAKLVdpdGggU29sYXJpcywgaXQgaXNuJ3QgcG9zc2libGUgdG8gbGluayBw
cm9ncmFtcyB1c2luZyB0aGUgTlNTIFNlcnZpY2UKLXN0YXRpY2FsbHkuCi1XaXRoIExpbnV4LCB0
aGlzIGlzIG5vIHByb2JsZW0uCitUcmFkaXRpb25hbGx5IHRoZXJlIHdhcyBvbmx5IGEgc2luZ2xl
IHNvdXJjZSBmb3Igc2VydmljZSBpbmZvcm1hdGlvbiwKK29mdGVuIGluIHRoZSBmb3JtIG9mIGEg
c2luZ2xlIGNvbmZpZ3VyYXRpb24KK2ZpbGUgKGUuZy4gXGZJL2V0Yy9wYXNzd2RcZlApLgorSG93
ZXZlciwgYXMgb3RoZXIgbmFtZXNlcnZpY2VzLCBsaWtlIHRoZSBOZXR3b3JrIEluZm9ybWF0aW9u
CitTZXJ2aWNlIChOSVMpIGFuZCB0aGUgRG9tYWluIE5hbWUgU2VydmljZSAoRE5TKSwgYmVjYW1l
IHBvcHVsYXIsCithIG1ldGhvZCB3YXMgbmVlZGVkCit0aGF0IHdvdWxkIGJlIG1vcmUgZmxleGli
bGUgdGhhbiBmaXhlZCBzZWFyY2ggb3JkZXJzIGNvZGVkIGludG8KK3RoZSBDIGxpYnJhcnkuCisu
TFAKK1RoZSBMaW51eCBsaWJjNSB3aXRoIE5ZUyBzdXBwb3J0IGFuZCB0aGUgR05VIEMgTGlicmFy
eSAyLnggKGxpYmMuc28uNikKK2ludHJvZHVjZWQgYSBjbGVhbmVyIHNvbHV0aW9uIHRvIHRoZSBw
cm9ibGVtLCBiYXNlZCBvbiB0aGUKKy5CICJOYW1lIFNlcnZpY2UgU3dpdGNoIgorbWVjaGFuaXNt
IHVzZWQgYnkgU3VuIE1pY3Jvc3lzdGVtcyBpbiB0aGUgU29sYXJpcyAyIEMgbGlicmFyeS4K
--=_360133be3063b9edf3d76eb28315455a--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
