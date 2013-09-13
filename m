From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clock_getres.2: wfix
Date: Fri, 13 Sep 2013 06:32:20 +0200
Message-ID: <52329554.7030708@gmail.com>
References: <1378765556-29638-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378765556-29638-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks,. APplied.

Cheers,

Michael

On 10.09.2013 00:25, Simon Paillard wrote:
> ---
>  man2/clock_getres.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/clock_getres.2 b/man2/clock_getres.2
> index ae7af1b..1e94b32 100644
> --- a/man2/clock_getres.2
> +++ b/man2/clock_getres.2
> @@ -202,7 +202,7 @@ specified is not supported on this system.
>  .BR clock_settime ()
>  does not have permission to set the clock indicated.
>  .SH VERSIONS
> -This system calls first appeared in Linux 2.6.
> +These system calls first appeared in Linux 2.6.
>  .SH CONFORMING TO
>  SUSv2, POSIX.1-2001.
>  .SH AVAILABILITY
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
