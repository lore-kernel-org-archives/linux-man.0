From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] mktemp.3: tfix
Date: Sat, 21 Feb 2015 08:56:48 +0100
Message-ID: <54E83A40.2010905@gmail.com>
References: <CAKoptixzT+RZZCwj8D-MVWOXkNc0EG_5RmS4p7ATjbs-dhwgtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKoptixzT+RZZCwj8D-MVWOXkNc0EG_5RmS4p7ATjbs-dhwgtg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Luke Faraone <lfaraone-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/18/2015 11:48 PM, Luke Faraone wrote:
>>From 9b57599ccf6784e76fd782405022dbe279de1d7e Mon Sep 17 00:00:00 2001
> From: Luke Faraone <lfaraone-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> Date: Wed, 18 Feb 2015 14:46:40 -0800
> Subject: [PATCH] mktemp(3) DESCRIPTION reference to BUGS corrected

Thanks. Applied.

Cheers,

Michael


> mktemp(3)'s DESCRIPTION referenced NOTES, but no such section exists. Corrected
> to refer to BUGS.
> ---
>  man3/mktemp.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/mktemp.3 b/man3/mktemp.3
> index bc58e2f..cdcc49a 100644
> --- a/man3/mktemp.3
> +++ b/man3/mktemp.3
> @@ -65,7 +65,7 @@ _XOPEN_SOURCE\ &&\ _XOPEN_SOURCE_EXTENDED
>  .ad b
>  .SH DESCRIPTION
>  .IR "Never use this function" ;
> -see NOTES.
> +see BUGS.
> 
>  The
>  .BR mktemp ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
