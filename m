From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] scalbln.3: Reformat thread-safety information
Date: Wed, 27 Aug 2014 18:03:58 +0200
Message-ID: <53FE016E.1040200@gmail.com>
References: <1408935706-14710-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408935706-14710-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers,

Michael


On 08/25/2014 05:01 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/scalbln.3 | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/man3/scalbln.3 b/man3/scalbln.3
> index 2b611a5..32f20c2 100644
> --- a/man3/scalbln.3
> +++ b/man3/scalbln.3
> @@ -158,16 +158,23 @@ These functions do not set
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw33 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
>  .BR scalbn (),
>  .BR scalbnf (),
>  .BR scalbnl (),
> +.br
>  .BR scalbln (),
>  .BR scalblnf (),
> -and
>  .BR scalblnl ()
> -functions are thread-safe.
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
