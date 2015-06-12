From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_tryjoin_np.3 ATTRIBUTES: Note functions that
 are thread-safe
Date: Fri, 12 Jun 2015 21:11:14 +0200
Message-ID: <557B2ED2.1060606@gmail.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1432721584-11342-8-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-8-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/27/2015 12:13 PM, Zeng Linggang wrote:
> After research, We think pthread_tryjoin_np() and
> pthread_timedjoin_np() are thread-safe. But, there
> are not markings of them in glibc document.


Thanks, Zeng Linggang. Applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_tryjoin_np.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/pthread_tryjoin_np.3 b/man3/pthread_tryjoin_np.3
> index 4fef86c..acce537 100644
> --- a/man3/pthread_tryjoin_np.3
> +++ b/man3/pthread_tryjoin_np.3
> @@ -117,6 +117,20 @@ never returns the error
>  .BR EINTR .
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.3.3.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw22 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR pthread_tryjoin_np (),
> +.BR pthread_timedjoin_np ()
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
