From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] termios.3: Reformat thread-safety information
Date: Tue, 22 Jul 2014 07:08:00 +0200
Message-ID: <53CDF1B0.2020501@gmail.com>
References: <1405916128-18956-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405916128-18956-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers,

Michael


On 07/21/2014 06:15 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/termios.3 | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/man3/termios.3 b/man3/termios.3
> index fbf909b..9583f11 100644
> --- a/man3/termios.3
> +++ b/man3/termios.3
> @@ -972,8 +972,16 @@ it may be necessary to follow this call with a further call to
>  .BR tcgetattr ()
>  to check that all changes have been performed successfully.
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.nh
> +.ad l
> +.TS
> +allbox;
> +lb lb lb
> +lw37 l l.
> +Interface	Attribute	Value
> +T{
>  .BR tcgetattr (),
>  .BR tcsetattr (),
>  .BR tcsendbreak (),
> @@ -985,9 +993,11 @@ The
>  .BR cfgetospeed (),
>  .BR cfsetispeed (),
>  .BR cfsetospeed (),
> -and
>  .BR cfsetspeed ()
> -functions are thread-safe.
> +T}	Thread safety	MT-Safe
> +.TE
> +.ad
> +.hy
>  .SH CONFORMING TO
>  .BR tcgetattr (),
>  .BR tcsetattr (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
