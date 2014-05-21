From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 18/24] scandir.3: Fix prototypes
Date: Wed, 21 May 2014 20:40:02 +0200
Message-ID: <537CF302.8090204@gmail.com>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk> <1400684275-20972-19-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-19-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Rasmus. Applied.

Cheers,

Michael


On 05/21/2014 04:57 PM, Rasmus Villemoes wrote:
> The alphasort and versionsort functions take arguments of type const
> struct dirent **, not const void *.
> 
> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man3/scandir.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/scandir.3 b/man3/scandir.3
> index aee2c86..7fea26e 100644
> --- a/man3/scandir.3
> +++ b/man3/scandir.3
> @@ -73,9 +73,9 @@ a directory for matching entries
>  .BI "int (*" compar ")(const struct dirent **, const struct dirent **));"
>  .RE
>  .sp
> -.BI "int alphasort(const void *" a ", const void *" b );
> +.BI "int alphasort(const struct dirent **" a ", const struct dirent **" b );
>  .sp
> -.BI "int versionsort(const void *" a ", const void *" b );
> +.BI "int versionsort(const struct dirent **" a ", const struct dirent **" b );
>  
>  .BR "#include <fcntl.h>" "          /* Definition of AT_* constants */"
>  .B #include <dirent.h>
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
