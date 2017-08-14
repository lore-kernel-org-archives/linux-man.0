From: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/2] ioctl_userfaultfd.2: document replacement of ENOSPC with ESRCH
Date: Mon, 14 Aug 2017 17:51:19 +0300
Message-ID: <1502722279-13861-3-git-send-email-rppt@linux.vnet.ibm.com>
References: <1502722279-13861-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502722279-13861-1-git-send-email-rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Since Linux 4.13 we return ESRCH instead of ENOSPC when the faulting
process exits during UFFDIO_{COPY/ZEROPAGE} operation.

Signed-off-by: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 man2/ioctl_userfaultfd.2 | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
index 14260fc..f83ef65 100644
--- a/man2/ioctl_userfaultfd.2
+++ b/man2/ioctl_userfaultfd.2
@@ -489,7 +489,12 @@ its virtual memory layout simultaneously with an outstanding
 .I UFFDIO_COPY
 operation.
 .TP
-.BR ENOSPC " (since Linux 4.11)"
+.BR ENOSPC " (since Linux 4.11 till Linux 4.13)"
+The faulting process has exited at the time of a
+.I UFFDIO_COPY
+operation.
+.TP
+.BR ESRCH " (since Linux 4.13)"
 The faulting process has exited at the time of a
 .I UFFDIO_COPY
 operation.
@@ -575,6 +580,11 @@ was zero; or the range specified was invalid.
 An invalid bit was specified in the
 .IR mode
 field.
+.TP
+.BR ESRCH " (since Linux 4.13)"
+The faulting process has exited at the time of a
+.I UFFDIO_ZEROPAGE
+operation.
 .\"
 .SS UFFDIO_WAKE
 (Since Linux 4.3.)
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
