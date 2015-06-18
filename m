From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getgrent_r.3: ATTRIBUTES: Note functions that are/aren't
 thread-safe
Date: Thu, 18 Jun 2015 09:05:11 +0200
Message-ID: <55826DA7.6050902@gmail.com>
References: <1434605811-18306-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1434605811-18306-2-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434605811-18306-2-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/18/2015 07:36 AM, Zeng Linggang wrote:
> The markings match glibc markings.
> markings of functions in glibc are:
> - getgrent_r:  MT-Unsafe race:grent locale
> - fgetgrent_r: MT-Safe

Thanks, Zeng Linggang. Applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getgrent_r.3 | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/man3/getgrent_r.3 b/man3/getgrent_r.3
> index 00927d6..847e69c 100644
> --- a/man3/getgrent_r.3
> +++ b/man3/getgrent_r.3
> @@ -114,6 +114,34 @@ No more entries.
>  .B ERANGE
>  Insufficient buffer space supplied.
>  Try again with larger buffer.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lbw27
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getgrent_r ()
> +T}	Thread safety	MT-Unsafe race:grent locale
> +T{
> +.BR fgetgrent_r ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
> +In the above table,
> +.I grent
> +in
> +.I race:grent
> +signifies that if any of the functions
> +.BR setgrent (),
> +.BR getgrent (),
> +.BR endgrent (),
> +or
> +.BR getgrent_r ()
> +are used in parallel in different threads of a program,
> +then data races could occur.
>  .SH CONFORMING TO
>  These functions are GNU extensions, done in a style resembling
>  the POSIX version of functions like
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
