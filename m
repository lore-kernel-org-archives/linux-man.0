From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] termios.3: srcfix: add FIXME
Date: Fri, 11 Sep 2015 12:07:31 +0200
Message-ID: <55F2A7E3.1080105@gmail.com>
References: <1440411596-2566-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1440411596-2566-7-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440411596-2566-7-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
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
>  man3/termios.3 | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/man3/termios.3 b/man3/termios.3
> index 02aee64..1ea5236 100644
> --- a/man3/termios.3
> +++ b/man3/termios.3
> @@ -994,6 +994,13 @@ T{
>  .BR cfsetispeed (),
>  .BR cfsetospeed (),
>  .BR cfsetspeed ()
> +.\" FIXME: the following markings are different from which in glibc manual,
> +.\" markings in glibc manual are more detailed.
> +.\" tcsendbreak: MT-Unsafe race:tcattr(filedes)/bsd
> +.\" tcflow: MT-Unsafe race:tcattr(filedes)/bsd
> +.\" glibc manual says /bsd indicate the preceding marker only applies
> +./" when the underlying kernel is a BSD kernel.
> +.\" So, it is safety in Linux kernel.
>  T}	Thread safety	MT-Safe
>  .TE
>  .ad
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
