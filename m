From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getrpcport.3: ATTRIBUTES: Note function that is thread-safe
Date: Fri, 12 Jun 2015 21:26:38 +0200
Message-ID: <557B326E.9060802@gmail.com>
References: <1433326594-25001-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1433326594-25001-5-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433326594-25001-5-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/03/2015 12:16 PM, Zeng Linggang wrote:
> After research, We think getrpcport() is thread-safe. But, there
> is not marking of getrpcport() in glibc document.


Thanks, Zeng Linggang. Applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getrpcport.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/getrpcport.3 b/man3/getrpcport.3
> index 13f970f..476f203 100644
> --- a/man3/getrpcport.3
> +++ b/man3/getrpcport.3
> @@ -35,6 +35,19 @@ is registered but not with version
>  it will still return a port number (for some version of the program)
>  indicating that the program is indeed registered.
>  The version mismatch will be detected upon the first call to the service.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getrpcport ()
> +T}	Thread safety	MT-Safe env locale
> +.TE
> +
>  .SH CONFORMING TO
>  Not in POSIX.1-2001.
>  Present on the BSDs, Solaris, and many other systems.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
