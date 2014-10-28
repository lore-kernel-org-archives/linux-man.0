From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] localedef.1: list default path for compiled files
Date: Tue, 28 Oct 2014 15:04:18 +0100
Message-ID: <544FA262.6020705@gmail.com>
References: <54449BF1.3050109@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54449BF1.3050109-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Marko. Applied.

Cheers,

Michael


On 10/20/2014 07:21 AM, Marko Myllynen wrote:
> 
> ---
>  man1/localedef.1 |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/man1/localedef.1 b/man1/localedef.1
> index 24da5d0..1f2cd7a 100644
> --- a/man1/localedef.1
> +++ b/man1/localedef.1
> @@ -291,6 +291,9 @@ Usual default repertoire map path.
>  .TP
>  .I /usr/lib/locale/locale-archive
>  Usual default locale archive location.
> +.TP 
> +.I /usr/lib/locale               
> +Usual default path for compiled individual locale data files.
>  .TP
>  .I outputpath/LC_ADDRESS
>  An output file that contains information about formatting of
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
