From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] exec.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 22 Jul 2014 07:11:23 +0200
Message-ID: <53CDF27B.6020300@gmail.com>
References: <1405930093-30232-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405930093-30232-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied in my local branch.

Cheers,

Michael



On 07/21/2014 10:08 AM, Peng Haitao wrote:
> The functions execl(), execlp(), execle(), execv(), execvp() and
> execvpe() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/exec.3 | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/man3/exec.3 b/man3/exec.3
> index 6356d2c..7756056 100644
> --- a/man3/exec.3
> +++ b/man3/exec.3
> @@ -196,6 +196,25 @@ for any of the errors specified for
>  The
>  .BR execvpe ()
>  function first appeared in glibc 2.11.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw29 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR execl (),
> +.BR execle (),
> +.BR execv ()
> +T}	Thread safety	MT-Safe
> +T{
> +.BR execlp (),
> +.BR execvp (),
> +.BR execvpe ()
> +T}	Thread safety	MT-Safe env
> +.TE
>  .SH CONFORMING TO
>  POSIX.1-2001, POSIX.1-2008.
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
