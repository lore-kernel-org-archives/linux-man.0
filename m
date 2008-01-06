From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] strptime.3: add #define to example to avoid implicit declaration of strptime
Date: Sun, 6 Jan 2008 11:11:37 +0100
Message-ID: <cfd18e0f0801060211k72326c66n400bcf81dc15d4aa@mail.gmail.com>
References: <20080106030415.GA32688@tapir>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080106030415.GA32688@tapir>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Marcelo Arenas Belon <carenas-kLeDWSohozoJb6fo7hG9ng@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Jan 6, 2008 4:04 AM, Carlo Marcelo Arenas Belon
<carenas-kLeDWSohozoJb6fo7hG9ng@public.gmane.org> wrote:
> The example doesn't follow the guidelines given in the description and will
> result in the following warning if compiled :
>
>  In function 'main':
>  13: warning: implicit declaration of function 'strptime'

Hi Carlo,

Thanks for your report. _GNU_SOURCE will do the job, but as documented
in the man page, _XOPEN_SOURCE is the precise macro required.  So I
added that to the example program.  The change will be in
man-pages-2.76.
Cheers,

Michael

> ---
> diff -urp man-pages-2.74/man3/strptime.3 man-pages-2.74/man3/strptime.3
> --- man-pages-2.74/man3/strptime.3      2007-12-20 04:13:45.000000000 -0800
> +++ man-pages-2.74/man3/strptime.3      2008-01-05 18:46:04.000000000 -0800
> @@ -384,6 +384,7 @@ and
>  .BR strftime (3).
>  .sp
>  .nf
> +#define _GNU_SOURCE
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <time.h>
>



-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
-
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
