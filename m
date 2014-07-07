From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] pipe.2: PIPE_BUF is defined in limits.h
Date: Mon, 07 Jul 2014 08:47:21 +0200
Message-ID: <53BA4279.4030206@gmail.com>
References: <1404654251-8293-1-git-send-email-eliedebrauwer@gmail.com> <1404654251-8293-2-git-send-email-eliedebrauwer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404654251-8293-2-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/06/2014 03:44 PM, Elie De Brauwer wrote:
> To make use of PIPE_BUF in an application one should include limits.h.
> Adding a reference to this inclusion.

Thanks, Elie. Applied.

Cheers,

Michael


> Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man2/pipe.2 | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/man2/pipe.2 b/man2/pipe.2
> index a5ed2ea..7f1a1d0 100644
> --- a/man2/pipe.2
> +++ b/man2/pipe.2
> @@ -98,6 +98,10 @@ Writes of greater than
>  bytes (see
>  .BR pipe (7))
>  will be split into multiple packets.
> +The constant
> +.BR PIPE_BUF
> +is defined in
> +.IR <limits.h> .
>  .IP *
>  If a
>  .BR read (2)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
