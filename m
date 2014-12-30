From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mmap.2:ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 30 Dec 2014 14:14:29 +0100
Message-ID: <54A2A535.3060008@gmail.com>
References: <1416909877-13102-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416909877-13102-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/25/2014 11:04 AM, Ma Shimiao wrote:
> The function mmap() and munmap() are thread safe.

Thanks, Ma Shimiao. Applied in my local branch.

Cheers,

Michael



> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man2/mmap.2 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man2/mmap.2 b/man2/mmap.2
> index 295df3d..f948866 100644
> --- a/man2/mmap.2
> +++ b/man2/mmap.2
> @@ -492,6 +492,19 @@ Attempted write into a region mapped as read-only.
>  Attempted access to a portion of the buffer that does not correspond
>  to the file (for example, beyond the end of the file, including the
>  case where another process has truncated the file).
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw18 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR mmap (),
> +.BR munmap ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  SVr4, 4.4BSD, POSIX.1-2001.
>  .\" SVr4 documents additional error codes ENXIO and ENODEV.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
