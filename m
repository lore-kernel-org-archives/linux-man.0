From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: fix path to binfmt_misc docs
Date: Tue, 15 Aug 2017 21:01:18 +0200
Message-ID: <d07b89ee-6a2c-1e09-ec69-eb23143e7089@gmail.com>
References: <20170611182137.6350-1-bp@benjamin.pe>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170611182137.6350-1-bp-FdlSlcb4kYoEmBOxnfisBw@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Peterson <bp-FdlSlcb4kYoEmBOxnfisBw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/11/2017 08:21 PM, Benjamin Peterson wrote:
> The documentation moved in linux commit 9d85025b0418163fae079c9ba8f8445212de8568
> ("docs-rst: create an user's manual book").
> 
> Signed-off-by: Benjamin Peterson <bp-FdlSlcb4kYoEmBOxnfisBw@public.gmane.org>

Thanks, Benjamin. Applied.

Cheers,

Michael

> ---
>  man5/proc.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index d6032e185..bcc342bcc 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -3854,7 +3854,7 @@ related to filesystems.
>  .I /proc/sys/fs/binfmt_misc
>  Documentation for files in this directory can be found
>  in the Linux kernel sources in
> -.IR Documentation/binfmt_misc.txt .
> +.IR Documentation/admin-guide/binfmt-misc.rst .
>  .TP
>  .IR /proc/sys/fs/dentry-state " (since Linux 2.2)"
>  This file contains information about the status of the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
