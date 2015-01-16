From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: locale.5: correct variable name
Date: Fri, 16 Jan 2015 07:48:47 +0100
Message-ID: <54B8B44F.8050109@gmail.com>
References: <CALhU9tnv1zWxb6O00=L6TGrWX2Vjmp_wA2hAUW_GGaYhQQu5EA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tnv1zWxb6O00=L6TGrWX2Vjmp_wA2hAUW_GGaYhQQu5EA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Akihiro. Applied.

Cheers,

Michael


On 01/15/2015 06:26 PM, Akihiro Motoki wrote:
> I think "positive_sign" is used.
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index 64444e0..e73a471 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -785,7 +785,7 @@ The same values are recognized as for
>  .TP
>  .I int_p_sign_posn
>  followed by an integer that indicates where the
> -.I negative_sign
> +.I positive_sign
>  should be placed for a nonnegative
>  internationally formatted monetary quantity.
>  The same values are recognized as for
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
