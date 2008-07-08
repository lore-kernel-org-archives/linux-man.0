From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] ioprio_set.2: CAP_SYS_ADMIN is not reqd to set IOPRIO_CLASS_IDLE anymore
Date: Tue, 8 Jul 2008 09:17:26 +0200
Message-ID: <cfd18e0f0807080017y56441677wdf8163c520e8103f@mail.gmail.com>
References: <200807081207.39693.knikanth@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200807081207.39693.knikanth-l3A5Bk7waGM@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikanth Karthikesan <knikanth-l3A5Bk7waGM@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Jul 8, 2008 at 8:37 AM, Nikanth Karthikesan <knikanth-l3A5Bk7waGM@public.gmane.org> wrote:
> Since linux-2.6.25 CAP_SYS_ADMIN capability is not required to set
> IOPRIO_CLASS_IDLE.
>
> Signed-off-by: Nikanth Karthikesan <knikanth-l3A5Bk7waGM@public.gmane.org>
>
> ---
>  man2/ioprio_set.2 |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> Index: b/man2/ioprio_set.2
> ===================================================================
> --- a/man2/ioprio_set.2
> +++ b/man2/ioprio_set.2
> @@ -293,11 +293,12 @@ capability can change the priority of an
>  .B "What is the desired priority"
>  Attempts to set very high priorities
>  .RB ( IOPRIO_CLASS_RT )
> -or very low ones
> -.RB ( IOPRIO_CLASS_IDLE )
>  require the
>  .B CAP_SYS_ADMIN
> -capability.
> +capability. Kernel versions till 2.6.24 require
> +.B CAP_SYS_ADMIN
> +capability even to set very low priority
> +.RB ( IOPRIO_CLASS_IDLE ).

Hi Nikanth,

Thanks for this!

I'll reword this as

==
Attempts to set very high priorities
.RB ( IOPRIO_CLASS_RT )
require the
.B CAP_SYS_ADMIN
capability.
Kernel versions up to 2.6.24 also required
B CAP_SYS_ADMIN
to set very low priority
.RB ( IOPRIO_CLASS_IDLE ),
but since Linux 2.6.24 this is no longer required.
==

Okay?

The change will be in man-pages-3.04.

Cheers,

Michael
-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
