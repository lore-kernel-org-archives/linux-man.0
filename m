From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] setenv.3, putenv.3: Elaborate on thread (non-)safety
Date: Wed, 24 Feb 2010 21:46:25 +0100
Message-ID: <20100224204625.GD19115@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Functions modifying the environment have the special property
of not only being thread-unsafe, but also making any function
_depending_ on the environment thread-unsafe. Document this
non-obvious fact, this keeps coming up in form of bugs filed
against glibc in distributions.

This could be somewhat infered from earlier POSIX specifications,
thankfully POSIX.2008 makes this official and explicit by this
paragraph:

http://www.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html#tag_15_09

"Since multi-threaded applications are not allowed to use the environ
variable to access or modify any environment variable while any other
thread is concurrently modifying any environment variable, any function
dependent on any environment variable is not thread-safe if another
thread is modifying the environment; see XSH exec."

It can be advised that multi-threaded applications should refrain
from modifying the environment altogether if at all possible.

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man3/putenv.3 b/man3/putenv.3
index a35c7ab..b944df3 100644
--- a/man3/putenv.3
+++ b/man3/putenv.3
@@ -111,6 +111,11 @@ This has been fixed in glibc 2.1.2.
 The 4.4BSD version, like glibc 2.0, uses a copy.
 .LP
 SUSv2 removes the \fIconst\fP from the prototype, and so does glibc 2.1.3.
+.LP
+This function is not thread-safe, and furthermore using it also makes
+many other functions thread-unsafe. See
+.BR setenv (3)
+for details.
 .SH "SEE ALSO"
 .BR clearenv (3),
 .BR getenv (3),
diff --git a/man3/setenv.3 b/man3/setenv.3
index c40705d..fef20d1 100644
--- a/man3/setenv.3
+++ b/man3/setenv.3
@@ -125,6 +125,24 @@ should fail with the error
 .BR EINVAL ;
 however, versions of glibc before 2.3.4 allowed an \(aq=\(aq sign in
 .IR name .
+.LP
+These functions are not thread-safe; furthermore, they have the special
+property of making many other functions thread-unsafe if they are used.
+If a function modifying the environment is called from any thread,
+it is not safe to call any function \fIdepending\fP on the environment
+from any other thread. This is due to the fact that
+.BR getenv (3)
+does not perform any locking while accessing the environment,
+for performance reasons.
+.LP
+Unfortunately, determining which functions depend on the environment
+can be challenging. E.g. it is not obvious that
+.BR syslog (3)
+depends on the environment (it needs to send a localtime timestamp,
+thus consults $TZ deep inside). Thus, modifying environment
+in multi-threaded applications should be avoided if at all possible,
+or special measures taken so that no non-obvious library functions
+get called meanwhile.
 .SH "SEE ALSO"
 .BR clearenv (3),
 .BR getenv (3),
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
