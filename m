From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: strncpy, strcat and memalign
Date: Sun, 1 Aug 2010 01:10:24 +0100
Message-ID: <AANLkTimhujBTS5G_Q3BoFrVe1DKXsftrN14eMC5BD+di@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

I think these two man pages could be adjusted to use a consistent name
for "nul" terminators, that is '\0' in a const char * string.
http://linux.die.net/man/3/strncpy


this one consistently uses '\0'
http://linux.die.net/man/3/strcat

strncpy talks about '\0', "null-terminating", and "null byte"

IMHO "NUL" is the correct name to use, which is different again (N.B.
single L), compared to NULL (#define NULL (void*)0


Also this page seems to have lost formatting, this may only be the web
page generation though.


http://linux.die.net/man/3/memalign
Synopsis

#define _XOPEN_SOURCE 600#include <stdlib.h>
int posix_memalign(void **memptr, size_t alignment, size_t size);
#include <malloc.h>
void *valloc(size_t size);void *memalign(size_t boundary, size_t size);


See the #include is not on its own line after "XOPEN_SOURCE 600".
Likewise memalign should be on its own line.

Thank you for taking a look, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
