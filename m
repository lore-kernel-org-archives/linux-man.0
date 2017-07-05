From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] posix_madvise.3: Remove paragraph about
 POSIX_FADV_NOREUSE
Date: Wed, 5 Jul 2017 10:28:34 +0200
Message-ID: <e65afbbd-a422-aa02-1e5a-2332e8b95221@gmail.com>
References: <20170626150208.2754-1-toddy@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170626150208.2754-1-toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/26/2017 05:02 PM, Dr. Tobias Quathamer wrote:
> POSIX_FADV_NOREUSE is documented for posix_fadvise, and a
> corresponding POSIX_MADV_NOREUSE flag is not specified by POSIX.

Thanks, Tobias. Applied.

Cheers,

Michael

> Thanks to Marc Lehmann <debian-reportbug-zsXavz5zCAg@public.gmane.org>
> See https://bugs.debian.org/865699
> ---
>  man3/posix_madvise.3 | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/man3/posix_madvise.3 b/man3/posix_madvise.3
> index d97d37b6e..18743b0f0 100644
> --- a/man3/posix_madvise.3
> +++ b/man3/posix_madvise.3
> @@ -106,12 +106,6 @@ Support for
>  first appeared in glibc version 2.2.
>  .SH CONFORMING TO
>  POSIX.1-2001.
> -
> -POSIX.1-2008 specifies a further value for
> -.IR advice ,
> -.BR POSIX_FADV_NOREUSE ,
> -meaning that the specified data will be accessed only once.
> -This value is not currently supported.
>  .SH NOTES
>  POSIX.1 permits an implementation to generate an error if
>  .I len
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
