From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/20] fpathconf.3: fix prototype
Date: Tue, 20 May 2014 07:19:43 +0200
Message-ID: <537AE5EF.5040207@gmail.com>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk> <1400540546-25578-13-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-13-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Rasmus! Applied.

Cheers,

Michael


On 05/20/2014 01:02 AM, Rasmus Villemoes wrote:
> The path argument to pathconf() is const.
> ---
>  man3/fpathconf.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/fpathconf.3 b/man3/fpathconf.3
> index d8d9a1b..0e46f31 100644
> --- a/man3/fpathconf.3
> +++ b/man3/fpathconf.3
> @@ -47,7 +47,7 @@ fpathconf, pathconf \- get configuration values for files
>  .sp
>  .BI "long fpathconf(int " fd ", int " name );
>  .br
> -.BI "long pathconf(char *" path ", int " name );
> +.BI "long pathconf(const char *" path ", int " name );
>  .fi
>  .SH DESCRIPTION
>  .BR fpathconf ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
