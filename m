From: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/2] ioctl_userfaultfd updates
Date: Mon, 14 Aug 2017 17:51:17 +0300
Message-ID: <1502722279-13861-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

Here are two small updates to ioctl_userfaultfd(2).

The first patch updates the description of uffdio_api.features field I've
sent a while ago, but it seems it was never applied.

The second patch reflects the recent API change [1].

[1] http://lkml.kernel.org/r/1502111545-32305-1-git-send-email-rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org 

Mike Rapoport (2):
  ioctl_userfaultfd.2: update uffdio_api.features description
  ioctl_userfaultfd.2: document replacement of ENOSPC with ESRCH

 man2/ioctl_userfaultfd.2 | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
