From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_attr_init.3: tfix
Date: Sun, 16 Nov 2014 16:50:33 +0100
Message-ID: <5468C7C9.8080304@gmail.com>
References: <1415986403-27318-1-git-send-email-andrea.balboni@unimore.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415986403-27318-1-git-send-email-andrea.balboni-rcYM44yAMweonA0d6jMUrA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrea Balboni <andrea.balboni-rcYM44yAMweonA0d6jMUrA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Andrea. Applied.

Cheers,

Michael

On 11/14/2014 06:33 PM, Andrea Balboni wrote:
> ---
>  man3/pthread_attr_init.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_attr_init.3 b/man3/pthread_attr_init.3
> index 6092283..3875519 100644
> --- a/man3/pthread_attr_init.3
> +++ b/man3/pthread_attr_init.3
> @@ -106,7 +106,7 @@ we see the following:
>  .in +4n
>  .nf
>  .\" Results from glibc 2.8, SUSE 11.0; Oct 2008
> -.RB "$" " ulimit \-s" "       # No stack imit ==> default stack size is 2MB"
> +.RB "$" " ulimit \-s" "       # No stack limit ==> default stack size is 2MB"
>  unlimited
>  .RB "$" " ./a.out"
>  Thread attributes:
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
