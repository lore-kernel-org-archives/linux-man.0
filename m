From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] argz_add.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 26 Feb 2015 08:30:05 +0100
Message-ID: <54EECB7D.9050205@gmail.com>
References: <1424911586-5418-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424911586-5418-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/26/2015 01:46 AM, Ma Shimiao wrote:
> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Thanks, Ma Shimiao. Applied.

Cheers,

Michael



> ---
>  man3/argz_add.3 | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/man3/argz_add.3 b/man3/argz_add.3
> index 4b2de7c..a571903 100644
> --- a/man3/argz_add.3
> +++ b/man3/argz_add.3
> @@ -195,6 +195,35 @@ All argz functions that do memory allocation have a return type of
>  and return 0 for success, and
>  .B ENOMEM
>  if an allocation error occurs.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw33 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR argz_add (),
> +.BR argz_add_sep (),
> +.br
> +.BR argz_append (),
> +.BR argz_count (),
> +.br
> +.BR argz_create (),
> +.BR argz_create_sep (),
> +.br
> +.BR argz_delete (),
> +.BR argz_extract (),
> +.br
> +.BR argz_insert (),
> +.BR argz_next (),
> +.br
> +.BR argz_replace (),
> +.BR argz_stringify ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  These functions are a GNU extension.
>  Handle with care.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
