From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mbsrtowcs.3: ATTRIBUTES: Note function that is thread
 safe with exceptions
Date: Sat, 04 Apr 2015 09:00:39 +0100
Message-ID: <551F9A27.9010001@gmail.com>
References: <1427271273-8602-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1427271273-8602-4-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427271273-8602-4-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/25/2015 08:14 AM, Zeng Linggang wrote:
> The marking matches glibc marking.

Hello Zeng Linggang,

Thanks. Patch applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mbsrtowcs.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/mbsrtowcs.3 b/man3/mbsrtowcs.3
> index 4df9986..6391b13 100644
> --- a/man3/mbsrtowcs.3
> +++ b/man3/mbsrtowcs.3
> @@ -123,6 +123,19 @@ is returned, and
>  .I errno
>  set to
>  .BR EILSEQ .
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lbw28
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR mbsrtowcs ()
> +T}	Thread safety	MT-Unsafe race:mbsrtowcs/!ps
> +.TE
> +
>  .SH CONFORMING TO
>  C99.
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
