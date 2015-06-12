From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rcmd.3: ATTRIBUTES: Note functions that are/aren't thread-safe
Date: Fri, 12 Jun 2015 21:40:59 +0200
Message-ID: <557B35CB.3040309@gmail.com>
References: <1433988270-8599-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1433988270-8599-8-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433988270-8599-8-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/11/2015 04:04 AM, Zeng Linggang wrote:
> After research, We think
> * rresvport(),
> * iruserok(),
> * ruserok(),
> * rresvport_af(),
> * iruserok_af(),
> * ruserok_af(),
> are thread-safe. And
> * rcmd(),
> * rcmd_af(),
> are not thread-safe. But, there are not
> markings of them in glibc document.

Thanks, Zeng Linggang. Applied.

Cheers,

Michael

> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/rcmd.3 | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/man3/rcmd.3 b/man3/rcmd.3
> index 7bc7313..64feb53 100644
> --- a/man3/rcmd.3
> +++ b/man3/rcmd.3
> @@ -267,6 +267,30 @@ The functions
>  and
>  .BR ruserok_af ()
>  functions are provide in glibc since version 2.2.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw17 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR rcmd (),
> +.BR rcmd_af ()
> +T}	Thread safety	MT-Unsafe
> +T{
> +.BR rresvport (),
> +.BR rresvport_af ()
> +T}	Thread safety	MT-Safe
> +T{
> +.BR iruserok (),
> +.BR ruserok (),
> +.BR iruserok_af (),
> +.BR ruserok_af ()
> +T}	Thread safety	MT-Safe locale
> +.TE
> +
>  .SH CONFORMING TO
>  Not in POSIX.1-2001.
>  Present on the BSDs, Solaris, and many other systems.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
