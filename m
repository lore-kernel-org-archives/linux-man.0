From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] toupper.3: Reformat thread-safety information
Date: Tue, 15 Jul 2014 07:14:46 +0200
Message-ID: <53C4B8C6.1030207@gmail.com>
References: <1405325149-8424-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405325149-8424-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Haitao. Applied.

Best regards,

Michael

On 07/14/2014 10:05 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/toupper.3 | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/man3/toupper.3 b/man3/toupper.3
> index 6e835b2..08f4169 100644
> --- a/man3/toupper.3
> +++ b/man3/toupper.3
> @@ -113,17 +113,22 @@ The value returned is that of the converted letter, or
>  .I c
>  if the conversion was not possible.
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> -.BR toupper ()
> -and
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw24 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR toupper (),
>  .BR tolower ()
> -functions are thread-safe with exceptions.
> -These functions can be safely used in multithreaded applications,
> -as long as
> -.BR setlocale (3)
> -is not called to change the locale during their execution.
> -.\" FIXME Add toupper_l() and tolower_l()
> +T}	Thread safety	MT-Safe locale
> +T{
> +.BR toupper_l (),
> +.BR tolower_l ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  .BR toupper (),
>  .BR tolower ():
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
