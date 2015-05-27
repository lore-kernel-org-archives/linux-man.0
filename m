From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_attr_setaffinity_np.3 ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 27 May 2015 18:12:59 +0800
Message-ID: <1432721584-11342-5-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think pthread_attr_setaffinity_np() and
pthread_attr_getaffinity_np() are thread-safe. But, there are not
markings of them in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_attr_setaffinity_np.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/pthread_attr_setaffinity_np.3 b/man3/pthread_attr_setaffinity_np.3
index ce49abb..cc6e94b 100644
--- a/man3/pthread_attr_setaffinity_np.3
+++ b/man3/pthread_attr_setaffinity_np.3
@@ -105,6 +105,20 @@ is too small).
 Could not allocate memory.
 .SH VERSIONS
 These functions are provided by glibc since version 2.3.4.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw30 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR pthread_attr_setaffinity_np (),
+.BR pthread_attr_getaffinity_np ()
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
