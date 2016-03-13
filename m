From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] readdir_r.3: tfix
Date: Mon, 14 Mar 2016 08:34:42 +1300
Message-ID: <56E5C0D2.3040608@gmail.com>
References: <1457892059-7685-1-git-send-email-jwilk@jwilk.net>
 <1457892059-7685-2-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457892059-7685-2-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/14/2016 07:00 AM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael

> ---
>  man3/readdir_r.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/readdir_r.3 b/man3/readdir_r.3
> index 478ee79..bc2fb22 100644
> --- a/man3/readdir_r.3
> +++ b/man3/readdir_r.3
> @@ -138,7 +138,7 @@ returns 0, and returns NULL in
>  .B EBADF
>  Invalid directory stream descriptor \fIdirp\fP.
>  .TP
> -.B ENAMETOOLOMG
> +.B ENAMETOOLONG
>  A directory entry whose name was too long to be read was encountered.
>  .SH ATTRIBUTES
>  For an explanation of the terms used in this section, see
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
