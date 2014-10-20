From: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
Subject: [PATCH] sysconf.3: Document _SC_NGROUPS_MAX
Date: Mon, 20 Oct 2014 01:08:52 -0700
Message-ID: <20141020080850.GA22821@thin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Already documented in getgroups(2), but not in sysconf(3).

Signed-off-by: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
---
 man3/sysconf.3 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man3/sysconf.3 b/man3/sysconf.3
index dc1ea5c..9f6c5c0 100644
--- a/man3/sysconf.3
+++ b/man3/sysconf.3
@@ -154,6 +154,9 @@ Must not be less than
 .B _POSIX_LOGIN_NAME_MAX
 (9).
 .TP
+.BR NGROUPS_MAX " - " _SC_NGROUPS_MAX
+Maximum number of supplementary group IDs.
+.TP
 .BR "" "clock ticks - " _SC_CLK_TCK
 The number of clock ticks per second.
 The corresponding variable is obsolete.
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
