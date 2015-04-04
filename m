From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] get_nprocs_conf.3: ATTRIBUTES: Note functions those are
 thread-safe
Date: Sat, 04 Apr 2015 08:59:50 +0100
Message-ID: <551F99F6.6070809@gmail.com>
References: <1427271273-8602-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1427271273-8602-2-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427271273-8602-2-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/25/2015 08:14 AM, Zeng Linggang wrote:
> The markings match glibc markings.

Hello Zeng Linggang,

Thanks. Patch applied.

Cheers,

Michael



> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/get_nprocs_conf.3 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/man3/get_nprocs_conf.3 b/man3/get_nprocs_conf.3
> index 8faf84f..157ac01 100644
> --- a/man3/get_nprocs_conf.3
> +++ b/man3/get_nprocs_conf.3
> @@ -45,6 +45,21 @@ This may be less than the number returned by
>  because processors may be offline (e.g., on hotpluggable systems).
>  .SH RETURN VALUE
>  As given in DESCRIPTION.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR get_nprocs (),
> +.br
> +.BR get_nprocs_conf ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
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
