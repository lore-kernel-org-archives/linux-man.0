From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] profil.3: ATTRIBUTES: Note function that is not thread-safe
Date: Fri, 12 Jun 2015 21:40:26 +0200
Message-ID: <557B35AA.3010503@gmail.com>
References: <1433988270-8599-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1433988270-8599-7-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433988270-8599-7-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/11/2015 04:04 AM, Zeng Linggang wrote:
> After research, We think profil() is not thread-safe. But,
> there is not marking of profil() in glibc document.


Thanks, Zeng Linggang. Applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/profil.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/profil.3 b/man3/profil.3
> index 437ee28..e087e7a 100644
> --- a/man3/profil.3
> +++ b/man3/profil.3
> @@ -67,6 +67,19 @@ If
>  is NULL, profiling is disabled.
>  .SH RETURN VALUE
>  Zero is always returned.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR profil ()
> +T}	Thread safety	MT-Unsafe
> +.TE
> +
>  .SH CONFORMING TO
>  Similar to a call in SVr4 (but not POSIX.1-2001).
>  .SH BUGS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
