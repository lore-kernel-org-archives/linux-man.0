From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] backtrace.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Feb 2015 08:13:10 +0100
Message-ID: <54DB0106.5010803@gmail.com>
References: <1423622172-18488-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423622172-18488-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/11/2015 03:36 AM, Ma Shimiao wrote:
> The markings match glibc markings.

Thanks, Ma Shimiao. Applied.

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/backtrace.3 | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/man3/backtrace.3 b/man3/backtrace.3
> index 1b21794..7018f12 100644
> --- a/man3/backtrace.3
> +++ b/man3/backtrace.3
> @@ -140,6 +140,22 @@ on error, NULL is returned.
>  and
>  .BR backtrace_symbols_fd ()
>  are provided in glibc since version 2.1.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw22 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR backtrace (),
> +.br
> +.BR backtrace_symbols (),
> +.br
> +.BR backtrace_symbols_fd ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  These functions are GNU extensions.
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
