From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] keyctl.2: tfix
Date: Mon, 25 Jan 2016 14:32:33 +0100
Message-ID: <56A623F1.8020804@gmail.com>
References: <CAKqBPxZN3k_B5GqkmJgb9dmXh+BB0uK-S-bgBou_OJnG8HTxfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKqBPxZN3k_B5GqkmJgb9dmXh+BB0uK-S-bgBou_OJnG8HTxfQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Stein <joeaarons-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/19/2016 11:18 PM, Joe Stein wrote:
> Signed-off-by: Joe Stein <joeaarons-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks, Joe. Applied.

Cheers,

Michael


> diff --git a/man2/keyctl.2 b/man2/keyctl.2
> index 8a9cb9b..8d706af 100644
> --- a/man2/keyctl.2
> +++ b/man2/keyctl.2
> @@ -98,7 +98,7 @@ Assume authority to instantiate key.
>  .P
>  These are wrapped by
>  .B libkeyutils
> -into individual functions to permit compiler the compiler to check types.
> +into individual functions to permit the compiler to check types.
>  See the
>  .B See Also
>  section at the bottom.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
