From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] malloc_trim.3: ATTRIBUTES: Note function that is thread-safe
Date: Fri, 12 Jun 2015 21:27:24 +0200
Message-ID: <557B329C.4050005@gmail.com>
References: <1433326594-25001-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1433326594-25001-8-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433326594-25001-8-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/03/2015 12:16 PM, Zeng Linggang wrote:
> After research, We think malloc_trim() is thread-safe. But, there
> is not marking of malloc_trim() in glibc document.


Thanks, Zeng Linggang. Applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/malloc_trim.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/malloc_trim.3 b/man3/malloc_trim.3
> index 74ef07e..769f1c1 100644
> --- a/man3/malloc_trim.3
> +++ b/man3/malloc_trim.3
> @@ -57,6 +57,19 @@ or 0 if it was not possible to release any memory.
>  No errors are defined.
>  .\" .SH VERSIONS
>  .\" Available already in glibc 2.0, possibly earlier
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR malloc_trim ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  This function is a GNU extension.
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
