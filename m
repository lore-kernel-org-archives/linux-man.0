From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_setname_np.3: ffix
Date: Tue, 21 Jan 2014 07:17:43 +0100
Message-ID: <52DE1107.5050608@gmail.com>
References: <1390255488-16155-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390255488-16155-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael

On 01/20/2014 11:04 PM, Simon Paillard wrote:
> ---
>  man3/pthread_setname_np.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_setname_np.3 b/man3/pthread_setname_np.3
> index 7e949ec..a7c9286 100644
> --- a/man3/pthread_setname_np.3
> +++ b/man3/pthread_setname_np.3
> @@ -104,7 +104,7 @@ These functions are nonstandard GNU extensions.
>  .SH NOTES
>  .BR pthread_setname_np ()
>  internally writes to the thread-specific
> -,I comm
> +.I comm
>  file under the
>  .IR /proc
>  filesystem:
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
