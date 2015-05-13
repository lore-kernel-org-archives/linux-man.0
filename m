From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getrlimit.2: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 13 May 2015 17:17:17 +0200
Message-ID: <55536AFD.90603@gmail.com>
References: <1431500032-26865-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1431500032-26865-2-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431500032-26865-2-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/13/2015 08:53 AM, Zeng Linggang wrote:
> After research, We think prlimit() is thread-safe. But, there
> is not marking of prlimit() in glibc document.
> getrlimit() and setrlimit() match glibc markings.
> - getrlimit: MT-Safe
> - setrlimit: MT-Safe

The following line would best be omitted. All I'd like to see here is 
what's in the glibc manual.

> - prlimit:   MT-Safe

Thanks, Zeng Linggang. Patch applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man2/getrlimit.2 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
> index 211ff69..ec464fe 100644
> --- a/man2/getrlimit.2
> +++ b/man2/getrlimit.2
> @@ -508,6 +508,21 @@ The
>  .BR prlimit ()
>  system call is available since Linux 2.6.36.
>  Library support is available since glibc 2.13.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw35 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getrlimit (),
> +.BR setrlimit (),
> +.BR prlimit ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  .BR getrlimit (),
>  .BR setrlimit ():
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
