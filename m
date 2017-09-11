From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/15] unshare.2: update pointer to in-kernel unshare
 documentation
Date: Mon, 11 Sep 2017 05:03:58 +0200
Message-ID: <20170911030358.GA29935@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Linux commit v4.12-rc1~137^2~33^2 converted unshare documentation
(previously resided in Documentation/unshare.txt) to ReStructured
format, along with relocating it to
Documentation/userspace-api/unshare.rst.

* man2/unshare.2 (.SH SEE ALSO): Amend pointer to
Documentation/unshare.txt with change introduced in Linux 4.14 (move to
Documentation/userspace_api/unshare.rst).

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/unshare.2 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/man2/unshare.2 b/man2/unshare.2
index 8bf6487..9f0afab 100644
--- a/man2/unshare.2
+++ b/man2/unshare.2
@@ -489,5 +489,9 @@ main(int argc, char *argv[])
 .BR vfork (2),
 .BR namespaces (7)
 .PP
-.I Documentation/unshare.txt
+.I Documentation/userspace-api/unshare.rst
 in the Linux kernel source tree
+.\" commit f504d47be5e8fa7ecf2bf660b18b42e6960c0eb2
+(or
+.I Documentation/unshare.txt
+before Linux 4.12)
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
