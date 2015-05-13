From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] psignal.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 13 May 2015 17:18:26 +0200
Message-ID: <55536B42.8060602@gmail.com>
References: <1431500032-26865-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1431500032-26865-7-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431500032-26865-7-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/13/2015 08:53 AM, Zeng Linggang wrote:
> After research, We think psiginfo() is thread-safe. But, there
> is not marking of psiginfo() in glibc document.
> psignal() matches glibc marking.
> - psignal:  MT-Safe locale

XXX > - psiginfo: MT-Safe locale


Thanks, Zeng Linggang. Patch applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/psignal.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/psignal.3 b/man3/psignal.3
> index 12124be..3ded4b0 100644
> --- a/man3/psignal.3
> +++ b/man3/psignal.3
> @@ -96,6 +96,20 @@ functions return no value.
>  The
>  .BR psiginfo ()
>  function was added to glibc in version 2.10.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw21 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR psignal (),
> +.BR psiginfo ()
> +T}	Thread safety	MT-Safe locale
> +.TE
> +
>  .SH CONFORMING TO
>  POSIX.1-2008, 4.3BSD.
>  .SH BUGS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
