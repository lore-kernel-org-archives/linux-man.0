From: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] ioctl_userfaultfd.2: update uffdio_api.features description
Date: Mon, 14 Aug 2017 17:51:18 +0300
Message-ID: <1502722279-13861-2-git-send-email-rppt@linux.vnet.ibm.com>
References: <1502722279-13861-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502722279-13861-1-git-send-email-rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

There is no requirement that uffdio_api.features must be zero for newer
kernels. This field actually defines what features user space would like to
enable.

Signed-off-by: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 man2/ioctl_userfaultfd.2 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
index f97b3ef..14260fc 100644
--- a/man2/ioctl_userfaultfd.2
+++ b/man2/ioctl_userfaultfd.2
@@ -86,7 +86,7 @@ structure, defined as:
 
 struct uffdio_api {
     __u64 api;        /* Requested API version (input) */
-    __u64 features;   /* Currently must be zero (input) */
+    __u64 features;   /* Requested features (input/output) */
     __u64 ioctls;     /* Available ioctl() operations (output) */
 };
 
@@ -665,4 +665,3 @@ operation that actually enables the desired features.
 
 .IR Documentation/vm/userfaultfd.txt
 in the Linux kernel source tree
