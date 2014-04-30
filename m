From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 06/10] Add <sys/types.h> to synopsis of get_robust_list()
Date: Wed, 30 Apr 2014 21:42:38 +0200
Message-ID: <1398886962-10633-7-git-send-email-rv@rasmusvillemoes.dk>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

If one were to implement wrappers for [gs]et_robust_list() using the
given prototypes, one would also have to include sys/types.h to get
a definition of size_t.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man2/get_robust_list.2 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man2/get_robust_list.2 b/man2/get_robust_list.2
index 76453ea..377d7e4 100644
--- a/man2/get_robust_list.2
+++ b/man2/get_robust_list.2
@@ -32,6 +32,7 @@ get_robust_list, set_robust_list \- get/set list of robust futexes
 .SH SYNOPSIS
 .nf
 .B #include <linux/futex.h>
+.B #include <sys/types.h>
 .B #include <syscall.h>
 .sp
 .BI "long get_robust_list(int " pid ", struct robust_list_head **" head_ptr ,
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
