From: Julian Orth <ju.orth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] sched_setattr.2: Remove a const attribute
Date: Tue,  9 Jun 2015 14:11:41 +0200
Message-ID: <1433851901-25034-1-git-send-email-ju.orth@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julian Orth <ju.orth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The attr argument of sched_setattr was documented as const but the
kernel will modify the size field of this struct if it contains an
invalid value. See the documentation of the size field for details.
---
 man2/sched_setattr.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/sched_setattr.2 b/man2/sched_setattr.2
index dff8e6d..df14ab4 100644
--- a/man2/sched_setattr.2
+++ b/man2/sched_setattr.2
@@ -31,7 +31,7 @@ set and get scheduling policy and attributes
 .nf
 .B #include <sched.h>
 
-.BI "int sched_setattr(pid_t " pid ", const struct sched_attr *" attr ,
+.BI "int sched_setattr(pid_t " pid ", struct sched_attr *" attr ,
 .BI "                  unsigned int " flags );
 
 .BI "int sched_getattr(pid_t " pid ", struct sched_attr *" attr ,
-- 
2.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
