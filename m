From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Error with EXAMPLE for strptime(3) (found in release 3.21)
Date: Sat, 5 Dec 2009 07:51:55 +0100
Message-ID: <cfd18e0f0912042251g6d3c7ed7u5a1103d4c8ec0d57@mail.gmail.com>
References: <d539ea680911301317gbf313e0vf698b9ad1d136c0f@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d539ea680911301317gbf313e0vf698b9ad1d136c0f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Manley <doug.manley-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Doug,

On Mon, Nov 30, 2009 at 10:17 PM, Doug Manley <doug.manley-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> The example, as per the first paragraph under NOTES, should initializ=
e "tm"
> before working with it.

Thanks. Fixed for man-pages-3.24 (but I made the sizeof() into
"sizeof(struct tm)").

Cheers,

Michael


> EXAMPLE
> =A0=A0=A0=A0=A0=A0 The following example demonstrates the use of strp=
time() and
> strftime(3).
>
> =A0=A0=A0=A0=A0=A0 #define _XOPEN_SOURCE
> =A0=A0=A0=A0=A0=A0 #include <stdio.h>
> =A0=A0=A0=A0=A0=A0 #include <stdlib.h>
> +++=A0=A0=A0=A0=A0=A0 #include <string.h> // Needed for memset.
> =A0=A0=A0=A0=A0=A0 #include <time.h>
>
> =A0=A0=A0=A0=A0=A0 int
> =A0=A0=A0=A0=A0=A0 main(void)
> =A0=A0=A0=A0=A0=A0 {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct tm tm;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 char buf[255];
>
> +++ =A0=A0=A0=A0=A0=A0=A0=A0=A0 memset( &tm, 0, sizeof(tm) );
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 strptime("2001-11-12 18:31:01", "%Y-%m=
-%d %H:%M:%S", &tm);
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 strftime(buf, sizeof(buf), "%d %b %Y %=
H:%M", &tm);
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 puts(buf);
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exit(EXIT_SUCCESS);
> =A0=A0=A0=A0=A0=A0 }
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
