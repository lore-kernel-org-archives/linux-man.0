From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] recv.2: remove duplicate paragraph for MSG_ERRQUEUE
Date: Sat, 31 Dec 2016 11:27:32 +0100
Message-ID: <3cb21035-4bc7-da18-febb-e2a919ba02c0@gmail.com>
References: <20161230213328.31980-1-vincent@bernat.im>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161230213328.31980-1-vincent-5wNQGcxKXm8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Bernat <vincent-5wNQGcxKXm8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Vincent

On 12/30/2016 10:33 PM, Vincent Bernat wrote:
> The removed paragraph is identical to the one a few lines above.

Gosh! The duplication was injected back in man-pages-1.34 (2000)!
Back in man-pages-1.33, it was the second instance only that was 
present, so I'm inclined to remove the other instance (opposite 
of your patch). What do you think?

Cheers,

Michael


> Signed-off-by: Vincent Bernat <vincent-5wNQGcxKXm8AvxtiuMwx3w@public.gmane.org>
> ---
>  man2/recv.2 | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/man2/recv.2 b/man2/recv.2
> index d2b531276d90..d901f3898c44 100644
> --- a/man2/recv.2
> +++ b/man2/recv.2
> @@ -225,20 +225,6 @@ and the other fields of the
>  .I sockaddr
>  are undefined.
>  The payload of the packet that caused the error is passed as normal data.
> -.IP
> -For local errors, no address is passed (this
> -can be checked with the
> -.I cmsg_len
> -member of the
> -.IR cmsghdr ).
> -For error receives,
> -the
> -.B MSG_ERRQUEUE
> -is set in the
> -.IR msghdr .
> -After an error has been passed, the pending socket error
> -is regenerated based on the next queued error and will be passed
> -on the next socket operation.
>  .TP
>  .B MSG_OOB
>  This flag requests receipt of out-of-band data that would not be received
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
