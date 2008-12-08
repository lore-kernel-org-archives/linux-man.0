From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] crypt.3: Fix formatting
Date: Mon, 8 Dec 2008 01:08:27 +0100
Message-ID: <20081208000827.GO10491@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

My groff removes the spaces and renders parts of the string in bold.

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man3/crypt.3 b/man3/crypt.3
index 8d75cd1..1139792 100644
--- a/man3/crypt.3
+++ b/man3/crypt.3
@@ -158,7 +158,8 @@ function was not implemented, probably because of U.S.A. export restrictions.
 .SH "CONFORMING TO"
 .BR crypt ():
 SVr4, 4.3BSD, POSIX.1-2001.
-.BR crypt_r () is a GNU extension.
+.BR crypt_r ()
+is a GNU extension.
 .SH NOTES
 .SS Glibc Notes
 The glibc2 version of this function supports additional
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
