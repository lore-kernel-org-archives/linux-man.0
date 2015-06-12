From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getprotoent_r.3: ATTRIBUTES: Note functions that are
 thread-safe
Date: Fri, 12 Jun 2015 21:39:15 +0200
Message-ID: <557B3563.8070105@gmail.com>
References: <1433988270-8599-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1433988270-8599-3-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433988270-8599-3-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/11/2015 04:04 AM, Zeng Linggang wrote:
> After research, We think
> * getprotoent_r(),
> * getprotobyname_r(),
> * getprotobynumber_r(),
> are thread-safe. But, there are not
> markings of them in glibc document.

Thanks, Zeng Linggang. Applied.

Cheers,

Michael

> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getprotoent_r.3 | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/man3/getprotoent_r.3 b/man3/getprotoent_r.3
> index 8d25c0c..00f76b9 100644
> --- a/man3/getprotoent_r.3
> +++ b/man3/getprotoent_r.3
> @@ -128,6 +128,23 @@ is too small.
>  Try again with a larger buffer
>  (and increased
>  .IR buflen ).
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getprotoent_r (),
> +.br
> +.BR getprotobyname_r (),
> +.br
> +.BR getprotobynumber_r ()
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
