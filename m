From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gethostid.3: ATTRIBUTES: Note functions that isn't thread-safe
Date: Wed, 29 Apr 2015 21:14:52 +0200
Message-ID: <55412DAC.2020404@gmail.com>
References: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1429764710-8598-2-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429764710-8598-2-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/23/2015 06:51 AM, Zeng Linggang wrote:
> The markings match glibc markings.
> markings of functions in glibc are:
> - gethostid: MT-Safe hostid env locale
> - sethostid: MT-Unsafe const:hostid


Thanks, Zeng. Applied.

It's probably better to title patches like this as:

     ATTRIBUTES: Note functions that are/aren't thread-safe

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/gethostid.3 | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/man3/gethostid.3 b/man3/gethostid.3
> index bbeb4a5..4b46deb 100644
> --- a/man3/gethostid.3
> +++ b/man3/gethostid.3
> @@ -89,6 +89,22 @@ to store the host ID.
>  .B EPERM
>  The calling process's effective user or group ID is not the same
>  as its corresponding real ID.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lbw25
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR gethostid ()
> +T}	Thread safety	MT-Safe hostid env locale
> +T{
> +.BR sethostid ()
> +T}	Thread safety	MT-Unsafe const:hostid
> +.TE
> +
>  .SH CONFORMING TO
>  4.2BSD; these functions were dropped in 4.4BSD.
>  SVr4 includes
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
