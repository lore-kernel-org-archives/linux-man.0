From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_attr_setaffinity_np.3 ATTRIBUTES: Note functions
 that are thread-safe
Date: Fri, 12 Jun 2015 21:10:26 +0200
Message-ID: <557B2EA2.2070105@gmail.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1432721584-11342-5-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-5-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/27/2015 12:12 PM, Zeng Linggang wrote:
> After research, We think pthread_attr_setaffinity_np() and
> pthread_attr_getaffinity_np() are thread-safe. But, there are not
> markings of them in glibc document.


Thanks, Zeng Linggang. Applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_attr_setaffinity_np.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/pthread_attr_setaffinity_np.3 b/man3/pthread_attr_setaffinity_np.3
> index ce49abb..cc6e94b 100644
> --- a/man3/pthread_attr_setaffinity_np.3
> +++ b/man3/pthread_attr_setaffinity_np.3
> @@ -105,6 +105,20 @@ is too small).
>  Could not allocate memory.
>  .SH VERSIONS
>  These functions are provided by glibc since version 2.3.4.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw30 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR pthread_attr_setaffinity_np (),
> +.BR pthread_attr_getaffinity_np ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  These functions are nonstandard GNU extensions;
>  hence the suffix "_np" (nonportable) in the names.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
