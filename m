From: Omar Sandoval <osandov-nWWhXC5lh1RBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] cgroups.7: tfix
Date: Fri, 30 Dec 2016 10:26:53 -0800
Message-ID: <a7d1da44d6003fc848baf286b5290fb8060fafea.1483121806.git.osandov@osandov.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Omar Sandoval <osandov-nWWhXC5lh1RBDgjK7y7TUQ@public.gmane.org>
---
 man7/cgroups.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/cgroups.7 b/man7/cgroups.7
index 2285725aa..bd0d2823d 100644
--- a/man7/cgroups.7
+++ b/man7/cgroups.7
@@ -248,7 +248,7 @@ For further information, see
 In Linux 3.2,
 this controller was extended to provide CPU "bandwidth" control.
 If the kernel is configured with
-.BR COONFIG_CFS_BANDWIDTH ,
+.BR CONFIG_CFS_BANDWIDTH ,
 then within each scheduling period
 (defined via a file in the cgroup directory), it is possible to define
 an upper limit on the CPU time allocated to the processes in a cgroup.
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
