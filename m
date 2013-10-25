From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] termios.3: ATTRIBUTES: Note functions that are thread-safe
Date: Sat, 26 Oct 2013 11:26:47 +1300
Message-ID: <526AF027.1030902@gmail.com>
References: <1382428983-24396-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382428983-24396-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 22.10.2013 21:03, Peng Haitao wrote:
> The functions tcgetattr(), tcsetattr(), tcsendbreak(),
> tcdrain(), tcflush(), tcflow(), cfmakeraw(), cfgetispeed(),
> cfgetospeed(), cfsetispeed(), cfsetospeed() and cfsetspeed()
> are thread safe.


Applied.

Thanks,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/termios.3 | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/termios.3 b/man3/termios.3
> index 4f5f304..feecad0 100644
> --- a/man3/termios.3
> +++ b/man3/termios.3
> @@ -37,7 +37,7 @@
>  .\"     Enhanced the discussion of "raw" mode for cfmakeraw().
>  .\"     Document CMSPAR.
>  .\"
> -.TH TERMIOS 3 2013-03-15 "Linux" "Linux Programmer's Manual"
> +.TH TERMIOS 3 2013-10-22 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  termios, tcgetattr, tcsetattr, tcsendbreak, tcdrain, tcflush, tcflow,
>  cfmakeraw, cfgetospeed, cfgetispeed, cfsetispeed, cfsetospeed, cfsetspeed \-
> @@ -929,6 +929,23 @@ Therefore, when making multiple changes
>  it may be necessary to follow this call with a further call to
>  .BR tcgetattr ()
>  to check that all changes have been performed successfully.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR tcgetattr (),
> +.BR tcsetattr (),
> +.BR tcsendbreak (),
> +.BR tcdrain (),
> +.BR tcflush (),
> +.BR tcflow (),
> +.BR cfmakeraw (),
> +.BR cfgetispeed (),
> +.BR cfgetospeed (),
> +.BR cfsetispeed (),
> +.BR cfsetospeed (),
> +and
> +.BR cfsetspeed ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  .BR tcgetattr (),
>  .BR tcsetattr (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
