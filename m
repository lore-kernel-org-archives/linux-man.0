From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] malloc.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 07 Jan 2015 13:55:16 +0100
Message-ID: <54AD2CB4.2050901@gmail.com>
References: <1420619432-15954-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420619432-15954-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/07/2015 09:30 AM, Ma Shimiao wrote:
> The function malloc(), free(), calloc() and realloc() are thread safe.

Thanks, Ma Shimiao. Patch applied in my local branch.

Cheers,

Michael


 
> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/malloc.3 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/man3/malloc.3 b/man3/malloc.3
> index 2684982..5e4132d 100644
> --- a/man3/malloc.3
> +++ b/man3/malloc.3
> @@ -168,6 +168,21 @@ is returned.
>  If
>  .BR realloc ()
>  fails, the original block is left untouched; it is not freed or moved.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw38 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR malloc (),
> +.BR free (),
> +.BR calloc (),
> +.BR realloc ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  C89, C99.
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
