From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] crypt.3: ffix
Date: Sat,  1 Mar 2014 15:59:38 +0100
Message-ID: <1393685978-23268-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/crypt.3 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man3/crypt.3 b/man3/crypt.3
index 0999532..9baa80a 100644
--- a/man3/crypt.3
+++ b/man3/crypt.3
@@ -168,7 +168,8 @@ function was not implemented, probably because of U.S.A. export restrictions.
 .\" to be considered insecure for the given reasons.
 .TP
 .B EPERM
-.I /proc/sys/crypto/fips_enabled has a nonzero value,
+.I /proc/sys/crypto/fips_enabled
+has a nonzero value,
 and an attempt was made to use a weak encryption type, such as DES.
 .SH ATTRIBUTES
 .SS Multithreading (see pthreads(7))
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
