From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] futex.7: SEE ALSO
Date: Mon, 16 Feb 2015 16:42:13 +0100
Message-ID: <1424101333-19091-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

futex.7 is meant as overview of the usage of futexes. It should
point to the related man-pages.

pthreads are the main usage of futexes, refer to pthread.7.
Implementation of robust futexes requires knowledge of set_robust_list.2
and get_robust_list.2.
It is noworthy that a closing thread can wake up a futex. Hence mention
clone.2 and set_tid_address.2.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man7/futex.7 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man7/futex.7 b/man7/futex.7
index 2be1511..87d2997 100644
--- a/man7/futex.7
+++ b/man7/futex.7
@@ -115,7 +115,12 @@ primitives; it is by no means the only one.
 .\" Rusty Russell (IBM Linux Technology Center).
 .\" This page written by bert hubert.
 .SH SEE ALSO
-.BR futex (2)
+.BR clone (2),
+.BR futex (2),
+.BR get_robust_list (2),
+.BR set_robust_list (2),
+.BR set_tid_address (2),
+.BR pthreads (7)
 
 .IR "Fuss, Futexes and Furwocks: Fast Userlevel Locking in Linux"
 (proceedings of the Ottawa Linux Symposium 2002),
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
