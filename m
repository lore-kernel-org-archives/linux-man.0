From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] inotify.7: fallocate does not trigger inotify events
Date: Tue, 28 Oct 2014 12:44:28 +0100
Message-ID: <544F819C.6070304@gmail.com>
References: <1412287353-5234-1-git-send-email-xypron.glpk@gmx.de> <1412287587-5392-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412287587-5392-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Heinrich.

Applied.

Cheers,

Michael


On 10/03/2014 12:06 AM, Heinrich Schuchardt wrote:
> Calling fallocate.2 does not result in inotify events.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/inotify.7 | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/man7/inotify.7 b/man7/inotify.7
> index a0e2528..7f45ba9 100644
> --- a/man7/inotify.7
> +++ b/man7/inotify.7
> @@ -752,6 +752,10 @@ and also the possibility that there may not be any
>  .B IN_MOVED_TO
>  event.
>  .SH BUGS
> +As of kernel 3.17, calling
> +.BR fallocate (2) 
> +does not create any inotify events.
> +
>  .\" FIXME . kernel commit 611da04f7a31b2208e838be55a42c7a1310ae321
>  .\" implies that unmount events were buggy 2.6.11 to 2.6.36
>  .\"
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
