From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mlock.2: tfix
Date: Fri, 27 Jan 2017 08:42:19 +1300
Message-ID: <8e569307-453a-dab4-844f-d5bac2fc3b3d@gmail.com>
References: <20170126151830.8088-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170126151830.8088-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/27/2017 04:18 AM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---

Thanks, Jakub!  Applied.

Cheers,

Michael


>  man2/mlock.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/mlock.2 b/man2/mlock.2
> index 9d5c1902c..7c90819b2 100644
> --- a/man2/mlock.2
> +++ b/man2/mlock.2
> @@ -493,7 +493,7 @@ resource limit is encountered.
>  .\" "Rationale for RLIMIT_MEMLOCK"
>  .\" 23 Jan 2006
>  .SH SEE ALSO
> -.BR minore (2),
> +.BR mincore (2),
>  .BR mmap (2),
>  .BR setrlimit (2),
>  .BR shmctl (2),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
