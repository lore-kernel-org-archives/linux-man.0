From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/15] Updates of in-kernel documentation pointers
Date: Mon, 11 Sep 2017 05:03:47 +0200
Message-ID: <20170911030347.GA24854@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

I've noticed that some of Linux kernel in-tree documentation pointers
are no longer valid and decided to check the validity for the rest of
them with some one-liner. As it turned out, there are quite a few of
them, in part due to latest ReST conversion effort. This patch set aims
at amending documentation pointers that are no longer valid with the
information about current location. I'm not quite sure about
wording/formatting, and do not guarantee that I haven't miss anything,
so I hope that this could be at least useful as a starting point.

Eugene Syromyatnikov (15):
  add_key.2, request_key.2, keyrings.7: update Linux documentation
    pointers
  prctl.2, ptrace.2: update pointer to in-kernel Yama documentation
  prctl.2: update pointer to in-kernel no_new_privs flag documentation
  prctl.2, seccomp.2: update pointer to in-kernel seccomp documentation
  unshare.2: update pointer to in-kernel unshare documentation
  initrd.4: update pointer to in-kernel root over NFS documentation
  initrd.4, proc.5, bootparam.7: update pointer to in-kernel initrd
    documentation
  proc.5: document removal of htab-reclaim sysctl file
  proc.5: document removal of timer_stats file
  proc.5: update pointer to in-kernel security keys documentation
  proc.5: update reference to kernel's crypto API documentation
  proc.5: update pointer to in-kernel MTRR documentation
  proc.5: update pointer to in-kernel SysRq documentation
  cpuset.7: update pointer to in-kernel cpusets documentation
  unicode.7: update pointer to in-kernel Unicode terminal support
    documentation

 man2/add_key.2     |  8 +++++++-
 man2/prctl.2       | 18 +++++++++++++++---
 man2/ptrace.2      |  4 ++++
 man2/request_key.2 |  8 +++++++-
 man2/seccomp.2     |  6 +++++-
 man2/unshare.2     |  6 +++++-
 man4/initrd.4      | 14 +++++++++++++-
 man5/proc.5        | 54 ++++++++++++++++++++++++++++++++++++++++++++----------
 man7/bootparam.7   |  6 +++++-
 man7/cpuset.7      |  6 +++++-
 man7/keyrings.7    |  4 +++-
 man7/unicode.7     |  6 +++++-
 12 files changed, 118 insertions(+), 22 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
