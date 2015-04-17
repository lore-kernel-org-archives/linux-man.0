From: "Robin H. Johnson" <robbat2@gentoo.org>
Subject: [PATCH] getent.1: Document options.
Date: Thu, 16 Apr 2015 23:53:04 -0700
Message-ID: <1429253584-14733-1-git-send-email-robbat2@gentoo.org>
Return-path: <libc-alpha-return-58479-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
To: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org, "Robin H. Johnson" <robbat2@gentoo.org>, Nalin Dahyabhai <nalin@redhat.com>, Jay Fenlason <fenlason@redhat.com>, Ulrich Drepper <drepper@redhat.com>
List-Id: linux-man@vger.kernel.org

The options to getent are now documented, after being around for nearly
a decade without changes.

Signed-off-by: Robin H. Johnson <robbat2@gentoo.org>
CC: Nalin Dahyabhai <nalin@redhat.com> (original -s {service} option)
CC: Jay Fenlason <fenlason@redhat.com> (-s {database}:{service} addition)
CC: Ulrich Drepper <drepper@redhat.com> (IDN flags)
---
 man1/getent.1 | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/man1/getent.1 b/man1/getent.1
index a15d880..16f2668 100644
--- a/man1/getent.1
+++ b/man1/getent.1
@@ -1,4 +1,5 @@
 .\" Copyright (c) 2011, Mark R. Bannister <cambridge@users.sourceforge.net>
+.\" Copyright (c) 2015, Robin H. Johnson <robbat2@gentoo.org>
 .\"
 .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
 .\" This is free documentation; you can redistribute it and/or
@@ -25,8 +26,7 @@
 .SH NAME
 getent \- get entries from Name Service Switch libraries
 .SH SYNOPSIS
-.B "getent
-.IR database " [" key " ...]"
+.BR getent\ [\fIoption\fP]...\ \fIdatabase\fP\ \fIkey\fP...
 .SH DESCRIPTION
 The
 .B getent
@@ -342,6 +342,24 @@ in succession to
 .BR getspnam (3)
 and display the result.
 .RE
+.SH OPTIONS
+.TP
+.BR \-s\ \fIservice\fP\ \-\-service\ \fIservice\fP
+.\" commit 9d0881aa76b399e6a025c5cf44bebe2ae0efa8af (glibc)
+Override all databases with the specified service. (Since glibc-2.2.5.)
+.TP
+.BR \-s\ \fIdatabase\fP:\fIservice\fP\ \-\-service\ \fIdatabase\fP:\fIservice\fP
+.\" commit b4f6f4be85d32b9c03361c38376e36f08100e3e8 (glibc)
+Override only specified databases with the specified service. The option may be used
+multiple times, but only the last service for each database will be used. (Since glibc-2.4.)
+.TP
+.BR \-i\ \-\-no\-idn
+.\" commit a160f8d808cf8020b13bd0ef4a9eaf3c11f964ad (glibc)
+Disables IDN encoding in lookups for
+.BR ahosts
+/
+.BR getaddrinfo (3)
+(Since glibc-2.13.)
 .SH EXIT STATUS
 One of the following exit values can be returned by
 .BR getent :
-- 
2.3.0
