From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getpw.3: ATTRIBUTES: Note function that is thread-safe
Date: Fri, 12 Jun 2015 21:09:55 +0200
Message-ID: <557B2E83.6080008@gmail.com>
References: <1432721584-11342-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1432721584-11342-3-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432721584-11342-3-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/27/2015 12:12 PM, Zeng Linggang wrote:
> After research, We think getpw() is thread-safe. But, there
> is not marking of getpw() in glibc document.

Thanks, Zeng Linggang. Applied.

Cheers,

Michael

> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getpw.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/getpw.3 b/man3/getpw.3
> index 68402f1..21fb4e9 100644
> --- a/man3/getpw.3
> +++ b/man3/getpw.3
> @@ -103,6 +103,19 @@ structure.
>  .TP
>  .I /etc/passwd
>  password database file
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getpw ()
> +T}	Thread safety	MT-Safe locale
> +.TE
> +
>  .SH CONFORMING TO
>  SVr2.
>  .SH BUGS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
