From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 11/20] envz_add.3: fix prototypes
Date: Tue, 20 May 2014 07:19:25 +0200
Message-ID: <537AE5DD.6070507@gmail.com>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk> <1400540546-25578-12-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-12-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Rasmus! Applied.

Cheers,

Michael


On 05/20/2014 01:02 AM, Rasmus Villemoes wrote:
> The envz_len parameters for envz_entry() and envz_get() are not passed
> by reference.
> ---
>  man3/envz_add.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/envz_add.3 b/man3/envz_add.3
> index cb85833..de388af 100644
> --- a/man3/envz_add.3
> +++ b/man3/envz_add.3
> @@ -18,10 +18,10 @@ envz_remove, envz_strip \- environment string support
>  .BI "error_t envz_add(char **" envz ", size_t *" envz_len ,
>  .BI "                 const char *" name ", const char *" value );
>  
> -.BI "char *envz_entry(const char *" envz ", size_t *" envz_len \
> +.BI "char *envz_entry(const char *" envz ", size_t " envz_len \
>  ", const char *" name );
>  
> -.BI "char *envz_get(const char *" envz ", size_t *" envz_len \
> +.BI "char *envz_get(const char *" envz ", size_t " envz_len \
>  ", const char *" name );
>  
>  .BI "error_t envz_merge(char **" envz ", size_t *" envz_len ,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
