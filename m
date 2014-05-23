From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] shmget.2: wfix
Date: Fri, 23 May 2014 15:51:23 +0200
Message-ID: <537F525B.5020405@gmail.com>
References: <1400852558-10067-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400852558-10067-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/23/2014 03:42 PM, Simon Paillard wrote:
> The section is about failures, no need to recall this for that specific
> error code.

Yup, fair enough. Applied. Thanks, Simon.

Cheers,

Michael



> ---
>  man2/shmget.2 | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/man2/shmget.2 b/man2/shmget.2
> index 44e3daa..f781048 100644
> --- a/man2/shmget.2
> +++ b/man2/shmget.2
> @@ -214,8 +214,7 @@ or greater than
>  .BR SHMMAX .
>  .TP
>  .B EINVAL
> -(The call did not create a new segment and)
> -a segment for the given
> +A segment for the given
>  .I key
>  exists, but \fIsize\fP is greater than the size
>  of that segment.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
