From: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Subject: [PATCH] ld.so.8: add some multi-arch notes, linker paths are quite varied (but standardized to each arch)
Date: Tue, 31 Mar 2015 13:48:57 -0700
Message-ID: <1427834937-207547-1-git-send-email-shawn@churchofgit.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man8/ld.so.8 | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 3bf8a36..096c2e2 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -33,6 +33,8 @@ during compilation.
 The program
 .B ld.so
 handles a.out binaries, a format used long ago;
+on i386
+.\" there are so many linker paths for each arch...
 .B ld-linux.so*
 handles ELF (\fI/lib/ld-linux.so.1\fP for libc5, \fI/lib/ld-linux.so.2\fP
 for glibc2), which everybody has been using for years now.
@@ -85,7 +87,18 @@ and then
 (On some 64-bit archiectures, the default spaths for 64-bit libraries are
 .IR /lib64 ,
 and then
-.IR /usr/lib64 .)
+.IR /usr/lib64 .
+Debian and derived distributions use
+.\".BR multiarch (7)
+multiarch paths of
+.IR /lib/${TRIPLET}
+and
+.IR /usr/lib/${TIPLET}
+and then
+.IR /lib ,
+and
+.IR /usr/lib .)
+.\" And Arch does not search in /lib or /lib64 at all
 If the binary was linked with the
 .B \-z nodeflib
 linker option, this step is skipped.
-- 
2.2.1.209.g41e5f3a

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
