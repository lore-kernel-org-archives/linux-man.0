From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] posix_memalign.3: ATTRIBUTES: Note functions that aren't
 thread-safe
Date: Sat, 18 Apr 2015 20:37:41 +0200
Message-ID: <5532A475.5020706@gmail.com>
References: <1429160978-15236-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1429160978-15236-4-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429160978-15236-4-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/16/2015 07:09 AM, Zeng Linggang wrote:
> The markings match glibc markings.


Thanks, Zeng. Applied.

Cheers,

Michael

> posix_memalign: MT-Safe
> aligned_alloc:  MT-Safe
> memalign:       MT-Safe
> 
> valloc:         MT-Unsafe init
> pvalloc:        MT-Unsafe init
> 
> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/posix_memalign.3 | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/man3/posix_memalign.3 b/man3/posix_memalign.3
> index 48dc770..f7b919d 100644
> --- a/man3/posix_memalign.3
> +++ b/man3/posix_memalign.3
> @@ -179,6 +179,28 @@ was added to glibc in version 2.16.
>  The function
>  .BR posix_memalign ()
>  is available since glibc 2.1.91.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR aligned_alloc (),
> +.br
> +.BR memalign (),
> +.br
> +.BR posix_memalign ()
> +T}	Thread safety	MT-Safe
> +T{
> +.BR valloc (),
> +.br
> +.BR pvalloc ()
> +T}	Thread safety	MT-Unsafe init
> +.TE
> +
>  .SH CONFORMING TO
>  The function
>  .BR valloc ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
