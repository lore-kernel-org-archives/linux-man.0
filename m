From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sigvec.3: Reformat thread-safety information
Date: Thu, 21 Aug 2014 17:00:32 -0500
Message-ID: <53F66C00.2070107@gmail.com>
References: <1408416389-30357-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408416389-30357-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Haitao,

Thanks. Applied in my local branch.

Cheers,

Michael



On 08/18/2014 09:46 PM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/sigvec.3 | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/man3/sigvec.3 b/man3/sigvec.3
> index 797d43d..8378dc1 100644
> --- a/man3/sigvec.3
> +++ b/man3/sigvec.3
> @@ -219,18 +219,21 @@ See the ERRORS under
>  and
>  .BR sigprocmask (2).
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw32 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
>  .BR sigvec (),
> +.BR sigmask (),
>  .BR sigblock (),
>  .BR sigsetmask (),
> -and
>  .BR siggetmask ()
> -functions are thread-safe.
> -.LP
> -The
> -.BR sigmask ()
> -macro is thread-safe.
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  All of these functions were in
>  4.3BSD, except
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
