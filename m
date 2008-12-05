From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] man3/dlopen.3: Describe confusing dladdr() behavior
Date: Fri, 5 Dec 2008 17:50:25 -0500
Message-ID: <cfd18e0f0812051450q438f9564w2f1aa7a82a993990@mail.gmail.com>
References: <20081205024452.GM10491@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081205024452.GM10491-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Petr,

Thanks for the patch!

On Thu, Dec 4, 2008 at 9:44 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> dladdr() will act unexpectedly if called from non-pic code on a
> compile-time-generated function pointer:
>
>> #define _GNU_SOURCE
>> #include <dlfcn.h>
>> #include <stdio.h>
>>
>> int
>> main(void)
>> {
>>       void *func;
>>       Dl_info info = {};
>>
>>       func = printf;
>>       dladdr(func, &info);
>>       printf("%s at %p resolved from %s\n", info.dli_sname,
>>                       func, info.dli_fname);
>>
>>       return 0;
>>

Thanks for the patch.  For the change log, I added sample runs.  See
my follow-up mail.

I've applied the patch pretty much as you gave it for 3.15.  Some
notes below, including a question or two.

> In the long term, it might make sense to make dladdr() recognize
> plt pointers and recurse, but I'm too afraid of Ulrich ;-)
> (and he seems to be heavy proponent of pic code anyway, so
> the chances for that to be accepted probably aren't high).
>
> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
>
> diff --git a/man3/dlopen.3 b/man3/dlopen.3
> index d302360..649c449 100644
> --- a/man3/dlopen.3
> +++ b/man3/dlopen.3
> @@ -30,8 +30,9 @@
>  .\" Modified by Matt Domsch, 2003-04-09: _init and _fini obsolete
>  .\" Modified by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2003-05-16.
>  .\" Modified by Walter Harms: dladdr, dlvsym
> +.\" Modified by Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, 2008-12-04: dladdr caveat
>  .\"
> -.TH DLOPEN 3 2008-10-27 "Linux" "Linux Programmer's Manual"
> +.TH DLOPEN 3 2008-12-04 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  dladdr, dlclose, dlerror, dlopen, dlsym, dlvsym \- programming interface to
>  dynamic linking loader
> @@ -408,12 +409,37 @@ Since glibc 2.2.3,
>  .BR atexit (3)
>  can be used to register an exit handler that is automatically
>  called when a library is unloaded.
> +

The convention in man-pages is not to add blank lines before .SS /
.SH.  Dropped.

>  .SS History
>  The dlopen interface standard comes from SunOS.
>  That system also has
>  .BR dladdr (),
>  but not
>  .BR dlvsym ().
> +

See above.

> +.SH BUGS
> +Sometimes, the function pointers you pass to
> +.BR dladdr ()
> +may surprise you.  On some architectures (notably i386 and x86_64),
> +.IR "dli_fname " and " dli_fbase"
> +may end up pointing back at the object where you called
> +.BR dladdr ()
> +from, even if the function used as an argument should come from
> +a dynamically linked library.
> +.PP
> +The problem is that the function pointer will still be resolved
> +at the compile time, but point merely to the
> +.I plt

(It would be kind here to explain what "plt" stand as for.  I added
"Procedure Linkage Table".)

> +section of the original object (which dispatches the call after
> +asking the dynamic linker to resolve the symbol).
> +To work this around, you can try to compile the code to be
> +position-independent:

I added: "gcc -fPIC" here

> then, the compiler cannot prepare the pointer
> +at the compile time anymore and today's gcc will just load

I made it "gcc(1)", but this doesn't seem quite right.  It's not gcc
in operation at program run time.  can you more precisely say what you
mean here.

> +the final symbol address from the
> +.I GOT

(I added "Global Offset Table")

> +at runtime before passing it to
> +.BR dladdr ().
> +
>  .SH EXAMPLE
>  Load the math library, and print the cosine of 2.0:
>  .nf

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
