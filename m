From: Breno Leitao <leitao-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] pkey_alloc.2: Fix argument order
Date: Tue,  7 Nov 2017 10:23:15 -0200
Message-ID: <1510057395-2297-1-git-send-email-leitao@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Breno Leitao <leitao-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Currently pkey_alloc() syscall has two arguments, and the very first
argument is still not supported as in kernel 4.14-rc8 and should be set
to zero, as showed in the following syscall implementation:

	SYSCALL_DEFINE2(pkey_alloc, unsigned long, flags, ...)
	{
		int pkey;
		int ret;

		/* No flags supported yet. */
		if (flags)
			return -EINVAL;

This behaviour is also documented correctly in the kernel documentation
as Documentation/x86/protection-keys.txt

The second argument is the one that should specify the page access
rights.

This patch fixes the manpage to describe how the code behaves.

Signed-off-by: Breno Leitao <leitao-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 man2/pkey_alloc.2 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man2/pkey_alloc.2 b/man2/pkey_alloc.2
index 8e701961c..858f64ce6 100644
--- a/man2/pkey_alloc.2
+++ b/man2/pkey_alloc.2
@@ -40,6 +40,12 @@ allocates a protection key (pkey) and allows it to be passed to
 The
 .BR pkey_alloc ()
 .I flags
+argument is still not supported and should be set to "0".
+.PP
+The
+.BR pkey_alloc ()
+.I access_rights
+.BR
 argument may contain zero or more disable operations:
 .TP
 .B PKEY_DISABLE_ACCESS
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
