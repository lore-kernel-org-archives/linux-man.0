From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] longjmp.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 29 Apr 2015 21:16:25 +0200
Message-ID: <55412E09.9000900@gmail.com>
References: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1429764710-8598-4-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429764710-8598-4-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/23/2015 06:51 AM, Zeng Linggang wrote:
> The markings match glibc markings.
> markings of functions in glibc are:
> - longjmp:    MT-Safe
> - siglongjmp: MT-Safe


Thanks, Zeng. Applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/longjmp.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/longjmp.3 b/man3/longjmp.3
> index 69bd6f5..2687703 100644
> --- a/man3/longjmp.3
> +++ b/man3/longjmp.3
> @@ -87,6 +87,20 @@ also restores the signal mask that was saved by
>  .BR sigsetjmp (3).
>  .SH RETURN VALUE
>  These functions never return.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw23 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR longjmp (),
> +.BR siglongjmp ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  C89, C99, and POSIX.1-2001 specify
>  .BR longjmp ().
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
