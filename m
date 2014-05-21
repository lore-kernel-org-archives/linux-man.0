From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 19/24] sigvec.3: Fix prototype
Date: Wed, 21 May 2014 20:15:09 +0200
Message-ID: <537CED2D.4060304@gmail.com>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk> <1400684275-20972-20-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-20-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Rasmus. Applied.

Cheers,

Michael


On 05/21/2014 04:57 PM, Rasmus Villemoes wrote:
> The vec argument to sigvec is const.
> 
> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man3/sigvec.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/sigvec.3 b/man3/sigvec.3
> index 8cc380f..4afa361 100644
> --- a/man3/sigvec.3
> +++ b/man3/sigvec.3
> @@ -29,7 +29,7 @@ sigvec, sigblock, sigsetmask, siggetmask, sigmask \- BSD signal API
>  .SH SYNOPSIS
>  .B #include <signal.h>
>  .sp
> -.BI "int sigvec(int " sig ", struct sigvec *" vec ", struct sigvec *" ovec );
> +.BI "int sigvec(int " sig ", const struct sigvec *" vec ", struct sigvec *" ovec );
>  .sp
>  .BI "int sigmask(int " signum );
>  .sp
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
