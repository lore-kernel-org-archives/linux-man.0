From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ftw.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 29 Apr 2015 21:21:38 +0200
Message-ID: <55412F42.2080705@gmail.com>
References: <1430302166-1700-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1430302166-1700-3-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430302166-1700-3-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/29/2015 12:09 PM, Zeng Linggang wrote:
> The marking matches glibc marking.
> markings of functions in glibc are:
> - nftw: MT-Safe cwd
> - ftw:  MT-Safe

Thanks, Zeng. Applied.

Cheers,

Michael




> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/ftw.3 | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/man3/ftw.3 b/man3/ftw.3
> index b24cfd6..b421c00 100644
> --- a/man3/ftw.3
> +++ b/man3/ftw.3
> @@ -350,6 +350,22 @@ and that value is returned as the result of
>  .SH VERSIONS
>  .BR nftw ()
>  is available under glibc since version 2.1.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR nftw ()
> +T}	Thread safety	MT-Safe cwd
> +T{
> +.BR ftw ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  POSIX.1-2001, POSIX.1-2008, SVr4, SUSv1.
>  POSIX.1-2008 marks
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
