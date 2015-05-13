From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getifaddrs.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 13 May 2015 17:14:49 +0200
Message-ID: <55536A69.7010304@gmail.com>
References: <1431500032-26865-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431500032-26865-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Zeng Linggang,

On 05/13/2015 08:53 AM, Zeng Linggang wrote:
> After research, We think getifaddrs() and freeifaddrs() are not
> thread-safe. But, there is not markings of getifaddrs() and
> freeifaddrs() in glibc document.

In cases such as this, it's good to tell me that there is no marking
in the glibc manual, but in that case you can skip omit the next two lines:

> - getifaddrs:  MT-Safe
> - freeifaddrs: MT-Safe

Patch applied. Thanks!

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getifaddrs.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/getifaddrs.3 b/man3/getifaddrs.3
> index ae6ac8e..0437b08 100644
> --- a/man3/getifaddrs.3
> +++ b/man3/getifaddrs.3
> @@ -167,6 +167,20 @@ the implementation supported only IPv4 addresses;
>  IPv6 support was added in glibc 2.3.3.
>  Support of address families other than IPv4 is available only
>  on kernels that support netlink.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw27 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getifaddrs (),
> +.BR freeifaddrs ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  Not in POSIX.1-2001.
>  This function first appeared in BSDi and is
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
