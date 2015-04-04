From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bug#621057: printf.3: ATTRIBUTES: Note functions those are thread-safe
Date: Sat, 04 Apr 2015 08:54:19 +0100
Message-ID: <551F98AB.7020909@gmail.com>
References: <1427084656-7273-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1427084656-7273-3-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427084656-7273-3-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, 621057-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/23/2015 04:24 AM, Zeng Linggang wrote:
> The markings match glibc markings.

Hello Zeng Linggang,

This patch seems to have been sent twice...

Cheers,

Michael



> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/printf.3 | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/man3/printf.3 b/man3/printf.3
> index bf84f07..8b24f20 100644
> --- a/man3/printf.3
> +++ b/man3/printf.3
> @@ -822,6 +822,29 @@ A \(aq%\(aq is written.
>  No argument is converted.
>  The complete conversion
>  specification is \(aq%%\(aq.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR printf (),
> +.BR fprintf (),
> +.br
> +.BR sprintf (),
> +.BR snprintf (),
> +.br
> +.BR vprintf (),
> +.BR vfprintf (),
> +.br
> +.BR vsprintf (),
> +.BR vsnprintf ()
> +T}	Thread safety	MT-Safe locale
> +.TE
> +
>  .SH CONFORMING TO
>  The
>  .BR fprintf (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
