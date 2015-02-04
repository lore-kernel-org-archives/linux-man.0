From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tsearch.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 04 Feb 2015 07:12:17 +0100
Message-ID: <54D1B841.3030205@gmail.com>
References: <1423026258-10938-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423026258-10938-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/04/2015 06:04 AM, Ma Shimiao wrote:
> The functions' markings match glibc markings.

Applied.  Thanks, Ma Shimiao.

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/tsearch.3 | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/man3/tsearch.3 b/man3/tsearch.3
> index cd9d0ad..1de3050 100644
> --- a/man3/tsearch.3
> +++ b/man3/tsearch.3
> @@ -187,6 +187,27 @@ also
>  return NULL if
>  .IR rootp
>  was NULL on entry.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR tsearch (),
> +.BR tfind (),
> +.br
> +.BR tdelete ()
> +T}	Thread safety	MT-Safe race:rootp
> +T{
> +.BR twalk ()
> +T}	Thread safety	MT-Safe race:root
> +T{
> +.BR tdestroy ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  SVr4, POSIX.1-2001.
>  The function
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
