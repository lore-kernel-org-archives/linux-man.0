From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 00/24] Yet more prototype fixes
Date: Wed, 21 May 2014 16:57:31 +0200
Message-ID: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Here's another round of prototype fixes, with various other small
things mixed in.

Rasmus Villemoes (24):
  inet.3: Fix prototype
  makecontext.3: Fix prototype
  makedev.3: Fix prototype
  malloc_trim.3: Fix prototype
  mq_getattr.3: Fix prototype
  perror.3: Fix declaration
  pthread_sigqueue.3: Include needed header
  pthread_attr_set*.3: Constify parameters
  pthread_cleanup_push_defer_np.3: Mention feature test macro
  pthread_setname_np.3: Fix prototype
  pthread_setschedparam.3: Fix prototypes
  pthread_setschedprio.3: Fix prototype
  rcmd.3: Fix prototypes
  re_comp.3: Fix prototypes
  rexec.3: Fix prototypes
  rtime.3: Replace header
  resolver.3: Fix prototypes and extern-declaration
  scandir.3: Fix prototypes
  sigvec.3: Fix prototype
  setnetgrent.3: Fix prototype
  tsearch.3: Fix prototype
  getauxval.3: Fix permissions
  key_setsecret.3: Fix prototypes
  xdr.3: tfix

 man3/getauxval.3                     |  0
 man3/inet.3                          |  2 +-
 man3/key_setsecret.3                 |  6 +++---
 man3/makecontext.3                   |  2 +-
 man3/makedev.3                       |  2 +-
 man3/malloc_trim.3                   |  2 +-
 man3/mq_getattr.3                    |  2 +-
 man3/perror.3                        |  4 ++--
 man3/pthread_attr_setaffinity_np.3   |  2 +-
 man3/pthread_attr_setdetachstate.3   |  2 +-
 man3/pthread_attr_setguardsize.3     |  2 +-
 man3/pthread_attr_setinheritsched.3  |  2 +-
 man3/pthread_attr_setschedparam.3    |  2 +-
 man3/pthread_attr_setschedpolicy.3   |  2 +-
 man3/pthread_attr_setscope.3         |  2 +-
 man3/pthread_attr_setstack.3         |  2 +-
 man3/pthread_attr_setstackaddr.3     |  2 +-
 man3/pthread_attr_setstacksize.3     |  2 +-
 man3/pthread_cleanup_push_defer_np.3 |  1 +
 man3/pthread_setname_np.3            |  2 +-
 man3/pthread_setschedparam.3         |  8 ++++----
 man3/pthread_setschedprio.3          |  2 +-
 man3/pthread_sigqueue.3              | 12 +++---------
 man3/rcmd.3                          |  6 +++---
 man3/re_comp.3                       |  4 ++--
 man3/resolver.3                      | 16 ++++++++--------
 man3/rexec.3                         |  8 ++++----
 man3/rtime.3                         |  2 +-
 man3/scandir.3                       |  4 ++--
 man3/setnetgrent.3                   |  2 +-
 man3/sigvec.3                        |  2 +-
 man3/tsearch.3                       |  2 +-
 man3/xdr.3                           |  2 +-
 33 files changed, 54 insertions(+), 59 deletions(-)
 mode change 100755 => 100644 man3/getauxval.3

-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
