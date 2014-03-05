From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getpriority.2: Adjust the process priority range
Date: Wed, 5 Mar 2014 15:17:46 +0100
Message-ID: <CAKgNAkjkmf94mp05Gqnh8SD2PnGvCZJcYwTS9mBDF9RYuDn75w@mail.gmail.com>
References: <1393992460-29062-1-git-send-email-andrew@digital-domain.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393992460-29062-1-git-send-email-andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Andrew,

On Wed, Mar 5, 2014 at 5:07 AM, Andrew Clayton
<andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org> wrote:
> The {get,set}priority man pages currently lists the process's priority
> range as being from 40..1 however it should be 40..0 as 0 would be for
> a nice of -20.


I don't think this is correct. Without actually re-checking the kernel
source, this is what I think is correct:

k-nice (the internal kernel value) has the range 40..1.
u-nice (the user-space value) has the range -20..+19

and u-nice = 20 - k-nice

(In fact, looking further down the man page, I see this is all
explained. Note that there is no +20 nice value on Linux.)

Cheers,

Michael


> Signed-off-by: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
> ---
>
> Perhaps the 40 should be 39 as the kernel seems to limit the nice range
> from -20 to 19 in kernel/sched/core.c::set_user_nice().
>
>  man2/getpriority.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/getpriority.2 b/man2/getpriority.2
> index b39bdcf..066cf75 100644
> --- a/man2/getpriority.2
> +++ b/man2/getpriority.2
> @@ -197,7 +197,7 @@ The actual priority range varies between kernel versions.
>  Linux before 1.3.36 had \-infinity..15.
>  Since kernel 1.3.43, Linux has the range \-20..19.
>  Within the kernel, nice values are actually represented
> -using the corresponding range 40..1
> +using the corresponding range 40..0
>  (since negative numbers are error codes) and these are the values
>  employed by the
>  .BR setpriority ()
> --
> 1.8.5.3
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
