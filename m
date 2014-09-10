From: "Carlos O'Donell" <carlos@redhat.com>
Subject: [PATCH] getgrent.3: Add ENOENT to error list.
Date: Wed, 10 Sep 2014 10:23:13 -0400
Message-ID: <54105ED1.5020206@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-52676-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
To: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Simo Sorce <ssorce@redhat.com>, Jakub Hrozek <jhrozek@redhat.com>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

Michael,

It's possible to get ENOENT returned from getgrent
if the backend, for example say SSSD, isn't configured
or the daemon isn't running. The same can be said of any
of the NSS backend.

As POSIX does not list ENOENT, we can list it ourselves
and define it how we like.

I don't know how you handle errno values that are glibc
specific, but here is the patch that enhances getgrent
to make users aware of what ENOENT is intended to mean
from glibc.

Patch against master. Pleas apply.

diff --git a/man3/getgrent.3 b/man3/getgrent.3
index f49c746..02f26bd 100644
--- a/man3/getgrent.3
+++ b/man3/getgrent.3
@@ -141,6 +141,11 @@ The calling process already has too many open files.
 .B ENFILE
 Too many open files in the system.
 .TP
+.\" not in POSIX
+.B ENOENT
+A necessary input file cannot be found.
+For NSS backends in glibc this indicates the backend is not correctly configured.
+.TP
 .B ENOMEM
 .\" not in POSIX
 Insufficient memory to allocate
---

Cheers,
Carlos.
