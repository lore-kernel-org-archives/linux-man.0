From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getdtablesize.2, attr.5: Move .so directive to first line
Date: Fri, 24 Mar 2017 15:40:19 +0100
Message-ID: <85d402cd-765d-74e0-6a00-a940d3d679b2@gmail.com>
References: <20170321010835.384cad5c.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170321010835.384cad5c.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/21/2017 01:08 AM, Alexander Miller wrote:
> Improves compatibility with the man and other dumb tools
> that process man page files.

Hello Alex,

I've applied this. However, could you say more about the
problem it fixes? (I did not encounter or get any reports of
problems before, and at least for me, man(1) seems to have
no problem with the files as they were.)

Thanks for the patch!

Cheers,

Michael


> Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/getdtablesize.2 | 2 +-
>  man5/attr.5          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/getdtablesize.2 b/man2/getdtablesize.2
> index d9be980..68c2fd8 100644
> --- a/man2/getdtablesize.2
> +++ b/man2/getdtablesize.2
> @@ -1,2 +1,2 @@
> -.\" Created 2013-02-05; will eventually be removed
>  .so man3/getdtablesize.3
> +.\" Created 2013-02-05; will eventually be removed
> diff --git a/man5/attr.5 b/man5/attr.5
> index 577f0c9..e979971 100644
> --- a/man5/attr.5
> +++ b/man5/attr.5
> @@ -1,2 +1,2 @@
> -.\" Page was imported from 'attr' project which had it in Section 5
>  .so man7/xattr.7
> +.\" Page was imported from 'attr' project which had it in Section 5
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
