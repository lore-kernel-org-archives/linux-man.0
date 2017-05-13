From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] sched_setaffinity.2: tfix
Date: Sat, 13 May 2017 13:14:04 +0200
Message-ID: <8bead30f-6ff4-a23a-54e1-b3478dd844d6@gmail.com>
References: <20170513103747.1341-1-jwilk@jwilk.net>
 <20170513103747.1341-2-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170513103747.1341-2-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/13/2017 12:37 PM, Jakub Wilk wrote:
> Remove duplicated word.

Thanks, Jakub. Applied.

Cheers,

Michael



> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man2/sched_setaffinity.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/sched_setaffinity.2 b/man2/sched_setaffinity.2
> index 93b6090b9..71d9512dc 100644
> --- a/man2/sched_setaffinity.2
> +++ b/man2/sched_setaffinity.2
> @@ -125,7 +125,7 @@ contains no processors that are currently physically on the system
>  and permitted to the thread according to any restrictions that
>  may be imposed by
>  .I cpuset
> -cgroups or the the "cpuset" mechanism described in
> +cgroups or the "cpuset" mechanism described in
>  .BR cpuset (7).
>  .TP
>  .B EINVAL
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
