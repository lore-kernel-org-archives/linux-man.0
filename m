From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ctermid.3: Modify thread-safety information
Date: Mon, 19 Jan 2015 10:19:48 +0100
Message-ID: <54BCCC34.8000305@gmail.com>
References: <1421650964-25562-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421650964-25562-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/19/2015 08:02 AM, Ma Shimiao wrote:
> According to the change of source code, ctermid's leve has been changed
> from MT-Unsafe to MT-Safe.
> Ater modifing, the marking matches glibc marking.


Applied. Thank you, Ma Shimiao.

Cheers,

Michael



> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/ctermid.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/ctermid.3 b/man3/ctermid.3
> index 5e1fc36..550e9cc 100644
> --- a/man3/ctermid.3
> +++ b/man3/ctermid.3
> @@ -68,7 +68,7 @@ l l l.
>  Interface	Attribute	Value
>  T{
>  .BR ctermid ()
> -T}	Thread safety	MT-Unsafe race:ctermid/!s
> +T}	Thread safety	MT-Safe
>  .TE
>  .SH CONFORMING TO
>  Svr4, POSIX.1-2001.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
