From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 14/15] cpuset.7: update pointer to in-kernel cpusets
 documentation
Date: Mon, 11 Sep 2017 05:04:18 +0200
Message-ID: <20170911030418.GA30275@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The file has been moved in Linux commit v2.6.29-rc2~47.

* man7/cpuset.7 (.SH SEE ALSO): Add information about the location of
cpusets.txt since Linux 2.6.29.

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man7/cpuset.7 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/man7/cpuset.7 b/man7/cpuset.7
index 51ced57..0a4e665 100644
--- a/man7/cpuset.7
+++ b/man7/cpuset.7
@@ -1503,5 +1503,9 @@ syntax that works on any shell, but alas more obscurely, by using the
 .BR migratepages (8),
 .BR numactl (8)
 .PP
-.IR Documentation/cpusets.txt
+.IR Documentation/cgroup\-v1/cpusets.txt
 in the Linux kernel source tree
+.\" commit 45ce80fb6b6f9594d1396d44dd7e7c02d596fef8
+(or
+.IR Documentation/cpusets.txt
+before Linux 2.6.29)
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
