From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clock_getres.2: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 20 May 2015 16:15:14 +0200
Message-ID: <555C96F2.5070707@gmail.com>
References: <1432116011-10181-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432116011-10181-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/20/2015 12:00 PM, Zeng Linggang wrote:
> After research, We think clock_getres(), clock_gettime() and
> clock_settime() are thread-safe. But, there are not markings of
> clock_getres(), clock_gettime() and clock_settime() in glibc document.
> 
> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Thanks, Zeng Linggang. Patch applied.

Cheers,

Michael


> ---
>  man2/clock_getres.2 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/man2/clock_getres.2 b/man2/clock_getres.2
> index 6809c7b..c7ecd3d 100644
> --- a/man2/clock_getres.2
> +++ b/man2/clock_getres.2
> @@ -204,6 +204,21 @@ specified is not supported on this system.
>  does not have permission to set the clock indicated.
>  .SH VERSIONS
>  These system calls first appeared in Linux 2.6.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw16 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR clock_getres (),
> +.BR clock_gettime (),
> +.BR clock_settime ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  SUSv2, POSIX.1-2001.
>  .SH AVAILABILITY
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
