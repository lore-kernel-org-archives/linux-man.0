From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strsignal.3: ATTRIBUTES: Note functions that isn't thread-safe
Date: Wed, 29 Apr 2015 21:18:30 +0200
Message-ID: <55412E86.3000109@gmail.com>
References: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1429764710-8598-10-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429764710-8598-10-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/23/2015 06:51 AM, Zeng Linggang wrote:
> The marking matches glibc marking.
> The marking of functions in glibc is:
> - strsignal: MT-Unsafe race:strsignal locale


Thanks, Zeng. Applied. (Again a number disagreement in the title 
of this patch; s/functions/function/)

Cheers,

Michael




> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strsignal.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/strsignal.3 b/man3/strsignal.3
> index 8c82a6f..c0e887e 100644
> --- a/man3/strsignal.3
> +++ b/man3/strsignal.3
> @@ -81,6 +81,19 @@ function returns the appropriate description
>  string, or an unknown signal message if the signal number is invalid.
>  On some systems (but not on Linux), NULL may instead be
>  returned for an invalid signal number.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lbw31
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR strsignal ()
> +T}	Thread safety	MT-Unsafe race:strsignal locale
> +.TE
> +
>  .SH CONFORMING TO
>  POSIX.1-2008.
>  Present on Solaris and the BSDs.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
