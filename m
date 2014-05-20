From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 13/20] fseek.3: fix prototype
Date: Tue, 20 May 2014 08:05:05 +0200
Message-ID: <537AF091.5080702@gmail.com>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk> <1400540546-25578-14-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-14-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied!

Cheers,

Michael


On 05/20/2014 01:02 AM, Rasmus Villemoes wrote:
> The pos argument to fsetpos() is const.
> ---
>  man3/fseek.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/fseek.3 b/man3/fseek.3
> index f46ee82..c22a2c2 100644
> --- a/man3/fseek.3
> +++ b/man3/fseek.3
> @@ -53,7 +53,7 @@ fgetpos, fseek, fsetpos, ftell, rewind \- reposition a stream
>  
>  .BI "int fgetpos(FILE *" stream ", fpos_t *" pos );
>  .br
> -.BI "int fsetpos(FILE *" stream ", fpos_t *" pos );
> +.BI "int fsetpos(FILE *" stream ", const fpos_t *" pos );
>  .SH DESCRIPTION
>  The
>  .BR fseek ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
