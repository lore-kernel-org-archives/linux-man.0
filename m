From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] updwtmp.3: ATTRIBUTES: Note functions that aren't thread-safe
Date: Sat, 18 Apr 2015 20:38:08 +0200
Message-ID: <5532A490.3090308@gmail.com>
References: <1429160978-15236-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1429160978-15236-6-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429160978-15236-6-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/16/2015 07:09 AM, Zeng Linggang wrote:
> The markings match glibc markings.

Thanks, Zeng. Applied.

Cheers,

Michael


> updwtmp: MT-Unsafe sig:ALRM timer
> logwtmp: MT-Unsafe sig:ALRM timer
> 
> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/updwtmp.3 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/man3/updwtmp.3 b/man3/updwtmp.3
> index 3f451fc..70281f4 100644
> --- a/man3/updwtmp.3
> +++ b/man3/updwtmp.3
> @@ -59,6 +59,21 @@ to append the structure to the wtmp file.
>  .TP
>  .I /var/log/wtmp
>  database of past user logins
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lbw24
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR updwtmp (),
> +.br
> +.BR logwtmp ()
> +T}	Thread safety	MT-Unsafe sig:ALRM timer
> +.TE
> +
>  .SH CONFORMING TO
>  Not in POSIX.1-2001.
>  Present on Solaris, NetBSD, and perhaps other systems.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
