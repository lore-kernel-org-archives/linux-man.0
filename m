From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: adjtimex.2: use italic for structure field
Date: Fri, 16 Jan 2015 07:47:52 +0100
Message-ID: <54B8B418.9000105@gmail.com>
References: <CALhU9tnq3iTe=Ta+z6yMG+BVotNgQC5=uaE4FCeG+HB-7bTgXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tnq3iTe=Ta+z6yMG+BVotNgQC5=uaE4FCeG+HB-7bTgXQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Akihiro. Applied.

Cheers,

Michael


On 01/15/2015 06:24 PM, Akihiro Motoki wrote:
> diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
> index ea94610..954ffb1 100644
> --- a/man2/adjtimex.2
> +++ b/man2/adjtimex.2
> @@ -195,7 +195,7 @@ which specifies an adjustment in microseconds.
>  .\" In kernel space there is ADJ_OFFSET_READONLY (0x2000) anded with
>  .\" ADJ_ADJTIME (0x8000) and ADJ_OFFSET_SINGLESHOT (0x0001) to give 0xa001)
>  Return (in
> -.BR buf.offset )
> +.IR buf.offset )
>  the remaining amount of time to be adjusted after an earlier
>  .BR ADJ_OFFSET_SINGLESHOT
>  operation.
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
