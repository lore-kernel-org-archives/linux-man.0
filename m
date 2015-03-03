From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mq_open.3: Add EINVAL error case for invalid name.
Date: Tue, 03 Mar 2015 08:27:47 +0100
Message-ID: <54F56273.1050202@gmail.com>
References: <20150228090402.GA23727@lira.corp.xrtc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150228090402.GA23727-LZG+QLMPa+1K62Tw8EOquqxOck334EZe@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Duncan Smith <Duncan-QHpCrFqKTQg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/28/2015 10:04 AM, Duncan Smith wrote:
> This behavior is implementation-defined by POSIX.  If the name doesn't
> start with a '/', glibc returns EINVAL without attempting the syscall.

Thanks, Duncan. Applied.

Cheers,

Michael


> ---
>  man3/mq_open.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/mq_open.3 b/man3/mq_open.3
> index e5f74d4..243aca0 100644
> --- a/man3/mq_open.3
> +++ b/man3/mq_open.3
> @@ -168,6 +168,11 @@ but a queue with this
>  already exists.
>  .TP
>  .B EINVAL
> +.I name
> +doesn't follow the format in
> +.BR mq_overview (7).
> +.TP
> +.B EINVAL
>  .B O_CREAT
>  was specified in
>  .IR oflag ,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
