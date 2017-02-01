From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] strerror.3: indicate reasonable buffer size
Date: Thu, 2 Feb 2017 09:15:07 +1300
Message-ID: <528ee232-ff19-da72-cb6b-de58852a5766@gmail.com>
References: <1485888838-4055-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485888838-4055-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/01/2017 07:53 AM, Heinrich Schuchardt wrote:
> Add a hint which buffer size is needed for
> strerror_r() and strerror_l().

Thanks, Heinrich.I applied the patch, but removed mention of 
"version 2.25", since this buffer size goes *way* back (at
least as far back 2.0.6).

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man3/strerror.3 | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/man3/strerror.3 b/man3/strerror.3
> index ec758fb..511a4a3 100644
> --- a/man3/strerror.3
> +++ b/man3/strerror.3
> @@ -256,6 +256,15 @@ to
>  .B EINVAL
>  if the error number is unknown.
>  C99 and POSIX.1-2008 require the return value to be non-NULL.
> +.SH NOTES
> +The GNU C Library, version 2.25 uses a buffer of 1024 characters for
> +.BR strerror ().
> +This buffer size therefore should be suffcient to avoid an
> +.B ERANGE
> +error in
> +.BR strerror_r ()
> +and
> +.BR strerror_l ().
>  .SH SEE ALSO
>  .BR err (3),
>  .BR errno (3),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
