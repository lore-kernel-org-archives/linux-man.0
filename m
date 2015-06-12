From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getnetent_r.3: ATTRIBUTES: Note functions that are thread-safe
Date: Fri, 12 Jun 2015 21:09:39 +0200
Message-ID: <557B2E73.5070009@gmail.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1432721584-11342-2-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-2-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/27/2015 12:12 PM, Zeng Linggang wrote:
> After research, We think getnetent_r(), getnetbyname_r() and
> getnetbyaddr_r() are thread-safe. But, there are not markings
> of them in glibc document.

Thanks, Zeng Linggang. Applied.

Cheers,

Michael



> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getnetent_r.3 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/man3/getnetent_r.3 b/man3/getnetent_r.3
> index 8f4c49f..d054fa3 100644
> --- a/man3/getnetent_r.3
> +++ b/man3/getnetent_r.3
> @@ -138,6 +138,21 @@ is too small.
>  Try again with a larger buffer
>  (and increased
>  .IR buflen ).
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw17 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getnetent_r (),
> +.BR getnetbyname_r (),
> +.BR getnetbyaddr_r ()
> +T}	Thread safety	MT-Safe locale
> +.TE
> +
>  .SH CONFORMING TO
>  These functions are GNU extensions.
>  Functions with similar names exist on some other systems,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
