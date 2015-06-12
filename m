From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] locale.1: minor output format clarification
Date: Fri, 12 Jun 2015 20:18:40 +0200
Message-ID: <557B2280.8070408@gmail.com>
References: <557ADF49.40303@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <557ADF49.40303-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/12/2015 03:31 PM, Marko Myllynen wrote:
> Hi Michael,
> 
> a minor clarification for the locale output format which was brought up
> at https://sourceware.org/bugzilla/show_bug.cgi?id=18516.


Thanks, Marko. Applied.

Cheers,

Michael


> ------
> 
> For reference, see
> 
> https://sourceware.org/bugzilla/show_bug.cgi?id=18516
> http://pubs.opengroup.org/onlinepubs/9699919799/utilities/locale.html
> ---
>  man1/locale.1 | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/man1/locale.1 b/man1/locale.1
> index 1bd233e..19cf13e 100644
> --- a/man1/locale.1
> +++ b/man1/locale.1
> @@ -45,6 +45,8 @@ displays the current locale settings for each locale category (see
>  based on the settings of the environment variables that control the locale
>  (see
>  .BR locale (7)).
> +Values for variables set in the environment are printed without double 
> +quotes, implied values are printed with double quotes.
>  
>  If either the
>  .B \-a
> 
> Thanks,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
