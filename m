From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] utimensat.2: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 20 May 2015 16:16:26 +0200
Message-ID: <555C973A.2000401@gmail.com>
References: <1432116011-10181-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1432116011-10181-10-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432116011-10181-10-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/20/2015 12:00 PM, Zeng Linggang wrote:
> After research, We think utimensat() and futimens() are thread-safe.
> But, there are not markings of utimensat() and futimens() in glibc
> document.
> 
> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Thanks, Zeng Linggang. Patch applied.

Cheers,

Michael


> ---
>  man2/utimensat.2 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man2/utimensat.2 b/man2/utimensat.2
> index 80094d7..1dc941a 100644
> --- a/man2/utimensat.2
> +++ b/man2/utimensat.2
> @@ -418,6 +418,20 @@ glibc support was added with version 2.6.
>  Support for
>  .BR futimens ()
>  first appeared in glibc 2.6.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw23 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR utimensat (),
> +.BR futimens ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  .BR futimens ()
>  and
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
