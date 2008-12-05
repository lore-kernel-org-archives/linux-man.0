From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] man3/fopencookie.3: Add missing _GNU_SOURCE requirement
Date: Fri, 5 Dec 2008 11:34:38 -0500
Message-ID: <cfd18e0f0812050834v74b425c1o378a16eb9728b9e5@mail.gmail.com>
References: <20081204232240.GH10491@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081204232240.GH10491-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Petr,

On Thu, Dec 4, 2008 at 6:22 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
>
> diff --git a/man3/fopencookie.3 b/man3/fopencookie.3
> index a69db65..5aadf04 100644
> --- a/man3/fopencookie.3
> +++ b/man3/fopencookie.3
> @@ -26,6 +26,7 @@
>  fopencookie \- opening a custom stream
>  .SH SYNOPSIS
>  .nf
> +.B #define _GNU_SOURCE
>  .B #include <stdio.h>
>
>  .BI "FILE *fopencookie(void *" cookie ", const char *" mode ,
> @@ -432,6 +433,7 @@ main(int argc, char *argv[])
>  .fi
>  .SH SEE ALSO
>  .BR fclose (3),
> +.BR feature_test_macros (7),

Good spotting to add this, but I moved it to the end of the list.  See
previous mail.

>  .BR fmemopen (3),
>  .BR fopen (3),
>  .BR fseek (3)

Changes applies for 3.15.

Thanks!

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
