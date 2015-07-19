From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dlopen.3: ATTRIBUTES: Note functions that are thread-safe
Date: Sun, 19 Jul 2015 22:00:18 +0200
Message-ID: <55AC01D2.6050705@gmail.com>
References: <1435138119-30051-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435138119-30051-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Zeng Linggang,

On 06/24/2015 11:28 AM, Zeng Linggang wrote:
> After research, We think
> * dlopen(),
> * dlerror(),
> * dlsym(),
> * dlclose(),
> * dladdr(),
> * dlvsym()
> are thread-safe. But, there are not
> markings of them in glibc document.

Thanks. I've applied this manually, since it happens that I am currently
working on splitting the dlopen(3) page into smaller pieces. So, it will
be a short while before your changes in this patch are released.

You might also want to check the thread safety of dlinfo(), dlmopen(),
and dladdr1(), since man pages for those functions will, I hope, soon
appear.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/dlopen.3 | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/man3/dlopen.3 b/man3/dlopen.3
> index cb5dbf9..53d3f16 100644
> --- a/man3/dlopen.3
> +++ b/man3/dlopen.3
> @@ -396,6 +396,25 @@ provided by glibc since version 2.1,
>  does the same as
>  .BR dlsym ()
>  but takes a version string as an additional argument.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw29 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR dlopen (),
> +.BR dlerror (),
> +.BR dlsym (),
> +.br
> +.BR dlclose (),
> +.BR dladdr (),
> +.BR dlvsym ()
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
