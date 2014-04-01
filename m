From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sigvec.3: wfix phrasing
Date: Tue, 01 Apr 2014 20:13:40 +0200
Message-ID: <533B01D4.9000406@gmail.com>
References: <1395650777-11717-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395650777-11717-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao! Applied.

Cheers,

Michael


On 03/24/2014 09:48 AM, penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/sigvec.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/sigvec.3 b/man3/sigvec.3
> index 39b39f9..8cc380f 100644
> --- a/man3/sigvec.3
> +++ b/man3/sigvec.3
> @@ -155,7 +155,7 @@ function; the POSIX replacement is
>  .PP
>  The
>  .BR sigmask ()
> -function constructs and returns a "signal mask" for
> +macro constructs and returns a "signal mask" for
>  .IR signum .
>  For example, we can initialize the
>  .I vec.sv_mask
> @@ -211,7 +211,7 @@ functions return the previous signal mask.
>  
>  The
>  .BR sigmask ()
> -function returns the signal mask for
> +macro returns the signal mask for
>  .IR signum .
>  .SH ERRORS
>  See the ERRORS under
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
