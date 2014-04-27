From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] sigaction.2 - bad cross-reference
Date: Sun, 27 Apr 2014 11:45:51 +0200
Message-ID: <535CD1CF.9050103@gmail.com>
References: <201404262047.s3QKljjh003218@sdf.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201404262047.s3QKljjh003218-WF+c3Tt1nJM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Curry <rlwinm-WF+c3Tt1nJM@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/26/2014 10:47 PM, Alan Curry wrote:
> The syscall that reports child CPU usage is times(2), not time(2)
> 
> --- a/man2/sigaction.2	2014-04-20 04:06:16.000000000 -0500
> +++ b/man2/sigaction.2	2014-04-26 15:39:35.087503556 -0500
> @@ -366,7 +366,7 @@
>  these fields do not include the times used by waited-for children (unlike
>  .BR getrusage (2)
>  and
> -.BR time (2)).
> +.BR times (2)).
>  In kernels up to 2.6, and since 2.6.27, these fields report
>  CPU time in units of
>  .IR sysconf(_SC_CLK_TCK) .

Thanks, Alan. Applied.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
