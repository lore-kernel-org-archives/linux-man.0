From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] small improvement for tcp.7
Date: Tue, 04 Feb 2014 09:26:40 +0100
Message-ID: <52F0A440.8060500@gmail.com>
References: <20140201182520.5c3ac952@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140201182520.5c3ac952-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks.

A request for the future: please title patches as per this form

[[atch] <page-name>: description

For example:

[patch] shmop.2: Add "(void *)" cast to RETURN VALUE

For simple patches that fix typos, just make the description "tfix".

Thus, the subject line for this patch would best be:

[patch] tcp.7: tfix

Thanks,

Michael


On 02/01/2014 03:25 PM, Yuri Kozlov wrote:
> Hello.
> diff --git a/man7/tcp.7 b/man7/tcp.7
> index 9cd7206..1f4346d 100644
> --- a/man7/tcp.7
> +++ b/man7/tcp.7
> @@ -898,7 +898,7 @@ Unprivileged processes are restricted to choosing one of th$
>  (described above).
>  Privileged processes
>  .RB ( CAP_NET_ADMIN )
> -processes can choose from any of the available congestion-control algorithms
> +can choose from any of the available congestion-control algorithms
>  (see the description of
>  .IR tcp_available_congestion_control
>  above).
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
