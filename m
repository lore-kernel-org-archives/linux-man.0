From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] localedef.1: tfix
Date: Fri, 12 Jun 2015 20:18:35 +0200
Message-ID: <557B227B.70803@gmail.com>
References: <5576F5D5.3080501@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5576F5D5.3080501-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/09/2015 04:19 PM, Marko Myllynen wrote:
> Hi Michael,
> 
> the subject says it all.

Thanks, Marko. Applied.

Cheers,

Michael

> ---
>  man1/localedef.1 |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/man1/localedef.1 b/man1/localedef.1
> index 2996f91..765d770 100644
> --- a/man1/localedef.1
> +++ b/man1/localedef.1
> @@ -82,7 +82,7 @@ If
>  contains a slash character ('/'), it is interpreted as the name of the
>  directory where the output definitions are to be stored.
>  In this case, there is a separate output file for each locale category
> -.RI ( LC_CTIME ,
> +.RI ( LC_TIME ,
>  .IR LC_NUMERIC ,
>  and so on).
>  .IP *
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
