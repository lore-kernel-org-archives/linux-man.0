From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] man3/dlopen.3: Describe confusing dladdr() behavior
Date: Fri, 5 Dec 2008 17:55:28 -0500
Message-ID: <cfd18e0f0812051455s5b1800a2ve00dcb21cdd4baa1@mail.gmail.com>
References: <20081205024452.GM10491@machine.or.cz>
	 <cfd18e0f0812051450q438f9564w2f1aa7a82a993990@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0812051450q438f9564w2f1aa7a82a993990-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Petr,

Below the changelog entry and diff that I actually applied.

Cheers,

Michael


commit ce02f233b3e884fe1fa303d5694ead012b298410
Author: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Date:   Fri Dec 5 17:45:53 2008 -0500

    dlopen.3: Describe confusing dladdr() behavior

    dladdr() will act unexpectedly if called from non-pic code on a
    compile-time-generated function pointer:

        /* test_dladdr.c */

        #define _GNU_SOURCE
        #include <dlfcn.h>
        #include <stdio.h>

        int
        main(void)
        {
            void *func;
            Dl_info info = {};

            func = printf;
            dladdr(func, &info);
            printf("%s at %p resolved from %s\n", info.dli_sname,
                    func, info.dli_fname);

            return 0;
        }

        $ cc test_dladdr.c -ldl
        $ ./a.out
        printf at 0x804838c resolved from ./a.out
        $ cc -fPIC test_dladdr.c -ldl
        $ ./a.out
        _IO_printf at 0xb7f71c30 resolved from /lib/libc.so.6

    In the long term, it might make sense to make dladdr() recognize
    plt pointers and recurse, but I'm too afraid of Ulrich ;-)
    (and he seems to be heavy proponent of pic code anyway, so
    the chances for that to be accepted probably aren't high).

    Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
    Signed-off-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/man3/dlopen.3 b/man3/dlopen.3
index d302360..43fba7c 100644
--- a/man3/dlopen.3
+++ b/man3/dlopen.3
@@ -30,8 +30,9 @@
 .\" Modified by Matt Domsch, 2003-04-09: _init and _fini obsolete
 .\" Modified by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2003-05-16.
 .\" Modified by Walter Harms: dladdr, dlvsym
+.\" Modified by Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, 2008-12-04: dladdr caveat
 .\"
-.TH DLOPEN 3 2008-10-27 "Linux" "Linux Programmer's Manual"
+.TH DLOPEN 3 2008-12-05 "Linux" "Linux Programmer's Manual"
 .SH NAME
 dladdr, dlclose, dlerror, dlopen, dlsym, dlvsym \- programming interface to
 dynamic linking loader
@@ -414,6 +415,34 @@ That system also has
 .BR dladdr (),
 but not
 .BR dlvsym ().
+.SH BUGS
+Sometimes, the function pointers you pass to
+.BR dladdr ()
+may surprise you.
+On some architectures (notably i386 and x86_64),
+.I dli_fname
+and
+.I dli_fbase
+may end up pointing back at the object from which you called
+.BR dladdr (),
+even if the function used as an argument should come from
+a dynamically linked library.
+.PP
+The problem is that the function pointer will still be resolved
+at compile time, but merely point to the
+.I plt
+(procedure linkage table)
+section of the original object (which dispatches the call after
+asking the dynamic linker to resolve the symbol).
+To work this around, you can try to compile the code to be
+position-independent
+.RI ( "cc -fPIC" ): then, the compiler cannot prepare the pointer
+at compile time anymore and today's
+.BR gcc (1)
+will just load the final symbol address from the
+.I GOT
+(Global Offset Table) at run time before passing it to
+.BR dladdr ().
 .SH EXAMPLE
 Load the math library, and print the cosine of 2.0:
 .nf
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
