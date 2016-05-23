From: Iustin Pop <iustin-JC6qDa14zzLYtjvyW6yDsg@public.gmane.org>
Subject: [PATCH] fnctl.2: tfix - remove duplicate paragraph in NOTES
Date: Mon, 23 May 2016 11:54:27 +0200
Message-ID: <20160523095427.GA23850@hq.k1024.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This paragraph already appears above, right before the "File Locking"
one.

Signed-off-by: Iustin Pop <iustin-JC6qDa14zzLYtjvyW6yDsg@public.gmane.org>
---
 man2/fcntl.2 | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/man2/fcntl.2 b/man2/fcntl.2
index d7c6ccf..a28812b 100644
--- a/man2/fcntl.2
+++ b/man2/fcntl.2
@@ -1758,10 +1758,6 @@ However, these details can be ignored by applications using glibc, whose
 wrapper function transparently employs the more recent system call
 where it is available.
 
-The errors returned by
-.BR dup2 (2)
-are different from those returned by
-.BR F_DUPFD .
 .SS Record locks
 Since kernel 2.0, there is no interaction between the types of lock
 placed by
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
