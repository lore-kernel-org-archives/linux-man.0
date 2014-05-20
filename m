From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 20/20] getrpcport.3: add #include and fix prototype
Date: Tue, 20 May 2014 08:45:50 +0200
Message-ID: <537AFA1E.8020004@gmail.com>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk> <1400540546-25578-21-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-21-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, rasmus. Applied.

Cheers,

Michael



On 05/20/2014 01:02 AM, Rasmus Villemoes wrote:
> The prototype for getrpcport() is obtained by #include'ing
> <rpc/rpc.h>. Also, update its prototype.
> ---
>  man3/getrpcport.3 | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/getrpcport.3 b/man3/getrpcport.3
> index 16ccdfc..a31fbc9 100644
> --- a/man3/getrpcport.3
> +++ b/man3/getrpcport.3
> @@ -10,8 +10,10 @@
>  getrpcport \- get RPC port number
>  .SH SYNOPSIS
>  .nf
> -.BI "int getrpcport(char *" host ", int " prognum ", int " versnum \
> -", int " proto );
> +.B "#include <rpc/rpc.h>"
> +.sp
> +.BI "int getrpcport(const char *" host ", unsigned long " prognum \
> +", unsigned long " versnum ", unsigned " proto );
>  .fi
>  .SH DESCRIPTION
>  .BR getrpcport ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
