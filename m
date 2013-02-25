From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: wfix
Date: Mon, 25 Feb 2013 08:04:51 +0100
Message-ID: <CAKgNAkga6RK2NXX4J5QxgE4DO2i6F2=aCf3a437uwjN94noy0A@mail.gmail.com>
References: <1361219486-9750-1-git-send-email-spaillard@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361219486-9750-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks Simon. Applied.

On Mon, Feb 18, 2013 at 9:31 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> A write to /proc/profile may *set* interrupt frequency to that value.
> ---
>  man5/proc.5 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man5/proc.5 b/man5/proc.5
> index 30ca3a9..1e13b60 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -1966,7 +1966,7 @@ Writing (e.g., an empty string) to this file resets the profiling counters;
>  on some architectures,
>  writing a binary integer "profiling multiplier" of size
>  .IR sizeof(int)
> -resets the profiling interrupt frequency.
> +sets the profiling interrupt frequency.
>
>  .TP
>  .I /proc/scsi
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
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
