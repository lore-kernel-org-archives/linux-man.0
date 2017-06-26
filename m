From: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] posix_madvise.3: Remove paragraph about POSIX_FADV_NOREUSE
Date: Mon, 26 Jun 2017 17:02:08 +0200
Message-ID: <20170626150208.2754-1-toddy@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

POSIX_FADV_NOREUSE is documented for posix_fadvise, and a
corresponding POSIX_MADV_NOREUSE flag is not specified by POSIX.

Thanks to Marc Lehmann <debian-reportbug-zsXavz5zCAg@public.gmane.org>
See https://bugs.debian.org/865699
---
 man3/posix_madvise.3 | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/man3/posix_madvise.3 b/man3/posix_madvise.3
index d97d37b6e..18743b0f0 100644
--- a/man3/posix_madvise.3
+++ b/man3/posix_madvise.3
@@ -106,12 +106,6 @@ Support for
 first appeared in glibc version 2.2.
 .SH CONFORMING TO
 POSIX.1-2001.
