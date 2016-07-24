From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getitimer.2: tfix
Date: Sun, 24 Jul 2016 20:38:08 +0200
Message-ID: <80d1c763-c4e0-5e2e-76ef-fc9541669123@gmail.com>
References: <1469364371-12020-1-git-send-email-toddy@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469364371-12020-1-git-send-email-toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/24/2016 02:46 PM, Dr. Tobias Quathamer wrote:

Thanks, Tobias. Applied.

Cheers,

Michael

> ---
>  man2/getitimer.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/getitimer.2 b/man2/getitimer.2
> index 3191a16..c991577 100644
> --- a/man2/getitimer.2
> +++ b/man2/getitimer.2
> @@ -106,7 +106,7 @@ substructure is populated with the timer interval.
>  If both fields of
>  .IR it_interval
>  are zero, then this is a single-shot timer (i.e., it expires just once).
> -.SS getitimer()
> +.SS setitimer()
>  The function
>  .BR setitimer ()
>  arms or disarms the timer specified by
>


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
