From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_getattr_np.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 27 May 2015 18:13:01 +0800
Message-ID: <1432721584-11342-7-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think pthread_getattr_np() is thread-safe. But,
there is not marking of pthread_getattr_np() in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_getattr_np.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/pthread_getattr_np.3 b/man3/pthread_getattr_np.3
index f721743..282d37c 100644
--- a/man3/pthread_getattr_np.3
+++ b/man3/pthread_getattr_np.3
@@ -95,6 +95,19 @@ if the
 resource limit is not supported.
 .SH VERSIONS
 This function is available in glibc since version 2.2.3.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR pthread_getattr_np ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 This function is a nonstandard GNU extension;
 hence the suffix "_np" (nonportable) in the name.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
