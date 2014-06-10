From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] localedef.1: tfix
Date: Tue, 10 Jun 2014 20:25:12 +0200
Message-ID: <53974D88.1030400@gmail.com>
References: <1402421960-4140-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402421960-4140-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri. Applied.

Cheers,

Michael


On 06/10/2014 07:39 PM, Yuri Kozlov wrote:
> ---
>  man1/localedef.1 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man1/localedef.1 b/man1/localedef.1
> index a3baca1..493cd5c 100644
> --- a/man1/localedef.1
> +++ b/man1/localedef.1
> @@ -293,7 +293,7 @@ Usual default repertoire map path.
>  Usual default locale archive location.
>  .TP
>  .I outputpath/LC_ADDRESS
> -An output file that contains contains information about formatting of
> +An output file that contains information about formatting of
>  addresses and geography-related items.
>  .TP
>  .I outputpath/LC_COLLATE
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
