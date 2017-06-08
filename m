From: Arjun Shankar <arjun.is-xDe9EDckjEKzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] ptsname.3: ERRORS: remove EINVAL
Date: Thu, 8 Jun 2017 12:52:18 +0000
Message-ID: <20170608125218.GA80475@aloka.lostca.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>, Joseph Myers <joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>, Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The glibc implementation of 'ptsname_r' no longer checks if it has
been called with a NULL 'buf' [1], and therefore cannot return an
EINVAL error.

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=8f0a947
    (prior to the release of glibc 2.26)

Signed-off-by: Arjun Shankar <arjun.is-xDe9EDckjEKzQB+pC5nmwQ@public.gmane.org>
---
 man3/ptsname.3 | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/man3/ptsname.3 b/man3/ptsname.3
index 90133fe..fd98b6b 100644
--- a/man3/ptsname.3
+++ b/man3/ptsname.3
@@ -58,12 +58,6 @@ is set to indicate the error.
 .\" result -- MTK, Dec 04
 .SH ERRORS
 .TP
-.B EINVAL
-.RB ( ptsname_r ()
-only)
-.I buf
-is NULL.
-.TP
 .B ENOTTY
 .I fd
 does not refer to a pseudoterminal master device.
-- 
2.9.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
