From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] futex.2: casting utime to uint32_t
Date: Mon, 13 Apr 2015 20:50:18 +0200
Message-ID: <1428951018-5770-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The kernel uses the following cast:

  if (cmd == FUTEX_REQUEUE || cmd == FUTEX_CMP_REQUEUE ||
      cmd == FUTEX_CMP_REQUEUE_PI || cmd == FUTEX_WAKE_OP)
    val2 = (u32) (unsigned long) utime;

This ensures that always the least significant four bytes of the
pointer are used, both on ILP32 and LP64 systems.

On a big endian system a simple cast from 64 bit pointer to 32 bit
integer would return the most significant four bytes.

We have to make the reader of the man-page aware of the usage of the
least significant bytes.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/futex.2 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/man2/futex.2 b/man2/futex.2
index 9fd8a51..7732822 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -136,11 +136,13 @@ argument is a pointer to a
 .IR timespec
 structure that specifies a timeout for the operation.
 However,  notwithstanding the prototype shown above, for some operations,
-this argument is instead a four-byte integer whose meaning
+the least significant four bytes are used as an integer whose meaning
 is determined by the operation.
 For these operations, the kernel casts the
 .I timeout
-value to
+value first to
+.IR "unsigned long",
+then to
 .IR uint32_t ,
 and in the remainder of this page, this argument is referred to as
 .I val2
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
