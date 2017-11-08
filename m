From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] getrlimit.2, utimensat.2: wsfix
Date: Wed, 8 Nov 2017 16:26:35 +0900
Message-ID: <955b7f28-6da3-124c-4c88-937802e9721f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/getrlimit.2 | 2 +-
 man2/utimensat.2 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
index 661f2156b..75cb7cc84 100644
--- a/man2/getrlimit.2
+++ b/man2/getrlimit.2
@@ -625,7 +625,7 @@ For backward compatibility, glibc also provides
 .BR vlimit ().
 All new applications should be written using
 .BR setrlimit ().
-.SS C library/ kernel ABI differences
+.SS C library/kernel ABI differences
 Since version 2.13, the glibc
 .BR getrlimit ()
 and
diff --git a/man2/utimensat.2 b/man2/utimensat.2
index 9127f7e88..ec03463a1 100644
--- a/man2/utimensat.2
+++ b/man2/utimensat.2
@@ -456,7 +456,7 @@ succeeds even if the file referred to by
 and
 .I pathname
 does not exist.
-.SS C library/ kernel ABI differences
+.SS C library/kernel ABI differences
 On Linux,
 .BR futimens ()
 is a library function implemented on top of the
-- 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
