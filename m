From: Nikanth Karthikesan <knikanth-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] lockf.3: update pointer to documentation in the kernel source in SEE ALSO
Date: Thu, 26 Mar 2009 11:17:08 +0530
Message-ID: <200903261117.08423.knikanth@suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The lockf.3 points to locks.txt and mandatory.txt in Documentation which has
been moved to Documentation/filesystems/locks.txt and
Documentation/filesystems/mandatory-locking.txt

Signed-off-by: Nikanth Karthikesan <knikanth-l3A5Bk7waGM@public.gmane.org>

---


diff --git a/man3/lockf.3 b/man3/lockf.3
index 53b5837..44fe024 100644
--- a/man3/lockf.3
+++ b/man3/lockf.3
@@ -134,6 +134,6 @@ SVr4, POSIX.1-2001.
 There are also
 .I locks.txt
 and
-.I mandatory.txt
+.I mandatory-locking.txt
 in
-.IR /usr/src/linux/Documentation .
+.IR /usr/src/linux/Documentation/filesystems .


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
