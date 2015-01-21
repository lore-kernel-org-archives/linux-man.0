From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] termios.3: Modify thread-safety information
Date: Wed, 21 Jan 2015 11:35:07 +0100
Message-ID: <54BF80DB.9060702@gmail.com>
References: <1421831254-23376-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421831254-23376-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/21/2015 10:07 AM, Ma Shimiao wrote:
> As this is man page for Linux, we don't need thread safety information
> for bsd

Thanks, Ma Shimiao. Applied.

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/termios.3 | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/man3/termios.3 b/man3/termios.3
> index 8eb04be..314218f 100644
> --- a/man3/termios.3
> +++ b/man3/termios.3
> @@ -984,9 +984,12 @@ Interface	Attribute	Value
>  T{
>  .BR tcgetattr (),
>  .BR tcsetattr (),
> +.BR tcsendbreak (),
>  .BR tcdrain (),
>  .br
>  .BR tcflush (),
> +.br
> +.BR tcflow (),
>  .BR cfmakeraw (),
>  .BR cfgetispeed (),
>  .BR cfgetospeed (),
> @@ -994,10 +997,6 @@ T{
>  .BR cfsetospeed (),
>  .BR cfsetspeed ()
>  T}	Thread safety	MT-Safe
> -T{
> -.BR tcsendbreak (),
> -.BR tcflow ()
> -T}	Thread safety	MT-Unsafe race:tcattr(filedes)/bsd
>  .TE
>  .ad
>  .hy
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
