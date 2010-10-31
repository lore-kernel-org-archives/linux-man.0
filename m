From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man crypt: #define __USE_XOPEN on 64-bit systems
Date: Sun, 31 Oct 2010 06:07:18 +0100
Message-ID: <AANLkTimnMY41v0cYV43JCjGpWLSqcx85AzENPpWjyEK=@mail.gmail.com>
References: <1288447730.1866.10.camel@hobbes>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1288447730.1866.10.camel@hobbes>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Lehmann <flo.lehmann-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Florian,

On Sat, Oct 30, 2010 at 4:08 PM, Florian Lehmann
<flo.lehmann-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Dear all,
>
> I am using
> Linux hobbes 2.6.35-22-generic #35-Ubuntu SMP Sat Oct 16 20:45:36 UTC
> 2010 x86_64 GNU/Linux
>
> with manpages
> Version: 3.24-1ubuntu1
>
> I was trying to run a simple c-program using the function crypt from
> unistd.h
>
> Tha manpages states to define the macro _XOPEN_SOURCE in order to use
> this function. This works fine on a 32-bit Version of Ubuntu 10.10. On
> the mentioned 54-bit system the program could not be compiled.
>
> On those systems you also have to define the macro __USE_XOPEN.
> I attached the program. Just compile with
> gcc -Wall crypter.c -lcrypt #will not work without __USE_XOPEN
>
> Thanks a lot and best regards from Ulm,

The problem is almost certainly that you didn't define _XOPEN_SOURCE
before including *any* header file. See feature_test_macros(7).

Reports like yours turn up with reasonable frequency, and clearly this
is a very common misunderstanding. I've tried to prevent it by
including a reference to feature_test_macros(7) in all pages where
feature test macros are used. That reference is always either in the
SEE ALSO section or in the SYNOPSIS.

Your report makes me reflect further on problem. I've made a change
which always places the reference to feature_test_macros(7) in the
SYNOPSIS section, to try and help the reader more easily find this
piece of information. The change will be in man-pages-3.30.

Thanks for your report!

MfG aus Muenchen,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
