From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_tryjoin_np.3 ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 27 May 2015 18:13:02 +0800
Message-ID: <1432721584-11342-8-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think pthread_tryjoin_np() and
pthread_timedjoin_np() are thread-safe. But, there
are not markings of them in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_tryjoin_np.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/pthread_tryjoin_np.3 b/man3/pthread_tryjoin_np.3
index 4fef86c..acce537 100644
--- a/man3/pthread_tryjoin_np.3
+++ b/man3/pthread_tryjoin_np.3
@@ -117,6 +117,20 @@ never returns the error
 .BR EINTR .
 .SH VERSIONS
 These functions first appeared in glibc in version 2.3.3.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw22 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR pthread_tryjoin_np (),
+.BR pthread_timedjoin_np ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 These functions are nonstandard GNU extensions;
 hence the suffix "_np" (nonportable) in the names.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
