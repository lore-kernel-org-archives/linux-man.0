From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_cleanup_push.3 ATTRIBUTES: Note functions that
 are thread-safe
Date: Fri, 12 Jun 2015 21:10:40 +0200
Message-ID: <557B2EB0.6060306@gmail.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1432721584-11342-6-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-6-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/27/2015 12:13 PM, Zeng Linggang wrote:
> After research, We think pthread_cleanup_push() and
> pthread_cleanup_pop() are thread-safe. But, there
> are not markings of them in glibc document.


Thanks, Zeng Linggang. Applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_cleanup_push.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/pthread_cleanup_push.3 b/man3/pthread_cleanup_push.3
> index 43ac9b9..2b7fe05 100644
> --- a/man3/pthread_cleanup_push.3
> +++ b/man3/pthread_cleanup_push.3
> @@ -124,6 +124,20 @@ These functions do not return a value.
>  There are no errors.
>  .\" SH VERSIONS
>  .\" Available since glibc 2.0
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw23 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR pthread_cleanup_push (),
> +.BR pthread_cleanup_pop ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  POSIX.1-2001.
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
