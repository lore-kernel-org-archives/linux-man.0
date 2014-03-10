From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 60749] Do not need to link against -lm for fabs*()
Date: Mon, 10 Mar 2014 13:26:07 +0000
Message-ID: <bug-60749-11311-DKe2IumCid@https.bugzilla.kernel.org/>
References: <bug-60749-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-60749-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60749

--- Comment #4 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Walter Harms pointed out on linux-man that what is going on here is that
gcc implements some functions (many of them are math functions) as built-ins.
There is a list here: http://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html
When the function is a compiled as a gcc built-in, then it is not
necessary link against the corresponding library.

However, I'm unwilling to add that level of detail about a specific
compiler to the various manual pages.


On Thu, Aug 15, 2013 at 10:36 PM,  <bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org> wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=60749
>
>             Bug ID: 60749
>            Summary: Do not need to link against -lm for fabs*()
>            Product: Documentation
>            Version: unspecified
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: low
>           Priority: P1
>          Component: man-pages
>           Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
>           Reporter: orion-CVdf0l11yl+B+jHODAdFcQ@public.gmane.org
>         Regression: No
>
> From the fabs(3) man page:
>
> SYNOPSIS
>        #include <math.h>
>
>        double fabs(double x);
>        float fabsf(float x);
>        long double fabsl(long double x);
>
>        Link with -lm.
>
>
> At least on RHEL5+ one does not appear to need to link with -lm.
>
> # cat fabs.c
> #include <math.h>
> #include <stdlib.h>
> #include <stdio.h>
>
> int main(int argc, char **argv)
> {
>    printf("%f\n",fabs(atof(argv[1])));
>    printf("%f\n",fabsf((float)atof(argv[1])));
>    printf("%Lf\n",fabsl((long double)atof(argv[1])));
>    return 0;
> }
> # gcc -g -Wall fabs.c
> # ./a.out -2.5
> 2.500000
> 2.500000
> 2.500000
> # gcc -v
> Using built-in specs.
> Target: x86_64-redhat-linux
> Configured with: ../configure --prefix=/usr --mandir=/usr/share/man
> --infodir=/usr/share/info --enable-shared --enable-threads=posix
> --enable-checking=release --with-system-zlib --enable-__cxa_atexit
> --disable-libunwind-exceptions --enable-libgcj-multifile
> --enable-languages=c,c++,objc,obj-c++,java,fortran,ada --enable-java-awt=gtk
> --disable-dssi --disable-plugin
> --with-java-home=/usr/lib/jvm/java-1.4.2-gcj-1.4.2.0/jre --with-cpu=generic
> --host=x86_64-redhat-linux
> Thread model: posix
> gcc version 4.1.2 20080704 (Red Hat 4.1.2-54)
>
> --
> You are receiving this mail because:
> You are watching the assignee of the bug.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
