From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] cgroups.7: ffix
Date: Tue, 27 Dec 2016 14:30:50 -0500
Message-ID: <20161227193050.GA548@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man7/cgroups.7 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man7/cgroups.7 b/man7/cgroups.7
index d640210..2285725 100644
--- a/man7/cgroups.7
+++ b/man7/cgroups.7
@@ -156,7 +156,8 @@ all threads in the process).
 .\"
 .SS Mounting v1 controllers
 The use of cgroups requires a kernel built with the
-.BR CONFIG_CGROUP\option.
+.BR CONFIG_CGROUP
+option.
 In addition, each of the v1 controllers has an associated
 configuration option that must be set in order to employ that controller.
 
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
