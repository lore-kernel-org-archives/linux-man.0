From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] pthread_attr_setdetachstate.3, pthread_attr_setschedparam.3,
	pthread_attr_setschedpolicy.3: Argument name is 'attr', not 'thread'
Date: Mon, 1 Feb 2010 21:55:46 +0100
Message-ID: <7b3bdec71002011255h2cc49a05kee38dd611e0732e9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Subject says it all; in those 3 pages, function argument is 'attr' but
it has been misnamed as 'thread' in description.

Denis

>From 63154fb092db324e2a50912b31a92b87b54c665b Mon Sep 17 00:00:00 2001
From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sun, 31 Jan 2010 21:53:31 +0100
Subject: [PATCH] pthread_attr_setdetachstate.3,
pthread_attr_setschedparam.3, pthread_attr_setschedpolicy.3: Argument
name is 'attr', not 'thread'

---
 man3/pthread_attr_setdetachstate.3 |    2 +-
 man3/pthread_attr_setschedparam.3  |    2 +-
 man3/pthread_attr_setschedpolicy.3 |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/pthread_attr_setdetachstate.3
b/man3/pthread_attr_setdetachstate.3
index cf130da..31908c3 100644
--- a/man3/pthread_attr_setdetachstate.3
+++ b/man3/pthread_attr_setdetachstate.3
@@ -40,7 +40,7 @@ The
 .BR pthread_attr_setdetachstate ()
 function sets the detach state attribute of the
 thread attributes object referred to by
-.IR thread
+.IR attr
 to the value specified in
 .IR detachstate .
 The detach state attribute determines whether a thread created using
diff --git a/man3/pthread_attr_setschedparam.3
b/man3/pthread_attr_setschedparam.3
index df36e84..ad10fbd 100644
--- a/man3/pthread_attr_setschedparam.3
+++ b/man3/pthread_attr_setschedparam.3
@@ -40,7 +40,7 @@ The
 .BR pthread_attr_setschedparam ()
 function sets the scheduling parameter attributes of the
 thread attributes object referred to by
-.IR thread
+.IR attr
 to the values specified in the buffer pointed to by
 .IR param .
 These attributes determine the scheduling parameters of
diff --git a/man3/pthread_attr_setschedpolicy.3
b/man3/pthread_attr_setschedpolicy.3
index 478d576..69a3458 100644
--- a/man3/pthread_attr_setschedpolicy.3
+++ b/man3/pthread_attr_setschedpolicy.3
@@ -40,7 +40,7 @@ The
 .BR pthread_attr_setschedpolicy ()
 function sets the scheduling policy attribute of the
 thread attributes object referred to by
-.IR thread
+.IR attr
 to the value specified in
 .IR policy .
 This attribute determines the scheduling policy of
-- 
1.7.0.rc1.7.gc0da5
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
