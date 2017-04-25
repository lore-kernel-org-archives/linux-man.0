From: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/5] {ioctl_}userfaultfd.2: initial updates for 4.11
Date: Tue, 25 Apr 2017 19:29:03 +0300
Message-ID: <1493137748-32452-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

These patches are some kind of brief highlights of the changes to the
userfaultfd pages.
The changes to userfaultfd functionality are also described at update to
Documentation/vm/userfaultfd.txt [1].

In general, there were three major additions:
* hugetlbfs support
* shmem support
* non-page fault events

I think we should add some details about using userfaultfd with different
memory types, describe meaning of each feature bits and add some text about
the new events.

I haven't updated 'struct uffd_msg' yet, and I hesitate whether it's
description belongs to userfaultfd.2 or ioctl_userfaultfd.2

As for the userfaultfd.7 we've discussed earlier, I believe it would
repeat Documentation/vm/userfaultfd.txt in way, so I'm not really sure it
is required.

--
Sincerely yours,
Mike.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5a02026d390ea1bb0c16a0e214e45613a3e3d885

Mike Rapoport (5):
  userfaultfd.2: describe memory types that can be used from 4.11
  ioctl_userfaultfd.2: describe memory types that can be used from 4.11
  ioctl_userfaultfd.2: update UFFDIO_API description
  userfaultfd.2: add Linux container migration use-case to NOTES
  usefaultfd.2: add brief description of "non-cooperative" mode

 man2/ioctl_userfaultfd.2 | 46 ++++++++++++++++++++++++++++++++++++++--------
 man2/userfaultfd.2       | 25 ++++++++++++++++++++++---
 2 files changed, 60 insertions(+), 11 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
