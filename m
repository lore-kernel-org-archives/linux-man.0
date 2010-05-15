From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] man3/opendir.3: Specify feature traits for fdopendir(3)
Date: Sat, 15 May 2010 03:34:19 +0200
Message-ID: <20100515013419.GO16800@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Currently, there is no note on the fact that fdopendir() is
POSIX.2008-only.

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

---

diff --git a/man3/opendir.3 b/man3/opendir.3
index a5c64a3..8e224ee 100644
--- a/man3/opendir.3
+++ b/man3/opendir.3
@@ -39,6 +39,18 @@ opendir, fdopendir \- open a directory
 .BI "DIR *opendir(const char *" name );
 .BI "DIR *fdopendir(int " fd );
 .fi
+.sp
+.in -4n
+Feature Test Macro Requirements for glibc (see
+.BR feature_test_macros (7)):
+.in
+.sp
+.BR fdopendir ():
+.br
+Since glibc 2.10: _XOPEN_SOURCE >= 700 || _POSIX_C_SOURCE >= 200809L
+.br
+Before glibc 2.10:
+_GNU_SOURCE
 .SH DESCRIPTION
 The
 .BR opendir ()
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
