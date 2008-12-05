From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] man3/dlopen.3: Describe confusing dladdr() behavior
Date: Fri, 5 Dec 2008 03:44:52 +0100
Message-ID: <20081205024452.GM10491@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

dladdr() will act unexpectedly if called from non-pic code on a
compile-time-generated function pointer:

> #define _GNU_SOURCE
> #include <dlfcn.h>
> #include <stdio.h>
>
> int
> main(void)
> {
> 	void *func;
> 	Dl_info info = {};
>
> 	func = printf;
> 	dladdr(func, &info);
> 	printf("%s at %p resolved from %s\n", info.dli_sname,
> 			func, info.dli_fname);
>
> 	return 0;
> }

In the long term, it might make sense to make dladdr() recognize
plt pointers and recurse, but I'm too afraid of Ulrich ;-)
(and he seems to be heavy proponent of pic code anyway, so
the chances for that to be accepted probably aren't high).

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man3/dlopen.3 b/man3/dlopen.3
index d302360..649c449 100644
--- a/man3/dlopen.3
+++ b/man3/dlopen.3
@@ -30,8 +30,9 @@
 .\" Modified by Matt Domsch, 2003-04-09: _init and _fini obsolete
 .\" Modified by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2003-05-16.
 .\" Modified by Walter Harms: dladdr, dlvsym
+.\" Modified by Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, 2008-12-04: dladdr caveat
 .\"
-.TH DLOPEN 3 2008-10-27 "Linux" "Linux Programmer's Manual"
+.TH DLOPEN 3 2008-12-04 "Linux" "Linux Programmer's Manual"
 .SH NAME
 dladdr, dlclose, dlerror, dlopen, dlsym, dlvsym \- programming interface to
 dynamic linking loader
@@ -408,12 +409,37 @@ Since glibc 2.2.3,
 .BR atexit (3)
 can be used to register an exit handler that is automatically
 called when a library is unloaded.
+
 .SS History
 The dlopen interface standard comes from SunOS.
 That system also has
 .BR dladdr (),
 but not
 .BR dlvsym ().
+
+.SH BUGS
+Sometimes, the function pointers you pass to
+.BR dladdr ()
+may surprise you.  On some architectures (notably i386 and x86_64),
+.IR "dli_fname " and " dli_fbase"
+may end up pointing back at the object where you called
+.BR dladdr ()
+from, even if the function used as an argument should come from
+a dynamically linked library.
+.PP
+The problem is that the function pointer will still be resolved
+at the compile time, but point merely to the
+.I plt
+section of the original object (which dispatches the call after
+asking the dynamic linker to resolve the symbol).
+To work this around, you can try to compile the code to be
+position-independent: then, the compiler cannot prepare the pointer
+at the compile time anymore and today's gcc will just load
+the final symbol address from the
+.I GOT
+at runtime before passing it to
+.BR dladdr ().
+
 .SH EXAMPLE
 Load the math library, and print the cosine of 2.0:
 .nf
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
