From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fgetc.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 26 Feb 2015 08:31:48 +0100
Message-ID: <54EECBE4.1030205@gmail.com>
References: <1424918409-8796-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424918409-8796-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/26/2015 03:40 AM, Ma Shimiao wrote:
> The markings match glibc markings.


Thanks, Ma Shimiao. Applied.

Cheers,

Michael



> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fgetc.3 | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/man3/fgetc.3 b/man3/fgetc.3
> index baf57c1..49aecf0 100644
> --- a/man3/fgetc.3
> +++ b/man3/fgetc.3
> @@ -121,6 +121,24 @@ returns
>  on success, or
>  .B EOF
>  on error.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw25 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR fgetc (),
> +.BR fgets (),
> +.BR getc (),
> +.br
> +.BR getchar (),
> +.BR ungetc ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  C89, C99, POSIX.1-2001.
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
