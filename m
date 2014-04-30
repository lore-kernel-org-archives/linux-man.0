From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 00/10] Fix various inconsistencies
Date: Wed, 30 Apr 2014 21:42:32 +0200
Message-ID: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

With the help of a perl script (which will be sent separately once
it's no longer as embarrassing as it is currently), I checked the
man2-pages for consistency with the actual installed headers.

Rasmus Villemoes (10):
  Fix return type of readlinkat()
  Fix prototype for stime()
  Fix prototypes for semop() and semtimedop()
  Fix prototypes for [sg]etpriority()
  Fix prototype for sched_setaffinity()
  Add <sys/types.h> to synopsis of get_robust_list()
  Fix prototype for mbind(2)
  Add <signal.h> to synopsis for ppoll()
  Fix prototype for set_mempolicy(2)
  Fix prototype for syscall(2)

 man2/get_robust_list.2   | 1 +
 man2/getpriority.2       | 4 ++--
 man2/mbind.2             | 6 +++---
 man2/poll.2              | 1 +
 man2/readlink.2          | 4 ++--
 man2/sched_setaffinity.2 | 2 +-
 man2/semop.2             | 6 +++---
 man2/set_mempolicy.2     | 4 ++--
 man2/stime.2             | 2 +-
 man2/syscall.2           | 2 +-
 10 files changed, 17 insertions(+), 15 deletions(-)

-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
