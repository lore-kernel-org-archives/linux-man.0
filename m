From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] eventfd.2: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 20 May 2015 16:15:22 +0200
Message-ID: <555C96FA.3070500@gmail.com>
References: <1432116011-10181-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1432116011-10181-2-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432116011-10181-2-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/20/2015 12:00 PM, Zeng Linggang wrote:
> After research, We think eventfd() is thread-safe. But, there
> is not marking of eventfd() in glibc document.
> 
> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>


Thanks, Zeng Linggang. Patch applied.

Cheers,

Michael



> ---
>  man2/eventfd.2 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man2/eventfd.2 b/man2/eventfd.2
> index 01c2d87..6b37e2d 100644
> --- a/man2/eventfd.2
> +++ b/man2/eventfd.2
> @@ -263,6 +263,19 @@ Since version 2.9, the glibc
>  wrapper will employ the
>  .BR eventfd2 ()
>  system call, if it is supported by the kernel.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR eventfd ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  .BR eventfd ()
>  and
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
