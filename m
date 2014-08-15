From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strerror.3: Reformat thread-safety information
Date: Fri, 15 Aug 2014 20:31:19 +0200
Message-ID: <53EE51F7.7090907@gmail.com>
References: <1407142414-23942-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407142414-23942-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao, Applied.

Cheers,

Michael


On 08/04/2014 10:53 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strerror.3 | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/man3/strerror.3 b/man3/strerror.3
> index b8f9cd7..708e15b 100644
> --- a/man3/strerror.3
> +++ b/man3/strerror.3
> @@ -200,15 +200,21 @@ is not a valid error number.
>  .B ERANGE
>  Insufficient storage was supplied to contain the error description string.
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw26 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
>  .BR strerror ()
> -function is not thread-safe.
> -.LP
> -The
> -.BR strerror_r ()
> -function is thread-safe.
> -.\" FIXME Need a thread-safety statement about strerror_l()
> +T}	Thread safety	MT-Unsafe
> +T{
> +.BR strerror_r (),
> +.BR strerror_l ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH VERSIONS
>  The
>  .BR strerror_l ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
