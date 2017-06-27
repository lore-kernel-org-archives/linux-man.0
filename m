From: Janne Snabb <snabb-wN/OigK0MJ0AvxtiuMwx3w@public.gmane.org>
Subject: [patch] getrandom.2: tfix
Date: Tue, 27 Jun 2017 20:42:37 +0300
Message-ID: <248f9a13-139b-9605-bac2-e083f2880aa9@epipe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

diff --git a/man2/getrandom.2 b/man2/getrandom.2
index a550fa5ad..86302759e 100644
--- a/man2/getrandom.2
+++ b/man2/getrandom.2
@@ -178,7 +178,7 @@ can be used to obtain randomness, see
 Unlike
 .IR /dev/random
 and
-.IR /dev/random ,
+.IR /dev/urandom ,
 .BR getrandom ()
 does not involve the use of pathnames or file descriptors.
 Thus,
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
