From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gets.3: see also fgets(3)
Date: Wed, 15 Jan 2014 17:13:42 +1300
Message-ID: <52D60AF6.4030201@gmail.com>
References: <1389721030-15533-1-git-send-email-abbotti@mev.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389721030-15533-1-git-send-email-abbotti-GUHe90Wt2aFaa/9Udqfwiw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Abbott <abbotti-GUHe90Wt2aFaa/9Udqfwiw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Ian. Applied.

Cheers,

Michael


On 01/15/2014 06:37 AM, Ian Abbott wrote:
> Signed-off-by: Ian Abbott <abbotti-GUHe90Wt2aFaa/9Udqfwiw@public.gmane.org>
> ---
>  man3/gets.3 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man3/gets.3 b/man3/gets.3
> index 7017b68..4c10ae7 100644
> --- a/man3/gets.3
> +++ b/man3/gets.3
> @@ -92,6 +92,7 @@ http://cwe.mitre.org/data/definitions/242.html
>  .BR write (2),
>  .BR ferror (3),
>  .BR fgetc (3),
> +.BR fgets (3),
>  .BR fgetwc (3),
>  .BR fgetws (3),
>  .BR fopen (3),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
