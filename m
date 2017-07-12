From: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] getpid.2: Note that caching is removed as of glibc 2.25.
Date: Wed, 12 Jul 2017 12:57:01 -0400
Message-ID: <f944b6ee-b279-3775-bcd1-200bf88e9af0@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Since glibc 2.25 the PID cache is removed.

Rationale given in the release notes:
https://sourceware.org/glibc/wiki/Release/2.25#pid_cache_removal
~~~
3.2.3. Calls to getpid are no longer cached

The PID cache used by glibc has been removed. In certain scenarios
 the cache was not 100% reliable and because of that it was deemed
 safer to remove the cache than to potentially return a wrong answer.

Applications performing getpid() calls in a loop will see the worst
 case performance degradation as the library call will perform a 
system call at each invocation. Such application uses were known 
to exist at least in OpenSSL (fork()-based PRNG invalidation), 
but supporting the performance of that specific invalidation 
mechanism was not judged to have sufficient value against 
immediate and long-term benefits of removing the cache.

Functional reasons exist for the PID cache removal including 
problems with PID namespaces, interoperability with raw system 
calls (BZ#17214, Chrome: Issue 800183004), and improvements to 
spawn (BZ#19957). Performance is actually increased in 
pthread_create() with the removal of the cache since the 
implementation no longer needs to perform an invalidation step.

Applications performing getpid() in a loop that need to do 
some level of fork()-based invalidation can instead use 
pthread_atfork() to register handlers to handle the invalidation. 
There is work-in-progress to make pthread_atfork() available 
to applications that do not link against libpthread.so 
(Provide pthread_atfork() without libpthread.so).

Other kinds of invalidation are not supported and the glibc 
community will actively look at a kernel assisted mechanism 
for state management across fork(), vfork(), clone() and other 
interfaces which can benefit from such semantics. It is the 
same type of solution required for crypto PRNG reset across 
such API calls. 
~~~

Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/man2/getpid.2 b/man2/getpid.2
index 1927607..45d71a6 100644
--- a/man2/getpid.2
+++ b/man2/getpid.2
@@ -112,6 +112,11 @@ for discussion of a case where
 may return the wrong value even when invoking
 .BR clone (2)
 via the glibc wrapper function.
+
+Since glibc version 2.25, the PID cache is removed, and calls to
+.BR getpid ()
+will not be cached.
+
 .SH SEE ALSO
 .BR clone (2),
 .BR fork (2),
-- 
Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
