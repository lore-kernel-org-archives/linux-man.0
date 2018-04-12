From: Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH 2/2] crypt.3, encrypt.3: Add notes about _XOPEN_CRYPT.
Date: Thu, 12 Apr 2018 14:05:40 -0500
Message-ID: <6d9a7e45-5d31-efbd-78ad-2808d492eb21@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------286F8F061530C9C208FB7DCF"
Return-path: <libc-alpha-return-91518-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
To: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Florian Weimer <fweimer@redhat.com>, Zack Weinberg <zackw@panix.com>, Rical Jasan <rj@2c3t.io>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------286F8F061530C9C208FB7DCF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The distribution may choose not to support _XOPEN_CRYPT in the
case that the distribution has transitioned from glibc crypt to
libxcrypt.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
-- 
Cheers,
Carlos.

--------------286F8F061530C9C208FB7DCF
Content-Type: text/x-patch;
 name="0002-crypt.3-encrypt.3-Add-notes-about-_XOPEN_CRYPT.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-crypt.3-encrypt.3-Add-notes-about-_XOPEN_CRYPT.patch"

>From d099bd9550d28da19dd082d27491f49bd8c721e9 Mon Sep 17 00:00:00 2001
From: Carlos O'Donell <carlos@systemhalted.org>
Date: Thu, 12 Apr 2018 13:58:27 -0500
Subject: [PATCH 2/2] crypt.3, encrypt.3: Add notes about _XOPEN_CRYPT.

The distribution may choose not to support _XOPEN_CRYPT in the
case that the distribution has transitioned from glibc crypt to
libxcrypt.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 man3/crypt.3   | 22 ++++++++++++++++++++--
 man3/encrypt.3 | 19 +++++++++++++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/man3/crypt.3 b/man3/crypt.3
index 3e6552ad8..58c62d93d 100644
--- a/man3/crypt.3
+++ b/man3/crypt.3
@@ -188,8 +188,26 @@ POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.
 .BR crypt_r ()
 is a GNU extension.
 .SH NOTES
-.SS Glibc notes
-The glibc2 version of this function supports additional
+.SS Availability in glibc
+The
+.BR crypt (),
+.BR encrypt (),
+and
+.BR setkey ()
+functions are part of the POSIX.1-2008 XSI Options Group for Encryption
+and are optional. If the interfaces are not available then the symbolic
+constant
+.BR _XOPEN_CRYPT
+is either not defined or defined to -1, and can be checked at runtime with
+.BR sysconf ().
+This may be the case if the downstream distribution has switched from glibc
+crypt to libxcrypt.  When recompiling applications in such distributions the
+user must detect if
+.BR _XOPEN_CRPYT
+is not available and include crypt.h for the function prototypes; otherwise
+libxcrypt is a ABI compatible drop-in replacement.
+.SS Features in glibc
+The glibc version of this function supports additional
 encryption algorithms.
 .PP
 If
diff --git a/man3/encrypt.3 b/man3/encrypt.3
index 3a1cf9598..3df4870c3 100644
--- a/man3/encrypt.3
+++ b/man3/encrypt.3
@@ -147,6 +147,25 @@ and
 .BR setkey_r ()
 are GNU extensions.
 .SH NOTES
+.SS Availability in glibc
+The
+.BR crypt (),
+.BR encrypt (),
+and
+.BR setkey ()
+functions are part of the POSIX.1-2008 XSI Options Group for Encryption
+and are optional. If the interfaces are not available then the symbolic
+constant
+.BR _XOPEN_CRYPT
+is either not defined or defined to -1, and can be checked at runtime with
+.BR sysconf ().
+This may be the case if the downstream distribution has switched from glibc
+crypt to libxcrypt.  When recompiling applications in such distributions the
+user must detect if
+.BR _XOPEN_CRPYT
+is not available and include crypt.h for the function prototypes; otherwise
+libxcrypt is a ABI compatible drop-in replacement.
+.SS Features in glibc
 In glibc 2.2, these functions use the DES algorithm.
 .SH EXAMPLE
 .EX
-- 
2.14.3


--------------286F8F061530C9C208FB7DCF--
