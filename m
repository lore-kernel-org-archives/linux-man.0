From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sigaltstack.2: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 13 May 2015 17:18:53 +0200
Message-ID: <55536B5D.2030501@gmail.com>
References: <1431500032-26865-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1431500032-26865-10-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431500032-26865-10-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/13/2015 08:53 AM, Zeng Linggang wrote:
> The marking matches glibc marking.
> The marking of functions in glibc is:
> - sigaltstack: MT-Safe


Thanks, Zeng Linggang. Patch applied.

Cheers,

Michael


> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man2/sigaltstack.2 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man2/sigaltstack.2 b/man2/sigaltstack.2
> index fb58593..a33d59b 100644
> --- a/man2/sigaltstack.2
> +++ b/man2/sigaltstack.2
> @@ -155,6 +155,19 @@ was less than
>  An attempt was made to change the alternate signal stack while
>  it was active (i.e., the process was already executing
>  on the current alternate signal stack).
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR sigaltstack ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  SUSv2, SVr4, POSIX.1-2001.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
