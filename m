From: Waiman Long <Waiman.Long-ZPxbGqLxI0U@public.gmane.org>
Subject: [PATCH 0/2] futex: extend the futex(2) and futex(7) manpages for TP futexes
Date: Fri, 30 Sep 2016 17:27:42 -0400
Message-ID: <1475270864-51787-1-git-send-email-Waiman.Long@hpe.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Mike Galbraith <umgwanakikbuti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Low <jason.low2-ZPxbGqLxI0U@public.gmane.org>, Scott J Norton <scott.norton-ZPxbGqLxI0U@public.gmane.org>, Douglas Hatch <doug.hatch-ZPxbGqLxI0U@public.gmane.org>, Waiman Long <Waiman.Long-ZPxbGqLxI0U@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This patchset includes changes to the futex(2) and futex(7) manpages
to add descriptions for the new throughput-optimized (TP) futexes
that can be used to implement userspace mutexes.

This patchset includes a place holder (4.X) for the exact version that
the new TP futexes code is merged. That will be changed later on when 
it is known.

Waiman Long (2):
  futex.2: Add description about the FUTEX_LOCK/FUTEX_UNLOCK operations
  futex.7: Add description about the FUTEX_LOCK/FUTEX_UNLOCK operations

 man2/futex.2 |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
 man7/futex.7 |   22 ++++++++++++++++++++++
 2 files changed, 71 insertions(+), 0 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
