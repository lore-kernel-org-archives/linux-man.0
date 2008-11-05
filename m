From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: pthread_create(3) - example bug + problems
Date: Wed, 5 Nov 2008 09:49:18 -0500
Message-ID: <cfd18e0f0811050649s630e1709nf03cee9c4982a433@mail.gmail.com>
References: <63134AC4-6552-4BFA-B9A6-D7D766DF07FE@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <63134AC4-6552-4BFA-B9A6-D7D766DF07FE-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Karsten Weiss <knweiss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[This time, really: CC += linux-man]

Hello Karsten,

On Fri, Oct 31, 2008 at 3:46 PM, Karsten Weiss <knweiss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Michael!
>
> I was just reading your man-pages 3.12 announcement on
> http://planet.kernel.org
> and noticed the new man page for pthread_create(3). I saw the example code
> at the end of the man page an decided to give it a try on my Mac.
> Unfortunately,
> it crashed immediately:
>
> $ ./pthread_test a b c
> Thread 2: top of stack near 0xb0102f6c; argv_string=b
> Thread 1: top of stack near 0xb0080f6c; argv_string=a
> Thread -1866982256: top of stack near 0xb0184f6c; argv_string=
> Bus error
>
> The bug is in this part of the code:
>
>    /* Allocate memory for pthread_create() arguments */
>
>    tinfo = calloc(num_threads, num_threads);
>    if (tinfo == NULL)
>        errExit("calloc");
>
> The calloc() line should read like this instead:
>
> tinfo = calloc(num_threads, sizeof(struct thread_info));
>                            ^^^^^^^^^^^^^^^^^^^^^^^^^^

D'oh!  Thanks.  That was thinko on my part that by chance didn't stop
the program working when I tested it.  (Or perhaps I made a botch up
editing the page after testing, since I see now that before the change
the test program happens still to work for some cases, but glibc
detects a memory corruption problem in other cases.)

I fixed that line as you suggest, for man-pages-3.13.

> Now the example works fine - even on my Mac:
>
> $ ./pthread_test a b c
> num_threads=3
> Thread 1: top of stack near 0xb0080f6c; argv_string=a
> Thread 2: top of stack near 0xb0102f6c; argv_string=b
> Thread 3: top of stack near 0xb0184f6c; argv_string=c
> Joined with thread 1; returned value was A
> Joined with thread 2; returned value was B
> Joined with thread 3; returned value was C
>
> Then tried to play with the stack size argument and noticed that this
> fails, too.
>
> A look in the pthread_set_stacksize man page on Mac revealed that on
> Mac the stack size must not only be at least PTHREAD_STACK_MIN...
>
> [
> So how about changing
>    if (stack_size > 0) {
> into
>    if (stack_size > PTHREAD_STACK_MIN) {
> (this also requires "include <limits.h>")
> ]

There's a good reason not to make this change: as the program stands
it lets people experiment with doing "the wrong thing" to see that it
really does cause an error return from the pthreads function.

> ...but the new stack size must also be a multiple of the system page
> size!
>
> From pthread_attr_setstacksize(3):
>
>     pthread_attr_setstacksize() will fail if:
>
>     [EINVAL]           Invalid value for attr.
>     [EINVAL]           stacksize is less than PTHREAD_STACK_MIN.
> !!!  [EINVAL]           stacksize is not a multiple of the system page size.
>
> See for yourself (PTHREAD_STACK_MIN==8192 on Mac OS X):
>
> $ ./pthread_test -s $((8192*10-1)) a
> pthread_attr_setstacksize: Invalid argument
> $ ./pthread_test -s $((8192*10)) a
> Thread 1: top of stack near 0xb0014f6c; argv_string=a
> Joined with thread 1; returned value was A
> $ ./pthread_test -s $((8192*10+1)) a
> pthread_attr_setstacksize: Invalid argument
>
> I don't know offhand if this is a POSIX requirement or a Mac OS X

(One can see the POSIX.1 requirements by reading the POSIX man pages
on Linux: "man 3p pthread_attr_setstacksize".  POSIX.1 does not impose
this requirement.  Offhand, I can't see such a requirement documented
on any other systems either; even FreeBSD does not document such a
restriction.)

> speciality but maybe it could be mentioned as a compatibility note?

So it looks like a MacOS-specific thing.  Still it's worth mentioning
in the man page.  For man-pages-3.13, I made this change:

--- a/man3/pthread_attr_setstacksize.3
+++ b/man3/pthread_attr_setstacksize.3
@@ -66,6 +66,15 @@ can fail with the following error:
 The stack size is less than
 .BR PTHREAD_STACK_MIN
 (16384) bytes.
+.PP
+On some systems,
+.\" e.g., MacOS
+.BR pthread_attr_setstacksize ()
+can fail with the error
+.B EINVAL
+if
+.I stacksize
+is not a multiple of the system page size.
 .SH VERSIONS
 These functions are provided by glibc since version 2.1.
 .SH CONFORMING TO

Thanks for making this test and reporting the result!

> Now for the most important part of this mail: Thank you so much for your
> man-page love! I *really* appreciate your great work!

You're welcome.  Please don't hesitate to make more reports and tests
in the future!

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
