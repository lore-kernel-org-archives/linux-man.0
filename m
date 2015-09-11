From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sigpause.3: srcfix: add FIXME
Date: Fri, 11 Sep 2015 12:07:13 +0200
Message-ID: <55F2A7D1.8080307@gmail.com>
References: <1440411596-2566-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1440411596-2566-6-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440411596-2566-6-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/24/2015 12:19 PM, Zeng Linggang wrote:
> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Applied!  Thanks, Zeng Linggang.

Cheers,

Michael

> ---
>  man3/sigpause.3 | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/man3/sigpause.3 b/man3/sigpause.3
> index 847bd10..dbc10de 100644
> --- a/man3/sigpause.3
> +++ b/man3/sigpause.3
> @@ -63,6 +63,12 @@ l l l.
>  Interface	Attribute	Value
>  T{
>  .BR sigpause ()
> +.\" FIXME: the following marking is different from which in glibc manual,
> +.\" marking in glibc manual is more detailed.
> +.\" sigpause: MT-Unsafe race:sigprocmask/!bsd!linux
> +.\" glibc manual says /!linux!bsd indicate the preceding marker only applies
> +./" when the underlying kernel is neither Linux nor a BSD kernel.
> +.\" So, it is safety in Linux kernel.
>  T}	Thread safety	MT-Safe
>  .TE
>  .SH CONFORMING TO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
