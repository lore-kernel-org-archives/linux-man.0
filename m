From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: unshare.2: ffix
Date: Fri, 16 Jan 2015 07:42:01 +0100
Message-ID: <54B8B2B9.6020301@gmail.com>
References: <CALhU9tmG39TE__PM6jvAd9wdh0pdy2tzNbGi71-deNyL_h_MyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tmG39TE__PM6jvAd9wdh0pdy2tzNbGi71-deNyL_h_MyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Akihiro. Applied.

Cheers,

Michael


On 01/15/2015 06:21 PM, Akihiro Motoki wrote:
> diff --git a/man2/unshare.2 b/man2/unshare.2
> index 9b1d506..3bc1f9a 100644
> --- a/man2/unshare.2
> +++ b/man2/unshare.2
> @@ -311,7 +311,8 @@ does not have a mapping in the parent namespace (see
>  .TP
>  .BR EPERM " (since Linux 3.9)"
>  .\" commit 3151527ee007b73a0ebd296010f1c0454a919c7d
> -.B CLONE_NEWUSER was specified in
> +.B CLONE_NEWUSER
> +was specified in
>  .I flags
>  and the caller is in a chroot environment
>  .\" FIXME What is the rationale for this restriction?
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
