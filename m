From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cpuset.7: tfix
Date: Sat, 21 Jun 2014 07:54:29 +0200
Message-ID: <53A51E15.6000708@gmail.com>
References: <1403327761-4115-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403327761-4115-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri. Applied.

Cheers,

Michael


On 06/21/2014 07:16 AM, Yuri Kozlov wrote:
> ---
>  man7/cpuset.7 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man7/cpuset.7 b/man7/cpuset.7
> index 3c74dac..1b89d79 100644
> --- a/man7/cpuset.7
> +++ b/man7/cpuset.7
> @@ -247,7 +247,7 @@ format of
>  Flag (0 or 1).
>  If set (1), the cpuset has exclusive use of
>  its memory nodes (no sibling or cousin may overlap).
> -Also if set (1), the cpuset is a \fBHardwall\fR cpuset (see below.)
> +Also if set (1), the cpuset is a \fBHardwall\fR cpuset (see below).
>  By default this is off (0).
>  Newly created cpusets also initially default this to off (0).
>  
> @@ -261,7 +261,7 @@ of that cpuset's parent cpuset.
>  .TP
>  .IR cpuset.mem_hardwall " (since Linux 2.6.26)"
>  Flag (0 or 1).
> -If set (1), the cpuset is a \fBHardwall\fR cpuset (see below.)
> +If set (1), the cpuset is a \fBHardwall\fR cpuset (see below).
>  Unlike \fBmem_exclusive\fR,
>  there is no constraint on whether cpusets
>  marked \fBmem_hardwall\fR may have overlapping
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
