From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] dlopen.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 22 Jul 2015 19:07:23 +0200
Message-ID: <55AFCDCB.5090101@gmail.com>
References: <1435138119-30051-1-git-send-email-zenglg.jy@cn.fujitsu.com>	 <55AC01D2.6050705@gmail.com> <1437563774.7073.2.camel@G08FNSTD140232>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437563774.7073.2.camel@G08FNSTD140232>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/22/2015 01:16 PM, Zeng Linggang wrote:
> After research, We think
> * dlopen(),
> * dlerror(),
> * dlsym(),
> * dlclose(),
> * dladdr(),
> * dlvsym(),
> * dlinfo(),
> * dlmopen(),
> * dladdr1()
> are thread-safe. But, there are not
> markings of them in glibc document.

Thanks for the fast response, Zeng Linggang.
I've incorporated the new pieces from your patch.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/dlopen.3 | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/man3/dlopen.3 b/man3/dlopen.3
> index cb5dbf9..f8e8667 100644
> --- a/man3/dlopen.3
> +++ b/man3/dlopen.3
> @@ -396,6 +396,29 @@ provided by glibc since version 2.1,
>  does the same as
>  .BR dlsym ()
>  but takes a version string as an additional argument.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw30 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR dlopen (),
> +.BR dlerror (),
> +.BR dlsym (),
> +.br
> +.BR dlclose (),
> +.BR dladdr (),
> +.BR dlvsym (),
> +.br
> +.BR dlinfo (),
> +.BR dlmopen (),
> +.BR dladdr1 ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  POSIX.1-2001 describes
>  .BR dlclose (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
