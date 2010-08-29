From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: strncpy, strcat and memalign
Date: Sun, 29 Aug 2010 09:08:52 +0200
Message-ID: <AANLkTinYg=ke4ju2L+6aqGQNEvzB4JuomfFUrV9sRKkG@mail.gmail.com>
References: <AANLkTimhujBTS5G_Q3BoFrVe1DKXsftrN14eMC5BD+di@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimhujBTS5G_Q3BoFrVe1DKXsftrN14eMC5BD+di-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jon,

On Sun, Aug 1, 2010 at 2:10 AM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
>
> I think these two man pages could be adjusted to use a consistent name
> for "nul" terminators, that is '\0' in a const char * string.
> http://linux.die.net/man/3/strncpy

The HTML-rendered man pages at linux.die.net are created by someone
unknown to me. They are also years out of date.

For up-to-date HTML renderings, produced by me, see
http://www.kernel.org/doc/man-pages/online_pages.html

> this one consistently uses '\0'
> http://linux.die.net/man/3/strcat
>
> strncpy talks about '\0', "null-terminating", and "null byte"
>
> IMHO "NUL" is the correct name to use, which is different again (N.B.
> single L), compared to NULL (#define NULL (void*)0

(Take a look at up-to-date pages.)

I tend to avoid NUL, simply because it is so easy to visually confuse
with "NULL".

Other than that, I think the pages pretty consistently use '\0',
"terminating null byte", and "null-terminated string". I think this is
okay.

> Also this page seems to have lost formatting, this may only be the web
> page generation though.
>
>
> http://linux.die.net/man/3/memalign
> Synopsis
>
> #define _XOPEN_SOURCE 600#include <stdlib.h>
> int posix_memalign(void **memptr, size_t alignment, size_t size);
> #include <malloc.h>
> void *valloc(size_t size);void *memalign(size_t boundary, size_t size);
>
>
> See the #include is not on its own line after "XOPEN_SOURCE 600".
> Likewise memalign should be on its own line.

See comments above about the die.net pages.

Cheers,

Michael



> Thank you for taking a look, Jon
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
