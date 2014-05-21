From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 08/24] pthread_attr_set*.3: Constify parameters
Date: Wed, 21 May 2014 16:57:39 +0200
Message-ID: <1400684275-20972-9-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Each of the pthread_attr_get* functions extract some piece of
information from a pthread_attr_t, which is passed by const
reference. Add the const keyword to the prototypes of these functions:

pthread_attr_getaffinity_np
pthread_attr_getdetachstate
pthread_attr_getguardsize
pthread_attr_getinheritsched
pthread_attr_getschedparam
pthread_attr_getschedpolicy
pthread_attr_getscope
pthread_attr_getstack
pthread_attr_getstackaddr
pthread_attr_getstacksize

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/pthread_attr_setaffinity_np.3  | 2 +-
 man3/pthread_attr_setdetachstate.3  | 2 +-
 man3/pthread_attr_setguardsize.3    | 2 +-
 man3/pthread_attr_setinheritsched.3 | 2 +-
 man3/pthread_attr_setschedparam.3   | 2 +-
 man3/pthread_attr_setschedpolicy.3  | 2 +-
 man3/pthread_attr_setscope.3        | 2 +-
 man3/pthread_attr_setstack.3        | 2 +-
 man3/pthread_attr_setstackaddr.3    | 2 +-
 man3/pthread_attr_setstacksize.3    | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/man3/pthread_attr_setaffinity_np.3 b/man3/pthread_attr_setaffinity_np.3
index e99cc58..4ae27d8 100644
--- a/man3/pthread_attr_setaffinity_np.3
+++ b/man3/pthread_attr_setaffinity_np.3
@@ -34,7 +34,7 @@ CPU affinity attribute in thread attributes object
 
 .BI "int pthread_attr_setaffinity_np(pthread_attr_t *" attr ,
 .BI "                   size_t " cpusetsize ", const cpu_set_t *" cpuset );
-.BI "int pthread_attr_getaffinity_np(pthread_attr_t *" attr ,
+.BI "int pthread_attr_getaffinity_np(const pthread_attr_t *" attr ,
 .BI "                   size_t " cpusetsize ", cpu_set_t *" cpuset );
 .sp
 Compile and link with \fI\-pthread\fP.
diff --git a/man3/pthread_attr_setdetachstate.3 b/man3/pthread_attr_setdetachstate.3
index dd43608..7e2f7ee 100644
--- a/man3/pthread_attr_setdetachstate.3
+++ b/man3/pthread_attr_setdetachstate.3
@@ -33,7 +33,7 @@ set/get detach state attribute in thread attributes object
 
 .BI "int pthread_attr_setdetachstate(pthread_attr_t *" attr \
 ", int " detachstate );
-.BI "int pthread_attr_getdetachstate(pthread_attr_t *" attr \
+.BI "int pthread_attr_getdetachstate(const pthread_attr_t *" attr \
 ", int *" detachstate );
 .sp
 Compile and link with \fI\-pthread\fP.
diff --git a/man3/pthread_attr_setguardsize.3 b/man3/pthread_attr_setguardsize.3
index 801aae9..ca06b42 100644
--- a/man3/pthread_attr_setguardsize.3
+++ b/man3/pthread_attr_setguardsize.3
@@ -33,7 +33,7 @@ attribute in thread attributes object
 
 .BI "int pthread_attr_setguardsize(pthread_attr_t *" attr \
 ", size_t " guardsize );
-.BI "int pthread_attr_getguardsize(pthread_attr_t *" attr \
+.BI "int pthread_attr_getguardsize(const pthread_attr_t *" attr \
 ", size_t *" guardsize );
 .sp
 Compile and link with \fI\-pthread\fP.
diff --git a/man3/pthread_attr_setinheritsched.3 b/man3/pthread_attr_setinheritsched.3
index a3e0e28..0f041f5 100644
--- a/man3/pthread_attr_setinheritsched.3
+++ b/man3/pthread_attr_setinheritsched.3
@@ -33,7 +33,7 @@ inherit-scheduler attribute in thread attributes object
 
 .BI "int pthread_attr_setinheritsched(pthread_attr_t *" attr ,
 .BI "                                 int " inheritsched );
-.BI "int pthread_attr_getinheritsched(pthread_attr_t *" attr ,
+.BI "int pthread_attr_getinheritsched(const pthread_attr_t *" attr ,
 .BI "                                 int *" inheritsched );
 .sp
 Compile and link with \fI\-pthread\fP.
diff --git a/man3/pthread_attr_setschedparam.3 b/man3/pthread_attr_setschedparam.3
index 9a478e8..c2f0506 100644
--- a/man3/pthread_attr_setschedparam.3
+++ b/man3/pthread_attr_setschedparam.3
@@ -33,7 +33,7 @@ scheduling parameter attributes in thread attributes object
 
 .BI "int pthread_attr_setschedparam(pthread_attr_t *" attr ,
 .BI "                               const struct sched_param *" param );
-.BI "int pthread_attr_getschedparam(pthread_attr_t *" attr ,
+.BI "int pthread_attr_getschedparam(const pthread_attr_t *" attr ,
 .BI "                               struct sched_param *" param );
 .sp
 Compile and link with \fI\-pthread\fP.
diff --git a/man3/pthread_attr_setschedpolicy.3 b/man3/pthread_attr_setschedpolicy.3
index 84b508a..59fe053 100644
--- a/man3/pthread_attr_setschedpolicy.3
+++ b/man3/pthread_attr_setschedpolicy.3
@@ -33,7 +33,7 @@ scheduling policy attribute in thread attributes object
 
 .BI "int pthread_attr_setschedpolicy(pthread_attr_t *" attr \
 ", int " policy );
-.BI "int pthread_attr_getschedpolicy(pthread_attr_t *" attr \
+.BI "int pthread_attr_getschedpolicy(const pthread_attr_t *" attr \
 ", int " *policy );
 .sp
 Compile and link with \fI\-pthread\fP.
diff --git a/man3/pthread_attr_setscope.3 b/man3/pthread_attr_setscope.3
index 2effe6b..837b105 100644
--- a/man3/pthread_attr_setscope.3
+++ b/man3/pthread_attr_setscope.3
@@ -33,7 +33,7 @@ attribute in thread attributes object
 
 .BI "int pthread_attr_setscope(pthread_attr_t *" attr \
 ", int " scope );
-.BI "int pthread_attr_getscope(pthread_attr_t *" attr \
+.BI "int pthread_attr_getscope(const pthread_attr_t *" attr \
 ", int *" scope );
 .sp
 Compile and link with \fI\-pthread\fP.
diff --git a/man3/pthread_attr_setstack.3 b/man3/pthread_attr_setstack.3
index e6ebb9f..66fd1ba 100644
--- a/man3/pthread_attr_setstack.3
+++ b/man3/pthread_attr_setstack.3
@@ -33,7 +33,7 @@ attributes in thread attributes object
 
 .BI "int pthread_attr_setstack(pthread_attr_t *" attr ,
 .BI "                          void *" stackaddr ", size_t " stacksize );
-.BI "int pthread_attr_getstack(pthread_attr_t *" attr ,
+.BI "int pthread_attr_getstack(const pthread_attr_t *" attr ,
 .BI "                          void **" stackaddr ", size_t *" stacksize );
 .sp
 Compile and link with \fI\-pthread\fP.
diff --git a/man3/pthread_attr_setstackaddr.3 b/man3/pthread_attr_setstackaddr.3
index 15331ca..e4d78ee 100644
--- a/man3/pthread_attr_setstackaddr.3
+++ b/man3/pthread_attr_setstackaddr.3
@@ -33,7 +33,7 @@ set/get stack address attribute in thread attributes object
 
 .BI "int pthread_attr_setstackaddr(pthread_attr_t *" attr \
 ", void *" stackaddr );
-.BI "int pthread_attr_getstackaddr(pthread_attr_t *" attr \
+.BI "int pthread_attr_getstackaddr(const pthread_attr_t *" attr \
 ", void **" stackaddr );
 .sp
 Compile and link with \fI\-pthread\fP.
diff --git a/man3/pthread_attr_setstacksize.3 b/man3/pthread_attr_setstacksize.3
index 95a9b4f..06e7c54 100644
--- a/man3/pthread_attr_setstacksize.3
+++ b/man3/pthread_attr_setstacksize.3
@@ -33,7 +33,7 @@ attribute in thread attributes object
 
 .BI "int pthread_attr_setstacksize(pthread_attr_t *" attr \
 ", size_t " stacksize );
-.BI "int pthread_attr_getstacksize(pthread_attr_t *" attr \
+.BI "int pthread_attr_getstacksize(const pthread_attr_t *" attr \
 ", size_t *" stacksize );
 .sp
 Compile and link with \fI\-pthread\fP.
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
