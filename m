From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mcheck.3: ATTRIBUTES: Note functions that aren't thread-safe
Date: Wed, 29 Apr 2015 21:16:35 +0200
Message-ID: <55412E13.1050904@gmail.com>
References: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1429764710-8598-5-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429764710-8598-5-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/23/2015 06:51 AM, Zeng Linggang wrote:
> mcheck() and mprobe() match glibc markings.
>>From research, We think mcheck_pedantic() and mcheck_check_all() are not
> thread-safe. But, there is not markings of mcheck_pedantic() and
> mcheck_check_all() in glibc document.
> - mcheck:           MT-Unsafe race:mcheck const:malloc_hooks
> - mcheck_pedantic:  MT-Unsafe race:mcheck const:malloc_hooks
> - mcheck_check_all: MT-Unsafe race:mcheck const:malloc_hooks
> - mprobe:           MT-Unsafe race:mcheck const:malloc_hooks


Thanks, Zeng. Applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mcheck.3 | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/man3/mcheck.3 b/man3/mcheck.3
> index e59da31..b836de7 100644
> --- a/man3/mcheck.3
> +++ b/man3/mcheck.3
> @@ -142,6 +142,27 @@ The
>  and
>  .BR mprobe ()
>  functions are present since at least glibc 2.0
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw28 lb lbw21
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR mcheck (),
> +.BR mcheck_pedantic (),
> +.br
> +.BR mcheck_check_all (),
> +.BR mprobe ()
> +T}	Thread safety	T{
> +MT-Unsafe race:mcheck
> +.br
> +const:malloc_hooks
> +T}
> +.TE
> +
>  .SH CONFORMING TO
>  These functions are GNU extensions.
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
