From: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH man-pages 0/2] some more userfault pages updates
Date: Thu, 27 Apr 2017 17:14:32 +0300
Message-ID: <1493302474-4701-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

Here are some more updates to {ioctl_}userfaultfd.2 pages.

Mike Rapoport (2):
  userfaultfd.2: start documenting non-cooperative events
  ioctl_userfaultfd.2: start adding details about userfaultfd features

 man2/ioctl_userfaultfd.2 |  53 ++++++++++++++++++-
 man2/userfaultfd.2       | 135 ++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 179 insertions(+), 9 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
