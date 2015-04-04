From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] scanf.3: ATTRIBUTES: Note functions those are thread-safe
Date: Sat, 04 Apr 2015 08:58:03 +0100
Message-ID: <551F998B.1030006@gmail.com>
References: <1427084656-7273-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1427084656-7273-5-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427084656-7273-5-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/23/2015 04:24 AM, Zeng Linggang wrote:
> The markings match glibc markings.


Hello Zeng Linggang,

Thanks. Patch applied.

Cheers,

Michael



> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/scanf.3 | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/man3/scanf.3 b/man3/scanf.3
> index 02455b4..a0e45a1 100644
> --- a/man3/scanf.3
> +++ b/man3/scanf.3
> @@ -574,6 +574,26 @@ Out of memory.
>  .B ERANGE
>  The result of an integer conversion would exceed the size
>  that can be stored in the corresponding integer type.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR scanf (),
> +.BR fscanf (),
> +.br
> +.BR sscanf (),
> +.BR vscanf (),
> +.br
> +.BR vsscanf (),
> +.BR vfscanf ()
> +T}	Thread safety	MT-Safe locale
> +.TE
> +
>  .SH CONFORMING TO
>  The functions
>  .BR fscanf (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
