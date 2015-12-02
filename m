From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] tee.2: tfix
Date: Wed, 02 Dec 2015 17:12:52 +0100
Message-ID: <565F1884.5090709@gmail.com>
References: <1445525054-2880-1-git-send-email-jwilk@jwilk.net> <1445525054-2880-3-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445525054-2880-3-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Jakub. Applied.

Cheers,

Michael


On 10/22/2015 04:44 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man2/tee.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/tee.2 b/man2/tee.2
> index 722d92c..6a8fbc9 100644
> --- a/man2/tee.2
> +++ b/man2/tee.2
> @@ -55,7 +55,7 @@ therefore, that data can be copied by a subsequent
>  .BR splice (2).
>  
>  .I flags
> -is a a bit mask that is composed by ORing together
> +is a bit mask that is composed by ORing together
>  zero or more of the following values:
>  .TP 1.9i
>  .B SPLICE_F_MOVE
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
