From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] capabilities.7: ffix
Date: Tue, 12 Mar 2013 07:32:30 +0100
Message-ID: <CAKgNAki1jTaoGFNJyBZBVUqAsV1dUg-YZUydRr88ab52qZSWoA@mail.gmail.com>
References: <1362608746-29066-1-git-send-email-spaillard@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362608746-29066-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks Simon. Applied.

On Wed, Mar 6, 2013 at 11:25 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> ---
>  man7/capabilities.7 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man7/capabilities.7 b/man7/capabilities.7
> index 64b642e..1b5fcc4 100644
> --- a/man7/capabilities.7
> +++ b/man7/capabilities.7
> @@ -1040,7 +1040,7 @@ enabled (1) in these sets.
>  Since Linux 3.8,
>  .\" 7b9a7ec565505699f503b4fcf61500dceb36e744
>  all non-existent capabilities (above
> -.B CAP_LAST_CAP)
> +.BR CAP_LAST_CAP )
>  are shown as disabled (0).
>
>  The
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
